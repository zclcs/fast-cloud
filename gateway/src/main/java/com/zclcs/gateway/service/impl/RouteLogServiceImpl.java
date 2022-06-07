package com.zclcs.gateway.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.system.RouteLog;
import com.zclcs.common.core.entity.system.ao.RouteLogAo;
import com.zclcs.common.core.utils.BaseAddressUtil;
import com.zclcs.gateway.mapper.RouteLogMapper;
import com.zclcs.gateway.service.RouteLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
    @Transactional(rollbackFor = Exception.class)
    public void createRouteLog(RouteLogAo routeLogAo) {
        RouteLog routeLog = new RouteLog();
        BeanUtil.copyProperties(routeLogAo, routeLog);
        setRouteLog(routeLog);
        this.save(routeLog);
    }

    private void setRouteLog(RouteLog routeLog) {
        if (StrUtil.isNotBlank(routeLog.getRouteIp())) {
            routeLog.setLocation(BaseAddressUtil.getCityInfo(routeLog.getRouteIp()));
        }
        routeLog.setCreateBy(MyConstant.ADMIN);
    }
}
