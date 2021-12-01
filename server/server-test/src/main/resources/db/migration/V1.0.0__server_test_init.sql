/*
 Navicat Premium Data Transfer

 Source Server         : docker_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : cloud_test

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 10/11/2021 10:26:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for test_class
-- ----------------------------
DROP TABLE IF EXISTS `test_class`;
CREATE TABLE `test_class`
(
    `id`   bigint(20)                                                    NOT NULL COMMENT '主键',
    `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
    `type` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NULL DEFAULT NULL COMMENT '类型 @@class_type',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '班级表'
  ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;