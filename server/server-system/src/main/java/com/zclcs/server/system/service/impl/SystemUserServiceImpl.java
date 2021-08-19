package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.system.SystemUser;
import com.zclcs.common.core.entity.system.SystemUserDataPermission;
import com.zclcs.common.core.entity.system.SystemUserRole;
import com.zclcs.common.core.entity.system.ao.SystemUserAo;
import com.zclcs.common.core.entity.system.vo.SystemUserDataPermissionVo;
import com.zclcs.common.core.entity.system.vo.SystemUserRoleVo;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import com.zclcs.common.core.utils.BaseUtil;
import com.zclcs.server.system.mapper.SystemUserDataPermissionMapper;
import com.zclcs.server.system.mapper.SystemUserMapper;
import com.zclcs.server.system.mapper.SystemUserRoleMapper;
import com.zclcs.server.system.service.SystemUserDataPermissionService;
import com.zclcs.server.system.service.SystemUserRoleService;
import com.zclcs.server.system.service.SystemUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

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
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class SystemUserServiceImpl extends ServiceImpl<SystemUserMapper, SystemUser> implements SystemUserService {

    private final SystemUserRoleService userRoleService;
    private final SystemUserRoleMapper systemUserRoleMapper;
    private final SystemUserDataPermissionService userDataPermissionService;
    private final SystemUserDataPermissionMapper systemUserDataPermissionMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public SystemUserVo findByName(String username) {
        QueryWrapper<SystemUserVo> objectQueryWrapper = new QueryWrapper<>();
        objectQueryWrapper.eq("su.username", username);
        return this.baseMapper.findOneVo(objectQueryWrapper);
    }

    @Override
    public SystemUserVo findUserDetail(String username) {
        SystemUserVo byName = this.findByName(username);
        QueryWrapper<SystemUserRoleVo> objectQueryWrapper = new QueryWrapper<>();
        objectQueryWrapper.eq("su.user_id", byName.getUserId());
        List<SystemUserRoleVo> listVo = systemUserRoleMapper.findListVo(objectQueryWrapper);
        byName.setSystemUserRoleVos(listVo);
        QueryWrapper<SystemUserDataPermissionVo> systemUserDataPermissionVoQueryWrapper = new QueryWrapper<>();
        objectQueryWrapper.eq("su.user_id", byName.getUserId());
        List<Long> deptIds = systemUserDataPermissionMapper.findListVo(systemUserDataPermissionVoQueryWrapper).stream().map(SystemUserDataPermissionVo::getDeptId).collect(Collectors.toList());
        byName.setDeptIds(deptIds);
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
    public void createUser(SystemUserAo user) {
        SystemUser systemUser = new SystemUser();
        BeanUtil.copyProperties(user, systemUser);
        systemUser.setCreateTime(new Date());
        systemUser.setAvatar(SystemUserVo.DEFAULT_AVATAR);
        systemUser.setPassword(passwordEncoder.encode(SystemUserVo.DEFAULT_PASSWORD));
        this.save(systemUser);
        setUserRoles(systemUser, user.getRoles());
        setUserDataPermissions(systemUser, user.getDeptIds());
    }

    @Override
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
        setUserRoles(systemUser, user.getRoles());

        userDataPermissionService.deleteByUserIds(userIds);
        setUserDataPermissions(systemUser, user.getDeptIds());
    }

    @Override
    public void deleteUsers(List<Long> userIds) {
        this.removeByIds(userIds);
        // 删除用户角色
        this.userRoleService.deleteUserRolesByUserId(userIds);
        this.userDataPermissionService.deleteByUserIds(userIds);
    }

    @Override
    public void updatePassword(String password) {
        SystemUser user = new SystemUser();
        user.setPassword(passwordEncoder.encode(password));
        String currentUsername = BaseUtil.getCurrentUsername();
        this.lambdaUpdate().eq(SystemUser::getUsername, currentUsername).update(user);
    }

    @Override
    public void resetPassword(List<Long> usernames) {
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
