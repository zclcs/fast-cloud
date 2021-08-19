package com.zclcs.server.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemRole;
import com.zclcs.common.core.entity.system.vo.SystemRoleVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 角色表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemRoleMapper extends BaseMapper<SystemRole> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemRoleVo> findPageVo(BasePage<SystemRoleVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemRoleVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemRoleVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemRoleVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemRoleVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemRoleVo> ew);

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemRoleVo> findUserRolePageVo(BasePage<SystemRoleVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemRoleVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemRoleVo> findUserRoleListVo(@Param(Constants.WRAPPER) Wrapper<SystemRoleVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemRoleVo findUserRoleOneVo(@Param(Constants.WRAPPER) Wrapper<SystemRoleVo> ew);

}
