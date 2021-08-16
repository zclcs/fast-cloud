package com.zclcs.server.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemLoginLog;
import com.zclcs.common.core.entity.system.vo.SystemLoginLogVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 登录日志表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemLoginLogMapper extends BaseMapper<SystemLoginLog> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemLoginLogVo> findPageVo(BasePage<SystemLoginLogVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemLoginLogVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemLoginLogVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemLoginLogVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemLoginLogVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemLoginLogVo> ew);

}
