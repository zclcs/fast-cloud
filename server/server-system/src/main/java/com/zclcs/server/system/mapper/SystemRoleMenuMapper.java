package com.zclcs.server.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemRoleMenu;
import com.zclcs.common.core.entity.system.vo.SystemRoleMenuVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 角色菜单关联表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemRoleMenuMapper extends BaseMapper<SystemRoleMenu> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemRoleMenuVo> findPageVo(BasePage<SystemRoleMenuVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemRoleMenuVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemRoleMenuVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemRoleMenuVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemRoleMenuVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemRoleMenuVo> ew);

}
