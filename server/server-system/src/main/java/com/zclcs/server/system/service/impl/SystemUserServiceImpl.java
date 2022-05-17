package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.RedisCachePrefixConstant;
import com.zclcs.common.core.entity.system.SystemUser;
import com.zclcs.common.core.entity.system.SystemUserDataPermission;
import com.zclcs.common.core.entity.system.SystemUserRole;
import com.zclcs.common.core.entity.system.ao.SelectSystemUserAo;
import com.zclcs.common.core.entity.system.ao.SystemUserAo;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import com.zclcs.common.core.utils.BaseUsersUtil;
import com.zclcs.common.redis.starter.service.RedisService;
import com.zclcs.server.system.mapper.SystemUserMapper;
import com.zclcs.server.system.service.SystemDeptService;
import com.zclcs.server.system.service.SystemUserDataPermissionService;
import com.zclcs.server.system.service.SystemUserRoleService;
import com.zclcs.server.system.service.SystemUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;
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
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class SystemUserServiceImpl extends ServiceImpl<SystemUserMapper, SystemUser> implements SystemUserService {

    private final SystemUserRoleService systemUserRoleService;
    private final SystemUserDataPermissionService systemUserDataPermissionService;
    private final SystemDeptService systemDeptService;
    private final PasswordEncoder passwordEncoder;
    private final RedisService redisService;

    @Override
    public SystemUserVo findByName(String username) {
        QueryWrapper<SystemUserVo> objectQueryWrapper = getUserQueryWrapper(SelectSystemUserAo.builder().build());
        objectQueryWrapper.eq("su.username", username);
        return this.baseMapper.findOneVo(objectQueryWrapper);
    }

    @Override
    public BasePage<SystemUserVo> findUserDetailPage(BasePageAo request, SelectSystemUserAo user) {
        BasePage<SystemUserVo> page = new BasePage<>(request.getPageNum(), request.getPageSize());
        QueryWrapper<SystemUserVo> userQueryWrapper = getUserQueryWrapper(user);
        BasePage<SystemUserVo> pageVo = this.baseMapper.findPageVo(page, userQueryWrapper);
        pageVo.getList().forEach(systemUserVo -> {
            systemUserVo.setRoleIds(StrUtil.split(systemUserVo.getRoleIdString(), StrUtil.COMMA).stream().map(Long::valueOf).collect(Collectors.toList()));
            systemUserVo.setDeptIds(StrUtil.split(systemUserVo.getDeptIdString(), StrUtil.COMMA).stream().map(Long::valueOf).collect(Collectors.toList()));
        });
        return pageVo;
    }

    @Override
    public List<SystemUserVo> findUserList(SelectSystemUserAo user) {
        QueryWrapper<SystemUserVo> userQueryWrapper = getUserQueryWrapper(user);
        List<SystemUserVo> userVos = this.baseMapper.findListVo(userQueryWrapper);
        return userVos;
    }

    private QueryWrapper<SystemUserVo> getUserQueryWrapper(SelectSystemUserAo user) {
        QueryWrapper<SystemUserVo> queryWrapper = new QueryWrapper<>();
        AtomicReference<List<Long>> deptList = new AtomicReference<>();
        Optional.ofNullable(user.getDeptId()).ifPresent(aLong -> deptList.set(systemDeptService.getChildDeptId(aLong)));
        queryWrapper
                .in(user.getDeptId() != null && CollUtil.isNotEmpty(deptList.get()), "su.dept_id", deptList.get())
                .eq(user.getDeptId() != null && CollUtil.isEmpty(deptList.get()), "su.dept_id", 0)
                .like(StrUtil.isNotBlank(user.getUsername()), "su.username", user.getUsername())
                .orderByAsc("su.user_id")
                .groupBy("su.user_id", "su.username", "su.password", "su.dept_id",
                        "su.email", "su.mobile", "su.status", "su.last_login_time", "su.gender",
                        "su.is_tab", "su.theme", "su.avatar", "su.description");
        return queryWrapper;
    }

    @Override
    public SystemUserVo findUserDetail(String username) {
        Object obj = redisService.get(RedisCachePrefixConstant.USER + username);
        if (obj == null) {
            synchronized (this) {
                // 再查一次，防止上个已经抢到锁的线程已经更新过了
                obj = redisService.get(RedisCachePrefixConstant.USER + username);
                if (obj != null) {
                    return (SystemUserVo) obj;
                }
                return cacheAndGetUserDetail(username);
            }
        }
        return (SystemUserVo) obj;
    }

    @Override
    public SystemUserVo cacheAndGetUserDetail(String username) {
        SystemUserVo systemUserVo = this.findByName(username);
        systemUserVo.setNeedUpdateUserDetail(true);
        redisService.set(RedisCachePrefixConstant.USER + username, systemUserVo);
        return systemUserVo;
    }

    @Override
    public void deleteUserDetailCache(String username) {
        redisService.del(RedisCachePrefixConstant.USER + username);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateLoginTime(String username) {
        this.lambdaUpdate().eq(SystemUser::getUsername, username).set(SystemUser::getLastLoginTime, DateUtil.date()).update();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createUser(SystemUserAo user) {
        SystemUser systemUser = new SystemUser();
        BeanUtil.copyProperties(user, systemUser);
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
        updateById(systemUser);

        ArrayList<Long> userIds = CollUtil.newArrayList(systemUser.getUserId());
        systemUserRoleService.deleteUserRolesByUserId(userIds);
        setUserRoles(systemUser, user.getRoleIds());

        systemUserDataPermissionService.deleteByUserIds(userIds);
        setUserDataPermissions(systemUser, user.getDeptIds());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUsers(List<Long> userIds) {
        this.removeByIds(userIds);
        // 删除用户角色
        this.systemUserRoleService.deleteUserRolesByUserId(userIds);
        this.systemUserDataPermissionService.deleteByUserIds(userIds);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updatePassword(String username, String password) {
        String currentUsername = BaseUsersUtil.getCurrentUsername();
        this.lambdaUpdate().eq(SystemUser::getUsername, Optional.ofNullable(username).filter(StrUtil::isNotBlank).orElse(currentUsername))
                .set(SystemUser::getPassword, password).update();
    }

    @Override
    public void updateStatus(String username, String status) {
        String orElse = Optional.ofNullable(status).filter(StrUtil::isNotBlank).orElse(SystemUserVo.STATUS_LOCK);
        String currentUsername = BaseUsersUtil.getCurrentUsername();
        this.lambdaUpdate().eq(SystemUser::getUsername, Optional.ofNullable(username).filter(StrUtil::isNotBlank).orElse(currentUsername))
                .set(SystemUser::getStatus, orElse)
                .update();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void resetPassword(List<String> usernames) {
        this.lambdaUpdate().in(SystemUser::getUsername, usernames)
                .set(SystemUser::getPassword, passwordEncoder.encode(SystemUserVo.DEFAULT_PASSWORD)).update();
    }

    private void setUserRoles(SystemUser user, List<Long> roles) {
        List<SystemUserRole> userRoles = new ArrayList<>();
        roles.stream().filter(Objects::nonNull).forEach(roleId -> {
            SystemUserRole userRole = new SystemUserRole();
            userRole.setUserId(user.getUserId());
            userRole.setRoleId(roleId);
            userRoles.add(userRole);
        });
        systemUserRoleService.saveBatch(userRoles);
    }

    private void setUserDataPermissions(SystemUser user, List<Long> deptIds) {
        List<SystemUserDataPermission> userDataPermissions = new ArrayList<>();
        deptIds.stream().filter(Objects::nonNull).forEach(deptId -> {
            SystemUserDataPermission permission = new SystemUserDataPermission();
            permission.setDeptId(deptId);
            permission.setUserId(user.getUserId());
            userDataPermissions.add(permission);
        });
        systemUserDataPermissionService.saveBatch(userDataPermissions);
    }
}
