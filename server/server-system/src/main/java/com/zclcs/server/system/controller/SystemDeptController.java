package com.zclcs.server.system.controller;

import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.DeptTree;
import com.zclcs.common.core.entity.system.ao.SystemDeptAo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.system.annotation.ControllerEndpoint;
import com.zclcs.server.system.service.SystemDeptService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
 * <p>
 * 部门表 前端控制器
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Slf4j
@Validated
@RestController
@RequestMapping("dept")
@RequiredArgsConstructor
@Api(tags = "部门管理")
public class SystemDeptController {

    private final SystemDeptService deptService;

    @GetMapping
    @ApiOperation(value = "分页")
    public BaseRsp<BasePage<DeptTree>> deptList(BasePageAo basePageAo, SystemDeptAo dept) {
        BasePage<DeptTree> page = this.deptService.findDeptPage(basePageAo, dept);
        return BaseRspUtil.data(page);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('dept:add')")
    @ControllerEndpoint(operation = "新增部门", exceptionMessage = "新增部门失败")
    @ApiOperation(value = "新增部门")
    public void addDept(@Valid SystemDeptAo dept) {
        this.deptService.createDept(dept);
    }

    @DeleteMapping("/{deptIds}")
    @PreAuthorize("hasAuthority('dept:delete')")
    @ControllerEndpoint(operation = "删除部门", exceptionMessage = "删除部门失败")
    @ApiOperation(value = "删除部门")
    public void deleteDepts(@NotBlank(message = "{required}") @PathVariable String deptIds) {
        List<Long> ids = Arrays.stream(deptIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.deptService.deleteDept(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('dept:update')")
    @ControllerEndpoint(operation = "修改部门", exceptionMessage = "修改部门失败")
    @ApiOperation(value = "修改部门")
    public void updateDept(@Valid SystemDeptAo dept) {
        this.deptService.updateDept(dept);
    }

}
