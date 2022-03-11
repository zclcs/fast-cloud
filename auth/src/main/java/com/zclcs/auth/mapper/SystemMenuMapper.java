package com.zclcs.auth.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
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
 * @since 2021-08-11
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
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemMenuVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemMenuVo> ew);

    /**
     * 查找集合
     *
     * @param ew       查询条件
     * @param username 用户名
     * @return 分页对象
     */
    List<SystemMenuVo> findUserMenuListVo(@Param(Constants.WRAPPER) Wrapper<SystemMenuVo> ew, @Param("username") String username);

}
