package com.zclcs.common.core.service.fallback;

import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.MyServerConstant;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.common.core.entity.system.ao.SystemMenuAo;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.common.core.service.SystemService;
import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author zclcs
 */
@Slf4j
@Component
public class SystemServiceFallback implements FallbackFactory<SystemService> {

    @Override
    public SystemService create(Throwable throwable) {
        return new SystemService() {
            @Override
            public void saveLog(SystemLogAo systemLogAo) {
                logError(throwable);
            }

            @Override
            public BaseRsp<Long> addMenu(SystemMenuAo menu) {
                logError(throwable);
                throw new MyException(throwable.getMessage());
            }
        };
    }

    private void logError(Throwable throwable) {
        log.error("调用{}服务出错", MyServerConstant.SERVER_SYSTEM, throwable);
    }
}
