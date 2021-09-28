package com.zclcs.server.system.controller;


import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.ao.SystemLogAo;
import com.zclcs.common.core.entity.system.vo.SystemLogVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.system.annotation.ControllerEndpoint;
import com.zclcs.server.system.service.SystemLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
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
    @PreAuthorize("hasAuthority('log:view')")
    public BaseRsp<BasePage<SystemLogVo>> logList(BasePageAo basePageAo, SystemLogAo log) {
        BasePage<SystemLogVo> page = this.logService.findLogPage(basePageAo, log);
        return BaseRspUtil.data(page);
    }

    @DeleteMapping("{logIds}")
    @PreAuthorize("hasAuthority('log:delete')")
    @ControllerEndpoint(exceptionMessage = "删除日志失败")
    @ApiOperation(value = "删除日志")
    public void deleteLogs(@NotBlank(message = "{required}") @PathVariable String logIds) {
        List<Long> ids = Arrays.stream(logIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.logService.deleteLogs(ids);
    }

}
