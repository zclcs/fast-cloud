package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.constant.RedisCachePrefixConstant;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.MenuTree;
import com.zclcs.common.core.entity.Tree;
import com.zclcs.common.core.entity.system.SystemMenu;
import com.zclcs.common.core.entity.system.ao.SystemMenuAo;
import com.zclcs.common.core.entity.system.router.RouterMeta;
import com.zclcs.common.core.entity.system.router.VueRouter;
import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import com.zclcs.common.core.entity.system.vo.SystemRoleVo;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import com.zclcs.common.core.utils.BaseTreeUtil;
import com.zclcs.common.redis.starter.service.RedisService;
import com.zclcs.server.system.mapper.SystemMenuMapper;
import com.zclcs.server.system.service.SystemMenuService;
import com.zclcs.server.system.service.SystemRoleService;
import com.zclcs.server.system.service.SystemUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Slf4j
@Service("systemMenuService")
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
@RequiredArgsConstructor
public class SystemMenuServiceImpl extends ServiceImpl<SystemMenuMapper, SystemMenu> implements SystemMenuService {

    private final SystemUserService systemUserService;
    private final SystemRoleService systemRoleService;
    private final RedisService redisService;

    @Override
    public List<String> findUserPermissions(String username) {
        Object obj = redisService.get(RedisCachePrefixConstant.USER_PERMISSIONS + username);
        if (obj == null) {
            synchronized (this) {
                // 再查一次，防止上个已经抢到锁的线程已经更新过了
                obj = redisService.get(RedisCachePrefixConstant.USER_PERMISSIONS + username);
                if (obj != null) {
                    return (List<String>) obj;
                }
                return cacheAndGetUserPermissions(username);
            }
        }
        return (List<String>) obj;
    }

    @Override
    public List<SystemMenuVo> findUserSystemMenus(String username) {
        //checkUser(username);
        QueryWrapper<SystemMenuVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("sm.order_num");
        return this.baseMapper.findUserMenuListVo(queryWrapper, username);
    }

    @Override
    public List<? extends Tree<?>> findSystemMenus(SystemMenuAo menu) {
        List<SystemMenuVo> menus = findSystemMenuList(menu);
        List<MenuTree> trees = new ArrayList<>();
        buildTrees(trees, menus);

        if (StringUtils.equals(menu.getType(), SystemMenuVo.TYPE_BUTTON) || StrUtil.isNotBlank(menu.getMenuName())) {
            return trees;
        } else {
            return BaseTreeUtil.build(trees);
        }
    }

    @Override
    public List<VueRouter<SystemMenuVo>> findUserRouters(String username) {
        Object obj = redisService.get(RedisCachePrefixConstant.USER_ROUTES + username);
        if (obj == null) {
            synchronized (this) {
                // 再查一次，防止上个已经抢到锁的线程已经更新过了
                obj = redisService.get(RedisCachePrefixConstant.USER_ROUTES + username);
                if (obj != null) {
                    return (List<VueRouter<SystemMenuVo>>) obj;
                }
                return cacheAndGetUserRouters(username);
            }
        }
        return (List<VueRouter<SystemMenuVo>>) obj;
    }

    @Override
    public List<VueRouter<SystemMenuVo>> cacheAndGetUserRouters(String username) {
        List<VueRouter<SystemMenuVo>> routes = new ArrayList<>();
        List<SystemMenuVo> menus = this.getCacheMenu(username).stream().filter(systemMenuVo -> !systemMenuVo.getType().equals(SystemMenuVo.TYPE_BUTTON))
                .sorted(Comparator.comparingDouble(SystemMenuVo::getOrderNum)).collect(Collectors.toList());
        menus.forEach(menu -> {
            VueRouter<SystemMenuVo> route = new VueRouter<>();
            route.setId(menu.getMenuId());
            route.setParentId(menu.getParentId());
            route.setPath(menu.getPath());
            route.setName(StrUtil.isNotBlank(menu.getKeepAliveName()) ? menu.getKeepAliveName() : menu.getMenuName());
            route.setComponent(menu.getComponent());
            route.setRedirect(menu.getRedirect());
            route.setMeta(new RouterMeta(
                    menu.getMenuName(),
                    menu.getIcon(),
                    menu.getHideMenu().equals(SystemMenuVo.YES),
                    menu.getIgnoreKeepAlive().equals(SystemMenuVo.YES),
                    menu.getHideBreadcrumb().equals(SystemMenuVo.YES),
                    menu.getHideChildrenInMenu().equals(SystemMenuVo.YES),
                    menu.getCurrentActiveMenu()));
            routes.add(route);
        });
        List<VueRouter<SystemMenuVo>> vueRouters = BaseTreeUtil.buildVueRouter(routes);
        redisService.set(RedisCachePrefixConstant.USER_ROUTES + username, vueRouters);
        return vueRouters;
    }

    @Override
    public List<String> cacheAndGetUserPermissions(String username) {
        List<String> permissions = getCacheMenu(username).stream().filter(Objects::nonNull).map(SystemMenuVo::getPerms).filter(StrUtil::isNotBlank).distinct().collect(Collectors.toList());
        redisService.set(RedisCachePrefixConstant.USER_PERMISSIONS + username, permissions);
        return permissions;
    }

