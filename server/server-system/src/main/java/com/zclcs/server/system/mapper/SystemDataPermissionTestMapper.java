package com.zclcs.server.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemDataPermissionTest;
import com.zclcs.common.core.entity.system.vo.SystemDataPermissionTestVo;
import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户权限测试 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemDataPermissionTestMapper extends BaseMapper<SystemDataPermissionTest> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemDataPermissionTestVo> findPageVo(BasePage<SystemDataPermissionTestVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemMenuVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemDataPermissionTestVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemDataPermissionTestVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemDataPermissionTestVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemDataPermissionTestVo> ew);

}
