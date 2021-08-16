package com.zclcs.server.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemUserDataPermission;
import com.zclcs.common.core.entity.system.vo.SystemUserDataPermissionVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户数据权限关联表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemUserDataPermissionMapper extends BaseMapper<SystemUserDataPermission> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemUserDataPermissionVo> findPageVo(BasePage<SystemUserDataPermissionVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemUserDataPermissionVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemUserDataPermissionVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemUserDataPermissionVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemUserDataPermissionVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemUserDataPermissionVo> ew);

}
