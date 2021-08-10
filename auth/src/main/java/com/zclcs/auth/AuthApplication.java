package com.zclcs.auth;

import com.zclcs.common.security.starter.annotation.EnableMyCloudResourceServer;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * @author zclcs
 */
@SpringBootApplication
@EnableRedisHttpSession
@EnableMyCloudResourceServer
@MapperScan("com.zclcs.auth.mapper")
public class AuthApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuthApplication.class, args);
    }

}
