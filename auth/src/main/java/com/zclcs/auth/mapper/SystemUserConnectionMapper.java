package com.zclcs.auth.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemUserConnection;
import com.zclcs.common.core.entity.system.vo.SystemUserConnectionVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 系统用户社交账户关联表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-12
 */
public interface SystemUserConnectionMapper extends BaseMapper<SystemUserConnection> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemUserConnectionVo> findPageVo(BasePage<SystemUserConnectionVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemUserConnectionVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemUserConnectionVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemUserConnectionVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemUserConnectionVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemUserConnectionVo> ew);
}
