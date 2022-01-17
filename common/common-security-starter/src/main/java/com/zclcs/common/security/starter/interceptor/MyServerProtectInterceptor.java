package com.zclcs.common.security.starter.interceptor;

import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.utils.BaseUtil;
import com.zclcs.common.security.starter.properties.MyCloudSecurityProperties;
import org.apache.commons.lang.StringUtils;
import org.springframework.lang.NonNull;
import org.springframework.util.Base64Utils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author zclcs
 */
public class MyServerProtectInterceptor implements HandlerInterceptor {

    private MyCloudSecurityProperties properties;

    @Override
    public boolean preHandle(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull Object handler) throws IOException {
        if (!properties.getOnlyFetchByGateway()) {
            return true;
        }
        String token = request.getHeader(MyConstant.GATEWAY_TOKEN_HEADER);
        String gatewayToken = new String(Base64Utils.encode(MyConstant.GATEWAY_TOKEN_VALUE.getBytes()));
        if (StringUtils.equals(gatewayToken, token)) {
            return true;
        } else {
            BaseUtil.makeJsonResponse(response, HttpServletResponse.SC_FORBIDDEN, BaseRspUtil.message("请通过网关获取资源"));
            return false;
        }
    }

    public void setProperties(MyCloudSecurityProperties properties) {
        this.properties = properties;
    }
}
