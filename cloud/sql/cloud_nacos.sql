/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : cloud_nacos

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 08/03/2022 08:53:59
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
  AUTO_INCREMENT = 389
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info`
VALUES (115, 'gateway.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_GATEWAY:8301}\n\nspring:\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  cloud:\n    gateway:\n      globalcors:\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: \"*\"\n            allowedMethods: \"*\"\n            allowedHeaders: \"*\"\n            allowCredentials: true\n      routes:\n        - id: ${SERVICE_NAME_AUTH:auth}\n          uri: lb://${SERVICE_NAME_AUTH:auth}\n          predicates:\n            - Path=${SERVICE_PATH_AUTH:/auth}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: authfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_AUTH:auth}\n        - id: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          uri: lb://${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_SYSTEM:/system}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: systemfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        - id: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          uri: lb://${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_GENERATOR:/generator}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: generatorfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        - id: ${SERVICE_NAME_SERVER_TEST:server-test}\n          uri: lb://${SERVICE_NAME_SERVER_TEST:server-test}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_TEST:/test}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: testfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_TEST:server-test}\n        - id: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n          uri: lb://${SERVICE_NAME_SERVER_MINIO:server-minio}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_MINIO:/minio}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_MINIO:server-minio}\n        - id: ${SERVICE_NAME_SERVER_DICT:server-dict}\n          uri: lb://${SERVICE_NAME_SERVER_DICT:server-dict}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_DICT:/dict}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_DICT:server-dict}\n      loadbalancer:\n        use404: true\n      default-filters:\n        - StripPrefix=1\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/gateway/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS_GATEWAY:false}\n\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 10000\n\n    socialfallback:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nribbon:\n  eager-load:\n    enabled: true\n\n',
        'd1265b489328f9dd412ba0e1c7dedc4d', '2021-09-18 02:54:58', '2021-12-30 00:56:41', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (118, 'server-system.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: system_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      data-id: server-system-seata.properties\n',
        'c8414a986d536524aa2e93e82f438778', '2021-09-18 02:54:58', '2022-03-03 00:35:47', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (119, 'auth.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_AUTH:8101}\n\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/auth/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id:\n      client-secret:\n      redirect-uri:\n    gitee:\n      client-id:\n      client-secret:\n      redirect-uri:\n    tencent_cloud:\n      client-id:\n      client-secret:\n      redirect-uri:\n    dingtalk:\n      client-id:\n      client-secret:\n      redirect-uri:\n    qq:\n      client-id:\n      client-secret:\n      redirect-uri:\n    microsoft:\n      client-id:\n      client-secret:\n      redirect-uri:\n  cache:\n    type: redis\n    prefix: \'MY::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nmy:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        'b1065a4934ff03945b6af0ec353d27af', '2021-09-18 02:54:58', '2022-03-07 01:28:15', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (120, 'server-generator.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_GENERATOR:cloud_generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: generator_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      data-id: server-generator-seata.properties',
        'c58979a075a56c6ef23eded4262e3b8d', '2021-10-11 08:40:32', '2022-03-03 00:43:48', 'nacos', '192.168.33.1', '',
        'dev', 'null', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (121, 'server-test.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TEST:cloud_test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: test_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      data-id: server-test-seata.properties\n',
        '944cfa08402eab35802fcd7d4228f29d', '2021-10-15 01:32:43', '2022-03-03 00:41:28', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (125, 'server-minio.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: minio_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-minio-seata.properties',
        '7c7b7b4c43f41e8fba36991623ffe492', '2021-10-18 02:22:24', '2022-03-03 00:43:33', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (128, 'knife4j.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4J_USERNAME:zclcs}\n      password: ${KNIFE4J_PASSWORD:123456}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: ${SERVICE_NAME_AUTH:auth}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n',
        '01ddac8455a549476d71f82c6eda1812', '2021-10-27 22:04:53', '2022-03-04 01:18:11', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (130, 'server-dict.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: dict_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-dict-seata.properties',
        'f9b0ccb61e83a1bb7a06cb85fe08bd09', '2021-10-28 02:04:33', '2022-03-07 00:51:28', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (131, 'dict.yaml', 'DEFAULT_GROUP',
        'system:\n  dict:\n    mq-type: none\n    raw-value: true\n    text-value-default-null: false\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: false',
        '3782112068e128f6e5535bb4b32e8b49', '2021-10-28 22:33:58', '2022-03-07 00:51:07', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (133, 'flyway.yaml', 'DEFAULT_GROUP',
        'spring:\n  flyway:\n    # 是否开启\n    enabled: true\n    # 迁移前校验 SQL 文件是否存在问题\n    validate-on-migrate: true\n    # 禁止清理数据库表 生产环境一定要启用\n    clean-disabled: true\n    # 文件编码\n    encoding: UTF-8\n    # 校验路径下是否存在 SQL 文件\n    check-location: false\n    # 最开始已经存在表结构，且不存在 flyway_schema_history 表时，需要设置为 true\n    baseline-on-migrate: true',
        '61e80c510ec79b9a32341aece6b7ed6b', '2021-11-10 18:54:07', '2022-02-25 06:05:32', 'nacos', '192.168.33.1', '',
        'dev', '数据库版本管理配置', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (134, 'logging.yaml', 'DEFAULT_GROUP',
        'logging:\n  level:\n    org:\n      springframework:\n        data:\n          convert:\n            CustomConversions: error\n    com:\n      alibaba:\n        cloud:\n          nacos:\n            client:\n              NacosPropertySourceBuilder: error\n      codingapi: info',
        '4888be6105874d1ef4a2630eb6960dab', '2021-11-29 18:41:52', '2022-02-16 01:00:30', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (140, 'server.yaml', 'DEFAULT_GROUP',
        'spring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      strict: true\n      seata: true    #开启seata代理，开启后默认每个数据源都代理，如果某个不需要代理可单独关闭\n      seata-mode: AT #支持XA及AT模式,默认AT\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmybatis-plus:\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\n#hystrix的超时时间\nhystrix:\n    command:\n        default:\n            execution:\n              timeout:\n                enabled: true\n              isolation:\n                    thread:\n                        timeoutInMilliseconds: 30000\n#ribbon的超时时间\nribbon:\n  ReadTimeout: 30000\n  ConnectTimeout: 30000\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        '6baf07a46334682e201e5db44387e272', '2022-01-09 21:26:46', '2022-03-03 02:32:58', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (141, 'rabbit-mq.yaml', 'DEFAULT_GROUP',
        'spring:\r\n  rabbitmq:\r\n    host: ${RABBIT_MQ_HOST:127.0.0.1}\r\n    port: ${RABBIT_MQ_PORT:5672}\r\n    username: ${RABBIT_MQ_USERNAME:root}\r\n    password: ${RABBIT_MQ_PASSWORD:123456}\r\n    virtual-host: /\r\n    # 手动提交消息\r\n    listener:\r\n      simple:\r\n        acknowledge-mode: manual\r\n      direct:\r\n        acknowledge-mode: manual',
        '22d79d245812abf7391b11a198e2d08a', '2022-02-06 21:37:27', '2022-02-06 21:37:27', NULL, '192.168.33.1', '',
        'dev', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (148, 'seata-client.yaml', 'DEFAULT_GROUP',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n      #data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n',
        '0de83e71798fce509306be201a3e47a0', '2022-02-24 21:23:01', '2022-03-03 00:35:58', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (321, 'seata.properties', 'DEFAULT_GROUP',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n',
        'c156812fa3281e8b4077108847dae707', '2022-02-25 04:45:16', '2022-03-03 01:00:28', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (348, 'server-system-seata.properties', 'DEFAULT_GROUP',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'b0401af7c6079b9403f72fd17759efa0', '2022-03-03 00:36:45', '2022-03-03 01:07:03', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (351, 'server-test-seata.properties', 'DEFAULT_GROUP',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=test_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'b729c82009386377e85a5860e7218766', '2022-03-03 00:41:41', '2022-03-03 01:07:23', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (355, 'server-minio-seata.properties', 'DEFAULT_GROUP',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=minio_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        '8e1d58733bdbdb746254179c7a66ae04', '2022-03-03 00:44:24', '2022-03-03 01:07:41', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (356, 'server-generator-seata.properties', 'DEFAULT_GROUP',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=generator_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        '414d8b39887bfb04fbd5c9f7d238f081', '2022-03-03 00:44:51', '2022-03-03 01:07:59', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (357, 'server-dict-seata.properties', 'DEFAULT_GROUP',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=dict_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        '186f7f9355a8355d5ebc157bfcc7b756', '2022-03-03 00:45:05', '2022-03-03 01:08:11', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (388, 'redis.yaml', 'DEFAULT_GROUP',
        'spring:\n  redis:\n    database: ${REDIS_DATABASE:0}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n',
        'c02654dfe190e20033fb8791b250d4b6', '2022-03-06 21:08:47', '2022-03-07 00:50:32', 'nacos', '192.168.33.1', '',
        'dev', '字典redis配置', '', '', 'yaml', '');

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
  AUTO_INCREMENT = 515
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '多租户改造'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info`
VALUES (0, 69, 'rabbit-mq.yaml', 'DEFAULT_GROUP', '',
        'spring:\r\n  rabbitmq:\r\n    host: ${RABBIT_MQ_HOST:127.0.0.1}\r\n    port: ${RABBIT_MQ_PORT:5672}\r\n    username: ${RABBIT_MQ_USERNAME:root}\r\n    password: ${RABBIT_MQ_PASSWORD:123456}\r\n    virtual-host: /\r\n    # 手动提交消息\r\n    listener:\r\n      simple:\r\n        acknowledge-mode: manual\r\n      direct:\r\n        acknowledge-mode: manual',
        '22d79d245812abf7391b11a198e2d08a', '2022-02-07 11:37:27', '2022-02-06 21:37:27', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 70, 'logging.yaml', 'DEFAULT_GROUP', '',
        'logging:\n  level:\n    org:\n      springframework:\n        data:\n          convert:\n            CustomConversions: error\n    com:\n      alibaba:\n        cloud:\n          nacos:\n            client:\n              NacosPropertySourceBuilder: error\n      codingapi: debug',
        '3df7de121fe51fc85486b4eb58e9aa78', '2022-02-10 09:36:17', '2022-02-09 19:36:17', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 71, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_TX_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4j_USERNAME:zclcs}\n      password: ${KNIFE4j_PASSWORD:123456}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: ${SERVICE_NAME_AUTH:auth}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n        swaggerVersion: 2.0',
        '98af42e70b7444d079159aa057859ee4', '2022-02-10 09:38:42', '2022-02-09 19:38:43', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (116, 72, 'tx-manager.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_TX_MANAGER:8501}\n\nspring:\n  datasource:\n    driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n    url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TX_MANAGER:cloud_tx_manager}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n    username: ${DATASOURCE_USERNAME:root}\n    password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_TX_MANAGER_DATABASE:2}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmy:\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  manager:\n    host: ${TX_MANAGER_PORT:0.0.0.0}\n    # TM监听Socket端口.\n    port: ${TX_CLIENT_MANAGER_PORT:8888}\n    # TM控制台密码\n    admin-key: ${TX_MANAGER_ADMIN_KEY:123456}\n  logger:\n    # 开启日志记录\n    enabled: ${TX_LOGGER_ENABLED:true}\n    driver-class-name: ${spring.datasource.driver-class-name}\n    jdbc-url: ${spring.datasource.url}\n    username: ${spring.datasource.username}\n    password: ${spring.datasource.password}',
        'bfa5497805bff26acda7206460f66f7c', '2022-02-11 09:48:40', '2022-02-10 19:48:40', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 73, 'logging.yaml', 'DEFAULT_GROUP', '',
        'logging:\n  level:\n    org:\n      springframework:\n        data:\n          convert:\n            CustomConversions: error\n    com:\n      alibaba:\n        cloud:\n          nacos:\n            client:\n              NacosPropertySourceBuilder: error\n      codingapi: info',
        '4888be6105874d1ef4a2630eb6960dab', '2022-02-11 14:21:00', '2022-02-11 00:21:00', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 74, 'logging.yaml', 'DEFAULT_GROUP', '',
        'logging:\n  level:\n    org:\n      springframework:\n        data:\n          convert:\n            CustomConversions: error\n    com:\n      alibaba:\n        cloud:\n          nacos:\n            client:\n              NacosPropertySourceBuilder: error\n      codingapi: debug',
        '3df7de121fe51fc85486b4eb58e9aa78', '2022-02-16 15:00:30', '2022-02-16 01:00:30', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (133, 75, 'flyway.yaml', 'DEFAULT_GROUP', '',
        'spring:\r\n  flyway:\r\n    enabled: true\r\n    # 迁移前校验 SQL 文件是否存在问题\r\n    validate-on-migrate: true\r\n    # 禁止清理数据库表 生产环境一定要启用\r\n    clean-disabled: true\r\n    # 文件编码\r\n    encoding: UTF-8\r\n    # 校验路径下是否存在 SQL 文件\r\n    check-location: false\r\n    # 最开始已经存在表结构，且不存在 flyway_schema_history 表时，需要设置为 true\r\n    baseline-on-migrate: true',
        '009b47e8c9b2a86c2a8b5615f331a93f', '2022-02-24 17:35:51', '2022-02-24 03:35:52', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (133, 76, 'flyway.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  flyway:\n    # 是否开启\n    enabled: true\n    # 版本表表名\n    table: \n    # 迁移前校验 SQL 文件是否存在问题\n    validate-on-migrate: true\n    # 禁止清理数据库表 生产环境一定要启用\n    clean-disabled: true\n    # 文件编码\n    encoding: UTF-8\n    # 校验路径下是否存在 SQL 文件\n    check-location: false\n    # 最开始已经存在表结构，且不存在 flyway_schema_history 表时，需要设置为 true\n    baseline-on-migrate: true',
        'cc13f1744bffc6d46a12801df80a86f1', '2022-02-24 17:36:35', '2022-02-24 03:36:36', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 77, 'seata-server.properties', 'DEFAULT_GROUP', '',
        '# 存储模式\r\nstore.mode=db\r\n\r\nstore.db.datasource=druid\r\nstore.db.dbType=mysql\r\n# 需要根据mysql的版本调整driverClassName\r\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\r\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\r\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\r\n# 注意根据生产实际情况调整参数host和port\r\nstore.db.url=jdbc:mysql://127.0.0.1:3306/seata-server?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false\r\n# 数据库用户名\r\nstore.db.user=\r\n# 用户名密码\r\nstore.db.password=',
        'f6c12ce31ad2407e5a9ab17e29385333', '2022-02-25 10:29:28', '2022-02-24 20:29:28', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (145, 78, 'seata-server.properties', 'DEFAULT_GROUP', '',
        '# 存储模式\r\nstore.mode=db\r\n\r\nstore.db.datasource=druid\r\nstore.db.dbType=mysql\r\n# 需要根据mysql的版本调整driverClassName\r\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\r\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\r\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\r\n# 注意根据生产实际情况调整参数host和port\r\nstore.db.url=jdbc:mysql://127.0.0.1:3306/seata-server?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false\r\n# 数据库用户名\r\nstore.db.user=\r\n# 用户名密码\r\nstore.db.password=',
        'f6c12ce31ad2407e5a9ab17e29385333', '2022-02-25 10:36:02', '2022-02-24 20:36:02', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (145, 79, 'seata-server.properties', 'DEFAULT_GROUP', '',
        '# 存储模式\nstore.mode=db\n\nstore.db.datasource=druid\nstore.db.dbType=mysql\n# 需要根据mysql的版本调整driverClassName\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\nstore.db.driverClassName=${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n# 数据库用户名\nstore.db.user=${DATASOURCE_USERNAME:root}\n# 用户名密码\nstore.db.password=${DATASOURCE_PASSWORD:root}',
        '990ec069a7450e75ad3c1d3df998bc69', '2022-02-25 11:08:00', '2022-02-24 21:08:00', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 80, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'tx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}\n  # logger:\n    # 开启日志记录\n    # enabled: ${TX_LOGGER_ENABLED:true}\n    # driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n    # jdbc-url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TX_MANAGER:cloud_tx_manager}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n    # username: ${DATASOURCE_USERNAME:root}\n    # password: ${DATASOURCE_PASSWORD:root}',
        '8df2ee94344e635c09443497d1c31f53', '2022-02-25 11:23:00', '2022-02-24 21:23:01', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 81, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'tx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}\n  # logger:\n    # 开启日志记录\n    # enabled: ${TX_LOGGER_ENABLED:true}\n    # driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n    # jdbc-url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TX_MANAGER:cloud_tx_manager}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n    # username: ${DATASOURCE_USERNAME:root}\n    # password: ${DATASOURCE_PASSWORD:root}',
        '8df2ee94344e635c09443497d1c31f53', '2022-02-25 11:23:46', '2022-02-24 21:23:46', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 82, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: applicationName\n  tx-service-group: cloud_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      cloud_tx_group: default\n  config:\n    type: nacos\n  registry:\n    type: nacos',
        'bbe634829528a758fa755047c8ce53fa', '2022-02-25 11:24:23', '2022-02-24 21:24:23', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 83, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: cloud_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      cloud_tx_group: default\n  config:\n    type: nacos\n  registry:\n    type: nacos',
        'baa6e1c77887cc608d45b67b5ef73659', '2022-02-25 11:31:59', '2022-02-24 21:31:59', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (145, 84, 'seata-server.properties', 'DEFAULT_GROUP', '',
        '# 存储模式\nstore.mode=db\n\nstore.db.datasource=druid\nstore.db.dbType=mysql\n# 需要根据mysql的版本调整driverClassName\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\nstore.db.driverClassName=${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SEATA:cloud_seata}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n# 数据库用户名\nstore.db.user=${DATASOURCE_USERNAME:root}\n# 用户名密码\nstore.db.password=${DATASOURCE_PASSWORD:root}',
        '284affebe69e307e6af9afa9f916278e', '2022-02-25 14:17:51', '2022-02-25 00:17:51', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (145, 85, 'seata-server.properties', 'DEFAULT_GROUP', '',
        '# 存储模式\nstore.mode=db\n\nstore.db.datasource=hikari\nstore.db.dbType=mysql\n# 需要根据mysql的版本调整driverClassName\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\nstore.db.driverClassName=${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SEATA:cloud_seata}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n# 数据库用户名\nstore.db.user=${DATASOURCE_USERNAME:root}\n# 用户名密码\nstore.db.password=${DATASOURCE_PASSWORD:root}',
        '691c9a426050b56bb59aa7259b0f8295', '2022-02-25 14:20:22', '2022-02-25 00:20:23', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 86, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false',
        'eb7a20eb25b920c9bb1941b072073f8a', '2022-02-25 14:28:10', '2022-02-25 00:28:11', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (120, 87, 'server-generator.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_GENERATOR:cloud_generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext',
        '684833201e0155cdbc2bba7ae2782918', '2022-02-25 14:28:38', '2022-02-25 00:28:39', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (138, 88, 'tx-client.yaml', 'DEFAULT_GROUP', '',
        'tx-lcn:\n  client:\n    manager-address: ${TX_CLIENT_MANAGER_HOST:127.0.0.1}:${TX_CLIENT_MANAGER_PORT:8888}\n  # logger:\n    # 开启日志记录\n    # enabled: ${TX_LOGGER_ENABLED:true}\n    # driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n    # jdbc-url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TX_MANAGER:cloud_tx_manager}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n    # username: ${DATASOURCE_USERNAME:root}\n    # password: ${DATASOURCE_PASSWORD:root}',
        '8df2ee94344e635c09443497d1c31f53', '2022-02-25 14:28:51', '2022-02-25 00:28:51', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (116, 89, 'tx-manager.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_TX_MANAGER:8501}\n\nspring:\n  datasource:\n    driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n    url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TX_MANAGER:cloud_tx_manager}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n    username: ${DATASOURCE_USERNAME:root}\n    password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_TX_MANAGER_DATABASE:2}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmy:\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}\n\ntx-lcn:\n  manager:\n    host: ${TX_MANAGER_PORT:0.0.0.0}\n    # TM监听Socket端口.\n    port: ${TX_CLIENT_MANAGER_PORT:8888}\n    # TM控制台密码\n    admin-key: ${TX_MANAGER_ADMIN_KEY:123456}\n  logger:\n    # 开启日志记录\n    enabled: ${TX_LOGGER_ENABLED:true}\n    driver-class-name: ${spring.datasource.driver-class-name}\n    jdbc-url: ${spring.datasource.url}\n    username: ${spring.datasource.username}\n    password: ${spring.datasource.password}',
        'bfa5497805bff26acda7206460f66f7c', '2022-02-25 14:28:55', '2022-02-25 00:28:55', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (125, 90, 'server-minio.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false',
        'da51b5a2ce7c8b074a7beb64c76d8774', '2022-02-25 14:29:15', '2022-02-25 00:29:15', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 91, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext',
        '1eab0b8a91594d7af5dd3887b32474e5', '2022-02-25 14:29:36', '2022-02-25 00:29:37', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (121, 92, 'server-test.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TEST:cloud_test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext',
        'a135c92c6a1a4371d2efffacc0800afe', '2022-02-25 14:30:04', '2022-02-25 00:30:04', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 93, 'service.vgroupMapping.cloud_tx_group', 'DEFAULT_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 15:04:06', '2022-02-25 01:04:07', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (140, 94, 'server.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmybatis-plus:\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\n#hystrix的超时时间\nhystrix:\n    command:\n        default:\n            execution:\n              timeout:\n                enabled: true\n              isolation:\n                    thread:\n                        timeoutInMilliseconds: 30000\n#ribbon的超时时间\nribbon:\n  ReadTimeout: 30000\n  ConnectTimeout: 30000\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        'a0f26eff106c1f6c56b758a99aacbb11', '2022-02-25 15:38:45', '2022-02-25 01:38:46', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 95, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: cloud_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      cloud_tx_group: default\n  config:\n    type: nacos\n  registry:\n    type: nacos',
        'baa6e1c77887cc608d45b67b5ef73659', '2022-02-25 15:42:00', '2022-02-25 01:42:01', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 96, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: cloud_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      cloud_tx_group: default\n  config:\n    type: nacos\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      group: DEFAULT_GROUP',
        '393fec38e86fd0312e9ee055da4727f3', '2022-02-25 15:43:24', '2022-02-25 01:43:24', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (159, 97, 'service.vgroupMapping.cloud_tx_group', 'DEFAULT_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 16:04:55', '2022-02-25 02:04:55', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (145, 98, 'seata-server.properties', 'DEFAULT_GROUP', '',
        '# 存储模式\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:$3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=root',
        '883c7b32c9a15130430e2dde62847196', '2022-02-25 16:17:07', '2022-02-25 02:17:07', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (145, 99, 'seata-server.properties', 'DEFAULT_GROUP', '',
        '# 存储模式\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:$3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=root\n\n#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=druid\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:$3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=root\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '208981464b8dd02e3e3a3e35ea449597', '2022-02-25 16:20:36', '2022-02-25 02:20:37', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 100, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: my_test_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      my_test_tx_group: default\n  config:\n    type: nacos\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      group: DEFAULT_GROUP',
        '1318856100151f9a70933d6cb8d2a2a8', '2022-02-25 16:24:33', '2022-02-25 02:24:33', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 101, 'transport.type', 'SEATA_GROUP', '', 'TCP', 'b136ef5f6a01d816991fe3cf7a6ac763', '2022-02-25 16:39:11',
        '2022-02-25 02:39:12', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 102, 'transport.server', 'SEATA_GROUP', '', 'NIO', 'b6d9dfc0fb54277321cebc0fff55df2f', '2022-02-25 16:39:13',
        '2022-02-25 02:39:13', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 103, 'transport.heartbeat', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:39:15', '2022-02-25 02:39:15', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 104, 'transport.enableTmClientBatchSendRequest', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:39:18', '2022-02-25 02:39:19', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 105, 'transport.enableRmClientBatchSendRequest', 'SEATA_GROUP', '', 'true',
        'b326b5062b2f0e69046810717534cb09', '2022-02-25 16:39:22', '2022-02-25 02:39:22', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 106, 'transport.enableTcServerBatchSendResponse', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:39:25', '2022-02-25 02:39:26', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 107, 'transport.rpcRmRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:39:28', '2022-02-25 02:39:29', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 108, 'transport.rpcTmRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:39:31', '2022-02-25 02:39:31', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 109, 'transport.rpcTcRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:39:33', '2022-02-25 02:39:34', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 110, 'transport.threadFactory.bossThreadPrefix', 'SEATA_GROUP', '', 'NettyBoss',
        '0f8db59a3b7f2823f38a70c308361836', '2022-02-25 16:39:37', '2022-02-25 02:39:38', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 111, 'transport.threadFactory.workerThreadPrefix', 'SEATA_GROUP', '', 'NettyServerNIOWorker',
        'a78ec7ef5d1631754c4e72ae8a3e9205', '2022-02-25 16:39:42', '2022-02-25 02:39:42', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 112, 'transport.threadFactory.serverExecutorThreadPrefix', 'SEATA_GROUP', '', 'NettyServerBizHandler',
        '11a36309f3d9df84fa8b59cf071fa2da', '2022-02-25 16:39:48', '2022-02-25 02:39:48', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 113, 'transport.threadFactory.shareBossWorker', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:39:51', '2022-02-25 02:39:52', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 114, 'transport.threadFactory.clientSelectorThreadPrefix', 'SEATA_GROUP', '', 'NettyClientSelector',
        'cd7ec5a06541e75f5a7913752322c3af', '2022-02-25 16:39:56', '2022-02-25 02:39:57', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 115, 'transport.threadFactory.clientSelectorThreadSize', 'SEATA_GROUP', '', '1',
        'c4ca4238a0b923820dcc509a6f75849b', '2022-02-25 16:40:00', '2022-02-25 02:40:01', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 116, 'transport.threadFactory.clientWorkerThreadPrefix', 'SEATA_GROUP', '', 'NettyClientWorkerThread',
        '61cf4e69a56354cf72f46dc86414a57e', '2022-02-25 16:40:06', '2022-02-25 02:40:06', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 117, 'transport.threadFactory.bossThreadSize', 'SEATA_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b',
        '2022-02-25 16:40:09', '2022-02-25 02:40:09', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 118, 'transport.threadFactory.workerThreadSize', 'SEATA_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 16:40:12', '2022-02-25 02:40:13', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 119, 'transport.shutdown.wait', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3',
        '2022-02-25 16:40:14', '2022-02-25 02:40:15', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 120, 'transport.serialization', 'SEATA_GROUP', '', 'seata', 'b943081c423b9a5416a706524ee05d40',
        '2022-02-25 16:40:17', '2022-02-25 02:40:17', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 121, 'transport.compressor', 'SEATA_GROUP', '', 'none', '334c4a4c42fdb79d7ebc3e73b517e6f8',
        '2022-02-25 16:40:19', '2022-02-25 02:40:19', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 122, 'service.vgroupMapping.default_tx_group', 'SEATA_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 16:40:22', '2022-02-25 02:40:23', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 123, 'service.default.grouplist', 'SEATA_GROUP', '', '127.0.0.1:8091', 'c32ce0d3e264525dcdada751f98143a3',
        '2022-02-25 16:40:26', '2022-02-25 02:40:26', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 124, 'service.enableDegrade', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:40:28', '2022-02-25 02:40:28', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 125, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:40:31', '2022-02-25 02:40:31', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 126, 'client.rm.asyncCommitBufferLimit', 'SEATA_GROUP', '', '10000', 'b7a782741f667201b54880c925faec4b',
        '2022-02-25 16:40:33', '2022-02-25 02:40:34', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 127, 'client.rm.lock.retryInterval', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2022-02-25 16:40:36', '2022-02-25 02:40:36', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 128, 'client.rm.lock.retryTimes', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f',
        '2022-02-25 16:40:38', '2022-02-25 02:40:38', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 129, 'client.rm.lock.retryPolicyBranchRollbackOnConflict', 'SEATA_GROUP', '', 'true',
        'b326b5062b2f0e69046810717534cb09', '2022-02-25 16:40:42', '2022-02-25 02:40:42', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 130, 'client.rm.reportRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:40:44', '2022-02-25 02:40:45', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 131, 'client.rm.tableMetaCheckEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:40:47', '2022-02-25 02:40:48', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 132, 'client.rm.tableMetaCheckerInterval', 'SEATA_GROUP', '', '60000', '2b4226dd7ed6eb2d419b881f3ae9c97c',
        '2022-02-25 16:40:50', '2022-02-25 02:40:51', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 133, 'client.rm.sqlParserType', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60',
        '2022-02-25 16:40:52', '2022-02-25 02:40:53', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 134, 'client.rm.reportSuccessEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:40:55', '2022-02-25 02:40:56', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 135, 'client.rm.sagaBranchRegisterEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:40:58', '2022-02-25 02:40:59', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 136, 'client.rm.sagaJsonParser', 'SEATA_GROUP', '', 'fastjson', 'd00d3dbc0834f08411c7b6c4c39e9f00',
        '2022-02-25 16:41:01', '2022-02-25 02:41:01', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 137, 'client.rm.tccActionInterceptorOrder', 'SEATA_GROUP', '', '-2147482648',
        'f056d9efa5dae3872f9da035c83bcde8', '2022-02-25 16:41:05', '2022-02-25 02:41:05', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (198, 138, 'client.rm.sqlParserType', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60',
        '2022-02-25 16:41:07', '2022-02-25 02:41:07', 'nacos', '192.168.33.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 139, 'client.tm.commitRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:41:09', '2022-02-25 02:41:10', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 140, 'client.tm.rollbackRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:41:11', '2022-02-25 02:41:12', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 141, 'client.tm.defaultGlobalTransactionTimeout', 'SEATA_GROUP', '', '60000',
        '2b4226dd7ed6eb2d419b881f3ae9c97c', '2022-02-25 16:41:15', '2022-02-25 02:41:15', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 142, 'client.tm.degradeCheck', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:41:18', '2022-02-25 02:41:18', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 143, 'client.tm.degradeCheckAllowTimes', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2022-02-25 16:41:20', '2022-02-25 02:41:21', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 144, 'client.tm.degradeCheckPeriod', 'SEATA_GROUP', '', '2000', '08f90c1a417155361a5c4b8d297e0d78',
        '2022-02-25 16:41:23', '2022-02-25 02:41:23', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 145, 'client.tm.interceptorOrder', 'SEATA_GROUP', '', '-2147482648', 'f056d9efa5dae3872f9da035c83bcde8',
        '2022-02-25 16:41:26', '2022-02-25 02:41:26', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 146, 'client.undo.dataValidation', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:41:28', '2022-02-25 02:41:29', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 147, 'client.undo.logSerialization', 'SEATA_GROUP', '', 'jackson', 'b41779690b83f182acc67d6388c7bac9',
        '2022-02-25 16:41:31', '2022-02-25 02:41:31', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 148, 'client.undo.onlyCareUpdateColumns', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:41:34', '2022-02-25 02:41:34', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 149, 'server.undo.logSaveDays', 'SEATA_GROUP', '', '7', '8f14e45fceea167a5a36dedd4bea2543',
        '2022-02-25 16:41:36', '2022-02-25 02:41:36', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 150, 'server.undo.logDeletePeriod', 'SEATA_GROUP', '', '86400000', 'f4c122804fe9076cb2710f55c3c6e346',
        '2022-02-25 16:41:38', '2022-02-25 02:41:39', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 151, 'client.undo.logTable', 'SEATA_GROUP', '', 'undo_log', '2842d229c24afe9e61437135e8306614',
        '2022-02-25 16:41:41', '2022-02-25 02:41:41', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 152, 'client.undo.compress.enable', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:41:43', '2022-02-25 02:41:44', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 153, 'client.undo.compress.type', 'SEATA_GROUP', '', 'zip', 'adcdbd79a8d84175c229b192aadc02f2',
        '2022-02-25 16:41:45', '2022-02-25 02:41:46', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 154, 'client.undo.compress.threshold', 'SEATA_GROUP', '', '64k', 'bd44a6458bdbff0b5cac721ba361f035',
        '2022-02-25 16:41:48', '2022-02-25 02:41:49', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 155, 'tcc.fence.logTableName', 'SEATA_GROUP', '', 'tcc_fence_log', 'db229b665c7cfd5abc03971d4ed284c6',
        '2022-02-25 16:41:51', '2022-02-25 02:41:52', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 156, 'tcc.fence.cleanPeriod', 'SEATA_GROUP', '', '1h', '7c68645d71b803bf0ba2f22519f73e08',
        '2022-02-25 16:41:53', '2022-02-25 02:41:54', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 157, 'log.exceptionRate', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd',
        '2022-02-25 16:41:55', '2022-02-25 02:41:55', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 158, 'store.mode', 'SEATA_GROUP', '', 'file', '8c7dd922ad47494fc02c388e12c00eac', '2022-02-25 16:41:56',
        '2022-02-25 02:41:57', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (166, 159, 'transport.type', 'SEATA_GROUP', '', 'TCP', 'b136ef5f6a01d816991fe3cf7a6ac763', '2022-02-25 16:42:21',
        '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (167, 160, 'transport.server', 'SEATA_GROUP', '', 'NIO', 'b6d9dfc0fb54277321cebc0fff55df2f',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (168, 161, 'transport.heartbeat', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (169, 162, 'transport.enableTmClientBatchSendRequest', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (170, 163, 'transport.enableRmClientBatchSendRequest', 'SEATA_GROUP', '', 'true',
        'b326b5062b2f0e69046810717534cb09', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (171, 164, 'transport.enableTcServerBatchSendResponse', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (172, 165, 'transport.rpcRmRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (173, 166, 'transport.rpcTmRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (174, 167, 'transport.rpcTcRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (175, 168, 'transport.threadFactory.bossThreadPrefix', 'SEATA_GROUP', '', 'NettyBoss',
        '0f8db59a3b7f2823f38a70c308361836', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (176, 169, 'transport.threadFactory.workerThreadPrefix', 'SEATA_GROUP', '', 'NettyServerNIOWorker',
        'a78ec7ef5d1631754c4e72ae8a3e9205', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (177, 170, 'transport.threadFactory.serverExecutorThreadPrefix', 'SEATA_GROUP', '', 'NettyServerBizHandler',
        '11a36309f3d9df84fa8b59cf071fa2da', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (178, 171, 'transport.threadFactory.shareBossWorker', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (179, 172, 'transport.threadFactory.clientSelectorThreadPrefix', 'SEATA_GROUP', '', 'NettyClientSelector',
        'cd7ec5a06541e75f5a7913752322c3af', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (180, 173, 'transport.threadFactory.clientSelectorThreadSize', 'SEATA_GROUP', '', '1',
        'c4ca4238a0b923820dcc509a6f75849b', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (181, 174, 'transport.threadFactory.clientWorkerThreadPrefix', 'SEATA_GROUP', '', 'NettyClientWorkerThread',
        '61cf4e69a56354cf72f46dc86414a57e', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (182, 175, 'transport.threadFactory.bossThreadSize', 'SEATA_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (183, 176, 'transport.threadFactory.workerThreadSize', 'SEATA_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (184, 177, 'transport.shutdown.wait', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (185, 178, 'transport.serialization', 'SEATA_GROUP', '', 'seata', 'b943081c423b9a5416a706524ee05d40',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (186, 179, 'transport.compressor', 'SEATA_GROUP', '', 'none', '334c4a4c42fdb79d7ebc3e73b517e6f8',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (187, 180, 'service.vgroupMapping.default_tx_group', 'SEATA_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (188, 181, 'service.default.grouplist', 'SEATA_GROUP', '', '127.0.0.1:8091', 'c32ce0d3e264525dcdada751f98143a3',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (189, 182, 'service.enableDegrade', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (190, 183, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (191, 184, 'client.rm.asyncCommitBufferLimit', 'SEATA_GROUP', '', '10000', 'b7a782741f667201b54880c925faec4b',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (192, 185, 'client.rm.lock.retryInterval', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (193, 186, 'client.rm.lock.retryTimes', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (194, 187, 'client.rm.lock.retryPolicyBranchRollbackOnConflict', 'SEATA_GROUP', '', 'true',
        'b326b5062b2f0e69046810717534cb09', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (195, 188, 'client.rm.reportRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (196, 189, 'client.rm.tableMetaCheckEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (197, 190, 'client.rm.tableMetaCheckerInterval', 'SEATA_GROUP', '', '60000', '2b4226dd7ed6eb2d419b881f3ae9c97c',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (198, 191, 'client.rm.sqlParserType', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (199, 192, 'client.rm.reportSuccessEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (200, 193, 'client.rm.sagaBranchRegisterEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (201, 194, 'client.rm.sagaJsonParser', 'SEATA_GROUP', '', 'fastjson', 'd00d3dbc0834f08411c7b6c4c39e9f00',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (202, 195, 'client.rm.tccActionInterceptorOrder', 'SEATA_GROUP', '', '-2147482648',
        'f056d9efa5dae3872f9da035c83bcde8', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (204, 196, 'client.tm.commitRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (205, 197, 'client.tm.rollbackRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (206, 198, 'client.tm.defaultGlobalTransactionTimeout', 'SEATA_GROUP', '', '60000',
        '2b4226dd7ed6eb2d419b881f3ae9c97c', '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (207, 199, 'client.tm.degradeCheck', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (208, 200, 'client.tm.degradeCheckAllowTimes', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (209, 201, 'client.tm.degradeCheckPeriod', 'SEATA_GROUP', '', '2000', '08f90c1a417155361a5c4b8d297e0d78',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (210, 202, 'client.tm.interceptorOrder', 'SEATA_GROUP', '', '-2147482648', 'f056d9efa5dae3872f9da035c83bcde8',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (211, 203, 'client.undo.dataValidation', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (212, 204, 'client.undo.logSerialization', 'SEATA_GROUP', '', 'jackson', 'b41779690b83f182acc67d6388c7bac9',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (213, 205, 'client.undo.onlyCareUpdateColumns', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (214, 206, 'server.undo.logSaveDays', 'SEATA_GROUP', '', '7', '8f14e45fceea167a5a36dedd4bea2543',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (215, 207, 'server.undo.logDeletePeriod', 'SEATA_GROUP', '', '86400000', 'f4c122804fe9076cb2710f55c3c6e346',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (216, 208, 'client.undo.logTable', 'SEATA_GROUP', '', 'undo_log', '2842d229c24afe9e61437135e8306614',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (217, 209, 'client.undo.compress.enable', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (218, 210, 'client.undo.compress.type', 'SEATA_GROUP', '', 'zip', 'adcdbd79a8d84175c229b192aadc02f2',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (219, 211, 'client.undo.compress.threshold', 'SEATA_GROUP', '', '64k', 'bd44a6458bdbff0b5cac721ba361f035',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (220, 212, 'tcc.fence.logTableName', 'SEATA_GROUP', '', 'tcc_fence_log', 'db229b665c7cfd5abc03971d4ed284c6',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (221, 213, 'tcc.fence.cleanPeriod', 'SEATA_GROUP', '', '1h', '7c68645d71b803bf0ba2f22519f73e08',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (222, 214, 'log.exceptionRate', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd',
        '2022-02-25 16:42:21', '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (223, 215, 'store.mode', 'SEATA_GROUP', '', 'file', '8c7dd922ad47494fc02c388e12c00eac', '2022-02-25 16:42:21',
        '2022-02-25 02:42:22', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 216, 'transport.type', 'SEATA_GROUP', '', 'TCP', 'b136ef5f6a01d816991fe3cf7a6ac763', '2022-02-25 16:43:15',
        '2022-02-25 02:43:15', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 217, 'transport.server', 'SEATA_GROUP', '', 'NIO', 'b6d9dfc0fb54277321cebc0fff55df2f', '2022-02-25 16:43:16',
        '2022-02-25 02:43:17', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 218, 'transport.heartbeat', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:43:18', '2022-02-25 02:43:19', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 219, 'transport.enableTmClientBatchSendRequest', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:43:21', '2022-02-25 02:43:22', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 220, 'transport.enableRmClientBatchSendRequest', 'SEATA_GROUP', '', 'true',
        'b326b5062b2f0e69046810717534cb09', '2022-02-25 16:43:24', '2022-02-25 02:43:25', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 221, 'transport.enableTcServerBatchSendResponse', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:43:28', '2022-02-25 02:43:28', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 222, 'transport.rpcRmRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:43:31', '2022-02-25 02:43:31', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 223, 'transport.rpcTmRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:43:33', '2022-02-25 02:43:34', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 224, 'transport.rpcTcRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:43:36', '2022-02-25 02:43:36', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 225, 'transport.threadFactory.bossThreadPrefix', 'SEATA_GROUP', '', 'NettyBoss',
        '0f8db59a3b7f2823f38a70c308361836', '2022-02-25 16:43:40', '2022-02-25 02:43:40', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 226, 'transport.threadFactory.workerThreadPrefix', 'SEATA_GROUP', '', 'NettyServerNIOWorker',
        'a78ec7ef5d1631754c4e72ae8a3e9205', '2022-02-25 16:43:45', '2022-02-25 02:43:45', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 227, 'transport.threadFactory.serverExecutorThreadPrefix', 'SEATA_GROUP', '', 'NettyServerBizHandler',
        '11a36309f3d9df84fa8b59cf071fa2da', '2022-02-25 16:43:51', '2022-02-25 02:43:51', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 228, 'transport.threadFactory.shareBossWorker', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:43:54', '2022-02-25 02:43:55', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 229, 'transport.threadFactory.clientSelectorThreadPrefix', 'SEATA_GROUP', '', 'NettyClientSelector',
        'cd7ec5a06541e75f5a7913752322c3af', '2022-02-25 16:43:59', '2022-02-25 02:44:00', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 230, 'transport.threadFactory.clientSelectorThreadSize', 'SEATA_GROUP', '', '1',
        'c4ca4238a0b923820dcc509a6f75849b', '2022-02-25 16:44:03', '2022-02-25 02:44:04', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 231, 'transport.threadFactory.clientWorkerThreadPrefix', 'SEATA_GROUP', '', 'NettyClientWorkerThread',
        '61cf4e69a56354cf72f46dc86414a57e', '2022-02-25 16:44:09', '2022-02-25 02:44:09', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 232, 'transport.threadFactory.bossThreadSize', 'SEATA_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b',
        '2022-02-25 16:44:12', '2022-02-25 02:44:12', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 233, 'transport.threadFactory.workerThreadSize', 'SEATA_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 16:44:15', '2022-02-25 02:44:16', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 234, 'transport.shutdown.wait', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3',
        '2022-02-25 16:44:18', '2022-02-25 02:44:18', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 235, 'transport.serialization', 'SEATA_GROUP', '', 'seata', 'b943081c423b9a5416a706524ee05d40',
        '2022-02-25 16:44:20', '2022-02-25 02:44:20', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 236, 'transport.compressor', 'SEATA_GROUP', '', 'none', '334c4a4c42fdb79d7ebc3e73b517e6f8',
        '2022-02-25 16:44:22', '2022-02-25 02:44:22', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 237, 'service.vgroupMapping.default_tx_group', 'SEATA_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 16:44:26', '2022-02-25 02:44:26', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 238, 'service.default.grouplist', 'SEATA_GROUP', '', '127.0.0.1:8091', 'c32ce0d3e264525dcdada751f98143a3',
        '2022-02-25 16:44:29', '2022-02-25 02:44:29', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 239, 'service.enableDegrade', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:44:31', '2022-02-25 02:44:31', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 240, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:44:34', '2022-02-25 02:44:34', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 241, 'client.rm.asyncCommitBufferLimit', 'SEATA_GROUP', '', '10000', 'b7a782741f667201b54880c925faec4b',
        '2022-02-25 16:44:37', '2022-02-25 02:44:37', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 242, 'client.rm.lock.retryInterval', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2022-02-25 16:44:39', '2022-02-25 02:44:40', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 243, 'client.rm.lock.retryTimes', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f',
        '2022-02-25 16:44:41', '2022-02-25 02:44:42', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 244, 'client.rm.lock.retryPolicyBranchRollbackOnConflict', 'SEATA_GROUP', '', 'true',
        'b326b5062b2f0e69046810717534cb09', '2022-02-25 16:44:46', '2022-02-25 02:44:46', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 245, 'client.rm.reportRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:44:48', '2022-02-25 02:44:48', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 246, 'client.rm.tableMetaCheckEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:44:51', '2022-02-25 02:44:51', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 247, 'client.rm.tableMetaCheckerInterval', 'SEATA_GROUP', '', '60000', '2b4226dd7ed6eb2d419b881f3ae9c97c',
        '2022-02-25 16:44:54', '2022-02-25 02:44:54', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 248, 'client.rm.sqlParserType', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60',
        '2022-02-25 16:44:56', '2022-02-25 02:44:57', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 249, 'client.rm.reportSuccessEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:44:59', '2022-02-25 02:45:00', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 250, 'client.rm.sagaBranchRegisterEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:45:02', '2022-02-25 02:45:03', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 251, 'client.rm.sagaJsonParser', 'SEATA_GROUP', '', 'fastjson', 'd00d3dbc0834f08411c7b6c4c39e9f00',
        '2022-02-25 16:45:05', '2022-02-25 02:45:05', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 252, 'client.rm.tccActionInterceptorOrder', 'SEATA_GROUP', '', '-2147482648',
        'f056d9efa5dae3872f9da035c83bcde8', '2022-02-25 16:45:08', '2022-02-25 02:45:09', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (256, 253, 'client.rm.sqlParserType', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60',
        '2022-02-25 16:45:11', '2022-02-25 02:45:11', 'nacos', '192.168.33.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 254, 'client.tm.commitRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:45:13', '2022-02-25 02:45:13', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 255, 'client.tm.rollbackRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:45:15', '2022-02-25 02:45:16', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 256, 'client.tm.defaultGlobalTransactionTimeout', 'SEATA_GROUP', '', '60000',
        '2b4226dd7ed6eb2d419b881f3ae9c97c', '2022-02-25 16:45:19', '2022-02-25 02:45:20', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 257, 'client.tm.degradeCheck', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:45:21', '2022-02-25 02:45:22', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 258, 'client.tm.degradeCheckAllowTimes', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2022-02-25 16:45:24', '2022-02-25 02:45:24', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 259, 'client.tm.degradeCheckPeriod', 'SEATA_GROUP', '', '2000', '08f90c1a417155361a5c4b8d297e0d78',
        '2022-02-25 16:45:27', '2022-02-25 02:45:27', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 260, 'client.tm.interceptorOrder', 'SEATA_GROUP', '', '-2147482648', 'f056d9efa5dae3872f9da035c83bcde8',
        '2022-02-25 16:45:30', '2022-02-25 02:45:30', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 261, 'client.undo.dataValidation', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:45:32', '2022-02-25 02:45:32', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 262, 'client.undo.logSerialization', 'SEATA_GROUP', '', 'jackson', 'b41779690b83f182acc67d6388c7bac9',
        '2022-02-25 16:45:35', '2022-02-25 02:45:35', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 263, 'client.undo.onlyCareUpdateColumns', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:45:38', '2022-02-25 02:45:38', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 264, 'server.undo.logSaveDays', 'SEATA_GROUP', '', '7', '8f14e45fceea167a5a36dedd4bea2543',
        '2022-02-25 16:45:40', '2022-02-25 02:45:40', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 265, 'server.undo.logDeletePeriod', 'SEATA_GROUP', '', '86400000', 'f4c122804fe9076cb2710f55c3c6e346',
        '2022-02-25 16:45:42', '2022-02-25 02:45:43', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 266, 'client.undo.logTable', 'SEATA_GROUP', '', 'undo_log', '2842d229c24afe9e61437135e8306614',
        '2022-02-25 16:45:45', '2022-02-25 02:45:45', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 267, 'client.undo.compress.enable', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:45:47', '2022-02-25 02:45:48', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 268, 'client.undo.compress.type', 'SEATA_GROUP', '', 'zip', 'adcdbd79a8d84175c229b192aadc02f2',
        '2022-02-25 16:45:50', '2022-02-25 02:45:50', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 269, 'client.undo.compress.threshold', 'SEATA_GROUP', '', '64k', 'bd44a6458bdbff0b5cac721ba361f035',
        '2022-02-25 16:45:52', '2022-02-25 02:45:53', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 270, 'tcc.fence.logTableName', 'SEATA_GROUP', '', 'tcc_fence_log', 'db229b665c7cfd5abc03971d4ed284c6',
        '2022-02-25 16:45:55', '2022-02-25 02:45:56', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 271, 'tcc.fence.cleanPeriod', 'SEATA_GROUP', '', '1h', '7c68645d71b803bf0ba2f22519f73e08',
        '2022-02-25 16:45:57', '2022-02-25 02:45:58', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 272, 'log.exceptionRate', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd',
        '2022-02-25 16:45:59', '2022-02-25 02:45:59', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 273, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2022-02-25 16:46:00',
        '2022-02-25 02:46:01', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 274, 'store.db.datasource', 'SEATA_GROUP', '', 'hikari', '80e0b2a2c1a1d6d47f9a9ff573c08c42',
        '2022-02-25 16:46:02', '2022-02-25 02:46:03', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 275, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e',
        '2022-02-25 16:46:04', '2022-02-25 02:46:04', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 276, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver',
        '33763409bb7f4838bde4fae9540433e4', '2022-02-25 16:46:08', '2022-02-25 02:46:08', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 277, 'store.db.url', 'SEATA_GROUP', '',
        'jdbc:mysql://127.0.0.1:$3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai',
        'fd620355df897cf0d610067705ac16ce', '2022-02-25 16:46:26', '2022-02-25 02:46:26', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 278, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2022-02-25 16:46:27',
        '2022-02-25 02:46:28', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 279, 'store.db.password', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845',
        '2022-02-25 16:46:29', '2022-02-25 02:46:29', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 280, 'store.db.minConn', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2022-02-25 16:46:30',
        '2022-02-25 02:46:31', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 281, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2022-02-25 16:46:32',
        '2022-02-25 02:46:32', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 282, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b',
        '2022-02-25 16:46:34', '2022-02-25 02:46:35', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 283, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c',
        '2022-02-25 16:46:37', '2022-02-25 02:46:38', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 284, 'store.db.distributedLockTable', 'SEATA_GROUP', '', 'distributed_lock',
        '26146b7a3a4907101617cb0f19bf613f', '2022-02-25 16:46:40', '2022-02-25 02:46:41', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 285, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd',
        '2022-02-25 16:46:42', '2022-02-25 02:46:43', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 286, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f',
        '2022-02-25 16:46:45', '2022-02-25 02:46:45', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 287, 'store.db.maxWait', 'SEATA_GROUP', '', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca',
        '2022-02-25 16:46:46', '2022-02-25 02:46:47', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 288, 'server.recovery.committingRetryPeriod', 'SEATA_GROUP', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2022-02-25 16:46:50', '2022-02-25 02:46:50', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 289, 'server.recovery.asynCommittingRetryPeriod', 'SEATA_GROUP', '', '1000',
        'a9b7ba70783b617e9998dc4dd82eb3c5', '2022-02-25 16:46:53', '2022-02-25 02:46:54', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 290, 'server.recovery.rollbackingRetryPeriod', 'SEATA_GROUP', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2022-02-25 16:46:57', '2022-02-25 02:46:57', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 291, 'server.recovery.timeoutRetryPeriod', 'SEATA_GROUP', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2022-02-25 16:47:00', '2022-02-25 02:47:00', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 292, 'server.maxCommitRetryTimeout', 'SEATA_GROUP', '', '-1', '6bb61e3b7bce0931da574d19d1d82c88',
        '2022-02-25 16:47:02', '2022-02-25 02:47:03', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 293, 'server.maxRollbackRetryTimeout', 'SEATA_GROUP', '', '-1', '6bb61e3b7bce0931da574d19d1d82c88',
        '2022-02-25 16:47:05', '2022-02-25 02:47:05', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 294, 'server.rollbackRetryTimeoutUnlockEnable', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:47:08', '2022-02-25 02:47:09', 'nacos', '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 295, 'server.distributedLockExpireTime', 'SEATA_GROUP', '', '10000', 'b7a782741f667201b54880c925faec4b',
        '2022-02-25 16:47:11', '2022-02-25 02:47:12', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 296, 'server.session.branchAsyncQueueSize', 'SEATA_GROUP', '', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca',
        '2022-02-25 16:47:14', '2022-02-25 02:47:15', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 297, 'server.session.enableBranchAsyncRemove', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:47:18', '2022-02-25 02:47:18', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 298, 'metrics.enabled', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:47:20', '2022-02-25 02:47:20', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 299, 'metrics.registryType', 'SEATA_GROUP', '', 'compact', '7cf74ca49c304df8150205fc915cd465',
        '2022-02-25 16:47:22', '2022-02-25 02:47:22', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 300, 'metrics.exporterList', 'SEATA_GROUP', '', 'prometheus', 'e4f00638b8a10e6994e67af2f832d51c',
        '2022-02-25 16:47:24', '2022-02-25 02:47:25', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 301, 'metrics.exporterPrometheusPort', 'SEATA_GROUP', '', '9898', '7b9dc501afe4ee11c56a4831e20cee71',
        '2022-02-25 16:47:27', '2022-02-25 02:47:28', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (224, 302, 'transport.type', 'SEATA_GROUP', '', 'TCP', 'b136ef5f6a01d816991fe3cf7a6ac763', '2022-02-25 16:49:27',
        '2022-02-25 02:49:27', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (225, 303, 'transport.server', 'SEATA_GROUP', '', 'NIO', 'b6d9dfc0fb54277321cebc0fff55df2f',
        '2022-02-25 16:49:27', '2022-02-25 02:49:27', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (226, 304, 'transport.heartbeat', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:49:27', '2022-02-25 02:49:27', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (227, 305, 'transport.enableTmClientBatchSendRequest', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:49:27', '2022-02-25 02:49:27', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (228, 306, 'transport.enableRmClientBatchSendRequest', 'SEATA_GROUP', '', 'true',
        'b326b5062b2f0e69046810717534cb09', '2022-02-25 16:49:27', '2022-02-25 02:49:27', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (229, 307, 'transport.enableTcServerBatchSendResponse', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:49:27', '2022-02-25 02:49:27', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (230, 308, 'transport.rpcRmRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:49:27', '2022-02-25 02:49:27', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (231, 309, 'transport.rpcTmRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:49:27', '2022-02-25 02:49:27', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (232, 310, 'transport.rpcTcRequestTimeout', 'SEATA_GROUP', '', '30000', '5ecc613150de01b7e6824594426f24f4',
        '2022-02-25 16:49:27', '2022-02-25 02:49:27', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (233, 311, 'transport.threadFactory.bossThreadPrefix', 'SEATA_GROUP', '', 'NettyBoss',
        '0f8db59a3b7f2823f38a70c308361836', '2022-02-25 16:49:27', '2022-02-25 02:49:27', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (234, 312, 'transport.threadFactory.workerThreadPrefix', 'SEATA_GROUP', '', 'NettyServerNIOWorker',
        'a78ec7ef5d1631754c4e72ae8a3e9205', '2022-02-25 16:49:32', '2022-02-25 02:49:32', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (235, 313, 'transport.threadFactory.serverExecutorThreadPrefix', 'SEATA_GROUP', '', 'NettyServerBizHandler',
        '11a36309f3d9df84fa8b59cf071fa2da', '2022-02-25 16:49:32', '2022-02-25 02:49:32', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (236, 314, 'transport.threadFactory.shareBossWorker', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:49:32', '2022-02-25 02:49:32', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (237, 315, 'transport.threadFactory.clientSelectorThreadPrefix', 'SEATA_GROUP', '', 'NettyClientSelector',
        'cd7ec5a06541e75f5a7913752322c3af', '2022-02-25 16:49:32', '2022-02-25 02:49:32', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (238, 316, 'transport.threadFactory.clientSelectorThreadSize', 'SEATA_GROUP', '', '1',
        'c4ca4238a0b923820dcc509a6f75849b', '2022-02-25 16:49:32', '2022-02-25 02:49:32', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (239, 317, 'transport.threadFactory.clientWorkerThreadPrefix', 'SEATA_GROUP', '', 'NettyClientWorkerThread',
        '61cf4e69a56354cf72f46dc86414a57e', '2022-02-25 16:49:32', '2022-02-25 02:49:32', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (240, 318, 'transport.threadFactory.bossThreadSize', 'SEATA_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b',
        '2022-02-25 16:49:32', '2022-02-25 02:49:32', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (241, 319, 'transport.threadFactory.workerThreadSize', 'SEATA_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 16:49:32', '2022-02-25 02:49:32', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (242, 320, 'transport.shutdown.wait', 'SEATA_GROUP', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3',
        '2022-02-25 16:49:32', '2022-02-25 02:49:32', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (243, 321, 'transport.serialization', 'SEATA_GROUP', '', 'seata', 'b943081c423b9a5416a706524ee05d40',
        '2022-02-25 16:49:32', '2022-02-25 02:49:32', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (244, 322, 'transport.compressor', 'SEATA_GROUP', '', 'none', '334c4a4c42fdb79d7ebc3e73b517e6f8',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (245, 323, 'service.vgroupMapping.default_tx_group', 'SEATA_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (246, 324, 'service.default.grouplist', 'SEATA_GROUP', '', '127.0.0.1:8091', 'c32ce0d3e264525dcdada751f98143a3',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (247, 325, 'service.enableDegrade', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (248, 326, 'service.disableGlobalTransaction', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (249, 327, 'client.rm.asyncCommitBufferLimit', 'SEATA_GROUP', '', '10000', 'b7a782741f667201b54880c925faec4b',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (250, 328, 'client.rm.lock.retryInterval', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (251, 329, 'client.rm.lock.retryTimes', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (252, 330, 'client.rm.lock.retryPolicyBranchRollbackOnConflict', 'SEATA_GROUP', '', 'true',
        'b326b5062b2f0e69046810717534cb09', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (253, 331, 'client.rm.reportRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (254, 332, 'client.rm.tableMetaCheckEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (255, 333, 'client.rm.tableMetaCheckerInterval', 'SEATA_GROUP', '', '60000', '2b4226dd7ed6eb2d419b881f3ae9c97c',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (256, 334, 'client.rm.sqlParserType', 'SEATA_GROUP', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (257, 335, 'client.rm.reportSuccessEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (258, 336, 'client.rm.sagaBranchRegisterEnable', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (259, 337, 'client.rm.sagaJsonParser', 'SEATA_GROUP', '', 'fastjson', 'd00d3dbc0834f08411c7b6c4c39e9f00',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (260, 338, 'client.rm.tccActionInterceptorOrder', 'SEATA_GROUP', '', '-2147482648',
        'f056d9efa5dae3872f9da035c83bcde8', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (262, 339, 'client.tm.commitRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (263, 340, 'client.tm.rollbackRetryCount', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (264, 341, 'client.tm.defaultGlobalTransactionTimeout', 'SEATA_GROUP', '', '60000',
        '2b4226dd7ed6eb2d419b881f3ae9c97c', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (265, 342, 'client.tm.degradeCheck', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (266, 343, 'client.tm.degradeCheckAllowTimes', 'SEATA_GROUP', '', '10', 'd3d9446802a44259755d38e6d163e820',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (267, 344, 'client.tm.degradeCheckPeriod', 'SEATA_GROUP', '', '2000', '08f90c1a417155361a5c4b8d297e0d78',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (268, 345, 'client.tm.interceptorOrder', 'SEATA_GROUP', '', '-2147482648', 'f056d9efa5dae3872f9da035c83bcde8',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (269, 346, 'client.undo.dataValidation', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (270, 347, 'client.undo.logSerialization', 'SEATA_GROUP', '', 'jackson', 'b41779690b83f182acc67d6388c7bac9',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (271, 348, 'client.undo.onlyCareUpdateColumns', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (272, 349, 'server.undo.logSaveDays', 'SEATA_GROUP', '', '7', '8f14e45fceea167a5a36dedd4bea2543',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (273, 350, 'server.undo.logDeletePeriod', 'SEATA_GROUP', '', '86400000', 'f4c122804fe9076cb2710f55c3c6e346',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (274, 351, 'client.undo.logTable', 'SEATA_GROUP', '', 'undo_log', '2842d229c24afe9e61437135e8306614',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (275, 352, 'client.undo.compress.enable', 'SEATA_GROUP', '', 'true', 'b326b5062b2f0e69046810717534cb09',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (276, 353, 'client.undo.compress.type', 'SEATA_GROUP', '', 'zip', 'adcdbd79a8d84175c229b192aadc02f2',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (277, 354, 'client.undo.compress.threshold', 'SEATA_GROUP', '', '64k', 'bd44a6458bdbff0b5cac721ba361f035',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (278, 355, 'tcc.fence.logTableName', 'SEATA_GROUP', '', 'tcc_fence_log', 'db229b665c7cfd5abc03971d4ed284c6',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (279, 356, 'tcc.fence.cleanPeriod', 'SEATA_GROUP', '', '1h', '7c68645d71b803bf0ba2f22519f73e08',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (280, 357, 'log.exceptionRate', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (281, 358, 'store.mode', 'SEATA_GROUP', '', 'db', 'd77d5e503ad1439f585ac494268b351b', '2022-02-25 16:49:42',
        '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (282, 359, 'store.db.datasource', 'SEATA_GROUP', '', 'hikari', '80e0b2a2c1a1d6d47f9a9ff573c08c42',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (283, 360, 'store.db.dbType', 'SEATA_GROUP', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (284, 361, 'store.db.driverClassName', 'SEATA_GROUP', '', 'com.mysql.cj.jdbc.Driver',
        '33763409bb7f4838bde4fae9540433e4', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (285, 362, 'store.db.url', 'SEATA_GROUP', '',
        'jdbc:mysql://127.0.0.1:$3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai',
        'fd620355df897cf0d610067705ac16ce', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (286, 363, 'store.db.user', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845', '2022-02-25 16:49:42',
        '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (287, 364, 'store.db.password', 'SEATA_GROUP', '', 'root', '63a9f0ea7bb98050796b649e85481845',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (288, 365, 'store.db.minConn', 'SEATA_GROUP', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2022-02-25 16:49:42',
        '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (289, 366, 'store.db.maxConn', 'SEATA_GROUP', '', '30', '34173cb38f07f89ddbebc2ac9128303f',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (290, 367, 'store.db.globalTable', 'SEATA_GROUP', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (291, 368, 'store.db.branchTable', 'SEATA_GROUP', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (292, 369, 'store.db.distributedLockTable', 'SEATA_GROUP', '', 'distributed_lock',
        '26146b7a3a4907101617cb0f19bf613f', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (293, 370, 'store.db.queryLimit', 'SEATA_GROUP', '', '100', 'f899139df5e1059396431415e770c6dd',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (294, 371, 'store.db.lockTable', 'SEATA_GROUP', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (295, 372, 'store.db.maxWait', 'SEATA_GROUP', '', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (296, 373, 'server.recovery.committingRetryPeriod', 'SEATA_GROUP', '', '1000',
        'a9b7ba70783b617e9998dc4dd82eb3c5', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (297, 374, 'server.recovery.asynCommittingRetryPeriod', 'SEATA_GROUP', '', '1000',
        'a9b7ba70783b617e9998dc4dd82eb3c5', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (298, 375, 'server.recovery.rollbackingRetryPeriod', 'SEATA_GROUP', '', '1000',
        'a9b7ba70783b617e9998dc4dd82eb3c5', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (299, 376, 'server.recovery.timeoutRetryPeriod', 'SEATA_GROUP', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (300, 377, 'server.maxCommitRetryTimeout', 'SEATA_GROUP', '', '-1', '6bb61e3b7bce0931da574d19d1d82c88',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (301, 378, 'server.maxRollbackRetryTimeout', 'SEATA_GROUP', '', '-1', '6bb61e3b7bce0931da574d19d1d82c88',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (302, 379, 'server.rollbackRetryTimeoutUnlockEnable', 'SEATA_GROUP', '', 'false',
        '68934a3e9455fa72420237eb05902327', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (303, 380, 'server.distributedLockExpireTime', 'SEATA_GROUP', '', '10000', 'b7a782741f667201b54880c925faec4b',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (304, 381, 'server.session.branchAsyncQueueSize', 'SEATA_GROUP', '', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (305, 382, 'server.session.enableBranchAsyncRemove', 'SEATA_GROUP', '', 'true',
        'b326b5062b2f0e69046810717534cb09', '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (306, 383, 'metrics.enabled', 'SEATA_GROUP', '', 'false', '68934a3e9455fa72420237eb05902327',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (307, 384, 'metrics.registryType', 'SEATA_GROUP', '', 'compact', '7cf74ca49c304df8150205fc915cd465',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (308, 385, 'metrics.exporterList', 'SEATA_GROUP', '', 'prometheus', 'e4f00638b8a10e6994e67af2f832d51c',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (309, 386, 'metrics.exporterPrometheusPort', 'SEATA_GROUP', '', '9898', '7b9dc501afe4ee11c56a4831e20cee71',
        '2022-02-25 16:49:42', '2022-02-25 02:49:43', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (148, 387, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}',
        'd947e71c9e9928a619ac81ea7ce1c6f0', '2022-02-25 16:59:21', '2022-02-25 02:59:22', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 388, 'transport.type', 'SEATA_GROUP', '', 'TCP', 'b136ef5f6a01d816991fe3cf7a6ac763', '2022-02-25 17:04:16',
        '2022-02-25 03:04:16', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 389, 'transport.server', 'SEATA_GROUP', '', 'NIO', 'b6d9dfc0fb54277321cebc0fff55df2f', '2022-02-25 17:04:17',
        '2022-02-25 03:04:18', 'nacos', '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (311, 390, 'transport.type', 'SEATA_GROUP', '', 'TCP', 'b136ef5f6a01d816991fe3cf7a6ac763', '2022-02-25 17:06:11',
        '2022-02-25 03:06:12', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (312, 391, 'transport.server', 'SEATA_GROUP', '', 'NIO', 'b6d9dfc0fb54277321cebc0fff55df2f',
        '2022-02-25 17:06:23', '2022-02-25 03:06:23', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 392, 'service.vgroupMapping.default_tx_group', 'DEFAULT_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 17:07:21', '2022-02-25 03:07:21', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 393, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      dataId: \"seata.properties\"\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}',
        '7dc7cff35fa596234058026bbe366776', '2022-02-25 17:07:35', '2022-02-25 03:07:35', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 394, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      dataId: \"seata.properties\"\n      group: DEFAULT_GROUP\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}',
        '93f23c789ad0e397384ab114076081e7', '2022-02-25 17:08:06', '2022-02-25 03:08:07', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 395, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      dataId: seata.properties\n      group: DEFAULT_GROUP\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}',
        'b34277e67fc6d5ae3789356bccd41dd2', '2022-02-25 17:12:26', '2022-02-25 03:12:27', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (313, 396, 'service.vgroupMapping.default_tx_group', 'DEFAULT_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 17:12:44', '2022-02-25 03:12:44', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 397, 'service.vgroupMapping.default_tx_group', 'DEFAULT_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-25 17:15:52', '2022-02-25 03:15:52', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 398, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      dataId: seata.properties\n      group: DEFAULT_GROUP\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        'ec2c88d2bb5a3ec65ba7ea9f6e9f0984', '2022-02-25 17:35:45', '2022-02-25 03:35:45', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 399, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        '78040518448e7c2df903677bf07b7ae5', '2022-02-25 17:41:23', '2022-02-25 03:41:23', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (145, 400, 'seata-server.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=druid\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:$3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=root\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '6b8f18fa5283c70842a9b7f4695f1fb5', '2022-02-25 18:45:02', '2022-02-25 04:45:02', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 401, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=druid\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '6a970560ce0d3840cbdded7e4f9e34ba', '2022-02-25 18:45:16', '2022-02-25 04:45:16', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (145, 402, 'seata-server.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=druid\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '6a970560ce0d3840cbdded7e4f9e34ba', '2022-02-25 18:45:20', '2022-02-25 04:45:21', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 403, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=druid\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '6a970560ce0d3840cbdded7e4f9e34ba', '2022-02-25 18:50:35', '2022-02-25 04:50:35', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 404, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        'fb1e9ac587892ba52a61e8c280dd6dc1', '2022-02-25 18:54:08', '2022-02-25 04:54:08', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 405, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=druid\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=druid\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '2a243e9138220a54809c29699ba25c56', '2022-02-25 19:35:26', '2022-02-25 05:35:26', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 406, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=druid\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '6a970560ce0d3840cbdded7e4f9e34ba', '2022-02-25 19:36:15', '2022-02-25 05:36:16', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 407, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=druid\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        'c02208584c096f3f811edc2487d7fe82', '2022-02-25 19:39:41', '2022-02-25 05:39:41', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (133, 408, 'flyway.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  flyway:\n    # 是否开启\n    enabled: true\n    # 版本表表名\n    table: ${spring.application.name}_flyway_history\n    # 迁移前校验 SQL 文件是否存在问题\n    validate-on-migrate: true\n    # 禁止清理数据库表 生产环境一定要启用\n    clean-disabled: true\n    # 文件编码\n    encoding: UTF-8\n    # 校验路径下是否存在 SQL 文件\n    check-location: false\n    # 最开始已经存在表结构，且不存在 flyway_schema_history 表时，需要设置为 true\n    baseline-on-migrate: true',
        '7e4ce9e20041e89fa5f6d8f04bf8a8e3', '2022-02-25 20:03:56', '2022-02-25 06:03:56', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (133, 409, 'flyway.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  flyway:\n    # 是否开启\n    enabled: true\n    # 迁移前校验 SQL 文件是否存在问题\n    validate-on-migrate: true\n    # 禁止清理数据库表 生产环境一定要启用\n    clean-disabled: true\n    # 文件编码\n    encoding: UTF-8\n    # 校验路径下是否存在 SQL 文件\n    check-location: false\n    # 最开始已经存在表结构，且不存在 flyway_schema_history 表时，需要设置为 true\n    baseline-on-migrate: true',
        '61e80c510ec79b9a32341aece6b7ed6b', '2022-02-25 20:05:31', '2022-02-25 06:05:32', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 410, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  client:\n    undo:\n      logTable: ${TEST_SEATA_LOGTABLE:system_undo_log}',
        '9e3c365038d9b48cbc0ad6f5064ee3b4', '2022-02-25 20:05:52', '2022-02-25 06:05:52', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (120, 411, 'server-generator.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_GENERATOR:cloud_generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  client:\n    undo:\n      logTable: ${TEST_SEATA_LOGTABLE:generator_undo_log}',
        'da6e7516d59e55930875565a3b691e1b', '2022-02-25 20:06:12', '2022-02-25 06:06:12', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (121, 412, 'server-test.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TEST:cloud_test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  client:\n    undo:\n      logTable: ${TEST_SEATA_LOGTABLE:test_undo_log}',
        'b7c8391cc17ee69670bde88019d425b6', '2022-02-25 20:06:41', '2022-02-25 06:06:42', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (125, 413, 'server-minio.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  client:\n    undo:\n      logTable: ${TEST_SEATA_LOGTABLE:minio_undo_log}',
        '4b5bc733d63aa3cec2856a8076bd7157', '2022-02-25 20:07:15', '2022-02-25 06:07:16', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 414, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  client:\n    undo:\n      logTable: ${TEST_SEATA_LOGTABLE:dict_undo_log}',
        '769db1e1eaaf47338cd25a28bdcfb1f6', '2022-02-25 20:07:35', '2022-02-25 06:07:36', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 415, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        'e2f3536cacf2826630441a0356692aa0', '2022-02-28 09:41:44', '2022-02-27 19:41:44', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 416, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      #group: DEFAULT_GROUP\n      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        '66486184cabfad57adebdef6d1831edf', '2022-02-28 09:50:16', '2022-02-27 19:50:16', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 417, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        'e2f3536cacf2826630441a0356692aa0', '2022-02-28 09:50:28', '2022-02-27 19:50:28', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 418, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=druid\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '873786afc31756beedf37e543c2de8ca', '2022-02-28 09:59:01', '2022-02-27 19:59:01', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 419, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n      #data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        '6bb25d844a8db6e173a96d5d32981427', '2022-02-28 10:35:12', '2022-02-27 20:35:12', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 420, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=hikari\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '9ee9bae2baf4249aa4946f73faa1676f', '2022-02-28 10:37:39', '2022-02-27 20:37:39', NULL, '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 421, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=druid\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        '873786afc31756beedf37e543c2de8ca', '2022-02-28 10:38:23', '2022-02-27 20:38:24', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 422, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=hikari\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.rm.sqlParserType=hikari\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        'a0f5038c8d74ceca999371c900715139', '2022-02-28 10:44:46', '2022-02-27 20:44:46', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 423, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        'e2f3536cacf2826630441a0356692aa0', '2022-02-28 10:49:43', '2022-02-27 20:49:43', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (317, 424, 'service.vgroupMapping.default_tx_group', 'DEFAULT_GROUP', '', 'default',
        'c21f969b5f03d33d43e04f8f136e7682', '2022-02-28 11:24:37', '2022-02-27 21:24:38', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 425, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n      #data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        '6bb25d844a8db6e173a96d5d32981427', '2022-02-28 11:33:22', '2022-02-27 21:33:23', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 426, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898',
        'dbf7319dc46f8a6572ca73cdf54f7a42', '2022-02-28 11:34:47', '2022-02-27 21:34:48', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 427, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '49622f48d877edc11d7103af2702e2b0', '2022-02-28 11:36:10', '2022-02-27 21:36:11', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 428, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        '\nseata:\n  enabled: true\n  client:\n    undo:\n      log-table: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        'e130684367ad24e6a1e293bb8cb485fb', '2022-02-28 15:15:54', '2022-02-28 01:15:54', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 429, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  #      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        '655fa35fc23254f15a7ad553f78813d1', '2022-03-01 09:02:12', '2022-02-28 19:02:13', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 430, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        '  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  #      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        'd44c9f0c99848af591cddd74ed1ce346', '2022-03-01 09:11:36', '2022-02-28 19:11:37', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 431, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'enabled: true\nclient:\n  undo:\n    log-table: ${spring.application.name}_undo_log\napplication-id: ${spring.application.name}\ntx-service-group: default_tx_group\n#一定要是false\nenable-auto-data-source-proxy: false\nservice:\n  vgroup-mapping:\n    #key与上面的tx-service-group的值对应\n    default_tx_group: default\nconfig:\n  type: nacos\n  nacos:\n    server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n    username: ${NACOS_USERNAME:nacos}\n    password: ${NACOS_PASSWORD:nacos}\n    namespace: ${NACOS_NAMESPACE:dev}\n    group: DEFAULT_GROUP\n  #      data-id: seata.properties\nregistry:\n  type: nacos\n  nacos:\n    application: ${SERVICE_NAME_SEATA:seata}\n    server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n    username: ${NACOS_USERNAME:nacos}\n    password: ${NACOS_PASSWORD:nacos}\n    namespace: ${NACOS_NAMESPACE:dev}\n    group: DEFAULT_GROUP',
        '3ab5e84e55683b4806f915abbf082719', '2022-03-01 09:22:38', '2022-02-28 19:22:39', NULL, '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 432, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        '  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  #      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        'd44c9f0c99848af591cddd74ed1ce346', '2022-03-01 09:26:29', '2022-02-28 19:26:30', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 433, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  #      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        '655fa35fc23254f15a7ad553f78813d1', '2022-03-01 09:33:56', '2022-02-28 19:33:56', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 434, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  #      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP',
        '655fa35fc23254f15a7ad553f78813d1', '2022-03-01 10:53:38', '2022-02-28 20:53:38', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 435, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  #      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n\nclient:\n  undo:\n    logTable: ${spring.application.name}_undo_log',
        'f913bdfedbc6547fee449e70d4039e99', '2022-03-01 11:04:28', '2022-02-28 21:04:28', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 436, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  #      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n\nclient.undo.logTable: ${spring.application.name}_undo_log',
        '58028144da16c1886845e833d48d77b6', '2022-03-01 11:28:42', '2022-02-28 21:28:42', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 437, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  #      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n\nseata.client.undo.logTable: ${spring.application.name}_undo_log',
        'f2f310a111d6d1780e6c93727cf5c589', '2022-03-01 15:02:31', '2022-03-01 01:02:31', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 438, 'client.undo.logTable', 'DEFAULT_GROUP', '', '111', '698d51a19d8a121ce581499d7b701668',
        '2022-03-01 17:04:59', '2022-03-01 03:04:59', NULL, '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (326, 439, 'client.undo.logTable', 'DEFAULT_GROUP', '', '111', '698d51a19d8a121ce581499d7b701668',
        '2022-03-01 17:05:35', '2022-03-01 03:05:36', 'nacos', '192.168.33.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (326, 440, 'client.undo.logTable', 'DEFAULT_GROUP', '', '${spring.application.name}_undo_log',
        'd82b7e95471d5bb53ecdb6c27307feb7', '2022-03-02 17:29:20', '2022-03-02 03:29:21', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 441, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n  #      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n',
        '4fe57a0d745618aaeb87739a7638d4f0', '2022-03-02 17:29:36', '2022-03-02 03:29:36', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 442, 'client.undo.logTable', 'SERVER_SYSTEM_GROUP', '', 'system_undo_log',
        '68ee15c9b9ccd196bda0ea7854914688', '2022-03-03 10:57:35', '2022-03-02 20:57:35', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 443, 'client.undo.logTable', 'SERVER_TEST_GROUP', '', 'system_undo_log', '68ee15c9b9ccd196bda0ea7854914688',
        '2022-03-03 11:15:17', '2022-03-02 21:15:18', NULL, '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (329, 444, 'client.undo.logTable', 'SERVER_TEST_GROUP', '', 'system_undo_log',
        '68ee15c9b9ccd196bda0ea7854914688', '2022-03-03 11:15:27', '2022-03-02 21:15:28', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 445, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: ${spring.application.name}_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n',
        'd250a49273f141279b1528616a152c4b', '2022-03-03 11:15:53', '2022-03-02 21:15:54', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (121, 446, 'server-test.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TEST:cloud_test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: ${spring.application.name}_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n',
        'ca042dcaefd87c8256e87b185353b813', '2022-03-03 11:16:10', '2022-03-02 21:16:10', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (125, 447, 'server-minio.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: ${spring.application.name}_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n',
        '065801c525d6f725d6fe363da12a99e0', '2022-03-03 11:16:36', '2022-03-02 21:16:37', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (140, 448, 'server.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      strict: true\n      seata: true    #开启seata代理，开启后默认每个数据源都代理，如果某个不需要代理可单独关闭\n      seata-mode: AT #支持XA及AT模式,默认AT\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmybatis-plus:\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\n#hystrix的超时时间\nhystrix:\n    command:\n        default:\n            execution:\n              timeout:\n                enabled: true\n              isolation:\n                    thread:\n                        timeoutInMilliseconds: 30000\n#ribbon的超时时间\nribbon:\n  ReadTimeout: 30000\n  ConnectTimeout: 30000\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        '0e279f6a336a06b38bd9b3eae6ea7763', '2022-03-03 11:18:15', '2022-03-02 21:18:15', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 449, 'client.undo.logTable', 'SERVER_MINIO_GROUP', '', 'test_undo_log', 'da6b4e4a1310bbb2d6005e6e9c8211a9',
        '2022-03-03 11:18:33', '2022-03-02 21:18:33', NULL, '192.168.33.1', 'I', 'dev');
INSERT INTO `his_config_info`
VALUES (335, 450, 'client.undo.logTable', 'SERVER_MINIO_GROUP', '', 'test_undo_log', 'da6b4e4a1310bbb2d6005e6e9c8211a9',
        '2022-03-03 11:18:48', '2022-03-02 21:18:48', 'nacos', '192.168.33.1', 'U', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 451, 'client.undo.logTable', 'SERVER_GENERATOR_GROUP', '', 'minio_undo_log',
        'e0e6aacc0642f7d51e8aa13ff9c139cd', '2022-03-03 11:19:09', '2022-03-02 21:19:10', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (337, 452, 'client.undo.logTable', 'SERVER_GENERATOR_GROUP', '', 'minio_undo_log',
        'e0e6aacc0642f7d51e8aa13ff9c139cd', '2022-03-03 11:19:50', '2022-03-02 21:19:50', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (120, 453, 'server-generator.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_GENERATOR:cloud_generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: ${spring.application.name}_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n',
        '6f37d4020c0920bbb1c51f30bd8019f6', '2022-03-03 11:20:24', '2022-03-02 21:20:24', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 454, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: ${spring.application.name}_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n',
        '0bbd5495b6d85e8113f844c4c22468ca', '2022-03-03 11:20:49', '2022-03-02 21:20:50', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 455, 'client.undo.logTable', 'SERVER_DICT_GROUP', '', 'generator_undo_log',
        '61e5b5340087a655f02a87f3493b28df', '2022-03-03 11:21:04', '2022-03-02 21:21:04', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (341, 456, 'client.undo.logTable', 'SERVER_DICT_GROUP', '', 'generator_undo_log',
        '61e5b5340087a655f02a87f3493b28df', '2022-03-03 11:21:21', '2022-03-02 21:21:21', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 457, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  client:\n    undo:\n      logTable: ${spring.application.name}_undo_log\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n      data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n',
        '0de707286e3b3322be368f2c174e9344', '2022-03-03 14:15:28', '2022-03-03 00:15:28', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 458, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: system_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      group: SERVER_SYSTEM_GROUP\n',
        '10c9265d048565b41dbd401ef992caaa', '2022-03-03 14:20:23', '2022-03-03 00:20:24', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 459, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: system_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      group: DEFAULT_GROUP\n',
        'bee9bfbc1dbc02a60d0cd7d39025e796', '2022-03-03 14:23:24', '2022-03-03 00:23:24', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 460, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: system_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      group: SERVER_SYSTEM_GROUP\n',
        '10c9265d048565b41dbd401ef992caaa', '2022-03-03 14:35:47', '2022-03-03 00:35:47', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (148, 461, 'seata-client.yaml', 'DEFAULT_GROUP', '',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      #group: DEFAULT_GROUP\n      #data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n',
        '99f54a015e789c45c79470e25ec389c0', '2022-03-03 14:35:58', '2022-03-03 00:35:58', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (328, 462, 'client.undo.logTable', 'SERVER_SYSTEM_GROUP', '', 'system_undo_log',
        '68ee15c9b9ccd196bda0ea7854914688', '2022-03-03 14:36:10', '2022-03-03 00:36:10', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (329, 463, 'client.undo.logTable', 'SERVER_TEST_GROUP', '', 'test_undo_log', 'da6b4e4a1310bbb2d6005e6e9c8211a9',
        '2022-03-03 14:36:10', '2022-03-03 00:36:10', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (335, 464, 'client.undo.logTable', 'SERVER_MINIO_GROUP', '', 'minio_undo_log',
        'e0e6aacc0642f7d51e8aa13ff9c139cd', '2022-03-03 14:36:10', '2022-03-03 00:36:10', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (337, 465, 'client.undo.logTable', 'SERVER_GENERATOR_GROUP', '', 'generator_undo_log',
        '61e5b5340087a655f02a87f3493b28df', '2022-03-03 14:36:10', '2022-03-03 00:36:10', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (341, 466, 'client.undo.logTable', 'SERVER_DICT_GROUP', '', 'dict_undo_log', '1b6e124501d3da96c48eac2d4b9db75b',
        '2022-03-03 14:36:16', '2022-03-03 00:36:16', NULL, '192.168.33.1', 'D', 'dev');
INSERT INTO `his_config_info`
VALUES (0, 467, 'server-system-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '49622f48d877edc11d7103af2702e2b0', '2022-03-03 14:36:45', '2022-03-03 00:36:45', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (348, 468, 'server-system-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '49622f48d877edc11d7103af2702e2b0', '2022-03-03 14:37:17', '2022-03-03 00:37:18', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (121, 469, 'server-test.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TEST:cloud_test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: test_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      group: SERVER_TEST_GROUP\n',
        '3da594d317ac29e003efe40d72a7f0d3', '2022-03-03 14:41:28', '2022-03-03 00:41:28', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 470, 'server-test-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '9d4b817c13707077f904b93a9251bde6', '2022-03-03 14:41:40', '2022-03-03 00:41:41', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (125, 471, 'server-minio.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: minio_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      group: SERVER_MINIO_GROUP',
        '302189186445fb258cd244c49b131eb8', '2022-03-03 14:43:32', '2022-03-03 00:43:33', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (120, 472, 'server-generator.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_GENERATOR:cloud_generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: generator_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      group: SERVER_GENERATOR_GROUP',
        '6823ca6ad13bfd5463048ad3007513e2', '2022-03-03 14:43:47', '2022-03-03 00:43:48', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 473, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: dict_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      group: SERVER_DICT_GROUP',
        '8f59dcd09b47716f0f1c73eb2130f554', '2022-03-03 14:44:00', '2022-03-03 00:44:01', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 474, 'server-minio-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '9d4b817c13707077f904b93a9251bde6', '2022-03-03 14:44:23', '2022-03-03 00:44:24', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 475, 'server-generator-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '9d4b817c13707077f904b93a9251bde6', '2022-03-03 14:44:50', '2022-03-03 00:44:51', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 476, 'server-dict-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '9d4b817c13707077f904b93a9251bde6', '2022-03-03 14:45:05', '2022-03-03 00:45:05', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (348, 477, 'server-system-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '9d4b817c13707077f904b93a9251bde6', '2022-03-03 14:56:11', '2022-03-03 00:56:12', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (348, 478, 'server-system-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '27f39f6e433c69d082229ccdc86b8323', '2022-03-03 14:57:52', '2022-03-03 00:57:53', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 479, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '49622f48d877edc11d7103af2702e2b0', '2022-03-03 14:58:12', '2022-03-03 00:58:12', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 480, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n',
        'c156812fa3281e8b4077108847dae707', '2022-03-03 15:00:27', '2022-03-03 01:00:28', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (351, 481, 'server-test-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '9d4b817c13707077f904b93a9251bde6', '2022-03-03 15:01:00', '2022-03-03 01:01:00', NULL, '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (355, 482, 'server-minio-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '9d4b817c13707077f904b93a9251bde6', '2022-03-03 15:01:13', '2022-03-03 01:01:13', NULL, '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (356, 483, 'server-generator-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '9d4b817c13707077f904b93a9251bde6', '2022-03-03 15:01:31', '2022-03-03 01:01:32', NULL, '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (357, 484, 'server-dict-seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n\ndruid.mysql.usePingMethod=false',
        '9d4b817c13707077f904b93a9251bde6', '2022-03-03 15:01:40', '2022-03-03 01:01:40', NULL, '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (351, 485, 'server-test-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'aa69e261541f413531b0fb39b7e9d899', '2022-03-03 15:01:55', '2022-03-03 01:01:56', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (355, 486, 'server-minio-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'aa69e261541f413531b0fb39b7e9d899', '2022-03-03 15:02:13', '2022-03-03 01:02:14', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (356, 487, 'server-generator-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'aa69e261541f413531b0fb39b7e9d899', '2022-03-03 15:02:32', '2022-03-03 01:02:33', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (356, 488, 'server-generator-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=generator_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        '69b1742bcb3e685769bc032238c8fc60', '2022-03-03 15:03:38', '2022-03-03 01:03:39', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (357, 489, 'server-dict-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'aa69e261541f413531b0fb39b7e9d899', '2022-03-03 15:03:55', '2022-03-03 01:03:56', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (348, 490, 'server-system-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'aa69e261541f413531b0fb39b7e9d899', '2022-03-03 15:07:03', '2022-03-03 01:07:03', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (351, 491, 'server-test-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=test_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        '2dac235aed8a63823dc304316ef1e81c', '2022-03-03 15:07:22', '2022-03-03 01:07:23', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (355, 492, 'server-minio-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=minio_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'fcfa0b06ac98811d6f25b4f39b33c109', '2022-03-03 15:07:40', '2022-03-03 01:07:41', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (356, 493, 'server-generator-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=generator_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        '69b1742bcb3e685769bc032238c8fc60', '2022-03-03 15:07:59', '2022-03-03 01:07:59', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (357, 494, 'server-dict-seata.properties', 'DEFAULT_GROUP', '',
        '#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=dict_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'bf2f9cc14965cabd5fdea1d01e040213', '2022-03-03 15:08:11', '2022-03-03 01:08:11', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (140, 495, 'server.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      strict: true\n      seata: true    #开启seata代理，开启后默认每个数据源都代理，如果某个不需要代理可单独关闭\n      seata-mode: AT #支持XA及AT模式,默认AT\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmybatis-plus:\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\n#hystrix的超时时间\nhystrix:\n    command:\n        default:\n            execution:\n              timeout:\n                enabled: true\n              isolation:\n                    thread:\n                        timeoutInMilliseconds: 30000\n#ribbon的超时时间\nribbon:\n  ReadTimeout: 30000\n  ConnectTimeout: 30000\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        'b751d579dd90ce99e6ed3b094df3f948', '2022-03-03 16:32:57', '2022-03-03 02:32:58', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 496, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4J_USERNAME:zclcs}\n      password: ${KNIFE4J_PASSWORD:123456}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: ${SERVICE_NAME_AUTH:auth}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n        swaggerVersion: 2.0',
        '7a8a3eab88a7406620fa27ae8e0b81db', '2022-03-04 11:10:02', '2022-03-03 21:10:03', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 497, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4J_USERNAME:zclcs}\n      password: ${KNIFE4J_PASSWORD:123456}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: ${SERVICE_NAME_AUTH:auth}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n\nsecurity:\n  enable: ${KNIFE4J_SECURITY_ENABLE:true}',
        '618fd91f0797a999ed3de703ce848689', '2022-03-04 14:17:03', '2022-03-04 00:17:04', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 498, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4J_USERNAME:zclcs}\n      password: ${KNIFE4J_PASSWORD:123456}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: ${SERVICE_NAME_AUTH:auth}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: /v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_AUTH:/auth}\n      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: /v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_SYSTEM:/system}\n      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: /v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_GENERATOR:/generator}\n      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: /v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_TEST:/test}\n      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: /v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_MINIO:/minio}\n      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: /v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_DICT:/dict}\n',
        'd34c2b21939eed52aae0098dfe4a9aab', '2022-03-04 14:28:15', '2022-03-04 00:28:15', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 499, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4J_USERNAME:zclcs}\n      password: ${KNIFE4J_PASSWORD:123456}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: ${SERVICE_NAME_AUTH:auth}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_AUTH:/auth}\n      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_SYSTEM:/system}\n      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_GENERATOR:/generator}\n      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_TEST:/test}\n      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_MINIO:/minio}\n      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_DICT:/dict}\n',
        'd632ae793df7551b3eecd3e588815f2f', '2022-03-04 14:29:02', '2022-03-04 00:29:02', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 500, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4J_USERNAME:zclcs}\n      password: ${KNIFE4J_PASSWORD:123456}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: ${SERVICE_NAME_AUTH:auth}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_AUTH:/auth}\n      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_SYSTEM:/system}\n      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_GENERATOR:/generator}\n      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_TEST:/test}\n      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_MINIO:/minio}\n      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: ${SERVICE_PATH_SERVER_DICT:/dict}\n',
        'd632ae793df7551b3eecd3e588815f2f', '2022-03-04 14:34:33', '2022-03-04 00:34:33', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 501, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4J_USERNAME:zclcs}\n      password: ${KNIFE4J_PASSWORD:123456}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: ${SERVICE_NAME_AUTH:auth}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n',
        '01ddac8455a549476d71f82c6eda1812', '2022-03-04 14:52:52', '2022-03-04 00:52:53', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 502, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4J_USERNAME:zclcs}\n      password: ${KNIFE4J_PASSWORD:123456}\n\n#knife4j:\n#  # 开启聚合组件\n#  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n#  cloud:\n#    enable: true\n#    routes:\n#      - name: ${SERVICE_NAME_AUTH:auth}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n#      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n#      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n#      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n#      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n#      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n\nknife4j:\n  nacos:\n    enable: true\n    serviceUrl: http://${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}/nacos/\n    routes:\n      - name: 系统服务\n        serviceName: server-system\n        location: /v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: /system',
        '381756e3231c589ad0052cded076c17e', '2022-03-04 14:58:24', '2022-03-04 00:58:25', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (128, 503, 'knife4j.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4J_USERNAME:zclcs}\n      password: ${KNIFE4J_PASSWORD:123456}\n\n#knife4j:\n#  # 开启聚合组件\n#  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n#  cloud:\n#    enable: true\n#    routes:\n#      - name: ${SERVICE_NAME_AUTH:auth}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n#      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n#      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n#      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n#      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n#      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n#        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n#        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n#        swaggerVersion: 2.0\n\nknife4j:\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  nacos:\n    enable: true\n    serviceUrl: http://${NACOS_HOST:127.0.0.1}:${NACOS_PORT:8848}/nacos/\n    routes:\n      - name: 系统服务\n        serviceName: server-system\n        location: /v2/api-docs?group=default\n        swaggerVersion: 2.0\n        servicePath: /system',
        'dfc32cca01cdbf3f3baadafcebe3d4da', '2022-03-04 15:18:10', '2022-03-04 01:18:11', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 504, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: dict_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-dict-seata.properties',
        'f9b0ccb61e83a1bb7a06cb85fe08bd09', '2022-03-07 10:59:50', '2022-03-06 20:59:51', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (131, 505, 'dict.yaml', 'DEFAULT_GROUP', '',
        'system:\n  dict:\n    mq-type: none\n    raw-value: true\n    text-value-default-null: false\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: false',
        '3782112068e128f6e5535bb4b32e8b49', '2022-03-07 11:01:36', '2022-03-06 21:01:36', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (132, 506, 'dict-redis.yaml', 'DEFAULT_GROUP', '',
        'spring:\r\n  redis:\r\n    database: ${REDIS_DICT_DATABASE:1}\r\n    host: ${REDIS_HOST:127.0.0.1}\r\n    port: ${REDIS_PORT:6379}\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000',
        '7d2edb1abbf480ce1ef354efa8270541', '2022-03-07 11:08:32', '2022-03-06 21:08:33', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (0, 507, 'redis.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  redis:\n    database: ${REDIS_DATABASE:0}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000',
        '115c8b7aa5e6740cd8b3e2e47606965d', '2022-03-07 11:08:46', '2022-03-06 21:08:47', NULL, '192.168.33.1', 'I',
        'dev');
INSERT INTO `his_config_info`
VALUES (132, 508, 'dict-redis.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  redis:\n    database: ${REDIS_DATABASE:0}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000',
        '115c8b7aa5e6740cd8b3e2e47606965d', '2022-03-07 11:08:50', '2022-03-06 21:08:51', NULL, '192.168.33.1', 'D',
        'dev');
INSERT INTO `his_config_info`
VALUES (388, 509, 'redis.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  redis:\n    database: ${REDIS_DATABASE:0}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000',
        '115c8b7aa5e6740cd8b3e2e47606965d', '2022-03-07 11:46:16', '2022-03-06 21:46:17', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (388, 510, 'redis.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  redis:\n    database: ${REDIS_DATABASE:0}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n  store-key:\n    # 缓存值的前缀\n    prefix: ${spring.cloud.nacos.config.namespace}',
        '6dbbf348fb44b99981858ac2ab2cc9dd', '2022-03-07 14:50:31', '2022-03-07 00:50:32', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (131, 511, 'dict.yaml', 'DEFAULT_GROUP', '',
        'system:\n  dict:\n    mq-type: none\n    raw-value: true\n    text-value-default-null: false\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: false\n    store-key:\n      # 树结构父级值的前缀\n      parent-prefix: ${spring.cloud.nacos.config.namespace}\n      # 数据字典类型对象前缀\n      type-prefix: ${spring.cloud.nacos.config.namespace}\n      # 数据字典值文本前缀\n      value-prefix: ${spring.cloud.nacos.config.namespace}',
        'ee4823dc723c5d410901cfda59090d57', '2022-03-07 14:51:07', '2022-03-07 00:51:07', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 512, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: dict_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n    store-key:\n      # 树结构父级值的前缀\n      parent-prefix: ${spring.cloud.nacos.config.namespace}\n      # 数据字典类型对象前缀\n      type-prefix: ${spring.cloud.nacos.config.namespace}\n      # 数据字典值文本前缀\n      value-prefix: ${spring.cloud.nacos.config.namespace}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-dict-seata.properties',
        'a32adce52deeab75cdc6bf4127efb9ab', '2022-03-07 14:51:28', '2022-03-07 00:51:28', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (119, 513, 'auth.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_AUTH:8101}\n\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  datasource:\n    dynamic:\n      p6spy: ${DATASOURCE_LOGGER_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: MyHikariCP\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  redis:\n    database: ${REDIS_AUTH_DATABASE:0}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/auth/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id:\n      client-secret:\n      redirect-uri:\n    gitee:\n      client-id:\n      client-secret:\n      redirect-uri:\n    tencent_cloud:\n      client-id:\n      client-secret:\n      redirect-uri:\n    dingtalk:\n      client-id:\n      client-secret:\n      redirect-uri:\n    qq:\n      client-id:\n      client-secret:\n      redirect-uri:\n    microsoft:\n      client-id:\n      client-secret:\n      redirect-uri:\n  cache:\n    type: redis\n    prefix: \'MY::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nmy:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        'ac4303744f96b61f961db1776bfbe6ef', '2022-03-07 15:02:35', '2022-03-07 01:02:35', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (119, 514, 'auth.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_AUTH:8101}\n\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/auth/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id:\n      client-secret:\n      redirect-uri:\n    gitee:\n      client-id:\n      client-secret:\n      redirect-uri:\n    tencent_cloud:\n      client-id:\n      client-secret:\n      redirect-uri:\n    dingtalk:\n      client-id:\n      client-secret:\n      redirect-uri:\n    qq:\n      client-id:\n      client-secret:\n      redirect-uri:\n    microsoft:\n      client-id:\n      client-secret:\n      redirect-uri:\n  cache:\n    type: redis\n    prefix: \'MY::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        'c856a3fb62e228c4e35b7adf3bef3998', '2022-03-07 15:28:15', '2022-03-07 01:28:15', 'nacos', '192.168.33.1', 'U',
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
