package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.system.RouteLog;
import com.zclcs.common.core.entity.system.ao.RouteLogAo;
import com.zclcs.common.core.entity.system.vo.RouteLogVo;
import com.zclcs.common.core.utils.BaseAddressUtil;
import com.zclcs.common.core.utils.BaseQueryWrapperUtil;
import com.zclcs.server.system.mapper.RouteLogMapper;
import com.zclcs.server.system.service.RouteLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 网关转发日志表 Service实现
 *
 * @author zclcs
 * @date 2021-12-29 17:21:05.034
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class RouteLogServiceImpl extends ServiceImpl<RouteLogMapper, RouteLog> implements RouteLogService {

    @Override
    public BasePage<RouteLogVo> findRouteLogPage(BasePageAo basePageAo, RouteLogVo routeLogVo) {
        BasePage<RouteLogVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<RouteLogVo> queryWrapper = getQueryWrapper(routeLogVo);
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<RouteLogVo> findRouteLogList(RouteLogVo routeLogVo) {
        QueryWrapper<RouteLogVo> queryWrapper = getQueryWrapper(routeLogVo);
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public RouteLogVo findRouteLog(RouteLogVo routeLogVo) {
        QueryWrapper<RouteLogVo> queryWrapper = getQueryWrapper(routeLogVo);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public Integer countRouteLog(RouteLogVo routeLogVo) {
        QueryWrapper<RouteLogVo> queryWrapper = getQueryWrapper(routeLogVo);
        return this.baseMapper.countVo(queryWrapper);
    }

    private QueryWrapper<RouteLogVo> getQueryWrapper(RouteLogVo routeLogVo) {
        QueryWrapper<RouteLogVo> queryWrapper = new QueryWrapper<>();
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "srl.route_ip", routeLogVo.getRouteIp());
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "srl.target_server", routeLogVo.getTargetServer());
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "srl.request_method", routeLogVo.getRequestMethod());
        BaseQueryWrapperUtil.betweenDateAddTimeNotBlank(queryWrapper, "srl.create_at", routeLogVo.getCreateTimeFrom(), routeLogVo.getCreateTimeTo());
        queryWrapper.orderByDesc("srl.create_at");
        return queryWrapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createRouteLog(RouteLogAo routeLogAo) {
        RouteLog routeLog = new RouteLog();
        BeanUtil.copyProperties(routeLogAo, routeLog);
        setRouteLog(routeLog);
        this.save(routeLog);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateRouteLog(RouteLogAo routeLogAo) {
        RouteLog routeLog = new RouteLog();
        BeanUtil.copyProperties(routeLogAo, routeLog);
        setRouteLog(routeLog);
        this.updateById(routeLog);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteRouteLog(List<Long> ids) {
        this.removeByIds(ids);
    }

    private void setRouteLog(RouteLog routeLog) {
        if (StrUtil.isNotBlank(routeLog.getRouteIp())) {
            routeLog.setLocation(BaseAddressUtil.getCityInfo(routeLog.getRouteIp()));
        }
    }
}
