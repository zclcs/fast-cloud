/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : dev_system

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 16/05/2022 18:15:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for system_black_list
-- ----------------------------
CREATE TABLE `system_black_list`
(
    `black_id`       bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '黑名单id',
    `black_ip`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '黑名单ip',
    `request_uri`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求uri（支持通配符）',
    `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '请求方法，如果为ALL则表示对所有方法生效',
    `limit_from`     varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '限制时间起',
    `limit_to`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '限制时间止',
    `location`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT 'ip对应地址',
    `black_status`   varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT '1' COMMENT '黑名单状态 默认 1 @@enable_disable',
    `version`        bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`      datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`      datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`black_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '黑名单表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_black_list
-- ----------------------------
INSERT INTO `system_black_list`
VALUES (7, NULL, '/actuator/**', 'ALL', '00:00:00', '23:59:59', NULL, '1', 1, NULL, '2022-05-16 11:46:31', NULL, NULL,
        NULL);

-- ----------------------------
-- Table structure for system_rate_limit_rule
-- ----------------------------
CREATE TABLE `system_rate_limit_rule`
(
    `rate_limit_rule_id` bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '限流规则id',
    `request_uri`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求uri（不支持通配符）',
    `request_method`     varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '请求方法，如果为ALL则表示对所有方法生效',
    `limit_from`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '限制时间起',
    `limit_to`           varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '限制时间止',
    `rate_limit_count`   smallint(4)                                                   NOT NULL COMMENT '限制次数',
    `interval_sec`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '时间周期（单位秒）',
    `rule_status`        varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT '1' COMMENT '规则状态 默认 1 @@enable_disable',
    `version`            bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`          datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`          datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`rate_limit_rule_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '限流规则表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_rate_limit_rule
-- ----------------------------
INSERT INTO `system_rate_limit_rule`
VALUES (5, '/auth/captcha', 'GET', '00:00:00', '23:59:59', 5, '60', '1', 1, NULL, '2022-05-16 11:48:16', NULL, NULL,
        NULL);

SET FOREIGN_KEY_CHECKS = 1;
