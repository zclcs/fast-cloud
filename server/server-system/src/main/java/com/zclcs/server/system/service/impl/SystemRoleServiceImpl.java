package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.RedisCachePrefixConstant;
import com.zclcs.common.core.entity.system.SystemRole;
import com.zclcs.common.core.entity.system.SystemRoleMenu;
import com.zclcs.common.core.entity.system.ao.SystemRoleAo;
import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import com.zclcs.common.core.entity.system.vo.SystemRoleVo;
import com.zclcs.common.core.utils.BaseQueryWrapperUtil;
import com.zclcs.common.redis.starter.service.RedisService;
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
import java.util.Set;
import java.util.stream.Collectors;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class SystemRoleServiceImpl extends ServiceImpl<SystemRoleMapper, SystemRole> implements SystemRoleService {

    private final SystemRoleMenuService systemRoleMenuService;
    private final SystemUserRoleService systemUserRoleService;
    private final RedisService redisService;

    @Override
    public BasePage<SystemRoleVo> findSystemRolePage(BasePageAo basePageAo, SystemRoleAo role) {
        BasePage<SystemRoleVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<SystemRoleVo> queryWrapper = getQueryWrapper(role);
        BasePage<SystemRoleVo> pageVo = this.baseMapper.findPageVo(basePage, queryWrapper);
        pageVo.getList().forEach(systemRoleVo ->
                systemRoleVo.setMenuIds(
                        StrUtil.split(systemRoleVo.getMenuIdsString(), StrUtil.COMMA)
                                .stream().map(Long::valueOf).collect(Collectors.toList())));
        return pageVo;
    }

    @Override
    public List<SystemRoleVo> findSystemRoleList(SystemRoleAo systemRoleAo) {
        QueryWrapper<SystemRoleVo> queryWrapper = getQueryWrapper(systemRoleAo);
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public SystemRoleVo findSystemRoleOne(SystemRoleAo systemRoleAo) {
        QueryWrapper<SystemRoleVo> queryWrapper = getQueryWrapper(systemRoleAo);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    private QueryWrapper<SystemRoleVo> getQueryWrapper(SystemRoleAo systemRoleAo) {
        QueryWrapper<SystemRoleVo> queryWrapper = new QueryWrapper<>();
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "sr.role_name", systemRoleAo.getRoleName());
        BaseQueryWrapperUtil.eqNotNull(queryWrapper, "sr.role_id", systemRoleAo.getRoleId());
        queryWrapper
                .orderByDesc("sr.create_at")
                .groupBy("sr.role_id", "sr.role_name", "sr.remark");
        return queryWrapper;
    }

    @Override
    public SystemRoleVo findById(Long roleId) {
        Object obj = redisService.get(RedisCachePrefixConstant.ROLE + roleId);
        if (obj == null) {
            synchronized (this) {
                // 再查一次，防止上个已经抢到锁的线程已经更新过了
                obj = redisService.get(RedisCachePrefixConstant.ROLE + roleId);
                if (obj != null) {
                    return (SystemRoleVo) obj;
                }
                return cacheAndGetById(roleId);
            }
        }
        return (SystemRoleVo) obj;
    }

    @Override
    public SystemRoleVo cacheAndGetById(Long roleId) {
        SystemRoleVo systemRoleVo = this.findSystemRoleOne(SystemRoleAo.builder().roleId(roleId).build());
        List<String> usernames = this.selectUsernamesByRoleId(roleId);
        systemRoleVo.setUsernames(usernames);
        redisService.set(RedisCachePrefixConstant.ROLE + roleId, systemRoleVo);
        return systemRoleVo;
    }

    @Override
    public void deleteCacheById(Long roleId) {
        redisService.del(String.valueOf(roleId));
    }

    @Override
    public List<String> selectUsernamesByRoleId(Long roleId) {
        return this.baseMapper.selectUsernamesByRoleId(roleId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createSystemRole(SystemRoleAo role) {
        SystemRole systemRole = new SystemRole();
        BeanUtil.copyProperties(role, systemRole);
        this.save(systemRole);
        setRoleMenus(systemRole, role.getMenuIds());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteSystemRoles(List<Long> roleIds) {
        this.removeByIds(roleIds);
        this.systemRoleMenuService.deleteRoleMenusByRoleId(roleIds);
        this.systemUserRoleService.deleteUserRolesByRoleId(roleIds);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateSystemRole(SystemRoleAo role) {
        SystemRole systemRole = new SystemRole();
        BeanUtil.copyProperties(role, systemRole);
        systemRole.setRoleName(role.getRoleName());
        baseMapper.updateById(systemRole);
        ArrayList<Long> roleIds = CollectionUtil.newArrayList(systemRole.getRoleId());
        this.systemRoleMenuService.deleteRoleMenusByRoleId(roleIds);
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
        this.systemRoleMenuService.saveBatch(roleMenus);
    }

    private void getParentMenuId(Long menuId, Set<Long> ids, List<SystemMenuVo> menus) {
        SystemMenuVo childMenu = CollUtil.findOneByField(menus, "menuId", menuId);
        if (!childMenu.getParentId().equals(SystemMenuVo.TOP_MENU_ID) && childMenu.getType().equals(SystemMenuVo.TYPE_MENU)) {
            SystemMenuVo parentMenu = CollUtil.findOneByField(menus, "menuId", childMenu.getParentId());
            ids.add(parentMenu.getMenuId());
            getParentMenuId(parentMenu.getMenuId(), ids, menus);
        }
    }
}
