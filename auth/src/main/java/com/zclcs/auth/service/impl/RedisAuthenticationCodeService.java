package com.zclcs.auth.service.impl;

import com.zclcs.common.core.constant.RedisCachePrefixConstant;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.SerializationUtils;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.code.RandomValueAuthorizationCodeServices;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.nio.charset.StandardCharsets;

/**
 * 授权码保存到Redis，以确保认证服务器集群的一致性
 *
 * @author zclcs
 */
@Slf4j
@Service
public class RedisAuthenticationCodeService extends RandomValueAuthorizationCodeServices {

    private final RedisConnectionFactory connectionFactory;

    public RedisAuthenticationCodeService(RedisConnectionFactory connectionFactory) {
        Assert.notNull(connectionFactory, "RedisConnectionFactory required");
        this.connectionFactory = connectionFactory;
    }

    @Override
    protected OAuth2Authentication remove(String code) {
        try (RedisConnection conn = getConnection()) {
            byte[] bytes = conn.hGet(RedisCachePrefixConstant.AUTH_CODE_PREFIX.getBytes(StandardCharsets.UTF_8), code.getBytes(StandardCharsets.UTF_8));
            if (bytes == null || ArrayUtils.isEmpty(bytes)) {
                return null;
            }
            OAuth2Authentication authentication = (OAuth2Authentication) SerializationUtils.deserialize(bytes);
            if (null != authentication) {
                conn.hDel(RedisCachePrefixConstant.AUTH_CODE_PREFIX.getBytes(StandardCharsets.UTF_8), code.getBytes(StandardCharsets.UTF_8));
            }
            return authentication;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    protected void store(String code, OAuth2Authentication authentication) {
        try (RedisConnection conn = getConnection()) {
            conn.hSet(RedisCachePrefixConstant.AUTH_CODE_PREFIX.getBytes(StandardCharsets.UTF_8), code.getBytes(StandardCharsets.UTF_8),
                    SerializationUtils.serialize(authentication));
            log.info("保存authentication code: {}至redis", code);
        } catch (Exception e) {
            log.error("保存authentication code至redis失败", e);
        }
    }

    private RedisConnection getConnection() {
        return connectionFactory.getConnection();
    }

}
