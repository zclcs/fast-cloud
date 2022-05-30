package com.zclcs.common.core.client;

import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.client.configure.fegin.FeignConfigure;
import com.zclcs.common.core.client.fallback.SystemClientFallback;
import com.zclcs.common.core.entity.system.ao.SystemMenuAo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author zclcs
 */
@FeignClient(value = "${my.server-name.server-system}", contextId = "systemLogServiceClient", fallbackFactory = SystemClientFallback.class, configuration = FeignConfigure.class)
public interface SystemClient {

    /**
     * 创建菜单
     *
     * @param menu menu
     * @return 菜单id
     */
    @PostMapping("/menu")
    BaseRsp<Long> addMenu(@RequestBody SystemMenuAo menu);
}
