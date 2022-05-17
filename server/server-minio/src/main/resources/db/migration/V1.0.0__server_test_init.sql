/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : dev_minio

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 16/05/2022 18:11:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for minio_bucket
-- ----------------------------
CREATE TABLE `minio_bucket`
(
    `id`            bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '桶id',
    `bucket_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '桶名称',
    `bucket_policy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '桶权限',
    `version`       bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`     datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`     datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`     varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`     varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = 'minio桶'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of minio_bucket
-- ----------------------------

-- ----------------------------
-- Table structure for minio_file
-- ----------------------------
CREATE TABLE `minio_file`
(
    `id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NOT NULL COMMENT '文件id',
    `bucket_id`          bigint(20)                                                     NOT NULL COMMENT '桶id',
    `file_name`          varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '文件名称',
    `original_file_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '原文件名称',
    `file_path`          varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
    `version`            bigint(20)                                                     NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`          datetime                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`          datetime                                                       NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `ix_minio_file_bucket_id` (`bucket_id`) USING BTREE COMMENT '文件表桶id索引'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = 'minio文件'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of minio_file
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
