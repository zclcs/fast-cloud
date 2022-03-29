package com.zclcs.common.core.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author zclcs
 */
@Component
@ConfigurationProperties(prefix = "my")
public class GlobalProperties {

    /**
     * 服务名配置
     */
    private ServerNameProperties serverName;

    /**
     * 服务缓存前缀
     */
    private RedisCacheProperties redisCache;

    public ServerNameProperties getServerName() {
        return serverName;
    }

    public void setServerName(ServerNameProperties serverName) {
        this.serverName = serverName;
    }

    public RedisCacheProperties getRedisCache() {
        return redisCache;
    }

    public void setRedisCache(RedisCacheProperties redisCache) {
        this.redisCache = redisCache;
    }

    @Override
    public String toString() {
        return "GlobalProperties{" +
                "serverName=" + serverName.toString() +
                ", redisCache=" + redisCache.toString() +
                '}';
    }
}
