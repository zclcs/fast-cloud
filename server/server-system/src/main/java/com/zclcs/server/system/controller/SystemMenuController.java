package com.zclcs.server.system.controller;


import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.MenuTree;
import com.zclcs.common.core.entity.router.VueRouter;
import com.zclcs.common.core.entity.system.ao.SystemMenuAo;
import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.system.service.SystemMenuService;
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
 * 菜单表 前端控制器
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("/menu")
@Api(tags = "菜单管理")
public class SystemMenuController {

    private final SystemMenuService menuService;

    @GetMapping("/{username}")
    @ApiOperation(value = "用户路由")
    public BaseRsp<List<VueRouter<SystemMenuVo>>> getUserRouters(@ApiParam(value = "用户名", required = true) @NotBlank(message = "{required}") @PathVariable String username) {
        List<VueRouter<SystemMenuVo>> userRouters = this.menuService.getUserRouters(username);
        return BaseRspUtil.data(userRouters);
    }

    @GetMapping
    @ApiOperation(value = "菜单")
    public BaseRsp<List<MenuTree>> menuList(SystemMenuAo menu) {
        List<MenuTree> systemMenus = (List<MenuTree>) this.menuService.findSystemMenus(menu);
        return BaseRspUtil.data(systemMenus);
    }

    @GetMapping("/permissions/{username}")
    @ApiOperation(value = "权限")
    public BaseRsp<List<String>> findUserPermissions(@ApiParam(value = "用户名", required = true) @NotBlank(message = "{required}") @PathVariable String username) {
        return BaseRspUtil.data(this.menuService.findUserPermissions(username));
    }

    @PostMapping
    @PreAuthorize("hasAuthority('menu:add')")
    @ApiOperation(value = "新增菜单/按钮")
    @ControllerEndpoint(operation = "新增菜单/按钮")
    public BaseRsp<Long> addMenu(@RequestBody @Validated SystemMenuAo menu) {
        return BaseRspUtil.data(this.menuService.createSystemMenu(menu));
    }

    @DeleteMapping("/{menuIds}")
    @PreAuthorize("hasAuthority('menu:delete')")
    @ApiOperation(value = "删除菜单/按钮")
    @ControllerEndpoint(operation = "删除菜单/按钮")
    public void deleteMenus(@ApiParam(value = "菜单/按钮id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String menuIds) {
        List<Long> ids = Arrays.stream(menuIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.menuService.deleteMenus(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('menu:update')")
    @ApiOperation(value = "修改菜单/按钮")
    @ControllerEndpoint(operation = "修改菜单/按钮")
    public void updateMenu(@RequestBody @Validated(UpdateStrategy.class) SystemMenuAo menu) {
        this.menuService.updateSystemMenu(menu);
    }

}
