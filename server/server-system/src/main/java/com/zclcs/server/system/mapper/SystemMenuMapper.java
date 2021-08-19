package com.zclcs.server.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemMenu;
import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemMenuMapper extends BaseMapper<SystemMenu> {

    /**
     * 获取用户权限集
     *
     * @param username 用户名
     * @return 权限集合
     */
    List<SystemMenuVo> findUserPermissions(String username);

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemMenuVo> findPageVo(BasePage<SystemMenuVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemMenuVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemMenuVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemMenuVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemMenuVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemMenuVo> ew);

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @param username 用户名
     * @return 分页对象
     */
    BasePage<SystemMenuVo> findUserMenuPageVo(BasePage<SystemMenuVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemMenuVo> ew, @Param("username") String username);

    /**
     * 查找集合
     *
     * @param ew       查询条件
     * @param username 用户名
     * @return 分页对象
     */
    List<SystemMenuVo> findUserMenuListVo(@Param(Constants.WRAPPER) Wrapper<SystemMenuVo> ew, @Param("username") String username);

    /**
     * 查找单个
     *
     * @param ew       查询条件
     * @param username 用户名
     * @return 分页对象
     */
    SystemMenuVo findUserMenuOneVo(@Param(Constants.WRAPPER) Wrapper<SystemMenuVo> ew, @Param("username") String username);

}
