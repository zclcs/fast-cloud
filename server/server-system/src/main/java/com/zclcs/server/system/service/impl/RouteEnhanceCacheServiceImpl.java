package com.zclcs.server.system.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zclcs.common.core.entity.system.BlackList;
import com.zclcs.common.core.entity.system.RateLimitRule;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.common.core.utils.BaseRouteEnhanceCacheUtil;
import com.zclcs.common.redis.starter.service.RedisService;
import com.zclcs.server.system.service.RouteEnhanceCacheService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zclcs
 */
@Slf4j
@Service
public class RouteEnhanceCacheServiceImpl implements RouteEnhanceCacheService {

    private RedisService redisService;

    private ObjectMapper objectMapper;

    @Autowired(required = false)
    public void setRedisService(RedisService redisService) {
        this.redisService = redisService;
    }

    @Autowired
    public void setObjectMapper(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Override
    public void saveBlackList(BlackList blackList) {
        String key = StringUtils.isNotBlank(blackList.getBlackIp()) ?
                BaseRouteEnhanceCacheUtil.getBlackListCacheKey(blackList.getBlackIp()) :
                BaseRouteEnhanceCacheUtil.getBlackListCacheKey();
        try {
            this.setBlackList(blackList);
            redisService.sSet(key, objectMapper.writeValueAsString(blackList));
        } catch (JsonProcessingException e) {
            throw new MyException("缓存黑名单失败");
        }
    }

    @Override
    public void removeBlackList(BlackList blackList) {
        String key = StringUtils.isNotBlank(blackList.getBlackIp()) ?
                BaseRouteEnhanceCacheUtil.getBlackListCacheKey(blackList.getBlackIp()) :
                BaseRouteEnhanceCacheUtil.getBlackListCacheKey();
        try {
            this.setBlackList(blackList);
            String valueAsString = objectMapper.writeValueAsString(blackList);
            redisService.setRemove(key, valueAsString);
        } catch (JsonProcessingException e) {
            throw new MyException("移除黑名单缓存失败");
        }
    }

    private void setBlackList(BlackList blackList) {
        blackList.setCreateTime(null);
        blackList.setModifyTime(null);
        blackList.setLocation(null);
    }

    @Override
    public void saveRateLimitRule(RateLimitRule rateLimitRule) {
        String key = BaseRouteEnhanceCacheUtil.getRateLimitCacheKey(rateLimitRule.getRequestUri(), rateLimitRule.getRequestMethod());
        try {
            this.setRateLimit(rateLimitRule);
            redisService.set(key, objectMapper.writeValueAsString(rateLimitRule));
        } catch (JsonProcessingException e) {
            throw new MyException("缓存限流规则失败");
        }
    }

    @Override
    public void removeRateLimitRule(RateLimitRule rateLimitRule) {
        String key = BaseRouteEnhanceCacheUtil.getRateLimitCacheKey(rateLimitRule.getRequestUri(), rateLimitRule.getRequestMethod());
        redisService.del(key);
    }

    private void setRateLimit(RateLimitRule rule) {
        rule.setCreateTime(null);
        rule.setModifyTime(null);
    }
}
