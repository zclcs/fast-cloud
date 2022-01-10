package com.zclcs.server.system.controller;

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.vo.RouteLogVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.system.service.RouteLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 网关转发日志表 Controller
 *
 * @author zclcs
 * @date 2021-12-29 17:21:05.034
 */
@Slf4j
@Validated
@RestController
@RequestMapping("routeLog")
@RequiredArgsConstructor
@Api(tags = "网关转发日志")
public class RouteLogController {

    private final RouteLogService routeLogService;

    @GetMapping
    @ApiOperation(value = "网关转发日志表查询（分页）")
    @PreAuthorize("hasAuthority('routeLog:view')")
    public BaseRsp<BasePage<RouteLogVo>> findRouteLogPage(@Validated BasePageAo basePageAo, @Validated RouteLogVo routeLogVo) {
        BasePage<RouteLogVo> page = this.routeLogService.findRouteLogPage(basePageAo, routeLogVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "网关转发日志表查询（集合）")
    @PreAuthorize("hasAuthority('routeLog:view')")
    public BaseRsp<List<RouteLogVo>> findRouteLogList(@Validated RouteLogVo routeLogVo) {
        List<RouteLogVo> list = this.routeLogService.findRouteLogList(routeLogVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "网关转发日志表查询（单个）")
    @PreAuthorize("hasAuthority('routeLog:view')")
    public BaseRsp<RouteLogVo> findRouteLog(@Validated RouteLogVo routeLogVo) {
        RouteLogVo routeLog = this.routeLogService.findRouteLog(routeLogVo);
        return BaseRspUtil.data(routeLog);
    }

    @DeleteMapping("/{routeLogIds}")
    @PreAuthorize("hasAuthority('routeLog:delete')")
    @ApiOperation(value = "删除网关转发日志")
    @ControllerEndpoint(operation = "删除网关转发日志")
    public void deleteRouteLog(@ApiParam(value = "网关转发日志表id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String routeLogIds) {
        List<Long> ids = Arrays.stream(routeLogIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.routeLogService.deleteRouteLog(ids);
    }
}