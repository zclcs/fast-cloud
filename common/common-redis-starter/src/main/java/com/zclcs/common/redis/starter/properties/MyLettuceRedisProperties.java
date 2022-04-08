package com.zclcs.common.redis.starter.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author zclcs
 */
@ConfigurationProperties(prefix = "my")
public class MyLettuceRedisProperties {

    /**
     * 缓存前缀
     */
    private String redisCachePrefix = "dev";

    public String getRedisCachePrefix() {
        return redisCachePrefix;
    }

    public void setRedisCachePrefix(String redisCachePrefix) {
        this.redisCachePrefix = redisCachePrefix;
    }

    @Override
    public String toString() {
        return "MyLettuceRedisProperties{" +
                "redisCachePrefix='" + redisCachePrefix + '\'' +
                '}';
    }
}
