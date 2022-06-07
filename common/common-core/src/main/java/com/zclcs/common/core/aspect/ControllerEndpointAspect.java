package com.zclcs.common.core.aspect;

import cn.hutool.json.JSONUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.constant.RabbitConstant;
import com.zclcs.common.core.entity.MessageStruct;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.common.core.utils.BaseUsersUtil;
import com.zclcs.common.core.utils.BaseUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.*;

/**
 * @author zclcs
 */
@Aspect
@Slf4j
@Component
public class ControllerEndpointAspect extends BaseAspectSupport {

    private ObjectMapper objectMapper;

    private RabbitTemplate rabbitTemplate;

    @Autowired
    public void setRabbitTemplate(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }

    @Autowired
    public void setObjectMapper(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Pointcut("execution(* com.zclcs..*.controller..*.*(..)) && @annotation(com.zclcs.common.core.annotation.ControllerEndpoint)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        Object result;
        Method targetMethod = resolveMethod(point);
        ControllerEndpoint annotation = targetMethod.getAnnotation(ControllerEndpoint.class);
        String operation = annotation.operation();
        long start = System.currentTimeMillis();
        result = point.proceed();
        if (StringUtils.isNotBlank(operation)) {
            String username = BaseUsersUtil.getCurrentUsername();
            String ip = BaseUtil.getHttpServletRequestIpAddress();

            String className = point.getTarget().getClass().getName();
            String methodName = targetMethod.getName();

            Object[] args = point.getArgs();
            LocalVariableTableParameterNameDiscoverer u = new LocalVariableTableParameterNameDiscoverer();
            String[] paramNames = u.getParameterNames(targetMethod);
            StringBuilder params = new StringBuilder();
            if (args != null && paramNames != null) {
                params = handleParams(params, args, Arrays.asList(paramNames));
            }
            SystemLogAo systemLogAo = new SystemLogAo();
            systemLogAo.setClassName(className);
            systemLogAo.setMethodName(methodName);
            systemLogAo.setParams(params.toString());
            systemLogAo.setIp(ip);
            systemLogAo.setOperation(operation);
            systemLogAo.setUsername(username);
            systemLogAo.setStart(start);
            rabbitTemplate.convertAndSend(RabbitConstant.LOG_EXCHANGE, RabbitConstant.SERVER_SYSTEM_LOG_ROUTE_KEY, new MessageStruct(JSONUtil.toJsonStr(systemLogAo)));
        }
        return result;
    }

    @SuppressWarnings("all")
    private StringBuilder handleParams(StringBuilder params, Object[] args, List paramNames) {
        try {
            for (int i = 0; i < args.length; i++) {
                if (args[i] instanceof Map) {
                    Set set = ((Map) args[i]).keySet();
                    List<Object> list = new ArrayList<>();
                    List<Object> paramList = new ArrayList<>();
                    for (Object key : set) {
                        list.add(((Map) args[i]).get(key));
                        paramList.add(key);
                    }
                    return handleParams(params, list.toArray(), paramList);
                } else {
                    if (args[i] instanceof Serializable) {
                        Class<?> aClass = args[i].getClass();
                        try {
                            aClass.getDeclaredMethod("toString", new Class[]{null});
                            // 如果不抛出 NoSuchMethodException 异常则存在 toString 方法 ，安全的 writeValueAsString ，否则 走 Object的 toString方法
                            params.append(" ").append(paramNames.get(i)).append(": ").append(objectMapper.writeValueAsString(args[i]));
                        } catch (NoSuchMethodException e) {
                            params.append(" ").append(paramNames.get(i)).append(": ").append(objectMapper.writeValueAsString(args[i].toString()));
                        }
                    } else if (args[i] instanceof MultipartFile) {
                        MultipartFile file = (MultipartFile) args[i];
                        params.append(" ").append(paramNames.get(i)).append(": ").append(file.getName());
                    } else {
                        params.append(" ").append(paramNames.get(i)).append(": ").append(args[i]);
                    }
                }
            }
        } catch (Exception ignore) {
            params.append("参数解析失败");
        }
        return params;
    }
}



