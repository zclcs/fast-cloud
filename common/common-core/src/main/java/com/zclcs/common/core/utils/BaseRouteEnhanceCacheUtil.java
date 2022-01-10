package com.zclcs.common.core.utils;


import com.zclcs.common.core.constant.MyConstant;

/**
 * @author zclcs
 */
public abstract class BaseRouteEnhanceCacheUtil {

    private static final String BLACKLIST_CACHE_KEY_PREFIX = "my:route:blacklist:";
    private static final String RATE_LIMIT_CACHE_KEY_PREFIX = "my:route:rate-limit:";
    private static final String RATE_LIMIT_COUNT_KEY_PREFIX = "my:route:rate-limit:count:";

    public static String getBlackListCacheKey(String ip) {
        if (MyConstant.LOCALHOST.equalsIgnoreCase(ip)) {
            ip = MyConstant.LOCALHOST_IP;
        }
        return String.format("%s%s", BLACKLIST_CACHE_KEY_PREFIX, ip);
    }

    public static String getBlackListCacheKey() {
        return String.format("%sally", BLACKLIST_CACHE_KEY_PREFIX);
    }

    public static String getRateLimitCacheKey(String uri, String method) {
        return String.format("%s%s:%s", RATE_LIMIT_CACHE_KEY_PREFIX, uri, method);
    }

    public static String getRateLimitCountKey(String uri, String ip) {
        return String.format("%s%s:%s", RATE_LIMIT_COUNT_KEY_PREFIX, uri, ip);
    }
}
