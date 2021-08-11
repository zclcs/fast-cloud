/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 12/08/2021 00:22:09
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
  AUTO_INCREMENT = 96
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'config_info'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info`
VALUES (84, 'gateway.yaml', 'DEFAULT_GROUP',
        'server:\r\n  port: 8301\r\nspring:\r\n  cloud:\r\n    gateway:\r\n      globalcors:\r\n        corsConfigurations:\r\n          \'[/**]\':\r\n            allowedOrigins: \"*\"\r\n            allowedMethods: \"*\"\r\n            allowedHeaders: \"*\"\r\n            allowCredentials: true\r\n      routes:\r\n        - id: FEBS-Auth-Social\r\n          uri: lb://FEBS-Auth\r\n          predicates:\r\n            - Path=/auth/social/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: socialfallback\r\n                fallbackUri: forward:/fallback/FEBS-Auth\r\n        - id: FEBS-Auth\r\n          uri: lb://FEBS-Auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: authfallback\r\n                fallbackUri: forward:/fallback/FEBS-Auth            \r\n        - id: FEBS-Server-System\r\n          uri: lb://FEBS-Server-System\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: systemfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-System\r\n        - id: FEBS-Server-Generator\r\n          uri: lb://FEBS-Server-Generator\r\n          predicates:\r\n            - Path=/generator/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: generatorfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-Generator\r\n        - id: FEBS-Server-Job\r\n          uri: lb://FEBS-Server-Job\r\n          predicates:\r\n            - Path=/job/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: jobfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-Job\r\n        - id: FEBS-Server-test\r\n          uri: lb://FEBS-Server-Test\r\n          predicates:\r\n            - Path=/test/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: testfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-Test\r\n      loadbalancer:\r\n        use404: true\r\n      default-filters:\r\n        - StripPrefix=1\r\n        - FebsDocGatewayHeaderFilter\r\n  autoconfigure:\r\n    exclude: org.springframework.boot.autoconfigure.mongo.MongoReactiveAutoConfiguration,org.springframework.boot.autoconfigure.data.mongo.MongoReactiveRepositoriesAutoConfiguration,org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration\r\n    \r\n# 网关增强配置\r\n  # data:\r\n  #   mongodb:\r\n  #     host: ${mongo.url}\r\n  #     port: 27017\r\n  #     database: febs_cloud_route\r\n\r\n  redis:\r\n    database: 3\r\n    host: ${redis.url}\r\n    port: 6379\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\n\r\n# 网关增强配置\r\nfebs:\r\n  gateway:\r\n    enhance: false\r\n    jwt:\r\n      secret: 123456\r\n      expiration: 36000\r\n  doc:\r\n    gateway:\r\n      enable: true\r\n      resources: \"FEBS-Server-System,FEBS-Server-Test,FEBS-Auth,FEBS-Server-Generator,FEBS-Server-Job\"\r\n\r\nhystrix:\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 10000\r\n    socialfallback:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 60000    \r\n\r\nribbon:\r\n  eager-load:\r\n    enabled: true\r\n\r\nmanagement:\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: health,info,gateway\r\n\r\n',
        'b8834a3889e78dda34d04dddba0e4b58', '2021-08-11 06:54:11', '2021-08-11 06:54:11', NULL, '192.168.41.239', '',
        '', 'FEBS-Gateway微服务配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (85, 'server-test.yaml', 'DEFAULT_GROUP',
        'server:\r\n  port: 8202\r\nspring:\r\n  datasource:\r\n    dynamic:\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\nfeign:\r\n  hystrix:\r\n    enabled: true\r\n\r\nhystrix:\r\n  shareSecurityContext: true\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 3000\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ntx-lcn:\r\n  client:\r\n    manager-address: ${febs-tx-manager}:8888\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.test.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext',
        '26158ba68af9aef82405c90c3c2a17a7', '2021-08-11 06:54:11', '2021-08-11 06:54:11', NULL, '192.168.41.239', '',
        '', 'FEBS-Server-Test微服务配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (86, 'tx-manager.yaml', 'DEFAULT_GROUP',
        'server:\r\n  port: 8501\r\nspring:\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n    username: root\r\n    password: 123456\r\n  redis:\r\n    database: 0\r\n    host: ${redis.url}\r\n    port: 6379\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n\r\ntx-lcn:\r\n  manager:\r\n    host: 0.0.0.0\r\n    # TM监听Socket端口.\r\n    port: 8888\r\n    # TM控制台密码\r\n    admin-key: 123456\r\n  logger:\r\n    # 开启日志记录\r\n    enabled: true\r\n    driver-class-name: ${spring.datasource.driver-class-name}\r\n    jdbc-url: ${spring.datasource.url}\r\n    username: ${spring.datasource.username}\r\n    password: ${spring.datasource.password}',
        'd0650331753a7507ca99d431c3face17', '2021-08-11 06:54:11', '2021-08-11 06:54:11', NULL, '192.168.41.239', '',
        '', 'null', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (87, 'server-generator.yaml', 'DEFAULT_GROUP',
        'server:\r\n  port: 8203\r\nspring:\r\n  datasource:\r\n    dynamic:\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.generator.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext',
        '73b5c2714ea7c765ef04cb4eb23cdb97', '2021-08-11 06:54:11', '2021-08-11 06:54:11', NULL, '192.168.41.239', '',
        '', 'null', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (88, 'server-job.yaml', 'DEFAULT_GROUP',
        'server:\r\n  port: 8204\r\nspring:\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n  datasource:\r\n    dynamic:\r\n      # 是否开启 SQL日志输出，生产环境建议关闭，有性能损耗\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      # 配置默认数据源\r\n      primary: base\r\n      datasource:\r\n        # 数据源-1，名称为 base\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n        # 数据源-2，名称为 job\r\n        job:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_job?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.server.job.entity\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.job.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext',
        '899d2ad5984b3253197e9e155fa5e618', '2021-08-11 06:54:11', '2021-08-11 06:54:11', NULL, '192.168.41.239', '',
        '', 'null', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (89, 'admin.yaml', 'DEFAULT_GROUP',
        'server:\n  port: 8401\n\nspring:\n  security:\n    user:\n      name: febs\n      password: 123456\n  boot:\n    admin:\n      ui:\n        title: ${spring.application.name}',
        '31a6f472776c2d374593f0ded91004af', '2021-08-11 06:54:11', '2021-08-11 06:54:11', NULL, '192.168.41.239', '',
        '', NULL, NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (90, 'server-system.yaml', 'DEFAULT_GROUP',
        'server:\r\n  port: 8201\r\n    \r\nspring:\r\n  aop:\r\n    proxy-target-class: true\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n  freemarker:\r\n    check-template-location: false\r\n\r\n  datasource:\r\n    dynamic:\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.system.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext\r\ntx-lcn:\r\n  client:\r\n    manager-address: ${febs-tx-manager}:8888',
        'b9efabc3b13d7c55115321865a2f40d5', '2021-08-11 06:54:11', '2021-08-11 06:54:11', NULL, '192.168.41.239', '',
        '', 'FEBS-Server-System微服务配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info`
