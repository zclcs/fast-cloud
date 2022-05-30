package com.zclcs.common.core.client.fallback;

import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.client.SystemClient;
import com.zclcs.common.core.constant.MyServerConstant;
import com.zclcs.common.core.entity.system.ao.SystemMenuAo;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.common.core.utils.BaseUtil;
import feign.hystrix.FallbackFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author zclcs
 */
@Slf4j
@Component
public class SystemClientFallback implements FallbackFactory<SystemClient> {

    @Override
    public SystemClient create(Throwable throwable) {
        return new SystemClient() {
            @Override
            public BaseRsp<Long> addMenu(SystemMenuAo menu) {
                BaseUtil.logServiceError(throwable, MyServerConstant.SERVER_SYSTEM);
                throw new MyException(throwable.getMessage());
            }
        };
    }
}
