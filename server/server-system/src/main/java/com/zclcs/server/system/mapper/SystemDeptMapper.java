package com.zclcs.server.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemDept;
import com.zclcs.common.core.entity.system.vo.SystemDeptVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 部门表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemDeptMapper extends BaseMapper<SystemDept> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemDeptVo> findPageVo(BasePage<SystemDeptVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemDeptVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemDeptVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemDeptVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemDeptVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemDeptVo> ew);

}
