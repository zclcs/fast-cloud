package com.zclcs.server.system.controller;


import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.system.SystemLoginLog;
import com.zclcs.common.core.entity.system.ao.SystemUserAo;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.utils.BaseUtil;
import com.zclcs.server.system.annotation.ControllerEndpoint;
import com.zclcs.server.system.service.SystemLoginLogService;
import com.zclcs.server.system.service.SystemUserDataPermissionService;
import com.zclcs.server.system.service.SystemUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
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
    private final SystemUserDataPermissionService userDataPermissionService;
    private final SystemLoginLogService loginLogService;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("success")
    @ApiOperation(value = "登录成功调用")
    public void loginSuccess(HttpServletRequest request) {
        String currentUsername = BaseUtil.getCurrentUsername();
        // update last login time
        this.userService.updateLoginTime(currentUsername);
        // save login log
        SystemLoginLog loginLog = new SystemLoginLog();
        loginLog.setUsername(currentUsername);
        loginLog.setBrowser(request.getHeader("user-agent"));
        this.loginLogService.save(loginLog);
    }

//    @GetMapping("index")
//    public BaseRsp<Object> index() {
//
//    }


    @GetMapping
    @PreAuthorize("hasAuthority('user:view')")
    @ApiOperation(value = "分页")
    public BaseRsp<BasePage<SystemUserVo>> userList(BasePageAo basePageAo, SystemUserAo user) {
        BasePage<SystemUserVo> userDetailPage = userService.findUserDetailPage(basePageAo, user);
        return BaseRspUtil.data(userDetailPage);
    }

    @GetMapping("check/{username}")
    @ApiOperation(value = "检查用户名")
    public boolean checkUserName(@NotBlank(message = "{required}") @PathVariable String username) {
        return this.userService.findByName(username) == null;
    }

    @PostMapping
    @PreAuthorize("hasAuthority('user:add')")
    @ApiOperation(value = "新增用户")
    @ControllerEndpoint(operation = "新增用户", exceptionMessage = "新增用户失败")
    public void addUser(@Valid SystemUserAo user) {
        this.userService.createUser(user);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('user:update')")
    @ApiOperation(value = "修改用户")
    @ControllerEndpoint(operation = "修改用户", exceptionMessage = "修改用户失败")
    public void updateUser(@Valid SystemUserAo user) {
        this.userService.updateUser(user);
    }

    @GetMapping("/{userId}")
    @PreAuthorize("hasAuthority('user:update')")
    @ApiOperation(value = "获取数据权限")
    public BaseRsp<List<Long>> findUserDataPermissions(@NotBlank(message = "{required}") @PathVariable Long userId) {
        List<Long> dataPermissions = this.userDataPermissionService.findByUserId(userId);
        return BaseRspUtil.data(dataPermissions);
    }

    @DeleteMapping("/{userIds}")
    @PreAuthorize("hasAuthority('user:delete')")
    @ApiOperation(value = "删除用户")
    @ControllerEndpoint(operation = "删除用户", exceptionMessage = "删除用户失败")
    public void deleteUsers(@NotBlank(message = "{required}") @PathVariable String userIds) {
        List<Long> ids = Arrays.stream(userIds.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.userService.deleteUsers(ids);
    }

//    @PutMapping("profile")
//    @ControllerEndpoint(exceptionMessage = "修改个人信息失败")
//    public void updateProfile(@Valid SystemUser user) {
//        this.userService.updateProfile(user);
//    }

//    @PutMapping("avatar")
//    @ControllerEndpoint(exceptionMessage = "修改头像失败")
//    public void updateAvatar(@NotBlank(message = "{required}") String avatar) {
//        this.userService.updateAvatar(avatar);
//    }

    @GetMapping("password/check")
    @ApiOperation(value = "检查用户密码")
    public boolean checkPassword(@NotBlank(message = "{required}") String password) {
        String currentUsername = BaseUtil.getCurrentUsername();
        SystemUserVo user = userService.findByName(currentUsername);
        return user != null && passwordEncoder.matches(password, user.getPassword());
    }

    @PutMapping("password")
    @ApiOperation(value = "修改密码")
    @ControllerEndpoint(exceptionMessage = "修改密码失败")
    public void updatePassword(@NotBlank(message = "{required}") String password) {
        userService.updatePassword(password);
    }

    @PutMapping("password/reset")
    @PreAuthorize("hasAuthority('user:reset')")
    @ApiOperation(value = "重置用户密码")
    @ControllerEndpoint(exceptionMessage = "重置用户密码失败")
    public void resetPassword(@NotBlank(message = "{required}") String usernames) {
        List<String> usernameList = Arrays.stream(usernames.split(StringConstant.COMMA)).collect(Collectors.toList());
        this.userService.resetPassword(usernameList);
    }

}
