package com.zclcs.common.redis.starter.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author zclcs
 */
@ConfigurationProperties(prefix = "my.lettuce.redis")
public class MyLettuceRedisProperties {

    /**
     * 是否开启Lettuce Redis
     */
    private Boolean enable = true;

    /**
     * 缓存前缀
     */
    private String cachePrefix = "default";

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }

    public String getCachePrefix() {
        return cachePrefix;
    }

    public void setCachePrefix(String cachePrefix) {
        this.cachePrefix = cachePrefix;
    }

    @Override
    public String toString() {
        return "MyLettuceRedisProperties{" +
                "enable=" + enable +
                "cachePrefix=" + cachePrefix +
                '}';
    }
}