VALUES (91, 'auth.yaml', 'DEFAULT_GROUP',
        'server:\n  port: 8101\nspring:\n  datasource:\n    dynamic:\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: FebsHikariCP\n      primary: base\n      datasource:\n        base:\n          username: root\n          password: root\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          url: jdbc:mysql://${mysql.url}:3306/cloud_system?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n  boot:\n    admin:\n      client:\n        url: http://${admin}:8401\n        username: zclcs\n        password: 123456\n        instance:\n          prefer-ip: true\n\n  redis:\n    database: 0\n    host: ${redis.url}\n    port: 6379\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\ninfo:\n  app:\n    name: ${spring.application.name}\n    description: \"@project.description@\"\n    version: \"@project.version@\"\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id: \n      client-secret: \n      redirect-uri: \n    gitee:\n      client-id: \n      client-secret: \n      redirect-uri: \n    tencent_cloud:\n      client-id: \n      client-secret: \n      redirect-uri: \n    dingtalk:\n      client-id: \n      client-secret: \n      redirect-uri: \n    qq:\n      client-id: \n      client-secret: \n      redirect-uri: \n    microsoft:\n      client-id: \n      client-secret: \n      redirect-uri: \n  cache:\n    type: redis\n    prefix: \'FEBS::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nmy:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.auth.controller\n    description: ${my.doc.title}\n    name: MrBird\n    email: 852252810@qq.com\n    url: https://mrbird.cc\n    version: 2.2-RELEASE\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /actuator/**,/captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**',
        '09e439072c2f9b5081d2229f2f8fa070', '2021-08-11 06:54:11', '2021-08-11 16:06:58', 'nacos', '192.168.31.17', '',
        '', 'FEBS-Auth微服务配置', '', '', 'yaml', '');

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
  AUTO_INCREMENT = 21
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = '多租户改造'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info`
VALUES (0, 1, 'gateway.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8301\r\nspring:\r\n  cloud:\r\n    gateway:\r\n      globalcors:\r\n        corsConfigurations:\r\n          \'[/**]\':\r\n            allowedOrigins: \"*\"\r\n            allowedMethods: \"*\"\r\n            allowedHeaders: \"*\"\r\n            allowCredentials: true\r\n      routes:\r\n        - id: FEBS-Auth-Social\r\n          uri: lb://FEBS-Auth\r\n          predicates:\r\n            - Path=/auth/social/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: socialfallback\r\n                fallbackUri: forward:/fallback/FEBS-Auth\r\n        - id: FEBS-Auth\r\n          uri: lb://FEBS-Auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: authfallback\r\n                fallbackUri: forward:/fallback/FEBS-Auth            \r\n        - id: FEBS-Server-System\r\n          uri: lb://FEBS-Server-System\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: systemfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-System\r\n        - id: FEBS-Server-Generator\r\n          uri: lb://FEBS-Server-Generator\r\n          predicates:\r\n            - Path=/generator/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: generatorfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-Generator\r\n        - id: FEBS-Server-Job\r\n          uri: lb://FEBS-Server-Job\r\n          predicates:\r\n            - Path=/job/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: jobfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-Job\r\n        - id: FEBS-Server-test\r\n          uri: lb://FEBS-Server-Test\r\n          predicates:\r\n            - Path=/test/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: testfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-Test\r\n      loadbalancer:\r\n        use404: true\r\n      default-filters:\r\n        - StripPrefix=1\r\n        - FebsDocGatewayHeaderFilter\r\n  autoconfigure:\r\n    exclude: org.springframework.boot.autoconfigure.mongo.MongoReactiveAutoConfiguration,org.springframework.boot.autoconfigure.data.mongo.MongoReactiveRepositoriesAutoConfiguration,org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration\r\n    \r\n# 网关增强配置\r\n  # data:\r\n  #   mongodb:\r\n  #     host: ${mongo.url}\r\n  #     port: 27017\r\n  #     database: febs_cloud_route\r\n\r\n  redis:\r\n    database: 3\r\n    host: ${redis.url}\r\n    port: 6379\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\n\r\n# 网关增强配置\r\nfebs:\r\n  gateway:\r\n    enhance: false\r\n    jwt:\r\n      secret: 123456\r\n      expiration: 36000\r\n  doc:\r\n    gateway:\r\n      enable: true\r\n      resources: \"FEBS-Server-System,FEBS-Server-Test,FEBS-Auth,FEBS-Server-Generator,FEBS-Server-Job\"\r\n\r\nhystrix:\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 10000\r\n    socialfallback:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 60000    \r\n\r\nribbon:\r\n  eager-load:\r\n    enabled: true\r\n\r\nmanagement:\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: health,info,gateway\r\n\r\n',
        'b8834a3889e78dda34d04dddba0e4b58', '2021-08-11 14:54:10', '2021-08-11 06:54:11', NULL, '192.168.41.239', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (0, 2, 'server-test.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8202\r\nspring:\r\n  datasource:\r\n    dynamic:\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\nfeign:\r\n  hystrix:\r\n    enabled: true\r\n\r\nhystrix:\r\n  shareSecurityContext: true\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 3000\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ntx-lcn:\r\n  client:\r\n    manager-address: ${febs-tx-manager}:8888\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.test.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext',
        '26158ba68af9aef82405c90c3c2a17a7', '2021-08-11 14:54:10', '2021-08-11 06:54:11', NULL, '192.168.41.239', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (0, 3, 'tx-manager.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8501\r\nspring:\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n    username: root\r\n    password: 123456\r\n  redis:\r\n    database: 0\r\n    host: ${redis.url}\r\n    port: 6379\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n\r\ntx-lcn:\r\n  manager:\r\n    host: 0.0.0.0\r\n    # TM监听Socket端口.\r\n    port: 8888\r\n    # TM控制台密码\r\n    admin-key: 123456\r\n  logger:\r\n    # 开启日志记录\r\n    enabled: true\r\n    driver-class-name: ${spring.datasource.driver-class-name}\r\n    jdbc-url: ${spring.datasource.url}\r\n    username: ${spring.datasource.username}\r\n    password: ${spring.datasource.password}',
        'd0650331753a7507ca99d431c3face17', '2021-08-11 14:54:10', '2021-08-11 06:54:11', NULL, '192.168.41.239', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (0, 4, 'server-generator.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8203\r\nspring:\r\n  datasource:\r\n    dynamic:\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.generator.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext',
        '73b5c2714ea7c765ef04cb4eb23cdb97', '2021-08-11 14:54:10', '2021-08-11 06:54:11', NULL, '192.168.41.239', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (0, 5, 'server-job.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8204\r\nspring:\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n  datasource:\r\n    dynamic:\r\n      # 是否开启 SQL日志输出，生产环境建议关闭，有性能损耗\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      # 配置默认数据源\r\n      primary: base\r\n      datasource:\r\n        # 数据源-1，名称为 base\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n        # 数据源-2，名称为 job\r\n        job:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_job?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.server.job.entity\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.job.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext',
        '899d2ad5984b3253197e9e155fa5e618', '2021-08-11 14:54:10', '2021-08-11 06:54:11', NULL, '192.168.41.239', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (0, 6, 'admin.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: 8401\n\nspring:\n  security:\n    user:\n      name: febs\n      password: 123456\n  boot:\n    admin:\n      ui:\n        title: ${spring.application.name}',
        '31a6f472776c2d374593f0ded91004af', '2021-08-11 14:54:10', '2021-08-11 06:54:11', NULL, '192.168.41.239', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (0, 7, 'server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8201\r\n    \r\nspring:\r\n  aop:\r\n    proxy-target-class: true\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n  freemarker:\r\n    check-template-location: false\r\n\r\n  datasource:\r\n    dynamic:\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.system.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext\r\ntx-lcn:\r\n  client:\r\n    manager-address: ${febs-tx-manager}:8888',
        'b9efabc3b13d7c55115321865a2f40d5', '2021-08-11 14:54:10', '2021-08-11 06:54:11', NULL, '192.168.41.239', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (0, 8, 'auth.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8101\r\nspring:\r\n  datasource:\r\n    dynamic:\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\n  redis:\r\n    database: 0\r\n    host: ${redis.url}\r\n    port: 6379\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n\r\njustauth:\r\n  enabled: true\r\n  type:\r\n    github:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    gitee:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    tencent_cloud:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    dingtalk:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    qq:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    microsoft:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n  cache:\r\n    type: redis\r\n    prefix: \'FEBS::CLOUD::SOCIAL::STATE::\'\r\n    timeout: 1h\r\n\r\nfebs:\r\n  frontUrl: \'http://localhost:9527\'\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.auth.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      only-fetch-by-gateway: false\r\n      anon-uris: /actuator/**,/captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**',
        '236dec1e831502a3c7cbe35dc73d3a38', '2021-08-11 14:54:11', '2021-08-11 06:54:11', NULL, '192.168.41.239', 'I',
        '');
INSERT INTO `his_config_info`
VALUES (8, 9, 'febs-gateway.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8301\r\nspring:\r\n  cloud:\r\n    gateway:\r\n      globalcors:\r\n        corsConfigurations:\r\n          \'[/**]\':\r\n            allowedOrigins: \"*\"\r\n            allowedMethods: \"*\"\r\n            allowedHeaders: \"*\"\r\n            allowCredentials: true\r\n      routes:\r\n        - id: FEBS-Auth-Social\r\n          uri: lb://FEBS-Auth\r\n          predicates:\r\n            - Path=/auth/social/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: socialfallback\r\n                fallbackUri: forward:/fallback/FEBS-Auth\r\n        - id: FEBS-Auth\r\n          uri: lb://FEBS-Auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: authfallback\r\n                fallbackUri: forward:/fallback/FEBS-Auth            \r\n        - id: FEBS-Server-System\r\n          uri: lb://FEBS-Server-System\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: systemfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-System\r\n        - id: FEBS-Server-Generator\r\n          uri: lb://FEBS-Server-Generator\r\n          predicates:\r\n            - Path=/generator/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: generatorfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-Generator\r\n        - id: FEBS-Server-Job\r\n          uri: lb://FEBS-Server-Job\r\n          predicates:\r\n            - Path=/job/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: jobfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-Job\r\n        - id: FEBS-Server-test\r\n          uri: lb://FEBS-Server-Test\r\n          predicates:\r\n            - Path=/test/**\r\n          filters:\r\n            - name: Hystrix\r\n              args:\r\n                name: testfallback\r\n                fallbackUri: forward:/fallback/FEBS-Server-Test\r\n      loadbalancer:\r\n        use404: true\r\n      default-filters:\r\n        - StripPrefix=1\r\n        - FebsDocGatewayHeaderFilter\r\n  autoconfigure:\r\n    exclude: org.springframework.boot.autoconfigure.mongo.MongoReactiveAutoConfiguration,org.springframework.boot.autoconfigure.data.mongo.MongoReactiveRepositoriesAutoConfiguration,org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration\r\n    \r\n# 网关增强配置\r\n  # data:\r\n  #   mongodb:\r\n  #     host: ${mongo.url}\r\n  #     port: 27017\r\n  #     database: febs_cloud_route\r\n\r\n  redis:\r\n    database: 3\r\n    host: ${redis.url}\r\n    port: 6379\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\n\r\n# 网关增强配置\r\nfebs:\r\n  gateway:\r\n    enhance: false\r\n    jwt:\r\n      secret: 123456\r\n      expiration: 36000\r\n  doc:\r\n    gateway:\r\n      enable: true\r\n      resources: \"FEBS-Server-System,FEBS-Server-Test,FEBS-Auth,FEBS-Server-Generator,FEBS-Server-Job\"\r\n\r\nhystrix:\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 10000\r\n    socialfallback:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 60000    \r\n\r\nribbon:\r\n  eager-load:\r\n    enabled: true\r\n\r\nmanagement:\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: health,info,gateway\r\n\r\n',
        'b8834a3889e78dda34d04dddba0e4b58', '2021-08-11 14:54:15', '2021-08-11 06:54:15', NULL, '192.168.41.239', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (24, 10, 'febs-server-test.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8202\r\nspring:\r\n  datasource:\r\n    dynamic:\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\nfeign:\r\n  hystrix:\r\n    enabled: true\r\n\r\nhystrix:\r\n  shareSecurityContext: true\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 3000\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ntx-lcn:\r\n  client:\r\n    manager-address: ${febs-tx-manager}:8888\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.test.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext',
        '26158ba68af9aef82405c90c3c2a17a7', '2021-08-11 14:54:15', '2021-08-11 06:54:15', NULL, '192.168.41.239', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (29, 11, 'febs-tx-manager.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8501\r\nspring:\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n    username: root\r\n    password: 123456\r\n  redis:\r\n    database: 0\r\n    host: ${redis.url}\r\n    port: 6379\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n\r\ntx-lcn:\r\n  manager:\r\n    host: 0.0.0.0\r\n    # TM监听Socket端口.\r\n    port: 8888\r\n    # TM控制台密码\r\n    admin-key: 123456\r\n  logger:\r\n    # 开启日志记录\r\n    enabled: true\r\n    driver-class-name: ${spring.datasource.driver-class-name}\r\n    jdbc-url: ${spring.datasource.url}\r\n    username: ${spring.datasource.username}\r\n    password: ${spring.datasource.password}',
        'd0650331753a7507ca99d431c3face17', '2021-08-11 14:54:15', '2021-08-11 06:54:15', NULL, '192.168.41.239', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (33, 12, 'febs-server-generator.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8203\r\nspring:\r\n  datasource:\r\n    dynamic:\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.generator.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext',
        '73b5c2714ea7c765ef04cb4eb23cdb97', '2021-08-11 14:54:15', '2021-08-11 06:54:15', NULL, '192.168.41.239', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (35, 13, 'febs-server-job.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8204\r\nspring:\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n  datasource:\r\n    dynamic:\r\n      # 是否开启 SQL日志输出，生产环境建议关闭，有性能损耗\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      # 配置默认数据源\r\n      primary: base\r\n      datasource:\r\n        # 数据源-1，名称为 base\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n        # 数据源-2，名称为 job\r\n        job:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_job?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.server.job.entity\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\n\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.job.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext',
        '899d2ad5984b3253197e9e155fa5e618', '2021-08-11 14:54:15', '2021-08-11 06:54:15', NULL, '192.168.41.239', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (38, 14, 'febs-admin.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: 8401\n\nspring:\n  security:\n    user:\n      name: febs\n      password: 123456\n  boot:\n    admin:\n      ui:\n        title: ${spring.application.name}',
        '31a6f472776c2d374593f0ded91004af', '2021-08-11 14:54:15', '2021-08-11 06:54:15', NULL, '192.168.41.239', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (82, 15, 'febs-server-system.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8201\r\n    \r\nspring:\r\n  aop:\r\n    proxy-target-class: true\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n  freemarker:\r\n    check-template-location: false\r\n\r\n  datasource:\r\n    dynamic:\r\n      p6spy: true\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\nsecurity:\r\n  oauth2:\r\n    resource:\r\n      id: ${spring.application.name}\r\n      user-info-uri: http://${febs-gateway}:8301/auth/user\r\n\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\nfebs:\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.server.system.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      anon-uris: /actuator/**,/v2/api-docs,/v2/api-docs-ext\r\ntx-lcn:\r\n  client:\r\n    manager-address: ${febs-tx-manager}:8888',
        'b9efabc3b13d7c55115321865a2f40d5', '2021-08-11 14:54:15', '2021-08-11 06:54:15', NULL, '192.168.41.239', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (83, 16, 'febs-auth.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8101\r\nspring:\r\n  datasource:\r\n    dynamic:\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\n  redis:\r\n    database: 0\r\n    host: ${redis.url}\r\n    port: 6379\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n\r\njustauth:\r\n  enabled: true\r\n  type:\r\n    github:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    gitee:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    tencent_cloud:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    dingtalk:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    qq:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    microsoft:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n  cache:\r\n    type: redis\r\n    prefix: \'FEBS::CLOUD::SOCIAL::STATE::\'\r\n    timeout: 1h\r\n\r\nfebs:\r\n  frontUrl: \'http://localhost:9527\'\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.auth.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      only-fetch-by-gateway: false\r\n      anon-uris: /actuator/**,/captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**',
        '236dec1e831502a3c7cbe35dc73d3a38', '2021-08-11 14:54:15', '2021-08-11 06:54:15', NULL, '192.168.41.239', 'D',
        '');
INSERT INTO `his_config_info`
VALUES (91, 17, 'auth.yaml', 'DEFAULT_GROUP', '',
        'server:\r\n  port: 8101\r\nspring:\r\n  datasource:\r\n    dynamic:\r\n      hikari:\r\n        connection-timeout: 30000\r\n        max-lifetime: 1800000\r\n        max-pool-size: 15\r\n        min-idle: 5\r\n        connection-test-query: select 1\r\n        pool-name: FebsHikariCP\r\n      primary: base\r\n      datasource:\r\n        base:\r\n          username: root\r\n          password: 123456\r\n          driver-class-name: com.mysql.cj.jdbc.Driver\r\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\r\n\r\n  jackson:\r\n    date-format: yyyy-MM-dd HH:mm:ss\r\n    time-zone: GMT+8\r\n  boot:\r\n    admin:\r\n      client:\r\n        url: http://${febs-admin}:8401\r\n        username: febs\r\n        password: 123456\r\n        instance:\r\n          prefer-ip: true\r\n\r\n  redis:\r\n    database: 0\r\n    host: ${redis.url}\r\n    port: 6379\r\n    lettuce:\r\n      pool:\r\n        min-idle: 8\r\n        max-idle: 500\r\n        max-active: 2000\r\n        max-wait: 10000\r\n    timeout: 5000\r\nmybatis-plus:\r\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\r\n  mapper-locations: classpath:mapper/*.xml\r\n  configuration:\r\n    jdbc-type-for-null: null\r\n  global-config:\r\n    banner: false\r\ninfo:\r\n  app:\r\n    name: ${spring.application.name}\r\n    description: \"@project.description@\"\r\n    version: \"@project.version@\"\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS\r\n\r\njustauth:\r\n  enabled: true\r\n  type:\r\n    github:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    gitee:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    tencent_cloud:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    dingtalk:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    qq:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n    microsoft:\r\n      client-id: \r\n      client-secret: \r\n      redirect-uri: \r\n  cache:\r\n    type: redis\r\n    prefix: \'FEBS::CLOUD::SOCIAL::STATE::\'\r\n    timeout: 1h\r\n\r\nfebs:\r\n  frontUrl: \'http://localhost:9527\'\r\n  doc:\r\n    enable: true\r\n    title: ${spring.application.name}文档\r\n    base-package: cc.mrbird.febs.auth.controller\r\n    description: ${febs.doc.title}\r\n    name: MrBird\r\n    email: 852252810@qq.com\r\n    url: https://mrbird.cc\r\n    version: 2.2-RELEASE\r\n  cloud:\r\n    security:\r\n      enable: true\r\n      only-fetch-by-gateway: false\r\n      anon-uris: /actuator/**,/captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**',
        '236dec1e831502a3c7cbe35dc73d3a38', '2021-08-11 23:50:24', '2021-08-11 15:50:24', 'nacos', '192.168.31.17', 'U',
        '');
INSERT INTO `his_config_info`
VALUES (91, 18, 'auth.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: 8101\nspring:\n  datasource:\n    dynamic:\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: FebsHikariCP\n      primary: base\n      datasource:\n        base:\n          username: root\n          password: 123456\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          url: jdbc:mysql://${mysql.url}:3306/febs_cloud_base?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n  boot:\n    admin:\n      client:\n        url: http://${admin}:8401\n        username: febs\n        password: 123456\n        instance:\n          prefer-ip: true\n\n  redis:\n    database: 0\n    host: ${redis.url}\n    port: 6379\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\nmybatis-plus:\n  type-aliases-package: cc.mrbird.febs.common.core.entity.system\n  mapper-locations: classpath:mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\ninfo:\n  app:\n    name: ${spring.application.name}\n    description: \"@project.description@\"\n    version: \"@project.version@\"\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id: \n      client-secret: \n      redirect-uri: \n    gitee:\n      client-id: \n      client-secret: \n      redirect-uri: \n    tencent_cloud:\n      client-id: \n      client-secret: \n      redirect-uri: \n    dingtalk:\n      client-id: \n      client-secret: \n      redirect-uri: \n    qq:\n      client-id: \n      client-secret: \n      redirect-uri: \n    microsoft:\n      client-id: \n      client-secret: \n      redirect-uri: \n  cache:\n    type: redis\n    prefix: \'FEBS::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nfebs:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: cc.mrbird.febs.auth.controller\n    description: ${febs.doc.title}\n    name: MrBird\n    email: 852252810@qq.com\n    url: https://mrbird.cc\n    version: 2.2-RELEASE\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /actuator/**,/captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**',
        '2073693a4f734308a97bda1202923cc4', '2021-08-11 23:57:05', '2021-08-11 15:57:06', 'nacos', '192.168.31.17', 'U',
        '');
INSERT INTO `his_config_info`
VALUES (91, 19, 'auth.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: 8101\nspring:\n  datasource:\n    dynamic:\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: FebsHikariCP\n      primary: base\n      datasource:\n        base:\n          username: root\n          password: 123456\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          url: jdbc:mysql://${mysql.url}:3306/cloud_system?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n  boot:\n    admin:\n      client:\n        url: http://${admin}:8401\n        username: zclcs\n        password: 123456\n        instance:\n          prefer-ip: true\n\n  redis:\n    database: 0\n    host: ${redis.url}\n    port: 6379\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\ninfo:\n  app:\n    name: ${spring.application.name}\n    description: \"@project.description@\"\n    version: \"@project.version@\"\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id: \n      client-secret: \n      redirect-uri: \n    gitee:\n      client-id: \n      client-secret: \n      redirect-uri: \n    tencent_cloud:\n      client-id: \n      client-secret: \n      redirect-uri: \n    dingtalk:\n      client-id: \n      client-secret: \n      redirect-uri: \n    qq:\n      client-id: \n      client-secret: \n      redirect-uri: \n    microsoft:\n      client-id: \n      client-secret: \n      redirect-uri: \n  cache:\n    type: redis\n    prefix: \'FEBS::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nfebs:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.auth.controller\n    description: ${my.doc.title}\n    name: MrBird\n    email: 852252810@qq.com\n    url: https://mrbird.cc\n    version: 2.2-RELEASE\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /actuator/**,/captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**',
        '09cb24da5f809a5bf60ae3838b4baf5c', '2021-08-12 00:02:41', '2021-08-11 16:02:41', 'nacos', '192.168.31.17', 'U',
        '');
INSERT INTO `his_config_info`
VALUES (91, 20, 'auth.yaml', 'DEFAULT_GROUP', '',
        'server:\n  port: 8101\nspring:\n  datasource:\n    dynamic:\n      hikari:\n        connection-timeout: 30000\n        max-lifetime: 1800000\n        max-pool-size: 15\n        min-idle: 5\n        connection-test-query: select 1\n        pool-name: FebsHikariCP\n      primary: base\n      datasource:\n        base:\n          username: root\n          password: root\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          url: jdbc:mysql://${mysql.url}:3306/cloud_system?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%2b8\n\n  jackson:\n    date-format: yyyy-MM-dd HH:mm:ss\n    time-zone: GMT+8\n  boot:\n    admin:\n      client:\n        url: http://${admin}:8401\n        username: zclcs\n        password: 123456\n        instance:\n          prefer-ip: true\n\n  redis:\n    database: 0\n    host: ${redis.url}\n    port: 6379\n    lettuce:\n      pool:\n        min-idle: 8\n        max-idle: 500\n        max-active: 2000\n        max-wait: 10000\n    timeout: 5000\nmybatis-plus:\n  type-aliases-package: com.zclcs.common.core.entity.system\n  mapper-locations: classpath:mapper/*.xml\n  configuration:\n    jdbc-type-for-null: null\n  global-config:\n    banner: false\ninfo:\n  app:\n    name: ${spring.application.name}\n    description: \"@project.description@\"\n    version: \"@project.version@\"\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: ALWAYS\n\njustauth:\n  enabled: true\n  type:\n    github:\n      client-id: \n      client-secret: \n      redirect-uri: \n    gitee:\n      client-id: \n      client-secret: \n      redirect-uri: \n    tencent_cloud:\n      client-id: \n      client-secret: \n      redirect-uri: \n    dingtalk:\n      client-id: \n      client-secret: \n      redirect-uri: \n    qq:\n      client-id: \n      client-secret: \n      redirect-uri: \n    microsoft:\n      client-id: \n      client-secret: \n      redirect-uri: \n  cache:\n    type: redis\n    prefix: \'FEBS::CLOUD::SOCIAL::STATE::\'\n    timeout: 1h\n\nfebs:\n  frontUrl: \'http://localhost:9527\'\n  doc:\n    enable: true\n    title: ${spring.application.name}文档\n    base-package: com.zclcs.auth.controller\n    description: ${my.doc.title}\n    name: MrBird\n    email: 852252810@qq.com\n    url: https://mrbird.cc\n    version: 2.2-RELEASE\n  cloud:\n    security:\n      enable: true\n      only-fetch-by-gateway: false\n      anon-uris: /actuator/**,/captcha,/social/**,/v2/api-docs,/v2/api-docs-ext,/login,/resource/**',
        'eb96c24d73b5888639b362931b82732c', '2021-08-12 00:06:57', '2021-08-11 16:06:58', 'nacos', '192.168.31.17', 'U',
        '');

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
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_bin COMMENT = 'tenant_info'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

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
