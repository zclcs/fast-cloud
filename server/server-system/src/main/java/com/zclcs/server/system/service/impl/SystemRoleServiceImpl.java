package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.system.SystemRole;
import com.zclcs.common.core.entity.system.SystemRoleMenu;
import com.zclcs.common.core.entity.system.ao.SystemRoleAo;
import com.zclcs.common.core.entity.system.vo.SystemRoleVo;
import com.zclcs.common.core.utils.BaseSortUtil;
import com.zclcs.server.system.mapper.SystemRoleMapper;
import com.zclcs.server.system.service.SystemRoleMenuService;
import com.zclcs.server.system.service.SystemRoleService;
import com.zclcs.server.system.service.SystemUserRoleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Slf4j
@Service("roleService")
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class SystemRoleServiceImpl extends ServiceImpl<SystemRoleMapper, SystemRole> implements SystemRoleService {

    private final SystemRoleMenuService roleMenuService;
    private final SystemUserRoleService userRoleService;

    @Override
    public BasePage<SystemRoleVo> findSystemRolePage(BasePageAo basePageAo, SystemRoleAo role) {
        BasePage<SystemRoleVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        BaseSortUtil.handlePageSort(basePageAo, basePage, "createTime", MyConstant.ORDER_DESC, false);
        QueryWrapper<SystemRoleVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sr.role_name", role.getRoleName());
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<SystemRoleVo> findUserRole(String username) {
        QueryWrapper<SystemRoleVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("su.user_name", username);
        return this.baseMapper.findUserRoleListVo(queryWrapper);
    }

    @Override
    public List<SystemRoleVo> findSystemRoleList() {
        QueryWrapper<SystemRoleVo> queryWrapper = new QueryWrapper<>();
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public SystemRoleVo findByName(String roleName) {
        QueryWrapper<SystemRoleVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sr.role_name", roleName);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createSystemRole(SystemRoleAo role) {
        SystemRole systemRole = new SystemRole();
        BeanUtil.copyProperties(role, systemRole);
        systemRole.setCreateTime(DateUtil.date());
        this.save(systemRole);
        setRoleMenus(systemRole, role.getMenuIds());

    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteSystemRoles(List<Long> roleIds) {
        this.removeByIds(roleIds);
        this.roleMenuService.deleteRoleMenusByRoleId(roleIds);
        this.userRoleService.deleteUserRolesByRoleId(roleIds);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateSystemRole(SystemRoleAo role) {
        SystemRole systemRole = new SystemRole();
        BeanUtil.copyProperties(role, systemRole);
        systemRole.setRoleName(null);
        systemRole.setModifyTime(DateUtil.date());
        baseMapper.updateById(systemRole);
        ArrayList<Long> roleIds = CollectionUtil.newArrayList(systemRole.getRoleId());
        this.roleMenuService.deleteRoleMenusByRoleId(roleIds);
        setRoleMenus(systemRole, role.getMenuIds());
    }

    private void setRoleMenus(SystemRole role, List<Long> menuIds) {
        List<SystemRoleMenu> roleMenus = new ArrayList<>();
        menuIds.stream().filter(Objects::nonNull).forEach(menuId -> {
            SystemRoleMenu roleMenu = new SystemRoleMenu();
            roleMenu.setMenuId(menuId);
            roleMenu.setRoleId(role.getRoleId());
            roleMenus.add(roleMenu);
        });
        this.roleMenuService.saveBatch(roleMenus);
    }
}
