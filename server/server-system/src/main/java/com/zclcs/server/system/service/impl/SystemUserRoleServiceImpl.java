package com.zclcs.server.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.system.SystemUserRole;
import com.zclcs.server.system.mapper.SystemUserRoleMapper;
import com.zclcs.server.system.service.SystemUserRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 用户角色关联表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Service
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class SystemUserRoleServiceImpl extends ServiceImpl<SystemUserRoleMapper, SystemUserRole> implements SystemUserRoleService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUserRolesByRoleId(List<Long> roleIds) {
        this.lambdaUpdate().in(SystemUserRole::getRoleId, roleIds).remove();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUserRolesByUserId(List<Long> userIds) {
        this.lambdaUpdate().in(SystemUserRole::getUserId, userIds).remove();
    }

    @Override
    public List<Long> findUserIdsByRoleId(List<Long> roleIds) {
        return this.lambdaQuery().in(SystemUserRole::getRoleId, roleIds).list().stream().map(SystemUserRole::getUserId).collect(Collectors.toList());
    }
}
