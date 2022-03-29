package com.zclcs.common.security.starter.configure;

import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.utils.BaseUsersUtil;
import com.zclcs.common.security.starter.handler.MyAccessDeniedHandler;
import com.zclcs.common.security.starter.handler.MyAuthExceptionEntryPoint;
import com.zclcs.common.security.starter.properties.MyCloudSecurityProperties;
import feign.RequestInterceptor;
import org.apache.commons.lang.StringUtils;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.security.oauth2.resource.ResourceServerProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpHeaders;
import org.springframework.security.access.expression.method.MethodSecurityExpressionHandler;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.method.configuration.GlobalMethodSecurityConfiguration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.provider.expression.OAuth2MethodSecurityExpressionHandler;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.util.Base64Utils;

/**
 * @author zclcs
 */
@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableConfigurationProperties(MyCloudSecurityProperties.class)
@ConditionalOnProperty(value = "my.cloud.security.enable", havingValue = "true", matchIfMissing = true)
public class MyCloudSecurityAutoConfigure extends GlobalMethodSecurityConfiguration {

    @Bean
    @ConditionalOnMissingBean(name = "accessDeniedHandler")
    public MyAccessDeniedHandler accessDeniedHandler() {
        return new MyAccessDeniedHandler();
    }

    @Bean
    @ConditionalOnMissingBean(name = "authenticationEntryPoint")
    public MyAuthExceptionEntryPoint authenticationEntryPoint() {
        return new MyAuthExceptionEntryPoint();
    }

    @Bean
    @ConditionalOnMissingBean(value = PasswordEncoder.class)
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public MyCloudSecurityInterceptorConfigure myCloudSecurityInterceptorConfigure() {
        return new MyCloudSecurityInterceptorConfigure();
    }

    @Bean
    @Primary
    @ConditionalOnMissingBean(DefaultTokenServices.class)
    public MyUserInfoTokenServices myUserInfoTokenServices(ResourceServerProperties properties) {
        return new MyUserInfoTokenServices(properties.getUserInfoUri(), properties.getClientId());
    }

    @Bean
    public RequestInterceptor oauth2FeignRequestInterceptor() {
        return requestTemplate -> {
            String gatewayToken = new String(Base64Utils.encode(MyConstant.GATEWAY_TOKEN_VALUE.getBytes()));
            requestTemplate.header(MyConstant.GATEWAY_TOKEN_HEADER, gatewayToken);
            String authorizationToken = BaseUsersUtil.getCurrentTokenValue();
            if (StringUtils.isNotBlank(authorizationToken)) {
                requestTemplate.header(HttpHeaders.AUTHORIZATION, MyConstant.OAUTH2_TOKEN_TYPE + authorizationToken);
            }
        };
    }

    @Override
    protected MethodSecurityExpressionHandler createExpressionHandler() {
        return new OAuth2MethodSecurityExpressionHandler();
    }
}
