package com.zclcs;

import com.codingapi.txlcn.tc.config.EnableDistributedTransaction;
import com.zclcs.common.security.starter.annotation.EnableMyCloudResourceServer;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author zclcs
 */
@EnableAsync
@SpringBootApplication
@EnableMyCloudResourceServer
@EnableTransactionManagement
@EnableDistributedTransaction
@MapperScan("com.zclcs.server.system.mapper")
@EnableFeignClients
@EnableDiscoveryClient
public class ServerSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServerSystemApplication.class, args);
    }

}
