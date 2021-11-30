/*
 Navicat Premium Data Transfer

 Source Server         : docker_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : cloud_nacos

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 30/11/2021 08:42:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`
(
    `id`           bigint(20)                                       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT 'content',
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL COMMENT 'source user',
    `src_ip`       varchar(50) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT '租户字段',
    `c_desc`       varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL,
    `c_use`        varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `effect`       varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `type`         varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `c_schema`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL,
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfo_datagrouptenant` (`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 135
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info`
VALUES (115, 'gateway.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_GATEWAY:8301}\n\nspring:\n  cloud:\n    gateway:\n      globalcors:\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: \"*\"\n            allowedMethods: \"*\"\n            allowedHeaders: \"*\"\n            allowCredentials: true\n      routes:\n        - id: ${SERVICE_NAME_AUTH:auth}\n          uri: lb://${SERVICE_NAME_AUTH:auth}\n          predicates:\n            - Path=${SERVICE_PATH_AUTH:/auth}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: authfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_AUTH:auth}\n        - id: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          uri: lb://${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_SYSTEM:/system}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: systemfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        - id: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          uri: lb://${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_GENERATOR:/generator}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: generatorfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        - id: ${SERVICE_NAME_SERVER_TEST:server-test}\n          uri: lb://${SERVICE_NAME_SERVER_TEST:server-test}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_TEST:/test}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: testfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_TEST:server-test}\n        - id: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n          uri: lb://${SERVICE_NAME_SERVER_MINIO:server-minio}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_MINIO:/minio}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_MINIO:server-minio}\n        - id: ${SERVICE_NAME_SERVER_DICT:server-dict}\n          uri: lb://${SERVICE_NAME_SERVER_DICT:server-dict}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_DICT:/dict}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_DICT:server-dict}\n      loadbalancer:\n        use404: true\n      default-filters:\n        - StripPrefix=1\n\n  autoconfigure:\n    exclude: org.springframework.boot.autoconfigure.mongo.MongoReactiveAutoConfiguration,org.springframework.boot.autoconfigure.data.mongo.MongoReactiveRepositoriesAutoConfiguration,org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration\n\n  # 网关增强配置\n  # data:\n  #   mongodb:\n  #     host: ${mongo.url}\n  #     port: 27017\n  #     database: cloud_route\n\n  redis:\n    database: ${REDIS_GATEWAY_DATABASE:3}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\n# 网关增强配置\nmy:\n  gateway:\n    enhance: false\n    jwt:\n      secret: 123456\n      expiration: 36000\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 10000\n    socialfallback:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nribbon:\n  eager-load:\n    enabled: true\n\n',
        '0c4587f28e3e0108864ae7455d21f5ec', '2021-09-18 02:54:58', '2021-10-28 02:04:02', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (116, 'tx-manager.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_TX_MANAGER:8501}\n\nspring:\n  datasource:\n    driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n    url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TX_MANAGER:cloud_tx_manager}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n    username: ${DATASOURCE_USERNAME:root}\n    password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_TX_MANAGER_DATABASE:2}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmy:\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  manager:\n    host: ${TX_MANAGER_PORT:0.0.0.0}\n    # TM监听Socket端口.\n    port: ${TX_CLIENT_MANAGER_PORT:8888}\n    # TM控制台密码\n    admin-key: ${TX_MANAGER_ADMIN_KEY:123456}\n  logger:\n    # 开启日志记录\n    enabled: ${TX_LOGGER_ENABLED:true}\n    driver-class-name: ${spring.datasource.driver-class-name}\n    jdbc-url: ${spring.datasource.url}\n    username: ${spring.datasource.username}\n    password: ${spring.datasource.password}',
        'bfa5497805bff26acda7206460f66f7c', '2021-09-18 02:54:58', '2021-09-27 22:03:18', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (118, 'server-system.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'da7141690b6dc581862153d6e38a1b2e', '2021-09-18 02:54:58', '2021-11-10 18:57:04', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (119, 'auth.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_AUTH:8101}\n\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_AUTH_DATABASE:0}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/auth/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id:\n      client-secret:\n      redirect-uri:\n    gitee:\n      client-id:\n      client-secret:\n      redirect-uri:\n    tencent_cloud:\n      client-id:\n      client-secret:\n      redirect-uri:\n    dingtalk:\n      client-id:\n      client-secret:\n      redirect-uri:\n    qq:\n      client-id:\n      client-secret:\n      redirect-uri:\n    microsoft:\n      client-id:\n      client-secret:\n      redirect-uri:\n  cache:\n    type: redis\n    prefix: \'MY::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nmy:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        'ac4303744f96b61f961db1776bfbe6ef', '2021-09-18 02:54:58', '2021-11-02 01:34:12', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (120, 'server-generator.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_GENERATOR:cloud_generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '9789d218184804203f02839ba8db9253', '2021-10-11 08:40:32', '2021-11-02 01:35:07', 'nacos', '192.168.33.1', '',
        'dev', 'null', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (121, 'server-test.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TEST:cloud_test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '6ae577083efef7d0786ef935d36c8251', '2021-10-15 01:32:43', '2021-11-02 01:36:24', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (125, 'server-minio.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'a7a665e30d40d4514678edba99077fe4', '2021-10-18 02:22:24', '2021-11-02 01:35:27', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (128, 'knife4j.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_TX_KNIFE4J:8401}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: ${SERVICE_NAME_AUTH:auth}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n        swaggerVersion: 2.0',
        '7460560f59df03d517e46926dff97247', '2021-10-27 22:04:53', '2021-11-09 03:28:47', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (130, 'server-dict.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_DICT_DATABASE:1}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'c0d72e0ad2d7253a920d8bb74c2601bf', '2021-10-28 02:04:33', '2021-11-10 19:29:54', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (131, 'dict.yaml', 'DEFAULT_GROUP',
        'system:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: false',
        '0bad0e76df0199d8434fd9848b844901', '2021-10-28 22:33:58', '2021-11-02 01:37:15', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (132, 'dict-redis.yaml', 'DEFAULT_GROUP',
        'spring:\r\n  redis:\r\n    database: ${REDIS_DICT_DATABASE:1}\r\n    host: ${REDIS_HOST:127.0.0.1}\r\n    port: ${REDIS_PORT:6379}\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000',
        '7d2edb1abbf480ce1ef354efa8270541', '2021-11-10 18:45:03', '2021-11-10 18:45:03', NULL, '192.168.33.1', '',
        'dev', '字典redis配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (133, 'flyway.yaml', 'DEFAULT_GROUP',
        'spring:\r\n  flyway:\r\n    enabled: true\r\n    # 迁移前校验 SQL 文件是否存在问题\r\n    validate-on-migrate: true\r\n    # 禁止清理数据库表 生产环境一定要启用\r\n    clean-disabled: true\r\n    # 文件编码\r\n    encoding: UTF-8\r\n    # 校验路径下是否存在 SQL 文件\r\n    check-location: false\r\n    # 最开始已经存在表结构，且不存在 flyway_schema_history 表时，需要设置为 true\r\n    baseline-on-migrate: true',
        '009b47e8c9b2a86c2a8b5615f331a93f', '2021-11-10 18:54:07', '2021-11-10 18:54:07', NULL, '192.168.33.1', '',
        'dev', '数据库版本管理配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (134, 'logging.yaml', 'DEFAULT_GROUP',
        'logging:\r\n  level:\r\n    org:\r\n      springframework:\r\n        data:\r\n          convert:\r\n            CustomConversions: error\r\n    com:\r\n      alibaba:\r\n        cloud:\r\n          nacos:\r\n            client:\r\n              NacosPropertySourceBuilder: error',
        '9fb50b8e377afdbf444623cd5f94bff7', '2021-11-29 18:41:52', '2021-11-29 18:41:52', NULL, '192.168.33.1', '',
        'dev', NULL, NULL, NULL, 'yaml', NULL);

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`
(
    `id`           bigint(20)                                       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `datum_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT '内容',
    `gmt_modified` datetime                                         NOT NULL COMMENT '修改时间',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum` (`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '增加租户字段'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`
(
    `id`           bigint(20)                                        NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT 'data_id',
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NOT NULL COMMENT 'group_id',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin      NOT NULL COMMENT 'content',
    `beta_ips`     varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'betaIps',
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin   NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime                                          NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime                                          NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin          NULL COMMENT 'source user',
    `src_ip`       varchar(50) CHARACTER SET utf8 COLLATE utf8_bin   NULL     DEFAULT NULL COMMENT 'source ip',
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT '' COMMENT '租户字段',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfobeta_datagrouptenant` (`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info_beta'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`
(
    `id`           bigint(20)                                       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT 'tenant_id',
    `tag_id`       varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL COMMENT 'content',
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'md5',
    `gmt_create`   datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified` datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL COMMENT 'source user',
    `src_ip`       varchar(50) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL COMMENT 'source ip',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_configinfotag_datagrouptenanttag` (`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info_tag'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`
(
    `id`        bigint(20)                                       NOT NULL COMMENT 'id',
    `tag_name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
    `tag_type`  varchar(64) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT 'tag_type',
    `data_id`   varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
    `group_id`  varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
    `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
    `nid`       bigint(20)                                       NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`nid`) USING BTREE,
    UNIQUE INDEX `uk_configtagrelation_configidtag` (`id`, `tag_name`, `tag_type`) USING BTREE,
    INDEX `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_tag_relation'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`
(
    `id`                bigint(20) UNSIGNED                              NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `group_id`          varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
    `quota`             int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
    `usage`             int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '使用量',
    `max_size`          int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
    `max_aggr_count`    int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
    `max_aggr_size`     int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
    `max_history_count` int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
    `gmt_create`        datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified`      datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_group_id` (`group_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`
(
    `id`           bigint(64) UNSIGNED                              NOT NULL,
    `nid`          bigint(20) UNSIGNED                              NOT NULL AUTO_INCREMENT,
    `data_id`      varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `group_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
    `app_name`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT NULL COMMENT 'app_name',
    `content`      longtext CHARACTER SET utf8 COLLATE utf8_bin     NOT NULL,
    `md5`          varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `gmt_create`   datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `gmt_modified` datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `src_user`     text CHARACTER SET utf8 COLLATE utf8_bin         NULL,
    `src_ip`       varchar(50) CHARACTER SET utf8 COLLATE utf8_bin  NULL     DEFAULT NULL,
    `op_type`      char(10) CHARACTER SET utf8 COLLATE utf8_bin     NULL     DEFAULT NULL,
    `tenant_id`    varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL     DEFAULT '' COMMENT '租户字段',
    PRIMARY KEY (`nid`) USING BTREE,
    INDEX `idx_gmt_create` (`gmt_create`) USING BTREE,
    INDEX `idx_gmt_modified` (`gmt_modified`) USING BTREE,
    INDEX `idx_did` (`data_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 30
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '多租户改造'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info`
VALUES (125, 1, 'server-minio.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME}\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.minio.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '84a273b70a15fad81f6d29497d1a9bc5', '2021-10-21 17:06:44', '2021-10-21 04:06:44', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (125, 2, 'server-minio.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME}\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.minio.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext,/file/preViewPicture/**\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '714016427065c01d3c2419e349de67f0', '2021-10-21 17:17:00', '2021-10-21 04:17:01', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (125, 3, 'server-minio.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME}\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.minio.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '84a273b70a15fad81f6d29497d1a9bc5', '2021-10-21 17:17:22', '2021-10-21 04:17:22', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (115, 4, 'gateway.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_GATEWAY:8301}\n\nspring:\n  cloud:\n    gateway:\n      globalcors:\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: \"*\"\n            allowedMethods: \"*\"\n            allowedHeaders: \"*\"\n            allowCredentials: true\n      routes:\n        - id: ${SERVICE_NAME_AUTH:auth}\n          uri: lb://${SERVICE_NAME_AUTH:auth}\n          predicates:\n            - Path=/auth/**\n          filters:\n            - name: Hystrix\n              args:\n                name: authfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_AUTH:auth}\n        - id: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          uri: lb://${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          predicates:\n            - Path=/system/**\n          filters:\n            - name: Hystrix\n              args:\n                name: systemfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        - id: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          uri: lb://${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          predicates:\n            - Path=/generator/**\n          filters:\n            - name: Hystrix\n              args:\n                name: generatorfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        - id: ${SERVICE_NAME_SERVER_TEST:server-test}\n          uri: lb://${SERVICE_NAME_SERVER_TEST:server-test}\n          predicates:\n            - Path=/test/**\n          filters:\n            - name: Hystrix\n              args:\n                name: testfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_TEST:server-test}\n        - id: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n          uri: lb://${SERVICE_NAME_SERVER_MINIO:server-minio}\n          predicates:\n            - Path=/minio/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_MINIO:server-minio}\n      loadbalancer:\n        use404: true\n      default-filters:\n        - StripPrefix=1\n        - MyDocGatewayHeaderFilter\n\n  autoconfigure:\n    exclude: org.springframework.boot.autoconfigure.mongo.MongoReactiveAutoConfiguration,org.springframework.boot.autoconfigure.data.mongo.MongoReactiveRepositoriesAutoConfiguration,org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration\n\n  # 网关增强配置\n  # data:\n  #   mongodb:\n  #     host: ${mongo.url}\n  #     port: 27017\n  #     database: cloud_route\n\n  redis:\n    database: ${REDIS_GATEWAY_DATABASE:3}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\n# 网关增强配置\nmy:\n  gateway:\n    enhance: false\n    jwt:\n      secret: 123456\n      expiration: 36000\n\n  doc:\n    gateway:\n      enable: true\n      resources: ${DOC_GATEWAY_RESOURCES:auth,server-system,server-generator,server-test}\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 10000\n    socialfallback:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nribbon:\n  eager-load:\n    enabled: true\n\n',
        'c47e66549d2e5f21450764b1cc63f35c', '2021-10-27 17:26:54', '2021-10-27 04:26:54', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (115, 5, 'gateway.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_GATEWAY:8301}\n\nspring:\n  cloud:\n    gateway:\n      globalcors:\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: \"*\"\n            allowedMethods: \"*\"\n            allowedHeaders: \"*\"\n            allowCredentials: true\n      routes:\n        - id: ${SERVICE_NAME_AUTH:auth}\n          uri: lb://${SERVICE_NAME_AUTH:auth}\n          predicates:\n            - Path=/auth/**\n          filters:\n            - name: Hystrix\n              args:\n                name: authfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_AUTH:auth}\n        - id: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          uri: lb://${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          predicates:\n            - Path=/system/**\n          filters:\n            - name: Hystrix\n              args:\n                name: systemfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        - id: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          uri: lb://${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          predicates:\n            - Path=/generator/**\n          filters:\n            - name: Hystrix\n              args:\n                name: generatorfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        - id: ${SERVICE_NAME_SERVER_TEST:server-test}\n          uri: lb://${SERVICE_NAME_SERVER_TEST:server-test}\n          predicates:\n            - Path=/test/**\n          filters:\n            - name: Hystrix\n              args:\n                name: testfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_TEST:server-test}\n        - id: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n          uri: lb://${SERVICE_NAME_SERVER_MINIO:server-minio}\n          predicates:\n            - Path=/minio/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_MINIO:server-minio}\n      loadbalancer:\n        use404: true\n      default-filters:\n        - StripPrefix=1\n\n  autoconfigure:\n    exclude: org.springframework.boot.autoconfigure.mongo.MongoReactiveAutoConfiguration,org.springframework.boot.autoconfigure.data.mongo.MongoReactiveRepositoriesAutoConfiguration,org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration\n\n  # 网关增强配置\n  # data:\n  #   mongodb:\n  #     host: ${mongo.url}\n  #     port: 27017\n  #     database: cloud_route\n\n  redis:\n    database: ${REDIS_GATEWAY_DATABASE:3}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\n# 网关增强配置\nmy:\n  gateway:\n    enhance: false\n    jwt:\n      secret: 123456\n      expiration: 36000\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 10000\n    socialfallback:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nribbon:\n  eager-load:\n    enabled: true\n\n',
        'b142be9ebdc2750b81fa68ae685f7320', '2021-10-28 11:01:54', '2021-10-27 22:01:54', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 6, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: ${PORT_TX_KNIFE4J:8401}\r\n\r\nknife4j:\r\n  # 开启聚合组件\r\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\r\n  cloud:\r\n    enable: true\r\n    routes:\r\n      - name: 鉴权服务\r\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\r\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\r\n        swaggerVersion: 2.0\r\n      - name: 系统服务\r\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\r\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\r\n        swaggerVersion: 2.0\r\n      - name: 快速开发服务\r\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\r\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\r\n        swaggerVersion: 2.0\r\n      - name: 测试服务\r\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\r\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\r\n        swaggerVersion: 2.0\r\n      - name: 文件服务\r\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\r\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\r\n        swaggerVersion: 2.0',
        '88375913f6782bfce8f036a245b558b3', '2021-10-28 11:04:53', '2021-10-27 22:04:53', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (115, 7, 'gateway.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_GATEWAY:8301}\n\nspring:\n  cloud:\n    gateway:\n      globalcors:\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: \"*\"\n            allowedMethods: \"*\"\n            allowedHeaders: \"*\"\n            allowCredentials: true\n      routes:\n        - id: ${SERVICE_NAME_AUTH:auth}\n          uri: lb://${SERVICE_NAME_AUTH:auth}\n          predicates:\n            - Path=${SERVICE_PATH_AUTH:/auth}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: authfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_AUTH:auth}\n        - id: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          uri: lb://${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_SYSTEM:/system}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: systemfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        - id: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          uri: lb://${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_GENERATOR:/generator}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: generatorfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        - id: ${SERVICE_NAME_SERVER_TEST:server-test}\n          uri: lb://${SERVICE_NAME_SERVER_TEST:server-test}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_TEST:/test}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: testfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_TEST:server-test}\n        - id: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n          uri: lb://${SERVICE_NAME_SERVER_MINIO:server-minio}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_MINIO:/minio}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_MINIO:server-minio}\n      loadbalancer:\n        use404: true\n      default-filters:\n        - StripPrefix=1\n\n  autoconfigure:\n    exclude: org.springframework.boot.autoconfigure.mongo.MongoReactiveAutoConfiguration,org.springframework.boot.autoconfigure.data.mongo.MongoReactiveRepositoriesAutoConfiguration,org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration\n\n  # 网关增强配置\n  # data:\n  #   mongodb:\n  #     host: ${mongo.url}\n  #     port: 27017\n  #     database: cloud_route\n\n  redis:\n    database: ${REDIS_GATEWAY_DATABASE:3}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\n# 网关增强配置\nmy:\n  gateway:\n    enhance: false\n    jwt:\n      secret: 123456\n      expiration: 36000\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 10000\n    socialfallback:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nribbon:\n  eager-load:\n    enabled: true\n\n',
        'f0b5245b7f331af1d1a2840812c3053f', '2021-10-28 15:04:02', '2021-10-28 02:04:02', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 8, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: ${PORT_SERVER_DICT:8205}\r\n\r\nspring:\r\n  aop:\r\n    proxy-target-class: true\r\n\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n\r\n  freemarker:\r\n    check-template-location: false\r\n\r\n  datasource:\r\n    dynamic:\r\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: MyHikariCP\r\n      primary: primary\r\n      datasource:\r\n        primary:\r\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\r\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\r\n          username: ${DATASOURCE_USERNAME:root}\r\n          password: ${DATASOURCE_PASSWORD:root}\r\n\r\n  redis:\r\n    database: ${REDIS_DICT_DATABASE:1}\r\n    host: ${REDIS_HOST:127.0.0.1}\r\n    port: ${REDIS_PORT:6379}\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\n\r\nmybatis-plus:\r\n  type-aliases-package: com.zclcs.common.core.entity.dict\r\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\r\n\r\nmy:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: com.zclcs.server.dict.controller\r\n    description: ${my.doc.title}\r\n    name: zclcs\r\n    email: 2371219112@qq.com\r\n    url: https://github.com/zclcs\r\n    version: 2.2-RELEASE\r\n\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\r\n      only-fetch-by-gateway: false\r\n\r\n  log:\r\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\r\n\r\ntx-lcn:\r\n  client:\r\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '88a5df63d56cc27349197cce368b6e63', '2021-10-28 15:04:32', '2021-10-28 02:04:33', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 9, 'dict.yaml', 'DEFAULT_GROUP', '',
        'system:\r\n  dict:\r\n    mq-type: none\r\n    text-value-default-null: true\r\n    on-boot-refresh-dict: true\r\n    cache:\r\n      enabled: true\r\n      maximum-size: 500\r\n      initial-capacity: 50\r\n      duration: 30s\r\n      miss-num: 50\r\n    controller:\r\n      enabled: false',
        '0989297cbb504b39c3cd1d16cffb7dd6', '2021-10-29 11:33:58', '2021-10-28 22:33:58', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 10, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: ${PORT_SERVER_DICT:8205}\r\n\r\nspring:\r\n  aop:\r\n    proxy-target-class: true\r\n\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n\r\n  freemarker:\r\n    check-template-location: false\r\n\r\n  datasource:\r\n    dynamic:\r\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: MyHikariCP\r\n      primary: primary\r\n      datasource:\r\n        primary:\r\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\r\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\r\n          username: ${DATASOURCE_USERNAME:root}\r\n          password: ${DATASOURCE_PASSWORD:root}\r\n\r\n  redis:\r\n    database: ${REDIS_DICT_DATABASE:1}\r\n    host: ${REDIS_HOST:127.0.0.1}\r\n    port: ${REDIS_PORT:6379}\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\n\r\nmybatis-plus:\r\n  type-aliases-package: com.zclcs.common.core.entity.dict\r\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\r\n\r\nmy:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: com.zclcs.server.dict.controller\r\n    description: ${my.doc.title}\r\n    name: zclcs\r\n    email: 2371219112@qq.com\r\n    url: https://github.com/zclcs\r\n    version: 2.2-RELEASE\r\n\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\r\n      only-fetch-by-gateway: false\r\n\r\n  log:\r\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\r\n\r\ntx-lcn:\r\n  client:\r\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '88a5df63d56cc27349197cce368b6e63', '2021-10-29 11:41:26', '2021-10-28 22:41:26', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 11, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.system.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'd3930eb312644c3be6a11fef912c59bd', '2021-11-01 17:15:42', '2021-11-01 04:15:42', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 12, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: ${PORT_TX_KNIFE4J:8401}\r\n\r\nknife4j:\r\n  # 开启聚合组件\r\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\r\n  cloud:\r\n    enable: true\r\n    routes:\r\n      - name: 鉴权服务\r\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\r\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\r\n        swaggerVersion: 2.0\r\n      - name: 系统服务\r\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\r\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\r\n        swaggerVersion: 2.0\r\n      - name: 快速开发服务\r\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\r\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\r\n        swaggerVersion: 2.0\r\n      - name: 测试服务\r\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\r\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\r\n        swaggerVersion: 2.0\r\n      - name: 文件服务\r\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\r\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\r\n        swaggerVersion: 2.0',
        '88375913f6782bfce8f036a245b558b3', '2021-11-02 14:20:50', '2021-11-02 01:20:50', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (119, 13, 'auth.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_AUTH:8101}\n\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_AUTH_DATABASE:0}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/auth/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id:\n      client-secret:\n      redirect-uri:\n    gitee:\n      client-id:\n      client-secret:\n      redirect-uri:\n    tencent_cloud:\n      client-id:\n      client-secret:\n      redirect-uri:\n    dingtalk:\n      client-id:\n      client-secret:\n      redirect-uri:\n    qq:\n      client-id:\n      client-secret:\n      redirect-uri:\n    microsoft:\n      client-id:\n      client-secret:\n      redirect-uri:\n  cache:\n    type: redis\n    prefix: \'MY::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nmy:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.auth.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        '79c7870f0c2160a88c22e4451d51603a', '2021-11-02 14:34:11', '2021-11-02 01:34:12', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 14, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_DICT_DATABASE:1}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: true\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.dict.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'e27643c49c0cac3e1390b030ebdd30fc', '2021-11-02 14:34:35', '2021-11-02 01:34:35', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (120, 15, 'server-generator.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_GENERATOR:cloud_generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.generator.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '7af6acac1762b21bb767a912d08f458f', '2021-11-02 14:35:06', '2021-11-02 01:35:07', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (125, 16, 'server-minio.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.minio.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'd2cf4809ead5e74c2703ec946fba884c', '2021-11-02 14:35:26', '2021-11-02 01:35:27', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 17, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_DICT_DATABASE:1}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.system.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '23c4896711aaee2a4fea8d6d1c902b4b', '2021-11-02 14:35:44', '2021-11-02 01:35:44', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (121, 18, 'server-test.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TEST:cloud_test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.test.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '19a789578066dba18b1ba2cec80bd593', '2021-11-02 14:36:24', '2021-11-02 01:36:24', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (131, 19, 'dict.yaml', 'DEFAULT_GROUP', '',
        'system:\r\n  dict:\r\n    mq-type: none\r\n    text-value-default-null: true\r\n    on-boot-refresh-dict: true\r\n    cache:\r\n      enabled: true\r\n      maximum-size: 500\r\n      initial-capacity: 50\r\n      duration: 30s\r\n      miss-num: 50\r\n    controller:\r\n      enabled: false',
        '0989297cbb504b39c3cd1d16cffb7dd6', '2021-11-02 14:37:15', '2021-11-02 01:37:15', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 20, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_DICT_DATABASE:1}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: true\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'e9a27a89797a836b665de6d23d453f0f', '2021-11-03 15:29:27', '2021-11-03 02:29:27', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 21, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_TX_KNIFE4J:8401}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: 鉴权服务\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: 系统服务\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: 快速开发服务\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: 测试服务\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: 文件服务\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: 字典服务\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n        swaggerVersion: 2.0',
        'd6120022008ee74ce01088517d9be61f', '2021-11-09 17:28:47', '2021-11-09 03:28:47', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 22, 'dict-redis.yaml', 'DEFAULT_GROUP', '',
        'spring:\r\n  redis:\r\n    database: ${REDIS_DICT_DATABASE:1}\r\n    host: ${REDIS_HOST:127.0.0.1}\r\n    port: ${REDIS_PORT:6379}\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000',
        '7d2edb1abbf480ce1ef354efa8270541', '2021-11-11 08:45:02', '2021-11-10 18:45:03', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 23, 'flyway.yaml', 'DEFAULT_GROUP', '',
        'spring:\r\n  flyway:\r\n    enabled: true\r\n    # 迁移前校验 SQL 文件是否存在问题\r\n    validate-on-migrate: true\r\n    # 禁止清理数据库表 生产环境一定要启用\r\n    clean-disabled: true\r\n    # 文件编码\r\n    encoding: UTF-8\r\n    # 校验路径下是否存在 SQL 文件\r\n    check-location: false\r\n    # 最开始已经存在表结构，且不存在 flyway_schema_history 表时，需要设置为 true\r\n    baseline-on-migrate: true',
        '009b47e8c9b2a86c2a8b5615f331a93f', '2021-11-11 08:54:07', '2021-11-10 18:54:07', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 24, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_DICT_DATABASE:1}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '5570cd579a011855aec84ac5db081a36', '2021-11-11 08:57:04', '2021-11-10 18:57:04', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 25, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_DICT_DATABASE:1}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: true\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'ba230b19cd57d23be9716cc7636c50a2', '2021-11-11 09:12:50', '2021-11-10 19:12:51', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 26, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_DICT_DATABASE:1}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'c0d72e0ad2d7253a920d8bb74c2601bf', '2021-11-11 09:18:07', '2021-11-10 19:18:07', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 27, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_DICT_DATABASE:1}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: true\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'ba230b19cd57d23be9716cc7636c50a2', '2021-11-11 09:19:42', '2021-11-10 19:19:43', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 28, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_DICT_DATABASE:1}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'c0d72e0ad2d7253a920d8bb74c2601bf', '2021-11-11 09:29:53', '2021-11-10 19:29:54', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 29, 'logging.yaml', 'DEFAULT_GROUP', '',
        'logging:\r\n  level:\r\n    org:\r\n      springframework:\r\n        data:\r\n          convert:\r\n            CustomConversions: error\r\n    com:\r\n      alibaba:\r\n        cloud:\r\n          nacos:\r\n            client:\r\n              NacosPropertySourceBuilder: error',
        '9fb50b8e377afdbf444623cd5f94bff7', '2021-11-30 08:41:52', '2021-11-29 18:41:52', NULL, '192.168.33.1', 'I',
        'dev');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`
(
    `role`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `action`   varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    UNIQUE INDEX `uk_role_permission` (`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`
(
    `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `role`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    UNIQUE INDEX `idx_user_role` (`username`, `role`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles`
VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`
(
    `id`                bigint(20) UNSIGNED                              NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `tenant_id`         varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
    `quota`             int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
    `usage`             int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '使用量',
    `max_size`          int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
    `max_aggr_count`    int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
    `max_aggr_size`     int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
    `max_history_count` int(10) UNSIGNED                                 NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
    `gmt_create`        datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `gmt_modified`      datetime                                         NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tenant_id` (`tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '租户容量信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`
(
    `id`            bigint(20)                                       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `kp`            varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
    `tenant_id`     varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
    `tenant_name`   varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
    `tenant_desc`   varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
    `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin  NULL DEFAULT NULL COMMENT 'create_source',
    `gmt_create`    bigint(20)                                       NOT NULL COMMENT '创建时间',
    `gmt_modified`  bigint(20)                                       NOT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tenant_info_kptenantid` (`kp`, `tenant_id`) USING BTREE,
    INDEX `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'tenant_info'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info`
VALUES (1, '1', 'dev', 'dev', '开发环境', 'nacos', 1631933668820, 1631933668820);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`
(
    `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `enabled`  tinyint(1)                                                    NOT NULL,
    PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users`
VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
