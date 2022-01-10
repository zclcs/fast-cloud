package com.zclcs.server.system.controller;

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.ao.RateLimitRuleAo;
import com.zclcs.common.core.entity.system.vo.RateLimitRuleVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.system.service.RateLimitRuleService;
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
 * 限流规则表 Controller
 *
 * @author zclcs
 * @date 2021-12-29 17:21:19.726
 */
@Slf4j
@RestController
@RequestMapping("rateLimitRule")
@RequiredArgsConstructor
@Api(tags = "限流规则")
public class RateLimitRuleController {

    private final RateLimitRuleService rateLimitRuleService;

    @GetMapping
    @ApiOperation(value = "限流规则表查询（分页）")
    @PreAuthorize("hasAuthority('rateLimitRule:view')")
    public BaseRsp<BasePage<RateLimitRuleVo>> findRateLimitRulePage(@Validated BasePageAo basePageAo, @Validated RateLimitRuleVo rateLimitRuleVo) {
        BasePage<RateLimitRuleVo> page = this.rateLimitRuleService.findRateLimitRulePage(basePageAo, rateLimitRuleVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "限流规则表查询（集合）")
    @PreAuthorize("hasAuthority('rateLimitRule:view')")
    public BaseRsp<List<RateLimitRuleVo>> findRateLimitRuleList(@Validated RateLimitRuleVo rateLimitRuleVo) {
        List<RateLimitRuleVo> list = this.rateLimitRuleService.findRateLimitRuleList(rateLimitRuleVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "限流规则表查询（单个）")
    @PreAuthorize("hasAuthority('rateLimitRule:view')")
    public BaseRsp<RateLimitRuleVo> findRateLimitRule(@Validated RateLimitRuleVo rateLimitRuleVo) {
        RateLimitRuleVo rateLimitRule = this.rateLimitRuleService.findRateLimitRule(rateLimitRuleVo);
        return BaseRspUtil.data(rateLimitRule);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('rateLimitRule:add')")
    @ApiOperation(value = "新增限流规则")
    @ControllerEndpoint(operation = "新增限流规则")
    public void addRateLimitRule(@RequestBody @Validated RateLimitRuleAo rateLimitRuleAo) {
        this.rateLimitRuleService.createRateLimitRule(rateLimitRuleAo);
    }

    @DeleteMapping("/{rateLimitRuleIds}")
    @PreAuthorize("hasAuthority('rateLimitRule:delete')")
    @ApiOperation(value = "删除限流规则")
    @ControllerEndpoint(operation = "删除限流规则")
    public void deleteRateLimitRule(@ApiParam(value = "限流规则表id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String rateLimitRuleIds) {
        List<Long> ids = Arrays.stream(rateLimitRuleIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.rateLimitRuleService.deleteRateLimitRule(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('rateLimitRule:update')")
    @ApiOperation(value = "修改限流规则")
    @ControllerEndpoint(operation = "修改限流规则")
    public void updateRateLimitRule(@RequestBody @Validated(UpdateStrategy.class) RateLimitRuleAo rateLimitRuleAo) {
        this.rateLimitRuleService.updateRateLimitRule(rateLimitRuleAo);
    }
}