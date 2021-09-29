package com.zclcs.common.core.service;

import com.zclcs.common.core.constant.MyServerConstant;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.common.core.service.fallback.SystemLogServiceFallback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author zclcs
 */
@FeignClient(value = MyServerConstant.SERVER_SYSTEM, contextId = "systemLogServiceClient", fallbackFactory = SystemLogServiceFallback.class)
public interface SystemLogService {

    /**
     * 保存日志
     *
     * @param systemLogAo 参数
     */
    @PostMapping("/log")
    void saveLog(@RequestBody SystemLogAo systemLogAo);
}
