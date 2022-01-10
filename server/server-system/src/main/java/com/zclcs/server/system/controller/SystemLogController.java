package com.zclcs.server.system.controller;

import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.common.core.entity.system.vo.SystemLogVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.system.service.SystemLogService;
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
 * <p>
 * 用户操作日志表 前端控制器
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("log")
@Api(tags = "用户操作日志")
public class SystemLogController {

    private final SystemLogService logService;

    @GetMapping
    @ApiOperation(value = "分页")
    @PreAuthorize("hasAuthority('userLog:view')")
    public BaseRsp<BasePage<SystemLogVo>> logList(BasePageAo basePageAo, SystemLogAo log) {
        BasePage<SystemLogVo> page = this.logService.findLogPage(basePageAo, log);
        return BaseRspUtil.data(page);
    }

    @PostMapping
    @ApiOperation(value = "保存日志")
    public void saveLog(@RequestBody @Validated SystemLogAo log) {
        this.logService.saveLog(log.getClassName(), log.getMethodName(), log.getParams(), log.getIp(), log.getOperation(), log.getUsername(), log.getStart());
    }

    @DeleteMapping("/{logIds}")
    @PreAuthorize("hasAuthority('log:delete')")
    @ApiOperation(value = "删除日志")
    public void deleteLogs(@ApiParam(value = "日志id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String logIds) {
        List<Long> ids = Arrays.stream(logIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.logService.deleteLogs(ids);
    }

}
