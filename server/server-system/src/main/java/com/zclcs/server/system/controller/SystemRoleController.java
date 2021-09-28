package com.zclcs.server.system.controller;


import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.SystemRole;
import com.zclcs.common.core.entity.system.ao.SelectSystemRoleAo;
import com.zclcs.common.core.entity.system.ao.SystemRoleAo;
import com.zclcs.common.core.entity.system.vo.SystemRoleVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.server.system.service.SystemRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("role")
@Api(tags = "角色管理")
public class SystemRoleController {

    private final SystemRoleService roleService;

    @GetMapping
    @ApiOperation(value = "分页")
    public BaseRsp<BasePage<SystemRoleVo>> roleList(@Validated BasePageAo queryRequest, SystemRoleAo role) {
        BasePage<SystemRoleVo> systemRolePage = roleService.findSystemRolePage(queryRequest, role);
        return BaseRspUtil.data(systemRolePage);
    }

    @GetMapping("options")
    @ApiOperation(value = "集合")
    public BaseRsp<List<SystemRoleVo>> roles(@Validated SelectSystemRoleAo selectSystemRoleAo) {
        List<SystemRoleVo> systemRoleList = roleService.findSystemRoleList(selectSystemRoleAo);
        return BaseRspUtil.data(systemRoleList);
    }

    @GetMapping("check/{roleId}/{roleName}")
    @ApiOperation(value = "检查用户角色名")
    public BaseRsp<Boolean> checkRoleName(@NotNull(message = "{required}") @PathVariable Long roleId, @NotBlank(message = "{required}") @PathVariable String roleName) {
        SystemRole one = roleService.lambdaQuery().eq(SystemRole::getRoleId, roleId).one();
        if (one.getRoleName().equals(roleName)) {
            return BaseRspUtil.data(false);
        }
        return BaseRspUtil.data(roleService.lambdaQuery().eq(SystemRole::getRoleName, roleName).one() != null);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('role:add')")
    @ApiOperation(value = "新增角色")
    @ControllerEndpoint(operation = "新增角色", exceptionMessage = "新增角色失败")
    public void addRole(@RequestBody @Validated SystemRoleAo role) {
        this.roleService.createSystemRole(role);
    }

    @DeleteMapping("/{roleIds}")
    @PreAuthorize("hasAuthority('role:delete')")
    @ApiOperation(value = "删除角色")
    @ControllerEndpoint(operation = "删除角色", exceptionMessage = "删除角色失败")
    public void deleteRoles(@NotBlank(message = "{required}") @PathVariable String roleIds) {
        List<Long> ids = Arrays.stream(roleIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.roleService.deleteSystemRoles(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('role:update')")
    @ApiOperation(value = "修改角色")
    @ControllerEndpoint(operation = "修改角色", exceptionMessage = "修改角色失败")
    public void updateRole(@RequestBody @Validated(UpdateStrategy.class) SystemRoleAo role) {
        this.roleService.updateSystemRole(role);
    }

}
