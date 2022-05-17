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

 Date: 16/05/2022 18:16:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for system_block_log
-- ----------------------------
CREATE TABLE `system_block_log`
(
    `block_id`       bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '拦截日志id',
    `block_ip`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '拦截ip',
    `request_uri`    varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '被拦截请求URI',
    `request_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '被拦截请求方法',
    `location`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT 'IP对应地址',
    `version`        bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`      datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`      datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`block_id`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '黑名单拦截日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
CREATE TABLE `system_log`
(
    `id`        bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '日志id',
    `username`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '操作用户',
    `operation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         NULL COMMENT '操作内容',
    `time`      decimal(11, 0)                                                NULL     DEFAULT NULL COMMENT '耗时',
    `method`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         NULL COMMENT '操作方法',
    `params`    text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         NULL COMMENT '方法参数',
    `ip`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '操作者ip',
    `location`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '操作地点',
    `version`   bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at` datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `system_log_username` (`username`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户操作日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
CREATE TABLE `system_login_log`
(
    `id`         bigint(11)                                                    NOT NULL AUTO_INCREMENT COMMENT 'id',
    `username`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '用户名',
    `login_time` datetime                                                      NOT NULL COMMENT '登录时间',
    `location`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '登录地点',
    `ip`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT 'ip地址',
    `system`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '操作系统',
    `browser`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '浏览器',
    `version`    bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`  datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`  datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `system_login_log_login_time` (`login_time`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '登录日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_rate_limit_log
-- ----------------------------
CREATE TABLE `system_rate_limit_log`
(
    `rate_limit_log_id` bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '限流日志id',
    `rate_limit_log_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '被拦截请求IP',
    `request_uri`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '被拦截请求URI',
    `request_method`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '被拦截请求方法',
    `location`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT 'IP对应地址',
    `version`           bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`         datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`         datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`         varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`rate_limit_log_id`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '限流拦截日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for system_route_log
-- ----------------------------
CREATE TABLE `system_route_log`
(
    `route_id`       bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '网关转发日志id',
    `route_ip`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '请求ip',
    `request_uri`    varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '请求uri',
    `target_uri`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '目标uri',
    `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '请求方法',
    `target_server`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '目标服务',
    `location`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT 'ip对应地址',
    `version`        bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`      datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`      datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`route_id`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '网关转发日志表'
  ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
