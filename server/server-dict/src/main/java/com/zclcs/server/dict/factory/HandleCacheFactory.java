package com.zclcs.server.dict.factory;

import com.zclcs.common.core.properties.GlobalProperties;
import com.zclcs.server.dict.service.HandleCacheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zclcs
 */
@Component
public class HandleCacheFactory {

    private static final Map<String, HandleCacheService> SERVER_MAP = new HashMap<>(10);
    private GlobalProperties globalProperties;
    private HandleCacheService handleServerDictCacheService;
    private HandleCacheService handleServerGeneratorCacheService;
    private HandleCacheService handleServerMinioCacheService;
    private HandleCacheService handleServerSystemCacheService;
    private HandleCacheService handleServerTestCacheService;

    public static HandleCacheService getHandleCacheService(String databaseName) {
        return SERVER_MAP.get(databaseName);
    }

    @Autowired
    public void setGlobalProperties(GlobalProperties globalProperties) {
        this.globalProperties = globalProperties;
    }

    @Autowired
    @Qualifier(value = "handleServerDictCacheService")
    public void setHandleServerDictCacheService(HandleCacheService handleServerDictCacheService) {
        this.handleServerDictCacheService = handleServerDictCacheService;
    }

    @Autowired
    @Qualifier(value = "handleServerGeneratorCacheService")
    public void setHandleServerGeneratorCacheService(HandleCacheService handleServerGeneratorCacheService) {
        this.handleServerGeneratorCacheService = handleServerGeneratorCacheService;
    }

    @Autowired
    @Qualifier(value = "handleServerMinioCacheService")
    public void setHandleServerMinioCacheService(HandleCacheService handleServerMinioCacheService) {
        this.handleServerMinioCacheService = handleServerMinioCacheService;
    }

    @Autowired
    @Qualifier(value = "handleServerSystemCacheService")
    public void setHandleServerSystemCacheService(HandleCacheService handleServerSystemCacheService) {
        this.handleServerSystemCacheService = handleServerSystemCacheService;
    }

    @Autowired
    @Qualifier(value = "handleServerTestCacheService")
    public void setHandleServerTestCacheService(HandleCacheService handleServerTestCacheService) {
        this.handleServerTestCacheService = handleServerTestCacheService;
    }

    @PostConstruct
    public void init() {
        SERVER_MAP.put(globalProperties.getDatabase().getServerDict(), handleServerDictCacheService);
        SERVER_MAP.put(globalProperties.getDatabase().getServerGenerator(), handleServerGeneratorCacheService);
        SERVER_MAP.put(globalProperties.getDatabase().getServerMinio(), handleServerMinioCacheService);
        SERVER_MAP.put(globalProperties.getDatabase().getServerSystem(), handleServerSystemCacheService);
        SERVER_MAP.put(globalProperties.getDatabase().getServerTest(), handleServerTestCacheService);
    }
}
