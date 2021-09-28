package com.zclcs.auth.properties;

import lombok.Data;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;

/**
 * @author zclcs
 */
@Data
@SpringBootConfiguration
@PropertySource(value = {"classpath:my-auth.properties"})
@ConfigurationProperties(prefix = "my.auth")
public class MyAuthProperties {
    /**
     * 验证码配置
     */
    private MyValidateCodeProperties code = new MyValidateCodeProperties();
    /**
     * JWT加签密钥
     */
    private String jwtAccessKey;
    /**
     * 是否使用 JWT令牌
     */
    private Boolean enableJwt;

    /**
     * 社交登录所使用的 Client
     */
    private String socialLoginClientId;
}
