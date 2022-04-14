package com.zclcs.server.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.system.SystemRoleMenu;
import com.zclcs.common.core.entity.system.vo.SystemRoleMenuVo;
import com.zclcs.server.system.mapper.SystemRoleMenuMapper;
import com.zclcs.server.system.service.SystemRoleMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 角色菜单关联表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Service
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class SystemRoleMenuServiceImpl extends ServiceImpl<SystemRoleMenuMapper, SystemRoleMenu> implements SystemRoleMenuService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteRoleMenusByRoleId(List<Long> roleIds) {
        this.lambdaUpdate().in(SystemRoleMenu::getRoleId, roleIds).remove();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteRoleMenusByMenuId(List<Long> menuIds) {
        this.lambdaUpdate().in(SystemRoleMenu::getMenuId, menuIds).remove();
    }

    @Override
    public List<SystemRoleMenuVo> getRoleMenusByRoleId(Long roleId) {
        QueryWrapper<SystemRoleMenuVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sr.role_id", roleId);
        return this.baseMapper.findListVo(queryWrapper);
    }
}
