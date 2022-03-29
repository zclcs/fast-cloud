package com.zclcs.common.core.properties;

/**
 * @author zclcs
 */
public class RedisCacheProperties {

    /**
     * 鉴权服务 - 缓存前缀
     */
    private String authPrefix;

    /**
     * 网关 - 缓存前缀
     */
    private String gatewayPrefix;

    /**
     * 字典服务 - 缓存前缀
     */
    private String serverDictPrefix;

    /**
     * 代码生成服务 - 缓存前缀
     */
    private String serverGeneratorPrefix;

    /**
     * 文件服务 - 缓存前缀
     */
    private String serverMinioPrefix;

    /**
     * 系统服务 - 缓存前缀
     */
    private String serverSystemPrefix;

    /**
     * 测试服务 - 缓存前缀
     */
    private String serverTestPrefix;

    public String getAuthPrefix() {
        return authPrefix;
    }

    public void setAuthPrefix(String authPrefix) {
        this.authPrefix = authPrefix;
    }

    public String getGatewayPrefix() {
        return gatewayPrefix;
    }

    public void setGatewayPrefix(String gatewayPrefix) {
        this.gatewayPrefix = gatewayPrefix;
    }

    public String getServerDictPrefix() {
        return serverDictPrefix;
    }

    public void setServerDictPrefix(String serverDictPrefix) {
        this.serverDictPrefix = serverDictPrefix;
    }

    public String getServerGeneratorPrefix() {
        return serverGeneratorPrefix;
    }

    public void setServerGeneratorPrefix(String serverGeneratorPrefix) {
        this.serverGeneratorPrefix = serverGeneratorPrefix;
    }

    public String getServerMinioPrefix() {
        return serverMinioPrefix;
    }

    public void setServerMinioPrefix(String serverMinioPrefix) {
        this.serverMinioPrefix = serverMinioPrefix;
    }

    public String getServerSystemPrefix() {
        return serverSystemPrefix;
    }

    public void setServerSystemPrefix(String serverSystemPrefix) {
        this.serverSystemPrefix = serverSystemPrefix;
    }

    public String getServerTestPrefix() {
        return serverTestPrefix;
    }

    public void setServerTestPrefix(String serverTestPrefix) {
        this.serverTestPrefix = serverTestPrefix;
    }

    @Override
    public String toString() {
        return "RedisCacheProperties{" +
                "authPrefix='" + authPrefix + '\'' +
                ", gatewayPrefix='" + gatewayPrefix + '\'' +
                ", serverDictPrefix='" + serverDictPrefix + '\'' +
                ", serverGeneratorPrefix='" + serverGeneratorPrefix + '\'' +
                ", serverMinioPrefix='" + serverMinioPrefix + '\'' +
                ", serverSystemPrefix='" + serverSystemPrefix + '\'' +
                ", serverTestPrefix='" + serverTestPrefix + '\'' +
                '}';
    }
}
