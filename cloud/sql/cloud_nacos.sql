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
  AUTO_INCREMENT = 126
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info`
VALUES (115, 'gateway.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_GATEWAY:8301}\n\nspring:\n  cloud:\n    gateway:\n      globalcors:\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: \"*\"\n            allowedMethods: \"*\"\n            allowedHeaders: \"*\"\n            allowCredentials: true\n      routes:\n        - id: ${SERVICE_NAME_AUTH:auth}\n          uri: lb://${SERVICE_NAME_AUTH:auth}\n          predicates:\n            - Path=/auth/**\n          filters:\n            - name: Hystrix\n              args:\n                name: authfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_AUTH:auth}\n        - id: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          uri: lb://${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          predicates:\n            - Path=/system/**\n          filters:\n            - name: Hystrix\n              args:\n                name: systemfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        - id: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          uri: lb://${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          predicates:\n            - Path=/generator/**\n          filters:\n            - name: Hystrix\n              args:\n                name: generatorfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        - id: ${SERVICE_NAME_SERVER_TEST:server-test}\n          uri: lb://${SERVICE_NAME_SERVER_TEST:server-test}\n          predicates:\n            - Path=/test/**\n          filters:\n            - name: Hystrix\n              args:\n                name: testfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_TEST:server-test}\n        - id: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n          uri: lb://${SERVICE_NAME_SERVER_MINIO:server-minio}\n          predicates:\n            - Path=/minio/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_MINIO:server-minio}\n      loadbalancer:\n        use404: true\n      default-filters:\n        - StripPrefix=1\n        - MyDocGatewayHeaderFilter\n\n  autoconfigure:\n    exclude: org.springframework.boot.autoconfigure.mongo.MongoReactiveAutoConfiguration,org.springframework.boot.autoconfigure.data.mongo.MongoReactiveRepositoriesAutoConfiguration,org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration\n\n  # 网关增强配置\n  # data:\n  #   mongodb:\n  #     host: ${mongo.url}\n  #     port: 27017\n  #     database: cloud_route\n\n  redis:\n    database: ${REDIS_GATEWAY_DATABASE:3}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\n# 网关增强配置\nmy:\n  gateway:\n    enhance: false\n    jwt:\n      secret: 123456\n      expiration: 36000\n\n  doc:\n    gateway:\n      enable: true\n      resources: ${DOC_GATEWAY_RESOURCES:auth,server-system,server-generator,server-test}\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 10000\n    socialfallback:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nribbon:\n  eager-load:\n    enabled: true\n\n',
        'c47e66549d2e5f21450764b1cc63f35c', '2021-09-18 02:54:58', '2021-10-18 02:33:02', 'nacos', '0:0:0:0:0:0:0:1',
        '', 'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (116, 'tx-manager.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_TX_MANAGER:8501}\n\nspring:\n  datasource:\n    driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n    url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TX_MANAGER:cloud_tx_manager}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n    username: ${DATASOURCE_USERNAME:root}\n    password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_TX_MANAGER_DATABASE:2}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmy:\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  manager:\n    host: ${TX_MANAGER_PORT:0.0.0.0}\n    # TM监听Socket端口.\n    port: ${TX_CLIENT_MANAGER_PORT:8888}\n    # TM控制台密码\n    admin-key: ${TX_MANAGER_ADMIN_KEY:123456}\n  logger:\n    # 开启日志记录\n    enabled: ${TX_LOGGER_ENABLED:true}\n    driver-class-name: ${spring.datasource.driver-class-name}\n    jdbc-url: ${spring.datasource.url}\n    username: ${spring.datasource.username}\n    password: ${spring.datasource.password}',
        'bfa5497805bff26acda7206460f66f7c', '2021-09-18 02:54:58', '2021-09-27 22:03:18', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (118, 'server-system.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.system.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'd3930eb312644c3be6a11fef912c59bd', '2021-09-18 02:54:58', '2021-09-27 22:06:53', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (119, 'auth.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_AUTH:8101}\n\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_AUTH_DATABASE:0}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/auth/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id:\n      client-secret:\n      redirect-uri:\n    gitee:\n      client-id:\n      client-secret:\n      redirect-uri:\n    tencent_cloud:\n      client-id:\n      client-secret:\n      redirect-uri:\n    dingtalk:\n      client-id:\n      client-secret:\n      redirect-uri:\n    qq:\n      client-id:\n      client-secret:\n      redirect-uri:\n    microsoft:\n      client-id:\n      client-secret:\n      redirect-uri:\n  cache:\n    type: redis\n    prefix: \'MY::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nmy:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.auth.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        '79c7870f0c2160a88c22e4451d51603a', '2021-09-18 02:54:58', '2021-09-27 22:07:29', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (120, 'server-generator.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_GENERATOR:cloud_generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.generator.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '7af6acac1762b21bb767a912d08f458f', '2021-10-11 08:40:32', '2021-10-11 09:03:15', 'nacos', '192.168.41.239', '',
        'dev', 'null', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (121, 'server-test.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TEST:cloud_test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.test.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        '19a789578066dba18b1ba2cec80bd593', '2021-10-15 01:32:43', '2021-10-15 01:57:33', 'nacos', '0:0:0:0:0:0:0:1',
        '', 'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (125, 'server-minio.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.server.minio.controller\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}',
        'd2cf4809ead5e74c2703ec946fba884c', '2021-10-18 02:22:24', '2021-10-21 04:17:22', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');

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
  AUTO_INCREMENT = 4
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
