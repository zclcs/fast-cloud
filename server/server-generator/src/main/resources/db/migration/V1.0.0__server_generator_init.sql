/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : dev_generator

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 05/05/2022 10:43:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for generator_config
-- ----------------------------
DROP TABLE IF EXISTS `generator_config`;
CREATE TABLE `generator_config`
(
    `id`                   bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '主键',
    `author`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '作者',
    `base_package`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '基础包名',
    `entity_package`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT 'entity文件存放路径',
    `ao_package`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '入参',
    `vo_package`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '出参',
    `mapper_package`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT 'mapper文件存放路径',
    `mapper_xml_package`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT 'mapper xml文件存放路径',
    `service_package`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT 'servcie文件存放路径',
    `service_impl_package` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT 'serviceImpl文件存放路径',
    `controller_package`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT 'controller文件存放路径',
    `is_trim`              char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NOT NULL COMMENT '是否去除前缀 1是 0否',
    `trim_value`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '前缀内容',
    `exclude_columns`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '需要排除的字段',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of generator_config
-- ----------------------------
INSERT INTO `generator_config`
VALUES (1, 'zclcs', 'com.zclcs', 'common.core.entity.test', 'common.core.entity.test.ao', 'common.core.entity.test.vo',
        'server.test.mapper', 'server.test.mapper', 'server.test.service', 'server.test.service.impl',
        'server.test.controller', '1', 'test_', 'version,tenant_id,create_at,update_at,create_by,update_by');

SET FOREIGN_KEY_CHECKS = 1;
