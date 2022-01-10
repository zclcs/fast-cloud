package com.zclcs.server.system.service;

import com.zclcs.common.core.entity.system.RouteLog;
import com.zclcs.common.core.entity.system.ao.RouteLogAo;
import com.zclcs.common.core.entity.system.vo.RouteLogVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;

import java.util.List;

/**
 * 网关转发日志表 Service接口
 *
 * @author zclcs
 * @date 2021-12-29 17:21:05.034
 */
public interface RouteLogService extends IService<RouteLog> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param routeLogVo routeLogVo
     * @return BasePage<RouteLogVo>
     */
    BasePage<RouteLogVo> findRouteLogPage(BasePageAo basePageAo, RouteLogVo routeLogVo);

    /**
     * 查询（所有）
     *
     * @param routeLogVo routeLogVo
     * @return List<RouteLogVo>
     */
    List<RouteLogVo> findRouteLogList(RouteLogVo routeLogVo);

    /**
     * 查询（单个）
     *
     * @param routeLogVo routeLogVo
     * @return RouteLogVo
     */
    RouteLogVo findRouteLog(RouteLogVo routeLogVo);

    /**
     * 统计
     *
     * @param routeLogVo routeLogVo
     * @return RouteLogVo
     */
    Integer countRouteLog(RouteLogVo routeLogVo);

    /**
     * 新增
     *
     * @param routeLogAo routeLogAo
     */
    void createRouteLog(RouteLogAo routeLogAo);

    /**
     * 修改
     *
     * @param routeLogAo routeLogAo
     */
    void updateRouteLog(RouteLogAo routeLogAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteRouteLog(List<Long> ids);

}
