package com.zclcs.common.core.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author zclcs
 */
@Component
@ConfigurationProperties(prefix = "my")
public class GlobalProperties {

    /**
     * 服务名配置
     */
    private ServerNameProperties serverName;

    /**
     * 服务名配置
     */
    private DatabaseProperties database;

    /**
     * 服务缓存前缀
     */
    private String redisCachePrefix;

    public ServerNameProperties getServerName() {
        return serverName;
    }

    public void setServerName(ServerNameProperties serverName) {
        this.serverName = serverName;
    }

    public DatabaseProperties getDatabase() {
        return database;
    }

    public void setDatabase(DatabaseProperties database) {
        this.database = database;
    }

    public String getRedisCachePrefix() {
        return redisCachePrefix;
    }

    public void setRedisCachePrefix(String redisCachePrefix) {
        this.redisCachePrefix = redisCachePrefix;
    }

    @Override
    public String toString() {
        return "GlobalProperties{" +
                "serverName=" + serverName.toString() +
                ", database=" + database.toString() +
                ", redisCachePrefix='" + redisCachePrefix + '\'' +
                '}';
    }
}
