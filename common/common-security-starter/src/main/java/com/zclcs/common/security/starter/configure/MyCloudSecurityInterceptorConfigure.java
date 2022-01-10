package com.zclcs.common.security.starter.configure;

import com.zclcs.common.security.starter.interceptor.MyServerProtectInterceptor;
import com.zclcs.common.security.starter.properties.MyCloudSecurityProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author zclcs
 */
public class MyCloudSecurityInterceptorConfigure implements WebMvcConfigurer {

    private MyCloudSecurityProperties properties;

    @Autowired
    public void setProperties(MyCloudSecurityProperties properties) {
        this.properties = properties;
    }

    @Bean
    public HandlerInterceptor myServerProtectInterceptor() {
        MyServerProtectInterceptor myServerProtectInterceptor = new MyServerProtectInterceptor();
        myServerProtectInterceptor.setProperties(properties);
        return myServerProtectInterceptor;
    }

    @Override
    @SuppressWarnings("all")
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(myServerProtectInterceptor());
    }
}
