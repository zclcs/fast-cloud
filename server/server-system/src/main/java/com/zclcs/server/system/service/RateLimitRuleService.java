package com.zclcs.server.system.service;

import com.zclcs.common.core.entity.system.RateLimitRule;
import com.zclcs.common.core.entity.system.ao.RateLimitRuleAo;
import com.zclcs.common.core.entity.system.vo.RateLimitRuleVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;

import java.util.List;

/**
 * 限流规则表 Service接口
 *
 * @author zclcs
 * @date 2021-12-29 17:21:19.726
 */
public interface RateLimitRuleService extends IService<RateLimitRule> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param rateLimitRuleVo rateLimitRuleVo
     * @return BasePage<RateLimitRuleVo>
     */
    BasePage<RateLimitRuleVo> findRateLimitRulePage(BasePageAo basePageAo, RateLimitRuleVo rateLimitRuleVo);

    /**
     * 查询（所有）
     *
     * @param rateLimitRuleVo rateLimitRuleVo
     * @return List<RateLimitRuleVo>
     */
    List<RateLimitRuleVo> findRateLimitRuleList(RateLimitRuleVo rateLimitRuleVo);

    /**
     * 查询（单个）
     *
     * @param rateLimitRuleVo rateLimitRuleVo
     * @return RateLimitRuleVo
     */
    RateLimitRuleVo findRateLimitRule(RateLimitRuleVo rateLimitRuleVo);

    /**
     * 统计
     *
     * @param rateLimitRuleVo rateLimitRuleVo
     * @return RateLimitRuleVo
     */
    Integer countRateLimitRule(RateLimitRuleVo rateLimitRuleVo);

    /**
     * 新增
     *
     * @param rateLimitRuleAo rateLimitRuleAo
     */
    void createRateLimitRule(RateLimitRuleAo rateLimitRuleAo);

    /**
     * 修改
     *
     * @param rateLimitRuleAo rateLimitRuleAo
     */
    void updateRateLimitRule(RateLimitRuleAo rateLimitRuleAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteRateLimitRule(List<Long> ids);

}
