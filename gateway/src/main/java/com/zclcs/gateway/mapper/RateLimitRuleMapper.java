package com.zclcs.gateway.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.RateLimitRule;
import com.zclcs.common.core.entity.system.vo.RateLimitRuleVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 限流规则表 Mapper
 *
 * @author zclcs
 * @date 2021-12-29 17:21:19.726
 */
public interface RateLimitRuleMapper extends BaseMapper<RateLimitRule> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<RateLimitRuleVo> findPageVo(BasePage<RateLimitRuleVo> basePage, @Param(Constants.WRAPPER) Wrapper<RateLimitRuleVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<RateLimitRuleVo> findListVo(@Param(Constants.WRAPPER) Wrapper<RateLimitRuleVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    RateLimitRuleVo findOneVo(@Param(Constants.WRAPPER) Wrapper<RateLimitRuleVo> ew);

    /**
     * 统计
     *
     * @param ew 查询条件
     * @return 对象
     */
    Integer countVo(@Param(Constants.WRAPPER) Wrapper<RateLimitRuleVo> ew);

}