package com.zclcs.server.system.properties;

import lombok.Data;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;

/**
 * @author zclcs
 */
@Data
@SpringBootConfiguration
@PropertySource(value = {"classpath:my-server-system.properties"})
@ConfigurationProperties(prefix = "my.server.system")
public class MyServerSystemProperties {
    /**
     * 批量插入当批次可插入的最大值
     */
    private Integer batchInsertMaxNum = 1000;
}
