package com.zclcs.server.system.controller;

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.DeptTree;
import com.zclcs.common.core.entity.system.ao.SelectSystemDeptAo;
import com.zclcs.common.core.entity.system.ao.SystemDeptAo;
import com.zclcs.common.core.entity.system.vo.SystemDeptVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.system.service.SystemDeptService;
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

    private final SystemDeptService systemDeptService;

    @GetMapping
    @ApiOperation(value = "分页")
    @PreAuthorize("hasAuthority('dept:view')")
    public BaseRsp<BasePage<DeptTree>> deptPage(@Valid BasePageAo basePageAo, SelectSystemDeptAo dept) {
        BasePage<DeptTree> page = this.systemDeptService.findDeptPage(basePageAo, dept);
        return BaseRspUtil.data(page);
    }

    @GetMapping("options")
    @ApiOperation(value = "前端下拉框")
    @PreAuthorize("hasAuthority('dept:view')")
    public BaseRsp<List<DeptTree>> deptTree(@Valid SelectSystemDeptAo dept) {
        List<DeptTree> list = this.systemDeptService.findDeptTree(dept);
        return BaseRspUtil.data(list);
    }

    @GetMapping("list")
    @ApiOperation(value = "集合")
    @PreAuthorize("hasAuthority('dept:view')")
    public BaseRsp<List<SystemDeptVo>> deptList(@Valid SelectSystemDeptAo dept) {
        List<SystemDeptVo> deptList = this.systemDeptService.findDeptList(dept);
        return BaseRspUtil.data(deptList);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('dept:add')")
    @ApiOperation(value = "新增部门")
    @ControllerEndpoint(operation = "新增部门")
    public void addDept(@RequestBody @Validated SystemDeptAo dept) {
        this.systemDeptService.createDept(dept);
    }

    @DeleteMapping("/{deptIds}")
    @PreAuthorize("hasAuthority('dept:delete')")
    @ApiOperation(value = "删除部门")
    @ControllerEndpoint(operation = "删除部门")
    public void deleteDepts(@ApiParam(value = "部门id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String deptIds) {
        List<Long> ids = Arrays.stream(deptIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.systemDeptService.deleteDept(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('dept:update')")
    @ApiOperation(value = "修改部门")
    @ControllerEndpoint(operation = "修改部门")
    public void updateDept(@RequestBody @Validated(UpdateStrategy.class) SystemDeptAo dept) {
        this.systemDeptService.updateDept(dept);
    }

}
