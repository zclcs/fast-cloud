package com.zclcs.server.system.service;

import com.zclcs.common.core.entity.system.BlackList;
import com.zclcs.common.core.entity.system.RateLimitRule;

/**
 * @author zclcs
 */
public interface RouteEnhanceCacheService {

    /**
     * 缓存黑名单规则
     *
     * @param blackList 黑名单规则
     */
    void saveBlackList(BlackList blackList);

    /**
     * 更新黑名单规则
     *
     * @param blackList 黑名单规则
     */
    void updateBlackList(BlackList blackList);

    /**
     * 删除黑名单规则缓存
     *
     * @param blackList 黑名单
     */
    void removeBlackList(BlackList blackList);

    /**
     * 缓存限流规则
     *
     * @param rateLimitRule 限流规则
     */
    void saveRateLimitRule(RateLimitRule rateLimitRule);

    /**
     * 缓存限流规则
     *
     * @param rateLimitRule 限流规则
     */
    void updateRateLimitRule(RateLimitRule rateLimitRule);

    /**
     * 从缓存中删除限流规则
     *
     * @param rateLimitRule 限流规则
     */
    void removeRateLimitRule(RateLimitRule rateLimitRule);

}
