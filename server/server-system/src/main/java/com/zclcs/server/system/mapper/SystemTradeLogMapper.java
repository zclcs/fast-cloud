package com.zclcs.server.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemTradeLog;
import com.zclcs.common.core.entity.system.vo.SystemTradeLogVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 分布式事务测试 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemTradeLogMapper extends BaseMapper<SystemTradeLog> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemTradeLogVo> findPageVo(BasePage<SystemTradeLogVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemTradeLogVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemTradeLogVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemTradeLogVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemTradeLogVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemTradeLogVo> ew);

}
