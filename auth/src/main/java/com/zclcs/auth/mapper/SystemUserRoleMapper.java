package com.zclcs.auth.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemUserRole;
import com.zclcs.common.core.entity.system.vo.SystemUserRoleVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户角色关联表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemUserRoleMapper extends BaseMapper<SystemUserRole> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemUserRoleVo> findPageVo(BasePage<SystemUserRoleVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemUserRoleVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemUserRoleVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemUserRoleVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemUserRoleVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemUserRoleVo> ew);

}
