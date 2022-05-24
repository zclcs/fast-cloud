package com.zclcs.gateway.handler;

import com.alibaba.csp.sentinel.slots.block.authority.AuthorityException;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeException;
import com.alibaba.csp.sentinel.slots.block.flow.FlowException;
import com.alibaba.csp.sentinel.slots.block.flow.param.ParamFlowException;
import com.alibaba.csp.sentinel.slots.system.SystemBlockException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.boot.autoconfigure.web.ErrorProperties;
import org.springframework.boot.autoconfigure.web.ResourceProperties;
import org.springframework.boot.autoconfigure.web.reactive.error.DefaultErrorWebExceptionHandler;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.reactive.error.ErrorAttributes;
import org.springframework.cloud.gateway.support.NotFoundException;
import org.springframework.cloud.gateway.support.TimeoutException;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.web.reactive.function.server.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.HashMap;
import java.util.Map;

/**
 * @author zclcs
 */
@Slf4j
public class MyGatewayExceptionHandler extends DefaultErrorWebExceptionHandler {

    public MyGatewayExceptionHandler(ErrorAttributes errorAttributes, ResourceProperties resourceProperties,
                                     ErrorProperties errorProperties, ApplicationContext applicationContext) {
        super(errorAttributes, resourceProperties, errorProperties, applicationContext);
    }

    /**
     * 异常处理，定义返回报文格式
     */
    @Override
    protected Map<String, Object> getErrorAttributes(ServerRequest webRequest, ErrorAttributeOptions options) {
        Throwable error = super.getError(webRequest);
        log.error(
                "请求发生异常，请求URI：{}，请求方法：{}，异常信息：{}",
                webRequest.path(), webRequest.methodName(), error.getMessage()
        );
        String errorMessage;
        if (error instanceof NotFoundException) {
            String serverId = StringUtils.substringAfterLast(error.getMessage(), "Unable to find instance for ");
            serverId = StringUtils.replace(serverId, "\"", StringUtils.EMPTY);
            errorMessage = String.format("无法找到%s服务", serverId);
        } else if (StringUtils.containsIgnoreCase(error.getMessage(), "connection refused")) {
            errorMessage = "目标服务拒绝连接";
        } else if (error instanceof TimeoutException) {
            errorMessage = "访问服务超时";
        } else if (error instanceof ResponseStatusException
                && StringUtils.containsIgnoreCase(error.getMessage(), HttpStatus.NOT_FOUND.toString())) {
            errorMessage = "未找到该资源";
        } else if (error instanceof FlowException) {
            errorMessage = "接口限流";
        } else if (error instanceof DegradeException) {
            errorMessage = "服务降级";
        } else if (error instanceof ParamFlowException) {
            errorMessage = "热点参数限流";
        } else if (error instanceof SystemBlockException) {
            errorMessage = "触发系统保护规则";
        } else if (error instanceof AuthorityException) {
            errorMessage = "授权规则不通过";
        } else {
            errorMessage = "网关转发异常";
        }
        Map<String, Object> errorAttributes = new HashMap<>(3);
        errorAttributes.put("message", errorMessage);
        return errorAttributes;
    }

    @Override
    @SuppressWarnings("all")
    protected RouterFunction<ServerResponse> getRoutingFunction(ErrorAttributes errorAttributes) {
        return RouterFunctions.route(RequestPredicates.all(), this::renderErrorResponse);
    }

    @Override
    protected int getHttpStatus(Map<String, Object> errorAttributes) {
        return HttpStatus.INTERNAL_SERVER_ERROR.value();
    }
}
