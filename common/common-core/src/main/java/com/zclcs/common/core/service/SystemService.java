package com.zclcs.common.core.service;

import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.entity.system.ao.SystemMenuAo;
import com.zclcs.common.core.service.configure.fegin.FeignConfigure;
import com.zclcs.common.core.service.fallback.SystemServiceFallback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author zclcs
 */
@FeignClient(value = "${my.server-name.server-system}", contextId = "systemLogServiceClient", fallbackFactory = SystemServiceFallback.class, configuration = FeignConfigure.class)
public interface SystemService {

    /**
     * 创建菜单
     *
     * @param menu menu
     * @return 菜单id
     */
    @PostMapping("/menu")
    BaseRsp<Long> addMenu(@RequestBody SystemMenuAo menu);
}
