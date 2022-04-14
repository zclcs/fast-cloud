package com.zclcs.server.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.entity.Tree;
import com.zclcs.common.core.entity.router.VueRouter;
import com.zclcs.common.core.entity.system.SystemMenu;
import com.zclcs.common.core.entity.system.ao.SystemMenuAo;
import com.zclcs.common.core.entity.system.vo.SystemMenuVo;

import java.util.List;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemMenuService extends IService<SystemMenu> {

    /**
     * 获取用户权限
     *
     * @param username 用户名
     * @return 用户权限
     */
    List<String> findUserPermissions(String username);

    /**
     * 获取用户菜单
     *
     * @param username 用户名
     * @return 用户菜单
     */
    List<SystemMenuVo> findUserSystemMenus(String username);

    /**
     * 获取用户菜单
     *
     * @param menu menu
     * @return 用户菜单
     */
    List<? extends Tree<?>> findSystemMenus(SystemMenuAo menu);

    /**
     * 获取用户路由
     *
     * @param username 用户名
     * @return 用户路由
     */
    List<VueRouter<SystemMenuVo>> getUserRouters(String username);

    /**
     * 获取用户路由
     *
     * @param username 用户名
     * @return 用户路由
     */
    List<String> getUserPermissions(String username);

    /**
     * 通过id获取菜单
     *
     * @param menuId 菜单id
     * @return 菜单
     */
    SystemMenuVo findById(Long menuId);

    /**
     * 通过id缓存菜单
     *
     * @param menuId 菜单id
     */
    SystemMenuVo cacheAndGetById(Long menuId);

    /**
     * 通过id删除菜单缓存
     *
     * @param menuId 菜单id
     */
    void deleteCacheById(Long menuId);

    /**
     * 获取菜单列表
     *
     * @param menu menu
     * @return 菜单列表
     */
    List<SystemMenuVo> findSystemMenuList(SystemMenuAo menu);

    /**
     * 创建菜单
     *
     * @param menu menu
     * @return 菜单id
     */
    Long createSystemMenu(SystemMenuAo menu);

    /**
     * 更新菜单
     *
     * @param menu menu
     */
    void updateSystemMenu(SystemMenuAo menu);

    /**
     * 递归删除菜单/按钮
     *
     * @param menuIds menuIds
     */
    void deleteMenus(List<Long> menuIds);

}
