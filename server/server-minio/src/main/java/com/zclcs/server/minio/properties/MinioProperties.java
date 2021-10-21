package com.zclcs.server.minio.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author zclcs
 */
@Data
@Component
@ConfigurationProperties(prefix = "minio")
public class MinioProperties {

    /**
     * 连接地址
     */
    private String endpoint;

    /**
     * 用户名
     */
    private String rootUser;

    /**
     * 密码
     */
    private String rootPassword;

    /**
     * 域名
     */
    private String domainName;

    /**
     * ip地址
     */
    private String host;

    /**
     * 端口
     */
    private String port;

}
