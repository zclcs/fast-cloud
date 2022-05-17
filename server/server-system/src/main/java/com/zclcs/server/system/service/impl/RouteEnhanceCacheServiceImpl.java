package com.zclcs.server.system.service.impl;

import com.zclcs.common.core.entity.system.BlackList;
import com.zclcs.common.core.entity.system.RateLimitRule;
import com.zclcs.common.core.utils.BaseRouteEnhanceCacheUtil;
import com.zclcs.common.redis.starter.service.RedisService;
import com.zclcs.server.system.service.RouteEnhanceCacheService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zclcs
 */
@Slf4j
@Service
public class RouteEnhanceCacheServiceImpl implements RouteEnhanceCacheService {

    private RedisService redisService;

    @Autowired(required = false)
    public void setRedisService(RedisService redisService) {
        this.redisService = redisService;
    }

    @Override
    public void saveBlackList(BlackList blackList) {
        String key = StringUtils.isNotBlank(blackList.getBlackIp()) ?
                BaseRouteEnhanceCacheUtil.getBlackListCacheKey(blackList.getBlackIp()) :
                BaseRouteEnhanceCacheUtil.getBlackListCacheKey();
        this.setBlackList(blackList);
        redisService.sSet(key, blackList);
    }

    @Override
    public void removeBlackList(BlackList blackList) {
        String key = StringUtils.isNotBlank(blackList.getBlackIp()) ?
                BaseRouteEnhanceCacheUtil.getBlackListCacheKey(blackList.getBlackIp()) :
                BaseRouteEnhanceCacheUtil.getBlackListCacheKey();
        this.setBlackList(blackList);
        redisService.setRemove(key, blackList);
    }

    private void setBlackList(BlackList blackList) {
        blackList.setCreateAt(null);
        blackList.setUpdateAt(null);
        blackList.setLocation(null);
    }

    @Override
    public void saveRateLimitRule(RateLimitRule rateLimitRule) {
        String key = BaseRouteEnhanceCacheUtil.getRateLimitCacheKey(rateLimitRule.getRequestUri(), rateLimitRule.getRequestMethod());
        this.setRateLimit(rateLimitRule);
        redisService.set(key, rateLimitRule);
    }

    @Override
    public void removeRateLimitRule(RateLimitRule rateLimitRule) {
        String key = BaseRouteEnhanceCacheUtil.getRateLimitCacheKey(rateLimitRule.getRequestUri(), rateLimitRule.getRequestMethod());
        redisService.del(key);
    }

    private void setRateLimit(RateLimitRule rule) {
        rule.setCreateAt(null);
        rule.setUpdateAt(null);
    }
}
