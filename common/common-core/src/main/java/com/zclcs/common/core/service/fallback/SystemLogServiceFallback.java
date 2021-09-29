package com.zclcs.common.core.service.fallback;

import com.zclcs.common.core.constant.MyServerConstant;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.common.core.service.SystemLogService;
import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author zclcs
 */
@Slf4j
@Component
public class SystemLogServiceFallback implements FallbackFactory<SystemLogService> {

    @Override
    public SystemLogService create(Throwable throwable) {
        return new SystemLogService() {
            @Override
            public void saveLog(SystemLogAo systemLogAo) {
                log.error("调用{}服务出错", MyServerConstant.SERVER_SYSTEM, throwable);
            }
        };
    }

}