    @Override
    public SystemMenuVo findById(Long menuId) {
        Object obj = redisService.get(RedisCachePrefixConstant.MENU + menuId);
        if (obj == null) {
            synchronized (this) {
                // 再查一次，防止上个已经抢到锁的线程已经更新过了
                obj = redisService.get(RedisCachePrefixConstant.MENU + menuId);
                if (obj != null) {
                    return (SystemMenuVo) obj;
                }
                return cacheAndGetById(menuId);
            }
        }
        return (SystemMenuVo) obj;
    }

    @Override
    public SystemMenuVo cacheAndGetById(Long menuId) {
        QueryWrapper<SystemMenuVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sm.menu_id", menuId);
        SystemMenuVo systemMenuVo = this.baseMapper.findOneVo(queryWrapper);
        redisService.set(RedisCachePrefixConstant.MENU + menuId, systemMenuVo);
        return systemMenuVo;
    }

    @Override
    public void deleteCacheById(Long menuId) {
        redisService.del(RedisCachePrefixConstant.MENU + menuId);
    }

    @Override
    public List<SystemMenuVo> findSystemMenuList(SystemMenuAo menu) {
        List<String> types = new ArrayList<>();
        Optional.ofNullable(menu.getTypes()).filter(StrUtil::isNotBlank)
                .ifPresent(s -> types.addAll(Arrays.asList(menu.getTypes().split(StringConstant.COMMA))));
        QueryWrapper<SystemMenuVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(menu.getMenuName()), "sm.menu_name", menu.getMenuName());
        queryWrapper.like(StrUtil.isNotBlank(menu.getType()), "sm.type", menu.getType());
        queryWrapper.in(CollectionUtil.isNotEmpty(types), "sm.type", types);
        queryWrapper.orderByAsc("sm.order_num");
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long createSystemMenu(SystemMenuAo menu) {
        SystemMenu systemMenu = new SystemMenu();
        BeanUtil.copyProperties(menu, systemMenu);
        setMenu(systemMenu);
        this.save(systemMenu);
        return systemMenu.getMenuId();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateSystemMenu(SystemMenuAo menu) {
        SystemMenu systemMenu = new SystemMenu();
        BeanUtil.copyProperties(menu, systemMenu);
        setMenu(systemMenu);
        this.updateById(systemMenu);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteMenus(List<Long> menuIds) {
        this.delete(menuIds);
    }

    private void buildTrees(List<MenuTree> trees, List<SystemMenuVo> menus) {
        menus.forEach(menu -> {
            MenuTree tree = new MenuTree();
            tree.setId(menu.getMenuId());
            tree.setParentId(menu.getParentId());
            tree.setLabel(menu.getMenuName());
            tree.setKeepAliveName(menu.getKeepAliveName());
            tree.setPath(menu.getPath());
            tree.setComponent(menu.getComponent());
            tree.setRedirect(menu.getRedirect());
            tree.setPerms(menu.getPerms());
            tree.setIcon(menu.getIcon());
            tree.setType(menu.getType());
            tree.setHideMenu(menu.getHideMenu());
            tree.setIgnoreKeepAlive(menu.getIgnoreKeepAlive());
            tree.setHideBreadcrumb(menu.getHideBreadcrumb());
            tree.setHideChildrenInMenu(menu.getHideChildrenInMenu());
            tree.setCurrentActiveMenu(menu.getCurrentActiveMenu());
            tree.setOrderNum(menu.getOrderNum());
            trees.add(tree);
        });
    }

    private void setMenu(SystemMenu menu) {
        if (menu.getParentId() == null) {
            menu.setParentId(SystemMenuVo.TOP_MENU_ID);
            menu.setType(SystemMenuVo.TYPE_DIR);
            menu.setComponent(SystemMenuVo.LAYOUT);
        }
        if (SystemMenuVo.TYPE_BUTTON.equals(menu.getType())) {
            menu.setPath(null);
            menu.setIcon(null);
            menu.setComponent(null);
            menu.setOrderNum(null);
        }
    }

    private void delete(List<Long> menuIds) {
        removeByIds(menuIds);
        QueryWrapper<SystemMenuVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.in("sm.parent_id", menuIds);
        List<Long> childMenus = baseMapper.findListVo(queryWrapper).stream().map(SystemMenuVo::getMenuId).collect(Collectors.toList());
        Optional.of(childMenus).filter(CollectionUtil::isNotEmpty).ifPresent(this::delete);
    }

    private List<SystemMenuVo> getCacheMenu(String username) {
        List<SystemMenuVo> systemMenuVos = new ArrayList<>();
        SystemUserVo userDetail = systemUserService.findUserDetail(username);
        String[] roleIds = userDetail.getRoleIdString().split(StrUtil.COMMA);
        for (String roleId : roleIds) {
            SystemRoleVo systemRoleVo = systemRoleService.findById(Long.valueOf(roleId));
            String[] menuIds = systemRoleVo.getMenuIdsString().split(StrUtil.COMMA);
            for (String menuId : menuIds) {
                SystemMenuVo byId = this.findById(Long.valueOf(menuId));
                systemMenuVos.add(byId);
            }
        }
        return systemMenuVos;
    }
}
