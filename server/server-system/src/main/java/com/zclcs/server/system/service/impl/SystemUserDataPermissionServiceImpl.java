package com.zclcs.server.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.system.SystemUserDataPermission;
import com.zclcs.server.system.mapper.SystemUserDataPermissionMapper;
import com.zclcs.server.system.service.SystemUserDataPermissionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 用户数据权限关联表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Service
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class SystemUserDataPermissionServiceImpl extends ServiceImpl<SystemUserDataPermissionMapper, SystemUserDataPermission> implements SystemUserDataPermissionService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteByDeptIds(List<Long> deptIds) {
        this.lambdaUpdate().in(SystemUserDataPermission::getDeptId, deptIds).remove();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteByUserIds(List<Long> userIds) {
        this.lambdaUpdate().in(SystemUserDataPermission::getUserId, userIds).remove();
    }

    @Override
    public List<Long> findByUserId(Long userId) {
        return this.lambdaQuery().eq(SystemUserDataPermission::getUserId, userId).list().stream().map(SystemUserDataPermission::getDeptId).collect(Collectors.toList());
    }
}
