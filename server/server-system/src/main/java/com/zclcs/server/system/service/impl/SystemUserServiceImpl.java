package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.system.SystemUser;
import com.zclcs.common.core.entity.system.SystemUserDataPermission;
import com.zclcs.common.core.entity.system.SystemUserRole;
import com.zclcs.common.core.entity.system.ao.SelectSystemUserAo;
import com.zclcs.common.core.entity.system.ao.SystemUserAo;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import com.zclcs.common.core.utils.BaseUsersUtil;
import com.zclcs.server.system.mapper.SystemUserDataPermissionMapper;
import com.zclcs.server.system.mapper.SystemUserMapper;
import com.zclcs.server.system.mapper.SystemUserRoleMapper;
import com.zclcs.server.system.service.SystemDeptService;
import com.zclcs.server.system.service.SystemUserDataPermissionService;
import com.zclcs.server.system.service.SystemUserRoleService;
import com.zclcs.server.system.service.SystemUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class SystemUserServiceImpl extends ServiceImpl<SystemUserMapper, SystemUser> implements SystemUserService {

    private final SystemUserRoleService userRoleService;
    private final SystemUserRoleMapper systemUserRoleMapper;
    private final SystemUserDataPermissionService userDataPermissionService;
    private final SystemUserDataPermissionMapper systemUserDataPermissionMapper;
    private final SystemDeptService deptService;
    private final SystemUserRoleMapper userRoleMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public SystemUserVo findByName(String username) {
        QueryWrapper<SystemUserVo> objectQueryWrapper = new QueryWrapper<>();
        objectQueryWrapper.eq("su.username", username);
        return this.baseMapper.findOneVo(objectQueryWrapper);
    }

    @Override
    public BasePage<SystemUserVo> findUserDetailPage(BasePageAo request, SelectSystemUserAo user) {
        BasePage<SystemUserVo> page = new BasePage<>(request.getPageNum(), request.getPageSize());
        BasePage<SystemUserVo> pageVo = this.baseMapper.findPageVo(page, getUserQueryWrapper(user));
        return pageVo;
    }

    @Override
    public List<SystemUserVo> findUserList(SelectSystemUserAo user) {
        List<SystemUserVo> userVos = this.baseMapper.findListVo(getUserQueryWrapper(user));
        return userVos;
    }

    private QueryWrapper<SystemUserVo> getUserQueryWrapper(SelectSystemUserAo user) {
        QueryWrapper<SystemUserVo> queryWrapper = new QueryWrapper<>();
        AtomicReference<List<Long>> deptList = new AtomicReference<>();
        Optional.ofNullable(user.getDeptId()).ifPresent(aLong -> deptList.set(deptService.getChildDeptId(aLong)));
        queryWrapper
                .in(user.getDeptId() != null && CollUtil.isNotEmpty(deptList.get()), "su.dept_id", deptList.get())
                .eq(user.getDeptId() != null && CollUtil.isEmpty(deptList.get()), "su.dept_id", 0)
                .like(StrUtil.isNotBlank(user.getUsername()), "su.username", user.getUsername())
                .orderByAsc("su.user_id");
        return queryWrapper;
    }

    @Override
    public SystemUserVo findUserDetail(String username) {
        SystemUserVo byName = this.findByName(username);
        return byName;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateLoginTime(String username) {
        SystemUser systemUser = new SystemUser();
        systemUser.setLastLoginTime(DateUtil.date());
        this.lambdaUpdate().eq(SystemUser::getUsername, username).update(systemUser);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createUser(SystemUserAo user) {
        SystemUser systemUser = new SystemUser();
        BeanUtil.copyProperties(user, systemUser);
        systemUser.setCreateTime(new Date());
        systemUser.setAvatar(SystemUserVo.DEFAULT_AVATAR);
        systemUser.setPassword(passwordEncoder.encode(SystemUserVo.DEFAULT_PASSWORD));
        this.save(systemUser);
        setUserRoles(systemUser, user.getRoleIds());
        setUserDataPermissions(systemUser, user.getDeptIds());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateUser(SystemUserAo user) {
        SystemUser systemUser = new SystemUser();
        BeanUtil.copyProperties(user, systemUser);
        // 更新用户
        systemUser.setPassword(null);
        systemUser.setUsername(null);
        systemUser.setCreateTime(null);
        systemUser.setModifyTime(DateUtil.date());
        updateById(systemUser);

        ArrayList<Long> userIds = CollUtil.newArrayList(systemUser.getUserId());
        userRoleService.deleteUserRolesByUserId(userIds);
        setUserRoles(systemUser, user.getRoleIds());

        userDataPermissionService.deleteByUserIds(userIds);
        setUserDataPermissions(systemUser, user.getDeptIds());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUsers(List<Long> userIds) {
        this.removeByIds(userIds);
        // 删除用户角色
        this.userRoleService.deleteUserRolesByUserId(userIds);
        this.userDataPermissionService.deleteByUserIds(userIds);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updatePassword(String username, String password) {
        SystemUser user = new SystemUser();
        user.setPassword(passwordEncoder.encode(password));
        String currentUsername = BaseUsersUtil.getCurrentUsername();
        this.lambdaUpdate().eq(SystemUser::getUsername, Optional.ofNullable(username).filter(StrUtil::isNotBlank).orElse(currentUsername)).update(user);
    }

    @Override
    public void updateStatus(String username, String status) {
        SystemUser user = new SystemUser();
        user.setStatus(Optional.ofNullable(status).filter(StrUtil::isNotBlank).orElse(SystemUserVo.STATUS_LOCK));
        String currentUsername = BaseUsersUtil.getCurrentUsername();
        this.lambdaUpdate().eq(SystemUser::getUsername, Optional.ofNullable(username).filter(StrUtil::isNotBlank).orElse(currentUsername)).update(user);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void resetPassword(List<String> usernames) {
        SystemUser user = new SystemUser();
        user.setPassword(passwordEncoder.encode(SystemUserVo.DEFAULT_PASSWORD));
        this.lambdaUpdate().in(SystemUser::getUsername, usernames).update(user);
    }

    private void setUserRoles(SystemUser user, List<Long> roles) {
        List<SystemUserRole> userRoles = new ArrayList<>();
        roles.stream().filter(Objects::nonNull).forEach(roleId -> {
            SystemUserRole userRole = new SystemUserRole();
            userRole.setUserId(user.getUserId());
            userRole.setRoleId(roleId);
            userRoles.add(userRole);
        });
        userRoleService.saveBatch(userRoles);
    }

    private void setUserDataPermissions(SystemUser user, List<Long> deptIds) {
        List<SystemUserDataPermission> userDataPermissions = new ArrayList<>();
        deptIds.stream().filter(Objects::nonNull).forEach(deptId -> {
            SystemUserDataPermission permission = new SystemUserDataPermission();
            permission.setDeptId(deptId);
            permission.setUserId(user.getUserId());
            userDataPermissions.add(permission);
        });
        userDataPermissionService.saveBatch(userDataPermissions);
    }
}
