package com.zclcs.common.core.properties;

/**
 * @author zclcs
 */
public class ServerNameProperties {

    /**
     * 鉴权服务
     */
    private String auth;

    /**
     * 网关
     */
    private String gateway;

    /**
     * 字典服务
     */
    private String serverDict;

    /**
     * 代码生成服务
     */
    private String serverGenerator;

    /**
     * 文件服务
     */
    private String serverMinio;

    /**
     * 系统服务
     */
    private String serverSystem;

    /**
     * 测试服务
     */
    private String serverTest;

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public String getGateway() {
        return gateway;
    }

    public void setGateway(String gateway) {
        this.gateway = gateway;
    }

    public String getServerDict() {
        return serverDict;
    }

    public void setServerDict(String serverDict) {
        this.serverDict = serverDict;
    }

    public String getServerGenerator() {
        return serverGenerator;
    }

    public void setServerGenerator(String serverGenerator) {
        this.serverGenerator = serverGenerator;
    }

    public String getServerMinio() {
        return serverMinio;
    }

    public void setServerMinio(String serverMinio) {
        this.serverMinio = serverMinio;
    }

    public String getServerSystem() {
        return serverSystem;
    }

    public void setServerSystem(String serverSystem) {
        this.serverSystem = serverSystem;
    }

    public String getServerTest() {
        return serverTest;
    }

    public void setServerTest(String serverTest) {
        this.serverTest = serverTest;
    }

    @Override
    public String toString() {
        return "ServerNameProperties{" +
                "auth='" + auth + '\'' +
                ", gateway='" + gateway + '\'' +
                ", serverDict='" + serverDict + '\'' +
                ", serverGenerator='" + serverGenerator + '\'' +
                ", serverMinio='" + serverMinio + '\'' +
                ", serverSystem='" + serverSystem + '\'' +
                ", serverTest='" + serverTest + '\'' +
                '}';
    }
}
