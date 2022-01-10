package com.zclcs.gateway.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.RateLimitLog;
import com.zclcs.common.core.entity.system.vo.RateLimitLogVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 限流拦截日志表 Mapper
 *
 * @author zclcs
 * @date 2021-12-29 17:21:34.946
 */
public interface RateLimitLogMapper extends BaseMapper<RateLimitLog> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<RateLimitLogVo> findPageVo(BasePage<RateLimitLogVo> basePage, @Param(Constants.WRAPPER) Wrapper<RateLimitLogVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<RateLimitLogVo> findListVo(@Param(Constants.WRAPPER) Wrapper<RateLimitLogVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    RateLimitLogVo findOneVo(@Param(Constants.WRAPPER) Wrapper<RateLimitLogVo> ew);

    /**
     * 统计
     *
     * @param ew 查询条件
     * @return 对象
     */
    Integer countVo(@Param(Constants.WRAPPER) Wrapper<RateLimitLogVo> ew);

}