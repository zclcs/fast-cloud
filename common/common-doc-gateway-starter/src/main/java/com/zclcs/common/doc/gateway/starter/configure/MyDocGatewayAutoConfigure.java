package com.zclcs.common.doc.gateway.starter.configure;

import com.zclcs.common.doc.gateway.starter.filter.MyDocGatewayHeaderFilter;
import com.zclcs.common.doc.gateway.starter.handler.MyDocGatewayHandler;
import com.zclcs.common.doc.gateway.starter.properties.MyDocGatewayProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.gateway.config.GatewayProperties;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.swagger.web.SecurityConfiguration;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;
import springfox.documentation.swagger.web.UiConfiguration;

/**
 * @author MrBird
 */
@Configuration
@EnableConfigurationProperties(MyDocGatewayProperties.class)
@ConditionalOnProperty(value = "my.doc.gateway.enable", havingValue = "true", matchIfMissing = true)
public class MyDocGatewayAutoConfigure {

    private final MyDocGatewayProperties myDocGatewayProperties;
    private SecurityConfiguration securityConfiguration;
    private UiConfiguration uiConfiguration;

    public MyDocGatewayAutoConfigure(MyDocGatewayProperties myDocGatewayProperties) {
        this.myDocGatewayProperties = myDocGatewayProperties;
    }

    @Autowired(required = false)
    public void setSecurityConfiguration(SecurityConfiguration securityConfiguration) {
        this.securityConfiguration = securityConfiguration;
    }

    @Autowired(required = false)
    public void setUiConfiguration(UiConfiguration uiConfiguration) {
        this.uiConfiguration = uiConfiguration;
    }

    @Bean
    public MyDocGatewayResourceConfigure myDocGatewayResourceConfigure(RouteLocator routeLocator, GatewayProperties gatewayProperties) {
        return new MyDocGatewayResourceConfigure(routeLocator, gatewayProperties);
    }

    @Bean
    public MyDocGatewayHeaderFilter myDocGatewayHeaderFilter() {
        return new MyDocGatewayHeaderFilter();
    }

    @Bean
    public MyDocGatewayHandler myDocGatewayHandler(SwaggerResourcesProvider swaggerResources) {
        MyDocGatewayHandler myDocGatewayHandler = new MyDocGatewayHandler();
        myDocGatewayHandler.setSecurityConfiguration(securityConfiguration);
        myDocGatewayHandler.setUiConfiguration(uiConfiguration);
        myDocGatewayHandler.setSwaggerResources(swaggerResources);
        myDocGatewayHandler.setProperties(myDocGatewayProperties);
        return myDocGatewayHandler;
    }
}
