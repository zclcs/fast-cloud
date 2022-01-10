/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : cloud_system

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 10/01/2022 15:30:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for system_black_list
-- ----------------------------
DROP TABLE IF EXISTS `system_black_list`;
CREATE TABLE `system_black_list`
(
    `black_id`       bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '黑名单id',
    `black_ip`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '黑名单ip',
    `request_uri`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '请求uri（支持通配符）',
    `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '请求方法，如果为ALL则表示对所有方法生效',
    `limit_from`     varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '限制时间起',
    `limit_to`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '限制时间止',
    `location`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip对应地址',
    `black_status`   varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT '1' COMMENT '黑名单状态 默认 1 @@enable_disable',
    `create_time`    datetime                                                      NOT NULL COMMENT '创建时间',
    `modify_time`    datetime                                                      NULL DEFAULT NULL COMMENT '修改时间',
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
VALUES (7, NULL, '/actuator/**', 'ALL', '00:00:00', '23:59:59', NULL, '1', '2022-01-05 10:23:50',
        '2022-01-05 10:23:50');

-- ----------------------------
-- Table structure for system_rate_limit_log
-- ----------------------------
DROP TABLE IF EXISTS `system_rate_limit_log`;
CREATE TABLE `system_rate_limit_log`
(
    `rate_limit_log_id` bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '限流日志id',
    `rate_limit_log_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '被拦截请求IP',
    `request_uri`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '被拦截请求URI',
    `request_method`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '被拦截请求方法',
    `location`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP对应地址',
    `create_time`       datetime                                                      NOT NULL COMMENT '创建时间',
    `modify_time`       datetime                                                      NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`rate_limit_log_id`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 18
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '限流拦截日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_rate_limit_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;