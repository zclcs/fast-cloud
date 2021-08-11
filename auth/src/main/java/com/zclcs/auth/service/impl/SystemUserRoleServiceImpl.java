package com.zclcs.auth.service.impl;

import com.zclcs.auth.entity.SystemUserRole;
import com.zclcs.auth.mapper.SystemUserRoleMapper;
import com.zclcs.auth.service.SystemUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户角色关联表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
@Service
public class SystemUserRoleServiceImpl extends ServiceImpl<SystemUserRoleMapper, SystemUserRole> implements SystemUserRoleService {

}
