package com.zclcs.server.system.controller;

import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.ao.RateLimitLogAo;
import com.zclcs.common.core.entity.system.vo.RateLimitLogVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.system.service.RateLimitLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 限流拦截日志表 Controller
 *
 * @author zclcs
 * @date 2021-12-29 17:21:34.946
 */
@Slf4j
@Validated
@RestController
@RequestMapping("rateLimitLog")
@RequiredArgsConstructor
@Api(tags = "限流拦截日志表")
public class RateLimitLogController {

    private final RateLimitLogService rateLimitLogService;

    @GetMapping
    @ApiOperation(value = "限流拦截日志表查询（分页）")
    @PreAuthorize("hasAuthority('rateLimitLog:view')")
    public BaseRsp<BasePage<RateLimitLogVo>> findRateLimitLogPage(@Valid BasePageAo basePageAo, RateLimitLogVo rateLimitLogVo) {
        BasePage<RateLimitLogVo> page = this.rateLimitLogService.findRateLimitLogPage(basePageAo, rateLimitLogVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "限流拦截日志表查询（集合）")
    @PreAuthorize("hasAuthority('rateLimitLog:view')")
    public BaseRsp<List<RateLimitLogVo>> findRateLimitLogList(RateLimitLogVo rateLimitLogVo) {
        List<RateLimitLogVo> list = this.rateLimitLogService.findRateLimitLogList(rateLimitLogVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "限流拦截日志表查询（单个）")
    @PreAuthorize("hasAuthority('rateLimitLog:view')")
    public BaseRsp<RateLimitLogVo> findRateLimitLog(RateLimitLogVo rateLimitLogVo) {
        RateLimitLogVo rateLimitLog = this.rateLimitLogService.findRateLimitLog(rateLimitLogVo);
        return BaseRspUtil.data(rateLimitLog);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('rateLimitLog:add')")
    @ApiOperation(value = "新增限流拦截日志表")
    public void addRateLimitLog(@RequestBody @Validated RateLimitLogAo rateLimitLogAo) {
        this.rateLimitLogService.createRateLimitLog(rateLimitLogAo);
    }

    @DeleteMapping("/{rateLimitLogIds}")
    @PreAuthorize("hasAuthority('rateLimitLog:delete')")
    @ApiOperation(value = "删除限流拦截日志表")
    public void deleteRateLimitLog(@ApiParam(value = "限流拦截日志表id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String rateLimitLogIds) {
        List<Long> ids = Arrays.stream(rateLimitLogIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.rateLimitLogService.deleteRateLimitLog(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('rateLimitLog:update')")
    @ApiOperation(value = "修改限流拦截日志表")
    public void updateRateLimitLog(@RequestBody @Validated(UpdateStrategy.class) RateLimitLogAo rateLimitLogAo) {
        this.rateLimitLogService.updateRateLimitLog(rateLimitLogAo);
    }
}