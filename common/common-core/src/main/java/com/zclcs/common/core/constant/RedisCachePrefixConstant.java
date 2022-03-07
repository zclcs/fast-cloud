package com.zclcs.common.core.constant;

/**
 * 系统常量类
 *
 * @author zclcs
 */
public interface RedisCachePrefixConstant {
    /**
     * 验证码 key前缀
     */
    String CODE_PREFIX = "captcha:";
    /**
     * auth_code key前缀
     */
    String AUTH_CODE_PREFIX = "auth_code:";
    /**
     * 缓存 client的 redis key，这里是 hash结构存储
     */
    String CLIENT_DETAILS_PREFIX = "client_details:";

}
