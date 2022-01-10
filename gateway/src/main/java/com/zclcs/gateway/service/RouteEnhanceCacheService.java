package com.zclcs.gateway.service;

import com.zclcs.common.core.entity.system.BlackList;
import com.zclcs.common.core.entity.system.RateLimitRule;

import java.util.List;
import java.util.Set;

/**
 * @author zclcs
 */
public interface RouteEnhanceCacheService {

    /**
     * 缓存所有黑名单规则
     *
     * @param blackList 黑名单列表
     */
    void saveAllBlackList(List<BlackList> blackList);

    /**
     * 缓存所有限流规则
     *
     * @param rateLimitRules 限流规则列表
     */
    void saveAllRateLimitRules(List<RateLimitRule> rateLimitRules);

    /**
     * 从缓存中获取黑名单规则
     *
     * @param ip ip
     * @return 黑名单
     */
    Set<Object> getBlackList(String ip);

    /**
     * 从缓存中获取黑名单规则
     *
     * @return 黑名单
     */
    Set<Object> getBlackList();

    /**
     * 从缓存中获取限流规则
     *
     * @param uri    uri
     * @param method method
     * @return 限流规则
     */
    Object getRateLimitRule(String uri, String method);

    /**
     * 获取当前请求次数
     *
     * @param uri uri
     * @param ip  ip
     * @return 次数
     */
    int getCurrentRequestCount(String uri, String ip);

    /**
     * 设置请求次数
     *
     * @param uri  uri
     * @param ip   ip
     * @param time time
     */
    void setCurrentRequestCount(String uri, String ip, Long time);

    /**
     * 递增请求次数
     *
     * @param uri uri
     * @param ip  ip
     */
    void incrCurrentRequestCount(String uri, String ip);
}
