package com.zclcs.server.system.controller;


import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.constant.SwaggerParamTypeConstant;
import com.zclcs.common.core.entity.system.SystemLoginLog;
import com.zclcs.common.core.entity.system.SystemUser;
import com.zclcs.common.core.entity.system.ao.SelectSystemUserAo;
import com.zclcs.common.core.entity.system.ao.SystemUserAo;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.utils.BaseUsersUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.system.service.SystemLoginLogService;
import com.zclcs.server.system.service.SystemUserDataPermissionService;
import com.zclcs.server.system.service.SystemUserService;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Slf4j
@Validated
@RestController
@RequiredArgsConstructor
@RequestMapping("user")
@Api(tags = "用户管理")
public class SystemUserController {

    private final SystemUserService userService;
    private final SystemUserDataPermissionService systemUserDataPermissionService;
    private final SystemLoginLogService systemLoginLogService;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("success")
    @ApiOperation(value = "登录成功调用")
    public void loginSuccess(HttpServletRequest request) {
        String currentUsername = BaseUsersUtil.getCurrentUsername();
        // update last login time
        this.userService.updateLoginTime(currentUsername);
        // save login log
        SystemLoginLog loginLog = new SystemLoginLog();
        loginLog.setUsername(currentUsername);
        loginLog.setBrowser(request.getHeader("user-agent"));
        this.systemLoginLogService.save(loginLog);
    }

    @GetMapping
    @PreAuthorize("hasAuthority('user:view')")
    @ApiOperation(value = "分页")
    public BaseRsp<BasePage<SystemUserVo>> userPage(@Validated BasePageAo basePageAo, SelectSystemUserAo selectSystemUserAo) {
        BasePage<SystemUserVo> userDetailPage = userService.findUserDetailPage(basePageAo, selectSystemUserAo);
        return BaseRspUtil.data(userDetailPage);
    }

    @GetMapping("options")
    @PreAuthorize("hasAuthority('user:view')")
    @ApiOperation(value = "集合")
    public BaseRsp<List<SystemUserVo>> userList(@Validated SelectSystemUserAo selectSystemUserAo) {
        List<SystemUserVo> userDetailPage = userService.findUserList(selectSystemUserAo);
        return BaseRspUtil.data(userDetailPage);
    }

    @GetMapping("check/{userId}/{username}")
    @ApiOperation(value = "检查用户名")
    public BaseRsp<Boolean> checkUserName(@ApiParam(value = "用户id", required = true) @NotNull(message = "{required}") @PathVariable Long userId,
                                          @ApiParam(value = "用户名", required = true) @NotBlank(message = "{required}") @PathVariable String username) {
        SystemUser one = userService.lambdaQuery().eq(SystemUser::getUserId, userId).one();
        if (one.getUsername().equals(username)) {
            return BaseRspUtil.data(false);
        }
        return BaseRspUtil.data(this.userService.findByName(username) != null);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('user:add')")
    @ApiOperation(value = "新增用户")
    @ControllerEndpoint(operation = "新增用户")
    public void addUser(@RequestBody @Validated SystemUserAo user) {
        this.userService.createUser(user);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('user:update')")
    @ApiOperation(value = "修改用户")
    @ControllerEndpoint(operation = "修改用户")
    public void updateUser(@RequestBody @Validated(UpdateStrategy.class) SystemUserAo user) {
        this.userService.updateUser(user);
    }

    @DeleteMapping("/{userIds}")
    @PreAuthorize("hasAuthority('user:delete')")
    @ApiOperation(value = "删除用户")
    @ControllerEndpoint(operation = "删除用户")
    public void deleteUsers(@ApiParam(value = "用户id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String userIds) {
        List<Long> ids = Arrays.stream(userIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.userService.deleteUsers(ids);
    }

    @GetMapping("/{userId}")
    @PreAuthorize("hasAuthority('user:view')")
    @ApiOperation(value = "获取数据权限")
    public BaseRsp<List<Long>> findUserDataPermissions(@ApiParam(value = "用户id", required = true) @NotBlank(message = "{required}") @PathVariable Long userId) {
        List<Long> dataPermissions = this.systemUserDataPermissionService.findByUserId(userId);
        return BaseRspUtil.data(dataPermissions);
    }

    @GetMapping("password/mine/check/{password}")
    @ApiOperation(value = "检查当前用户密码")
    public BaseRsp<Boolean> checkMyPassword(@ApiParam(value = "密码", required = true) @NotBlank(message = "{required}") @PathVariable String password) {
        String currentUsername = BaseUsersUtil.getCurrentUsername();
        SystemUserVo user = userService.findByName(currentUsername);
        return BaseRspUtil.data(user != null && passwordEncoder.matches(password, user.getPassword()));
    }

    @GetMapping("password/{username}/check/{password}")
    @ApiOperation(value = "检查用户密码")
    public BaseRsp<Boolean> checkPassword(@ApiParam(value = "用户名", required = true) @NotBlank(message = "{required}") @PathVariable String username,
                                          @ApiParam(value = "密码", required = true) @NotBlank(message = "{required}") @PathVariable String password) {
        SystemUserVo user = userService.findByName(username);
        return BaseRspUtil.data(user != null && passwordEncoder.matches(password, user.getPassword()));
    }

    @PutMapping("password/mine")
    @ApiOperation(value = "修改当前用户密码", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "password", value = "密码", required = true, paramType = SwaggerParamTypeConstant.QUERY)
    })
    @ControllerEndpoint(operation = "修改当前用户密码")
    public void updateMyPassword(@NotBlank(message = "{required}") String password) {
        userService.updatePassword(null, password);
    }

    @PutMapping("password")
    @ApiOperation(value = "修改密码", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", value = "用户名", required = true, paramType = SwaggerParamTypeConstant.QUERY),
            @ApiImplicitParam(name = "password", value = "密码", required = true, paramType = SwaggerParamTypeConstant.QUERY)
    })
    @ControllerEndpoint(operation = "修改密码")
    public void updatePassword(@NotBlank(message = "{required}") String username,
                               @NotBlank(message = "{required}") String password) {
        userService.updatePassword(username, password);
    }

    @PutMapping("status")
    @ApiOperation(value = "禁用账号", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", value = "用户名", required = true, paramType = SwaggerParamTypeConstant.QUERY)
    })
    @ControllerEndpoint(operation = "禁用账号")
    public void updateStatus(@NotBlank(message = "{required}") String username) {
        userService.updateStatus(username, null);
    }

    @PutMapping("password/reset")
    @PreAuthorize("hasAuthority('user:reset')")
    @ApiOperation(value = "重置用户密码", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "usernames", value = "用户名集合(,分隔)", required = true, paramType = SwaggerParamTypeConstant.QUERY)
    })
    @ControllerEndpoint(operation = "重置用户密码")
    public void resetPassword(@NotBlank(message = "{required}") String usernames) {
        List<String> usernameList = Arrays.stream(usernames.split(StringConstant.COMMA)).collect(Collectors.toList());
        this.userService.resetPassword(usernameList);
    }

}
