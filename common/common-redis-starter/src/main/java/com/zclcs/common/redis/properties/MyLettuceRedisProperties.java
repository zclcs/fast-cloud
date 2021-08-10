package com.zclcs.common.redis.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author MrBird
 */
@ConfigurationProperties(prefix = "my.lettuce.redis")
public class MyLettuceRedisProperties {

    /**
     * 是否开启Lettuce Redis
     */
    private Boolean enable = true;

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }

    @Override
    public String toString() {
        return "MyLettuceRedisProperties{" +
                "enable=" + enable +
                '}';
    }
}
