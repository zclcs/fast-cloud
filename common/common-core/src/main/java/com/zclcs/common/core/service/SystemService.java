package com.zclcs.common.core.service;

import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.MyServerConstant;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.common.core.entity.system.ao.SystemMenuAo;
import com.zclcs.common.core.service.configure.fegin.FeignConfigure;
import com.zclcs.common.core.service.fallback.SystemServiceFallback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author zclcs
 */
@FeignClient(value = MyServerConstant.SERVER_SYSTEM, contextId = "systemLogServiceClient", fallbackFactory = SystemServiceFallback.class, configuration = FeignConfigure.class)
public interface SystemService {

    /**
     * 保存日志
     *
     * @param systemLogAo 参数
     */
    @PostMapping("/log")
    void saveLog(@RequestBody SystemLogAo systemLogAo);

    /**
     * 创建菜单
     *
     * @param menu menu
     * @return 菜单id
     */
    @PostMapping("/menu")
    BaseRsp<Long> addMenu(@RequestBody SystemMenuAo menu);
}