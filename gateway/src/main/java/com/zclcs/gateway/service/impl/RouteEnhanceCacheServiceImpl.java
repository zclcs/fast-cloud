package com.zclcs.gateway.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zclcs.common.core.entity.system.BlackList;
import com.zclcs.common.core.entity.system.RateLimitRule;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.common.core.utils.BaseRouteEnhanceCacheUtil;
import com.zclcs.common.redis.starter.service.RedisService;
import com.zclcs.gateway.service.RouteEnhanceCacheService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

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
    public void saveAllBlackList(List<BlackList> blackList) {
        blackList.forEach(black -> {
            String key = StringUtils.isNotBlank(black.getBlackIp()) ?
                    BaseRouteEnhanceCacheUtil.getBlackListCacheKey(black.getBlackIp()) :
                    BaseRouteEnhanceCacheUtil.getBlackListCacheKey();
            String value = null;
            try {
                this.setBlackList(black);
                value = objectMapper.writeValueAsString(black);
            } catch (JsonProcessingException e) {
                throw new MyException("缓存所有黑名单失败");
            }
            redisService.sSet(key, value);
        });
        log.info("Cache blacklist into redis >>>");
    }

    @Override
    public Set<Object> getBlackList(String ip) {
        String key = BaseRouteEnhanceCacheUtil.getBlackListCacheKey(ip);
        return redisService.sGet(key);
    }

    @Override
    public Set<Object> getBlackList() {
        String key = BaseRouteEnhanceCacheUtil.getBlackListCacheKey();
        return redisService.sGet(key);
    }

    private void setBlackList(BlackList blackList) {
        blackList.setCreateTime(null);
        blackList.setModifyTime(null);
        blackList.setLocation(null);
    }

    @Override
    public void saveAllRateLimitRules(List<RateLimitRule> rateLimitRules) {
        rateLimitRules.forEach(r -> {
            String key = BaseRouteEnhanceCacheUtil.getRateLimitCacheKey(r.getRequestUri(), r.getRequestMethod());
            String value = null;
            try {
                this.setRateLimit(r);
                value = objectMapper.writeValueAsString(r);
            } catch (JsonProcessingException e) {
                throw new MyException("缓存所有限流规则失败");
            }
            redisService.set(key, value);
        });
        log.info("Cache rate limit rules into redis >>>");
    }

    @Override
    public Object getRateLimitRule(String uri, String method) {
        String key = BaseRouteEnhanceCacheUtil.getRateLimitCacheKey(uri, method);
        return redisService.get(key);
    }

    @Override
    public int getCurrentRequestCount(String uri, String ip) {
        String key = BaseRouteEnhanceCacheUtil.getRateLimitCountKey(uri, ip);
        return redisService.hasKey(key) ? (int) redisService.get(key) : 0;
    }

    @Override
    public void setCurrentRequestCount(String uri, String ip, Long time) {
        String key = BaseRouteEnhanceCacheUtil.getRateLimitCountKey(uri, ip);
        redisService.set(key, 1, time);
    }

    @Override
    public void incrCurrentRequestCount(String uri, String ip) {
        String key = BaseRouteEnhanceCacheUtil.getRateLimitCountKey(uri, ip);
        redisService.incr(key, 1L);
    }

    private void setRateLimit(RateLimitRule rule) {
        rule.setCreateTime(null);
        rule.setModifyTime(null);
    }
}
