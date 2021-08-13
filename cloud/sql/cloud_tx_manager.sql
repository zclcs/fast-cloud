/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : cloud_tx_manager

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 13/08/2021 21:03:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_logger
-- ----------------------------
DROP TABLE IF EXISTS `t_logger`;
CREATE TABLE `t_logger`
(
    `id`          bigint(20)                                                     NOT NULL AUTO_INCREMENT,
    `group_id`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    `unit_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    `tag`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    `content`     varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `create_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL,
    `app_name`    varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_logger
-- ----------------------------

-- ----------------------------
-- Table structure for t_tx_exception
-- ----------------------------
DROP TABLE IF EXISTS `t_tx_exception`;
CREATE TABLE `t_tx_exception`
(
    `id`                bigint(20)                                                      NOT NULL AUTO_INCREMENT,
    `group_id`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    NULL DEFAULT NULL,
    `unit_id`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    NULL DEFAULT NULL,
    `mod_id`            varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL,
    `transaction_state` tinyint(4)                                                      NULL DEFAULT NULL,
    `registrar`         tinyint(4)                                                      NULL DEFAULT NULL,
    `ex_state`          tinyint(4)                                                      NULL DEFAULT NULL COMMENT '0 待处理 1已处理',
    `remark`            varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time`       datetime                                                        NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tx_exception
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
