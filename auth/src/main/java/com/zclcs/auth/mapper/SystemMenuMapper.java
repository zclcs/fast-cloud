package com.zclcs.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zclcs.auth.entity.SystemMenu;
import com.zclcs.auth.entity.vo.SystemMenuVo;

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

}
