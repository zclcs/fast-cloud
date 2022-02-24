/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : cloud_dict

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 13/01/2022 09:14:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dict_table
-- ----------------------------
CREATE TABLE `dict_table`
(
    `id`           bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '字典表名id',
    `dict_name_id` bigint(20)                                                    NOT NULL COMMENT '表名id',
    `code`         char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL COMMENT '字典code',
    `title`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典中文',
    `remark`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `ix_dict_table_table_name` (`dict_name_id`) USING BTREE COMMENT '字典表名索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '字典'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict_table
-- ----------------------------
INSERT INTO `dict_table`
VALUES (1, 1, '0', '锁定', NULL);
INSERT INTO `dict_table`
VALUES (2, 1, '1', '有效', NULL);
INSERT INTO `dict_table`
VALUES (3, 2, '0', '男', NULL);
INSERT INTO `dict_table`
VALUES (4, 2, '1', '女', NULL);
INSERT INTO `dict_table`
VALUES (5, 2, '2', '保密', NULL);
INSERT INTO `dict_table`
VALUES (8, 4, '0', '普通', NULL);
INSERT INTO `dict_table`
VALUES (9, 4, '1', '层级', NULL);
INSERT INTO `dict_table`
VALUES (15, 8, '0', '否', NULL);
INSERT INTO `dict_table`
VALUES (16, 8, '1', '是', NULL);
INSERT INTO `dict_table`
VALUES (17, 9, '0', '菜单', NULL);
INSERT INTO `dict_table`
VALUES (18, 9, '1', '按钮', NULL);
INSERT INTO `dict_table`
VALUES (19, 9, '2', '目录', NULL);
INSERT INTO `dict_table`
VALUES (20, 10, '0', '关闭', NULL);
INSERT INTO `dict_table`
VALUES (21, 10, '1', '开启', NULL);
INSERT INTO `dict_table`
VALUES (1311, 111, '1', '开启', NULL);
INSERT INTO `dict_table`
VALUES (1312, 111, '0', '关闭', NULL);

-- ----------------------------
-- Table structure for dict_table_level
-- ----------------------------
CREATE TABLE `dict_table_level`
(
    `id`           bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '字典表名id',
    `parent_id`    bigint(20)                                                    NOT NULL DEFAULT 0 COMMENT '父项id-默认为0',
    `parent_code`  char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL DEFAULT '0' COMMENT '父级code-默认为0',
    `dict_name_id` bigint(20)                                                    NOT NULL COMMENT '表名id',
    `level`        smallint(2)                                                   NOT NULL DEFAULT 1 COMMENT '层级',
    `code`         char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL COMMENT '字典code',
    `title`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典中文',
    `remark`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `ix_dict_table_level` (`dict_name_id`) USING BTREE COMMENT '层级字典表名索引',
    INDEX `ix_dict_table_parent_id` (`parent_id`) USING BTREE COMMENT '层级字典父项索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '层级字典'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict_table_level
-- ----------------------------

-- ----------------------------
-- Table structure for dict_table_name
-- ----------------------------
CREATE TABLE `dict_table_name`
(
    `id`         bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '字典名表主键',
    `dict_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典名',
    `dict_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典名中文',
    `sort`       smallint(4)                                                   NULL     DEFAULT NULL COMMENT '排序',
    `type`       char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL DEFAULT '0' COMMENT '字典类型 0 普通 1层级-默认为0',
    `remark`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '字典名表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict_table_name
-- ----------------------------
INSERT INTO `dict_table_name`
VALUES (1, 'user_status', '用户状态', NULL, '0', NULL);
INSERT INTO `dict_table_name`
VALUES (2, 'user_gender', '用户性别', NULL, '0', NULL);
INSERT INTO `dict_table_name`
VALUES (4, 'dict_type', '字典类型', NULL, '0', NULL);
INSERT INTO `dict_table_name`
VALUES (8, 'yes_no', '是否字典表', NULL, '0', NULL);
INSERT INTO `dict_table_name`
VALUES (9, 'menu_type', '菜单类型', NULL, '0', NULL);
INSERT INTO `dict_table_name`
VALUES (10, 'user_is_tab', '是否开启tab', NULL, '0', NULL);
INSERT INTO `dict_table_name`
VALUES (111, 'enable_disable', '开启或关闭', NULL, '0', NULL);

SET FOREIGN_KEY_CHECKS = 1;
