package com.zclcs.server.system.controller;

import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.ao.BlockLogAo;
import com.zclcs.common.core.entity.system.vo.BlockLogVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.system.service.BlockLogService;
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
 * 黑名单拦截日志表 Controller
 *
 * @author zclcs
 * @date 2021-12-29 17:21:44.593
 */
@Slf4j
@Validated
@RestController
@RequestMapping("blockLog")
@RequiredArgsConstructor
@Api(tags = "黑名单拦截日志表")
public class BlockLogController {

    private final BlockLogService blockLogService;

    @GetMapping
    @ApiOperation(value = "黑名单拦截日志表查询（分页）")
    @PreAuthorize("hasAuthority('blockLog:view')")
    public BaseRsp<BasePage<BlockLogVo>> findBlockLogPage(@Valid BasePageAo basePageAo, BlockLogVo blockLogVo) {
        BasePage<BlockLogVo> page = this.blockLogService.findBlockLogPage(basePageAo, blockLogVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "黑名单拦截日志表查询（集合）")
    @PreAuthorize("hasAuthority('blockLog:view')")
    public BaseRsp<List<BlockLogVo>> findBlockLogList(BlockLogVo blockLogVo) {
        List<BlockLogVo> list = this.blockLogService.findBlockLogList(blockLogVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "黑名单拦截日志表查询（单个）")
    @PreAuthorize("hasAuthority('blockLog:view')")
    public BaseRsp<BlockLogVo> findBlockLog(BlockLogVo blockLogVo) {
        BlockLogVo blockLog = this.blockLogService.findBlockLog(blockLogVo);
        return BaseRspUtil.data(blockLog);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('blockLog:add')")
    @ApiOperation(value = "新增黑名单拦截日志表")
    public void addBlockLog(@RequestBody @Validated BlockLogAo blockLogAo) {
        this.blockLogService.createBlockLog(blockLogAo);
    }

    @DeleteMapping("/{blockLogIds}")
    @PreAuthorize("hasAuthority('blockLog:delete')")
    @ApiOperation(value = "删除黑名单拦截日志表")
    public void deleteBlockLog(@ApiParam(value = "黑名单拦截日志表id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String blockLogIds) {
        List<Long> ids = Arrays.stream(blockLogIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.blockLogService.deleteBlockLog(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('blockLog:update')")
    @ApiOperation(value = "修改黑名单拦截日志表")
    public void updateBlockLog(@RequestBody @Validated(UpdateStrategy.class) BlockLogAo blockLogAo) {
        this.blockLogService.updateBlockLog(blockLogAo);
    }
}