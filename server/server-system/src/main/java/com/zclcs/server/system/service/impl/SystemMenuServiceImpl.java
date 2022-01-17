package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.codingapi.txlcn.tc.annotation.LcnTransaction;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.MenuTree;
import com.zclcs.common.core.entity.Tree;
import com.zclcs.common.core.entity.router.RouterMeta;
import com.zclcs.common.core.entity.router.VueRouter;
import com.zclcs.common.core.entity.system.SystemMenu;
import com.zclcs.common.core.entity.system.ao.SystemMenuAo;
import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.common.core.utils.BaseTreeUtil;
import com.zclcs.common.core.utils.BaseUtil;
import com.zclcs.server.system.mapper.SystemMenuMapper;
import com.zclcs.server.system.service.SystemMenuService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
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
@Service("menuService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class SystemMenuServiceImpl extends ServiceImpl<SystemMenuMapper, SystemMenu> implements SystemMenuService {

    @Override
    public List<String> findUserPermissions(String username) {
        checkUser(username);
        List<SystemMenuVo> userPermissions = this.baseMapper.findUserPermissions(username);
        return userPermissions.stream().map(SystemMenuVo::getPerms).collect(Collectors.toList());
    }

    @Override
    public List<SystemMenuVo> findUserSystemMenus(String username) {
        checkUser(username);
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
    public List<VueRouter<SystemMenuVo>> getUserRouters(String username) {
        checkUser(username);
        List<VueRouter<SystemMenuVo>> routes = new ArrayList<>();
        List<SystemMenuVo> menus = this.findUserSystemMenus(username);
        menus.forEach(menu -> {
            VueRouter<SystemMenuVo> route = new VueRouter<>();
            route.setId(menu.getMenuId());
            route.setParentId(menu.getParentId());
            route.setPath(menu.getPath());
            route.setName(menu.getMenuName());
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
        return BaseTreeUtil.buildVueRouter(routes);
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
    @LcnTransaction
    @Transactional(rollbackFor = Exception.class)
    public Long createSystemMenu(SystemMenuAo menu) {
        SystemMenu systemMenu = new SystemMenu();
        BeanUtil.copyProperties(menu, systemMenu);
        systemMenu.setCreateTime(DateUtil.date());
        setMenu(systemMenu);
        this.save(systemMenu);
        return systemMenu.getMenuId();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateSystemMenu(SystemMenuAo menu) {
        SystemMenu systemMenu = new SystemMenu();
        BeanUtil.copyProperties(menu, systemMenu);
        systemMenu.setModifyTime(DateUtil.date());
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
            tree.setCreateTime(menu.getCreateTime());
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

    private void checkUser(String username) {
        String currentUsername = BaseUtil.getCurrentUsername();
        if (StringUtils.isNotBlank(currentUsername)
                && !StringUtils.equalsIgnoreCase(currentUsername, username)) {
            throw new MyException("无权获取别的用户数据");
        }
    }
}
