package com.zclcs.gateway.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.entity.system.RouteLog;
import com.zclcs.common.core.entity.system.ao.RouteLogAo;

/**
 * 网关转发日志表 Service接口
 *
 * @author zclcs
 * @date 2021-12-29 17:21:05.034
 */
public interface RouteLogService extends IService<RouteLog> {

    /**
     * 新增
     *
     * @param routeLogAo routeLogAo
     */
    void createRouteLog(RouteLogAo routeLogAo);

}
