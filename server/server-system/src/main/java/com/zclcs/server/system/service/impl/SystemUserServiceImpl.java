package com.zclcs.server.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.system.SystemUser;
import com.zclcs.common.core.entity.system.vo.SystemUserDataPermissionVo;
import com.zclcs.common.core.entity.system.vo.SystemUserRoleVo;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
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

import java.util.List;
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
    public void updateLoginTime(String username) {

    }

    @Override
    public void createUser(SystemUser user) {

    }

    @Override
    public void updateUser(SystemUser user) {

    }

    @Override
    public void deleteUsers(String[] userIds) {

    }

    @Override
    public void updatePassword(String password) {

    }

    @Override
    public void resetPassword(String[] usernames) {

    }
}
