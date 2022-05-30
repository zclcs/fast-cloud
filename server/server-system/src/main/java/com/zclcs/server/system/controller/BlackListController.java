package com.zclcs.server.system.controller;

import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.ao.BlackListAo;
import com.zclcs.common.core.entity.system.vo.BlackListVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.system.service.BlackListService;
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
 * 黑名单表 Controller
 *
 * @author zclcs
 * @date 2021-12-29 17:20:03.111
 */
@Slf4j
@Validated
@RestController
@RequestMapping("blackList")
@RequiredArgsConstructor
@Api(tags = "黑名单表")
public class BlackListController {

    private final BlackListService blackListService;

    @GetMapping
    @ApiOperation(value = "黑名单表查询（分页）")
    @PreAuthorize("hasAuthority('blackList:view')")
    public BaseRsp<BasePage<BlackListVo>> findBlackListPage(@Valid BasePageAo basePageAo, BlackListVo blackListVo) {
        BasePage<BlackListVo> page = this.blackListService.findBlackListPage(basePageAo, blackListVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "黑名单表查询（集合）")
    @PreAuthorize("hasAuthority('blackList:view')")
    public BaseRsp<List<BlackListVo>> findBlackListList(BlackListVo blackListVo) {
        List<BlackListVo> list = this.blackListService.findBlackListList(blackListVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "黑名单表查询（单个）")
    @PreAuthorize("hasAuthority('blackList:view')")
    public BaseRsp<BlackListVo> findBlackList(BlackListVo blackListVo) {
        BlackListVo blackList = this.blackListService.findBlackList(blackListVo);
        return BaseRspUtil.data(blackList);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('blackList:add')")
    @ApiOperation(value = "新增黑名单表")
    public void addBlackList(@RequestBody @Validated BlackListAo blackListAo) {
        this.blackListService.createBlackList(blackListAo);
    }

    @DeleteMapping("/{blackListIds}")
    @PreAuthorize("hasAuthority('blackList:delete')")
    @ApiOperation(value = "删除黑名单表")
    public void deleteBlackList(@ApiParam(value = "黑名单表id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String blackListIds) {
        List<Long> ids = Arrays.stream(blackListIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.blackListService.deleteBlackList(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('blackList:update')")
    @ApiOperation(value = "修改黑名单表")
    public void updateBlackList(@RequestBody @Validated(UpdateStrategy.class) BlackListAo blackListAo) {
        this.blackListService.updateBlackList(blackListAo);
    }
}