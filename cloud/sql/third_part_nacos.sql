/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : third_part_nacos

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 06/05/2022 09:34:54
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
  AUTO_INCREMENT = 390
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info`
VALUES (115, 'gateway.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_GATEWAY:8301}\n\nspring:\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${NACOS_NAMESPACE:dev}_${DB_NAME_SYSTEM:system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  cloud:\n    gateway:\n      globalcors:\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: \"*\"\n            allowedMethods: \"*\"\n            allowedHeaders: \"*\"\n            allowCredentials: true\n      routes:\n        - id: ${SERVICE_NAME_AUTH:auth}\n          uri: lb://${SERVICE_NAME_AUTH:auth}\n          predicates:\n            - Path=${SERVICE_PATH_AUTH:/auth}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: authfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_AUTH:auth}\n        - id: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          uri: lb://${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_SYSTEM:/system}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: systemfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        - id: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          uri: lb://${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_GENERATOR:/generator}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: generatorfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        - id: ${SERVICE_NAME_SERVER_TEST:server-test}\n          uri: lb://${SERVICE_NAME_SERVER_TEST:server-test}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_TEST:/test}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: testfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_TEST:server-test}\n        - id: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n          uri: lb://${SERVICE_NAME_SERVER_MINIO:server-minio}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_MINIO:/minio}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_MINIO:server-minio}\n        - id: ${SERVICE_NAME_SERVER_DICT:server-dict}\n          uri: lb://${SERVICE_NAME_SERVER_DICT:server-dict}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_DICT:/dict}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_DICT:server-dict}\n      loadbalancer:\n        use404: true\n      default-filters:\n        - StripPrefix=1\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/gateway/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nmy:\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS_GATEWAY:false}\n\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 10000\n\n    socialfallback:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nribbon:\n  eager-load:\n    enabled: true\n',
        '484e962fee68c4f595cc78acc9b9307a', '2021-09-18 02:54:58', '2022-04-28 22:16:19', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (118, 'server-system.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${NACOS_NAMESPACE:dev}_${DB_NAME_SYSTEM:_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: system_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      data-id: server-system-seata.properties\n',
        '457b71376c82cd53aa641c103d064cc1', '2021-09-18 02:54:58', '2022-04-28 22:15:14', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (119, 'auth.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_AUTH:8101}\n\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${NACOS_NAMESPACE:dev}_${DB_NAME_SYSTEM:system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/auth/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id:\n      client-secret:\n      redirect-uri:\n    gitee:\n      client-id:\n      client-secret:\n      redirect-uri:\n    tencent_cloud:\n      client-id:\n      client-secret:\n      redirect-uri:\n    dingtalk:\n      client-id:\n      client-secret:\n      redirect-uri:\n    qq:\n      client-id:\n      client-secret:\n      redirect-uri:\n    microsoft:\n      client-id:\n      client-secret:\n      redirect-uri:\n  cache:\n    type: redis\n    prefix: \'MY::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nmy:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        '478b92155fb6de3f7e31ae54d0308fc0', '2021-09-18 02:54:58', '2022-04-28 22:16:31', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (120, 'server-generator.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${NACOS_NAMESPACE:dev}_${DB_NAME_GENERATOR:generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: generator_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      data-id: server-generator-seata.properties',
        'b620e85807b7f53902971f35551eb69b', '2021-10-11 08:40:32', '2022-04-28 22:15:56', 'nacos', '192.168.33.1', '',
        'dev', 'null', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (121, 'server-test.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${NACOS_NAMESPACE:dev}_${DB_NAME_TEST:test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: test_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      data-id: server-test-seata.properties\n',
        '7ac6b786a53ecc7adcc836b350204bd0', '2021-10-15 01:32:43', '2022-04-28 22:15:28', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (125, 'server-minio.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${NACOS_NAMESPACE:dev}_${DB_NAME_MINIO:minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: minio_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-minio-seata.properties',
        '0fdad6184ee1fd11cf5ae95ff88adbd3', '2021-10-18 02:22:24', '2022-04-28 22:15:42', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (128, 'knife4j.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_KNIFE4J:8401}\n\nspring:\n  security:\n    user:\n      name: ${KNIFE4J_USERNAME:zclcs}\n      password: ${KNIFE4J_PASSWORD:123456}\n\nknife4j:\n  # 开启聚合组件\n  enableAggregation: ${DOC_ENABLE_AGGREGATION:true}\n  cloud:\n    enable: true\n    routes:\n      - name: ${SERVICE_NAME_AUTH:auth}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_AUTH:/auth}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_SYSTEM:/system}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_GENERATOR:/generator}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_TEST:server-test}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_TEST:/test}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_MINIO:/minio}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n      - name: ${SERVICE_NAME_SERVER_DICT:server-dict}\n        uri: ${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}\n        location: ${SERVICE_PATH_SERVER_DICT:/dict}/v2/api-docs?group=default\n        swaggerVersion: 2.0\n',
        '01ddac8455a549476d71f82c6eda1812', '2021-10-27 22:04:53', '2022-03-27 20:26:58', NULL, '192.168.33.1', '',
        'dev', '', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (130, 'server-dict.yaml', 'DEFAULT_GROUP',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${NACOS_NAMESPACE:dev}_${DB_NAME_DICT:dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: dict_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n    store-key:\n      # 树结构父级值的前缀\n      parent-prefix: \'${my.redis-cache-prefix}dict:p:\'\n      # 数据字典类型对象前缀\n      type-prefix: \'${my.redis-cache-prefix}dict:t:\'\n      # 数据字典值文本前缀\n      value-prefix: \'${my.redis-cache-prefix}dict:v:\'\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-dict-seata.properties',
        '29c154be47bc13e15c3178478c55594e', '2021-10-28 02:04:33', '2022-04-28 22:16:08', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (131, 'dict.yaml', 'DEFAULT_GROUP',
        'system:\n  dict:\n    mq-type: none\n    raw-value: true\n    text-value-default-null: false\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: false\n    store-key:\n      # 树结构父级值的前缀\n      parent-prefix: \'${my.redis-cache-prefix}dict:p:\'\n      # 数据字典类型对象前缀\n      type-prefix: \'${my.redis-cache-prefix}dict:t:\'\n      # 数据字典值文本前缀\n      value-prefix: \'${my.redis-cache-prefix}dict:v:\'',
        '24677bc0605b9d27690d654b7297953a', '2021-10-28 22:33:58', '2022-04-06 21:19:56', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (133, 'flyway.yaml', 'DEFAULT_GROUP',
        'spring:\n  flyway:\n    # 是否开启\n    enabled: true\n    # 迁移前校验 SQL 文件是否存在问题\n    validate-on-migrate: true\n    # 禁止清理数据库表 生产环境一定要启用\n    clean-disabled: true\n    # 文件编码\n    encoding: UTF-8\n    # 校验路径下是否存在 SQL 文件\n    check-location: false\n    # 最开始已经存在表结构，且不存在 flyway_schema_history 表时，需要设置为 true\n    baseline-on-migrate: true',
        '61e80c510ec79b9a32341aece6b7ed6b', '2021-11-10 18:54:07', '2022-03-27 20:26:58', NULL, '192.168.33.1', '',
        'dev', '数据库版本管理配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (134, 'logging.yaml', 'DEFAULT_GROUP',
        'logging:\n  level:\n    org:\n      springframework:\n        data:\n          convert:\n            CustomConversions: error\n    com:\n      zclcs: info\n      alibaba:\n        cloud:\n          nacos:\n            client:\n              NacosPropertySourceBuilder: error\n      codingapi: info',
        '891ca48626e6c0ca5412f22caa5d23b5', '2021-11-29 18:41:52', '2022-04-20 03:59:40', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (140, 'server.yaml', 'DEFAULT_GROUP',
        'spring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      strict: true\n      seata: true    #开启seata代理，开启后默认每个数据源都代理，如果某个不需要代理可单独关闭\n      seata-mode: AT #支持XA及AT模式,默认AT\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/oath2/info\n\nmybatis-plus:\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\n#hystrix的超时时间\nhystrix:\n    command:\n        default:\n            execution:\n              timeout:\n                enabled: true\n              isolation:\n                    thread:\n                        timeoutInMilliseconds: 30000\n#ribbon的超时时间\nribbon:\n  ReadTimeout: 30000\n  ConnectTimeout: 30000\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        'caba4d3936f2c6276cf8a68dac7caef5', '2022-01-09 21:26:46', '2022-04-20 02:15:37', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (141, 'rabbit-mq.yaml', 'DEFAULT_GROUP',
        'spring:\n  rabbitmq:\n    host: ${RABBIT_MQ_HOST:127.0.0.1}\n    port: ${RABBIT_MQ_PORT:5672}\n    username: ${RABBIT_MQ_USERNAME:root}\n    password: ${RABBIT_MQ_PASSWORD:123456}\n    virtual-host: /\n    # 手动提交消息\n    listener:\n      type: simple\n      simple:\n        #消息必须手动确认\n        acknowledge-mode: manual\n        #限制每次发送一条数据。\n        prefetch: 1\n        #重试策略相关配置\n        retry:\n          # 开启消费者(程序出现异常)重试机制，默认开启并一直重试\n          enabled: true\n          # 最大重试次数\n          max-attempts: 5\n          # 重试间隔时间(毫秒)\n          initial-interval: 30000\n      direct:\n        acknowledge-mode: manual',
        'dae582dedcc14adede9afe38538a4356', '2022-02-06 21:37:27', '2022-04-08 02:03:33', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'yaml', '');
INSERT INTO `config_info`
VALUES (148, 'seata-client.yaml', 'DEFAULT_GROUP',
        'seata:\n  enabled: true\n  application-id: ${spring.application.name}\n  tx-service-group: default_tx_group\n  #一定要是false\n  enable-auto-data-source-proxy: false\n  service:\n    vgroup-mapping:\n      #key与上面的tx-service-group的值对应\n      default_tx_group: default\n  config:\n    type: nacos\n    nacos:\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n      #data-id: seata.properties\n  registry:\n    type: nacos\n    nacos:\n      application: ${SERVICE_NAME_SEATA:seata}\n      server-addr: ${NACOS_DISCOVERY_IP:192.168.33.10}:${NACOS_PORT:8848}\n      username: ${NACOS_USERNAME:nacos}\n      password: ${NACOS_PASSWORD:nacos}\n      namespace: ${NACOS_NAMESPACE:dev}\n      group: DEFAULT_GROUP\n',
        '0de83e71798fce509306be201a3e47a0', '2022-02-24 21:23:01', '2022-03-27 20:26:58', NULL, '192.168.33.1', '',
        'dev', '', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (321, 'seata.properties', 'DEFAULT_GROUP',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/dev_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n',
        'bbfa4238afda35a02da8c5179c83091c', '2022-02-25 04:45:16', '2022-04-22 02:37:24', 'nacos', '192.168.33.1', '',
        'dev', '', '', '', 'properties', '');
INSERT INTO `config_info`
VALUES (348, 'server-system-seata.properties', 'DEFAULT_GROUP',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=system_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'b0401af7c6079b9403f72fd17759efa0', '2022-03-03 00:36:45', '2022-03-27 20:26:58', NULL, '192.168.33.1', '',
        'dev', '', NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (351, 'server-test-seata.properties', 'DEFAULT_GROUP',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=test_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        'b729c82009386377e85a5860e7218766', '2022-03-03 00:41:41', '2022-03-27 20:26:58', NULL, '192.168.33.1', '',
        'dev', '', NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (355, 'server-minio-seata.properties', 'DEFAULT_GROUP',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=minio_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        '8e1d58733bdbdb746254179c7a66ae04', '2022-03-03 00:44:24', '2022-03-27 20:26:58', NULL, '192.168.33.1', '',
        'dev', '', NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (356, 'server-generator-seata.properties', 'DEFAULT_GROUP',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=generator_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        '414d8b39887bfb04fbd5c9f7d238f081', '2022-03-03 00:44:51', '2022-03-27 20:26:58', NULL, '192.168.33.1', '',
        'dev', '', NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (357, 'server-dict-seata.properties', 'DEFAULT_GROUP',
        '#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=dict_undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n',
        '186f7f9355a8355d5ebc157bfcc7b756', '2022-03-03 00:45:05', '2022-03-27 20:26:58', NULL, '192.168.33.1', '',
        'dev', '', NULL, NULL, 'properties', NULL);
INSERT INTO `config_info`
VALUES (388, 'redis.yaml', 'DEFAULT_GROUP',
        'spring:\n  redis:\n    database: ${REDIS_DATABASE:0}\n    host: ${REDIS_HOST:127.0.0.1}\n    port: ${REDIS_PORT:6379}\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\n\nmy:\n  lettuce:\n    redis:\n      enable: true',
        'db84078effee6e2be0ba7b00ed4f6e5a', '2022-03-06 21:08:47', '2022-03-27 20:26:58', NULL, '192.168.33.1', '',
        'dev', '字典redis配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (389, 'global-configuration.yaml', 'DEFAULT_GROUP',
        'my:\n  server-name:\n    auth: ${SERVICE_NAME_AUTH:auth}\n    gateway: ${SERVICE_NAME_GATEWAY:gateway}\n    server-dict: ${SERVICE_NAME_SERVER_DICT:server-dict}\n    server-generator: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n    server-minio: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n    server-system: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n    server-test: ${SERVICE_NAME_SERVER_TEST:server-test}\n  redis-cache-prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:\'\n  database:\n    server-dict: ${DB_NAME_DICT:cloud_dict}\n    server-generator: ${DB_NAME_GENERATOR:cloud_generator}\n    server-minio: ${DB_NAME_MINIO:cloud_minio}\n    server-system: ${DB_NAME_SYSTEM:cloud_system}\n    server-test: ${DB_NAME_TEST:cloud_test}',
        '261fe562c5846881414532783228e58c', '2022-03-10 20:58:18', '2022-04-06 22:30:00', 'nacos', '192.168.33.1', '',
        'dev', '全局配置、全局系统配置等', '', '', 'yaml', '');

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
  AUTO_INCREMENT = 596
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '多租户改造'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info`
VALUES (321, 566, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/cloud_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n',
        'c156812fa3281e8b4077108847dae707', '2022-04-07 08:49:41', '2022-04-06 19:49:42', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (389, 567, 'global-configuration.yaml', 'DEFAULT_GROUP', '',
        'my:\n  server-name:\n    auth: ${SERVICE_NAME_AUTH:auth}\n    gateway: ${SERVICE_NAME_GATEWAY:gateway}\n    server-dict: ${SERVICE_NAME_SERVER_DICT:server-dict}\n    server-generator: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n    server-minio: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n    server-system: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n    server-test: ${SERVICE_NAME_SERVER_TEST:server-test}\n  redis-cache:\n    auth-prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:auth:\'\n    gateway-prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:gateway:\'\n    server-dict-prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:server-dict:\'\n    server-generator-prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:server-generator:\'\n    server-minio-prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:server-minio:\'\n    server-system-prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:server-system:\'\n    server-test-prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:server-test:\'',
        '48b3d98740393bd846ede7330796fae9', '2022-04-07 10:19:31', '2022-04-06 21:19:31', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (131, 568, 'dict.yaml', 'DEFAULT_GROUP', '',
        'system:\n  dict:\n    mq-type: none\n    raw-value: true\n    text-value-default-null: false\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: false\n    store-key:\n      # 树结构父级值的前缀\n      parent-prefix: \'${my.redis-cache.server-dict-prefix}dict:p:\'\n      # 数据字典类型对象前缀\n      type-prefix: \'${my.redis-cache.server-dict-prefix}dict:t:\'\n      # 数据字典值文本前缀\n      value-prefix: \'${my.redis-cache.server-dict-prefix}dict:v:\'',
        'e041b0ba329bcf9577a30afcc1ab4ca7', '2022-04-07 10:19:55', '2022-04-06 21:19:56', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (389, 569, 'global-configuration.yaml', 'DEFAULT_GROUP', '',
        'my:\n  server-name:\n    auth: ${SERVICE_NAME_AUTH:auth}\n    gateway: ${SERVICE_NAME_GATEWAY:gateway}\n    server-dict: ${SERVICE_NAME_SERVER_DICT:server-dict}\n    server-generator: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n    server-minio: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n    server-system: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n    server-test: ${SERVICE_NAME_SERVER_TEST:server-test}\n  redis-cache:\n    prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:\'',
        '4d0f8a15a6ef0d587cdca2bafa1a9230', '2022-04-07 10:20:18', '2022-04-06 21:20:19', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 570, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: dict_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n    store-key:\n      # 树结构父级值的前缀\n      parent-prefix: \'${my.redis-cache.server-dict-prefix}dict:p:\'\n      # 数据字典类型对象前缀\n      type-prefix: \'${my.redis-cache.server-dict-prefix}dict:t:\'\n      # 数据字典值文本前缀\n      value-prefix: \'${my.redis-cache.server-dict-prefix}dict:v:\'\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n  lettuce:\n    redis:\n      cache-prefix: ${my.redis-cache.server-dict-prefix}\n\nseata:\n  config:\n    nacos:\n      data-id: server-dict-seata.properties',
        'fd658a49b3910ccf6aeef2eeb62610cd', '2022-04-07 10:21:03', '2022-04-06 21:21:04', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (115, 571, 'gateway.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_GATEWAY:8301}\n\nspring:\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  cloud:\n    gateway:\n      globalcors:\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: \"*\"\n            allowedMethods: \"*\"\n            allowedHeaders: \"*\"\n            allowCredentials: true\n      routes:\n        - id: ${SERVICE_NAME_AUTH:auth}\n          uri: lb://${SERVICE_NAME_AUTH:auth}\n          predicates:\n            - Path=${SERVICE_PATH_AUTH:/auth}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: authfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_AUTH:auth}\n        - id: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          uri: lb://${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_SYSTEM:/system}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: systemfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        - id: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          uri: lb://${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_GENERATOR:/generator}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: generatorfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        - id: ${SERVICE_NAME_SERVER_TEST:server-test}\n          uri: lb://${SERVICE_NAME_SERVER_TEST:server-test}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_TEST:/test}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: testfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_TEST:server-test}\n        - id: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n          uri: lb://${SERVICE_NAME_SERVER_MINIO:server-minio}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_MINIO:/minio}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_MINIO:server-minio}\n        - id: ${SERVICE_NAME_SERVER_DICT:server-dict}\n          uri: lb://${SERVICE_NAME_SERVER_DICT:server-dict}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_DICT:/dict}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_DICT:server-dict}\n      loadbalancer:\n        use404: true\n      default-filters:\n        - StripPrefix=1\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/gateway/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nmy:\n  lettuce:\n    redis:\n      cache-prefix: ${my.redis-cache.gateway-prefix}\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS_GATEWAY:false}\n\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 10000\n\n    socialfallback:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nribbon:\n  eager-load:\n    enabled: true\n',
        '4a8f6c4c1b3062583a308cde74e6ad3a', '2022-04-07 10:21:27', '2022-04-06 21:21:28', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (125, 572, 'server-minio.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: minio_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n  lettuce:\n    redis:\n      cache-prefix: ${my.redis-cache.server-minio-prefix}\n\nseata:\n  config:\n    nacos:\n      data-id: server-minio-seata.properties',
        'c0eaacd6818c8d42497ea3447624f385', '2022-04-07 10:27:15', '2022-04-06 21:27:15', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (121, 573, 'server-test.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TEST:cloud_test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: test_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n  lettuce:\n    redis:\n      cache-prefix: ${my.redis-cache.server-test-prefix}\n\nseata:\n  config:\n    nacos:\n      data-id: server-test-seata.properties\n',
        '4df99998828c62f476b5e3d99e8e9f3e', '2022-04-07 10:27:27', '2022-04-06 21:27:28', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (120, 574, 'server-generator.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_GENERATOR:cloud_generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: generator_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n  lettuce:\n    redis:\n      cache-prefix: ${my.redis-cache.server-generator-prefix}\n\nseata:\n  config:\n    nacos:\n      data-id: server-generator-seata.properties',
        '49211b5e9809c1fd7a1b276acea4cf87', '2022-04-07 10:27:36', '2022-04-06 21:27:37', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (119, 575, 'auth.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_AUTH:8101}\n\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/auth/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id:\n      client-secret:\n      redirect-uri:\n    gitee:\n      client-id:\n      client-secret:\n      redirect-uri:\n    tencent_cloud:\n      client-id:\n      client-secret:\n      redirect-uri:\n    dingtalk:\n      client-id:\n      client-secret:\n      redirect-uri:\n    qq:\n      client-id:\n      client-secret:\n      redirect-uri:\n    microsoft:\n      client-id:\n      client-secret:\n      redirect-uri:\n  cache:\n    type: redis\n    prefix: \'MY::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nmy:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**\n\n  lettuce:\n    redis:\n      cache-prefix: ${my.redis-cache.auth-prefix}\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        '1997053953b5f60fee6309308d665b60', '2022-04-07 10:27:49', '2022-04-06 21:27:50', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 576, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: system_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n  lettuce:\n    redis:\n      cache-prefix: ${my.redis-cache.server-system-prefix}\n\nseata:\n  config:\n    nacos:\n      data-id: server-system-seata.properties\n',
        'd78669cc04d6089c46005273bc004c2d', '2022-04-07 10:27:58', '2022-04-06 21:27:59', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (389, 577, 'global-configuration.yaml', 'DEFAULT_GROUP', '',
        'my:\n  server-name:\n    auth: ${SERVICE_NAME_AUTH:auth}\n    gateway: ${SERVICE_NAME_GATEWAY:gateway}\n    server-dict: ${SERVICE_NAME_SERVER_DICT:server-dict}\n    server-generator: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n    server-minio: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n    server-system: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n    server-test: ${SERVICE_NAME_SERVER_TEST:server-test}\n  redis-cache-prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:\'',
        'a4fbf548ff8f6d717a42a0a73ee0ab05', '2022-04-07 11:25:22', '2022-04-06 22:25:22', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (389, 578, 'global-configuration.yaml', 'DEFAULT_GROUP', '',
        'my:\n  server-name:\n    auth: ${SERVICE_NAME_AUTH:auth}\n    gateway: ${SERVICE_NAME_GATEWAY:gateway}\n    server-dict: ${SERVICE_NAME_SERVER_DICT:server-dict}\n    server-generator: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n    server-minio: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n    server-system: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n    server-test: ${SERVICE_NAME_SERVER_TEST:server-test}\n  redis-cache-prefix: \'${spring.cloud.nacos.discovery.namespace:dev}:\'\n  database:\n    server-dict: ${DB_NAME_DICT:cloud_dict}\n    server-generator: ${DB_NAME_GENERATOR:cloud_generator}\n    server-minio: ${DB_NAME_MINIO:cloud_minio}\n    server-system: ${DB_NAME_SYSTEM:cloud_system}\n    server-test: ${DB_NAME_TEST:cloud_test}',
        '261fe562c5846881414532783228e58c', '2022-04-07 11:30:00', '2022-04-06 22:30:00', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (141, 579, 'rabbit-mq.yaml', 'DEFAULT_GROUP', '',
        'spring:\r\n  rabbitmq:\r\n    host: ${RABBIT_MQ_HOST:127.0.0.1}\r\n    port: ${RABBIT_MQ_PORT:5672}\r\n    username: ${RABBIT_MQ_USERNAME:root}\r\n    password: ${RABBIT_MQ_PASSWORD:123456}\r\n    virtual-host: /\r\n    # 手动提交消息\r\n    listener:\r\n      simple:\r\n        acknowledge-mode: manual\r\n      direct:\r\n        acknowledge-mode: manual',
        '22d79d245812abf7391b11a198e2d08a', '2022-04-08 15:03:33', '2022-04-08 02:03:33', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 580, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: dict_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n    store-key:\n      # 树结构父级值的前缀\n      parent-prefix: \'${my.redis-cache-prefix}dict:p:\'\n      # 数据字典类型对象前缀\n      type-prefix: \'${my.redis-cache-prefix}dict:t:\'\n      # 数据字典值文本前缀\n      value-prefix: \'${my.redis-cache-prefix}dict:v:\'\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-dict-seata.properties',
        'bf3d99d4ff314b7ade6b6efd5fda413d', '2022-04-11 14:24:46', '2022-04-11 01:24:46', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 581, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: server-dict\n      datasource:\n        server-dict:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n        server-system:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: dict_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n    store-key:\n      # 树结构父级值的前缀\n      parent-prefix: \'${my.redis-cache-prefix}dict:p:\'\n      # 数据字典类型对象前缀\n      type-prefix: \'${my.redis-cache-prefix}dict:t:\'\n      # 数据字典值文本前缀\n      value-prefix: \'${my.redis-cache-prefix}dict:v:\'\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-dict-seata.properties',
        'b817a20a8fdb6df9fd82135d8002b7fc', '2022-04-11 16:24:36', '2022-04-11 03:24:36', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 582, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: dict_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n    store-key:\n      # 树结构父级值的前缀\n      parent-prefix: \'${my.redis-cache-prefix}dict:p:\'\n      # 数据字典类型对象前缀\n      type-prefix: \'${my.redis-cache-prefix}dict:t:\'\n      # 数据字典值文本前缀\n      value-prefix: \'${my.redis-cache-prefix}dict:v:\'\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-dict-seata.properties',
        'bf3d99d4ff314b7ade6b6efd5fda413d', '2022-04-11 16:25:57', '2022-04-11 03:25:58', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 583, 'logging.yaml', 'DEFAULT_GROUP', '',
        'logging:\n  level:\n    org:\n      springframework:\n        data:\n          convert:\n            CustomConversions: error\n    com:\n      alibaba:\n        cloud:\n          nacos:\n            client:\n              NacosPropertySourceBuilder: error\n      codingapi: info',
        '4888be6105874d1ef4a2630eb6960dab', '2022-04-20 14:43:22', '2022-04-20 01:43:23', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (140, 584, 'server.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      strict: true\n      seata: true    #开启seata代理，开启后默认每个数据源都代理，如果某个不需要代理可单独关闭\n      seata-mode: AT #支持XA及AT模式,默认AT\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/user\n\nmybatis-plus:\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\n#hystrix的超时时间\nhystrix:\n    command:\n        default:\n            execution:\n              timeout:\n                enabled: true\n              isolation:\n                    thread:\n                        timeoutInMilliseconds: 30000\n#ribbon的超时时间\nribbon:\n  ReadTimeout: 30000\n  ConnectTimeout: 30000\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        '6baf07a46334682e201e5db44387e272', '2022-04-20 14:55:50', '2022-04-20 01:55:51', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (140, 585, 'server.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      strict: true\n      seata: true    #开启seata代理，开启后默认每个数据源都代理，如果某个不需要代理可单独关闭\n      seata-mode: AT #支持XA及AT模式,默认AT\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/oath2/user\n\nmybatis-plus:\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\n#hystrix的超时时间\nhystrix:\n    command:\n        default:\n            execution:\n              timeout:\n                enabled: true\n              isolation:\n                    thread:\n                        timeoutInMilliseconds: 30000\n#ribbon的超时时间\nribbon:\n  ReadTimeout: 30000\n  ConnectTimeout: 30000\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        '810d9ccb797f09de7a745a81463a099e', '2022-04-20 14:57:57', '2022-04-20 01:57:57', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (140, 586, 'server.yaml', 'DEFAULT_GROUP', '',
        'spring:\n  aop:\n    proxy-target-class: true\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  freemarker:\n    check-template-location: false\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      strict: true\n      seata: true    #开启seata代理，开启后默认每个数据源都代理，如果某个不需要代理可单独关闭\n      seata-mode: AT #支持XA及AT模式,默认AT\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n\nsecurity:\n  oauth2:\n    resource:\n      id: ${spring.application.name}\n      user-info-uri: http://${GATEWAY_HOST:127.0.0.1}:${PORT_GATEWAY:8301}/auth/oath2/user\n\nmybatis-plus:\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\n#hystrix的超时时间\nhystrix:\n    command:\n        default:\n            execution:\n              timeout:\n                enabled: true\n              isolation:\n                    thread:\n                        timeoutInMilliseconds: 30000\n#ribbon的超时时间\nribbon:\n  ReadTimeout: 30000\n  ConnectTimeout: 30000\n\nmy:\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        '810d9ccb797f09de7a745a81463a099e', '2022-04-20 15:15:36', '2022-04-20 02:15:37', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (134, 587, 'logging.yaml', 'DEFAULT_GROUP', '',
        'logging:\n  level:\n    org:\n      springframework:\n        data:\n          convert:\n            CustomConversions: error\n    com:\n      zclcs: debug\n      alibaba:\n        cloud:\n          nacos:\n            client:\n              NacosPropertySourceBuilder: error\n      codingapi: info',
        'a4f31574c8745e3a57bd203f966efea8', '2022-04-20 16:59:39', '2022-04-20 03:59:40', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (321, 588, 'seata.properties', 'DEFAULT_GROUP', '',
        '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n#If you use a registry, you can ignore it\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=jackson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\n#client.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.mode=db\nstore.db.datasource=hikari\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\n# 注意根据生产实际情况调整参数host和port\nstore.db.url=jdbc:mysql://127.0.0.1:3306/third_part_seata?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai\n# 数据库用户名\nstore.db.user=root\n# 用户名密码\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=true\n\n#Metrics configuration, only for the server\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898\n',
        'ecc8be657ee54bed3cedc0b785857a87', '2022-04-22 15:37:24', '2022-04-22 02:37:24', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (118, 589, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_SYSTEM:8201}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: system_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/server/system/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      data-id: server-system-seata.properties\n',
        'c8414a986d536524aa2e93e82f438778', '2022-04-29 11:15:14', '2022-04-28 22:15:14', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (121, 590, 'server-test.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_TEST:8203}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_TEST:cloud_test}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: test_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.test\n  mapper-locations: classpath:com/zclcs/server/test/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      data-id: server-test-seata.properties\n',
        '944cfa08402eab35802fcd7d4228f29d', '2022-04-29 11:15:28', '2022-04-28 22:15:28', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (125, 591, 'server-minio.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_MINIO:8204}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_MINIO:cloud_minio}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: minio_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.minio\n  mapper-locations: classpath:com/zclcs/server/minio/mapper/*.xml\n\nminio:\n  endpoint: ${ENDPOINT:http://192.168.33.10:9000}\n  root-user: ${ROOT_USER:minio}\n  root-password: ${ROOT_PASSWORD:minio123}\n  domain-name: ${DOMAIN_NAME:}\n  host: ${HOST:192.168.33.10}\n  port: ${PORT:9000}\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-minio-seata.properties',
        '7c7b7b4c43f41e8fba36991623ffe492', '2022-04-29 11:15:42', '2022-04-28 22:15:42', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (120, 592, 'server-generator.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_GENERATOR:8202}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_GENERATOR:cloud_generator}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: generator_flyway_history\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.generator\n  mapper-locations: classpath:com/zclcs/server/generator/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n\nseata:\n  config:\n    nacos:\n      data-id: server-generator-seata.properties',
        'c58979a075a56c6ef23eded4262e3b8d', '2022-04-29 11:15:55', '2022-04-28 22:15:56', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (130, 593, 'server-dict.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_SERVER_DICT:8205}\n\nspring:\n  datasource:\n    dynamic:\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_DICT:cloud_dict}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  flyway:\n    table: dict_flyway_history\n\nsystem:\n  dict:\n    mq-type: none\n    text-value-default-null: true\n    on-boot-refresh-dict: false\n    cache:\n      enabled: true\n      maximum-size: 500\n      initial-capacity: 50\n      duration: 30s\n      miss-num: 50\n    controller:\n      enabled: true\n      prefix: /cache\n    store-key:\n      # 树结构父级值的前缀\n      parent-prefix: \'${my.redis-cache-prefix}dict:p:\'\n      # 数据字典类型对象前缀\n      type-prefix: \'${my.redis-cache-prefix}dict:t:\'\n      # 数据字典值文本前缀\n      value-prefix: \'${my.redis-cache-prefix}dict:v:\'\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.dict\n  mapper-locations: classpath:com/zclcs/server/dict/mapper/*.xml\n\nmy:\n  cloud:\n    security:\n      enable: true\n      anon-uris: /v2/api-docs,/v2/api-docs-ext\n      only-fetch-by-gateway: false\n\nseata:\n  config:\n    nacos:\n      data-id: server-dict-seata.properties',
        'bf3d99d4ff314b7ade6b6efd5fda413d', '2022-04-29 11:16:07', '2022-04-28 22:16:08', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (115, 594, 'gateway.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_GATEWAY:8301}\n\nspring:\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\n  cloud:\n    gateway:\n      globalcors:\n        corsConfigurations:\n          \'[/**]\':\n            allowedOrigins: \"*\"\n            allowedMethods: \"*\"\n            allowedHeaders: \"*\"\n            allowCredentials: true\n      routes:\n        - id: ${SERVICE_NAME_AUTH:auth}\n          uri: lb://${SERVICE_NAME_AUTH:auth}\n          predicates:\n            - Path=${SERVICE_PATH_AUTH:/auth}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: authfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_AUTH:auth}\n        - id: ${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          uri: lb://${SERVICE_NAME_SERVER_SYSTEM:server-system}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_SYSTEM:/system}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: systemfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_SYSTEM:server-system}\n        - id: ${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          uri: lb://${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_GENERATOR:/generator}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: generatorfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_GENERATOR:server-generator}\n        - id: ${SERVICE_NAME_SERVER_TEST:server-test}\n          uri: lb://${SERVICE_NAME_SERVER_TEST:server-test}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_TEST:/test}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: testfallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_TEST:server-test}\n        - id: ${SERVICE_NAME_SERVER_MINIO:server-minio}\n          uri: lb://${SERVICE_NAME_SERVER_MINIO:server-minio}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_MINIO:/minio}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_MINIO:server-minio}\n        - id: ${SERVICE_NAME_SERVER_DICT:server-dict}\n          uri: lb://${SERVICE_NAME_SERVER_DICT:server-dict}\n          predicates:\n            - Path=${SERVICE_PATH_SERVER_DICT:/dict}/**\n          filters:\n            - name: Hystrix\n              args:\n                name: miniofallback\n                fallbackUri: forward:/fallback/${SERVICE_NAME_SERVER_DICT:server-dict}\n      loadbalancer:\n        use404: true\n      default-filters:\n        - StripPrefix=1\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/gateway/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\nmy:\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS_GATEWAY:false}\n\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 10000\n\n    socialfallback:\n      execution:\n        isolation:\n          thread:\n            timeoutInMilliseconds: 60000\n\nribbon:\n  eager-load:\n    enabled: true\n',
        '6605d4737c0c6b7224e88fa377769efe', '2022-04-29 11:16:19', '2022-04-28 22:16:19', 'nacos', '192.168.33.1', 'U',
        'dev');
INSERT INTO `his_config_info`
VALUES (119, 595, 'auth.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: ${PORT_AUTH:8101}\n\nspring:\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n\n  datasource:\n    dynamic:\n      p6spy: ${LOG_SQL_ENABLED:true}\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n      primary: primary\n      datasource:\n        primary:\n          driver-class-name: ${DATASOURCE_DRIVER:com.mysql.cj.jdbc.Driver}\n          url: jdbc:${DATASOURCE_DB_TYPE:mysql}://${DATASOURCE_HOST:127.0.0.1}:${DATASOURCE_PORT:3306}/${DB_NAME_SYSTEM:cloud_system}?${DATASOURCE_PARAM:useUnicode=true&characterEncoding=UTF-8&useSSL=false&zeroDateTimeBehavior=convertToNull&serverTimezone=Asia/Shanghai}\n          username: ${DATASOURCE_USERNAME:root}\n          password: ${DATASOURCE_PASSWORD:root}\n\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:com/zclcs/auth/mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id:\n      client-secret:\n      redirect-uri:\n    gitee:\n      client-id:\n      client-secret:\n      redirect-uri:\n    tencent_cloud:\n      client-id:\n      client-secret:\n      redirect-uri:\n    dingtalk:\n      client-id:\n      client-secret:\n      redirect-uri:\n    qq:\n      client-id:\n      client-secret:\n      redirect-uri:\n    microsoft:\n      client-id:\n      client-secret:\n      redirect-uri:\n  cache:\n    type: redis\n    prefix: \'MY::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nmy:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    description: ${my.doc.title}\n    name: zclcs\n    email: 2371219112@qq.com\n    url: https://github.com/zclcs\n    version: 2.2-RELEASE\n\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**\n\n  log:\n    enable-log-for-controller: ${LOG_CONTROLLER_PARAMS:false}',
        'b1065a4934ff03945b6af0ec353d27af', '2022-04-29 11:16:31', '2022-04-28 22:16:31', 'nacos', '192.168.33.1', 'U',
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
