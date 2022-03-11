package com.zclcs.auth.manager;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zclcs.auth.mapper.SystemMenuMapper;
import com.zclcs.auth.mapper.SystemUserMapper;
import com.zclcs.auth.mapper.SystemUserRoleMapper;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.router.RouterMeta;
import com.zclcs.common.core.entity.router.VueRouter;
import com.zclcs.common.core.entity.system.SystemUser;
import com.zclcs.common.core.entity.system.SystemUserRole;
import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import com.zclcs.common.core.entity.system.vo.SystemUserDataPermissionVo;
import com.zclcs.common.core.entity.system.vo.SystemUserRoleVo;
import com.zclcs.common.core.entity.system.vo.SystemUserVo;
import com.zclcs.common.core.utils.BaseTreeUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 用户业务逻辑
 *
 * @author zclcs
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class UserManager {

    private final SystemUserMapper userMapper;
    private final SystemUserRoleMapper userRoleMapper;
    private final SystemMenuMapper menuMapper;

    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名
     * @return 用户
     */
    public SystemUserVo findByName(String username) {
        SystemUserVo user = userMapper.findByName(username);
        if (user != null) {
            List<SystemUserRoleVo> listVo = userRoleMapper.findListVo(new QueryWrapper<SystemUserRoleVo>().eq("sur.user_id", user.getUserId()));
            user.setRoles(listVo);
            List<SystemUserDataPermissionVo> permissions = userMapper.findUserDataPermissions(user.getUserId());
            List<Long> deptIds = permissions.stream().map(SystemUserDataPermissionVo::getDeptId).collect(Collectors.toList());
            user.setDeptIds(deptIds);
        }
        return user;
    }

    /**
     * 通过用户名查询用户权限串
     *
     * @param username 用户名
     * @return 权限
     */
    public List<String> findUserPermissions(String username) {
        List<SystemMenuVo> userPermissions = menuMapper.findUserPermissions(username);
        return userPermissions.stream().map(SystemMenuVo::getPerms).collect(Collectors.toList());
    }

    public List<VueRouter<SystemMenuVo>> findUserRoutes(String username) {
        List<VueRouter<SystemMenuVo>> routes = new ArrayList<>();
        QueryWrapper<SystemMenuVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByAsc("sm.order_num");
        List<SystemMenuVo> menus = menuMapper.findUserMenuListVo(queryWrapper, username);
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
        return BaseTreeUtil.buildVueRouter(routes);
    }

    /**
     * 通过菜单id集合查询权限串
     *
     * @param menuIds 菜单id集合
     * @return 权限
     */
    public String findPermissions(List<Long> menuIds) {
        List<SystemMenuVo> listVo = menuMapper.findListVo(new QueryWrapper<SystemMenuVo>().in("sm.menu_id", menuIds));
        return listVo.stream().map(SystemMenuVo::getPerms).filter(StrUtil::isNotBlank).collect(Collectors.joining(StrUtil.COMMA));
    }

    /**
     * 通过菜单id集合查询权限串
     *
     * @return 权限
     */
    public List<SystemMenuVo> findAllPermissions() {
        return menuMapper.findListVo(new QueryWrapper<>());
    }

    /**
     * 通过权限串查询菜单id集合
     *
     * @param permissions 权限串
     * @return 菜单id集合
     */
    public List<Long> findMenuIdsByPermissions(String permissions) {
        List<String> permList = Arrays.stream(permissions.split(StringConstant.COMMA)).collect(Collectors.toList());
        List<SystemMenuVo> listVo = menuMapper.findListVo(new QueryWrapper<SystemMenuVo>().in("sm.perms", permList));
        return listVo.stream().map(SystemMenuVo::getMenuId).filter(Objects::nonNull).collect(Collectors.toList());
    }

    /**
     * 注册用户
     *
     * @param username username
     * @param password password
     * @return SystemUser SystemUser
     */
    @Transactional(rollbackFor = Exception.class)
    public SystemUserVo registerUser(String username, String password) {
        SystemUser systemUser = new SystemUser();
        systemUser.setUsername(username);
        systemUser.setPassword(password);
        systemUser.setCreateTime(new Date());
        systemUser.setStatus(SystemUserVo.STATUS_VALID);
        systemUser.setGender(SystemUserVo.SEX_UNKNOWN);
        systemUser.setAvatar(SystemUserVo.DEFAULT_AVATAR);
        systemUser.setDescription("注册用户");
        userMapper.insert(systemUser);

        SystemUserRole userRole = new SystemUserRole();
        userRole.setUserId(systemUser.getUserId());
        // 注册用户角色 ID
        userRole.setRoleId(MyConstant.REGISTER_ROLE_ID);
        userRoleMapper.insert(userRole);
        SystemUserVo systemUserVo = new SystemUserVo();
        BeanUtil.copyProperties(systemUserVo, systemUser);
        return systemUserVo;
    }
}
