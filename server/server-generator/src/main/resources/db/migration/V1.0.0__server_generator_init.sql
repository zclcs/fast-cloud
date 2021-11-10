/*
 Navicat Premium Data Transfer

 Source Server         : docker_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : cloud_generator

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 08/11/2021 10:39:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for generator_config
-- ----------------------------
DROP TABLE IF EXISTS `generator_config`;
CREATE TABLE `generator_config`
(
    `id`                   bigint(20)                                             NOT NULL AUTO_INCREMENT COMMENT '主键',
    `author`               varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
    `base_package`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '基础包名',
    `entity_package`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'entity文件存放路径',
    `ao_package`           varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入参',
    `vo_package`           varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出参',
    `mapper_package`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mapper文件存放路径',
    `mapper_xml_package`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mapper xml文件存放路径',
    `service_package`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'servcie文件存放路径',
    `service_impl_package` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'serviceImpl文件存放路径',
    `controller_package`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'controller文件存放路径',
    `is_trim`              char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL COMMENT '是否去除前缀 1是 0否',
    `trim_value`           varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前缀内容',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '代码生成配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of generator_config
-- ----------------------------
INSERT INTO `generator_config`
VALUES (1, 'zclcs', 'com.zclcs', 'common.core.entity.dict', 'common.core.entity.dict.ao', 'common.core.entity.dict.vo',
        'server.dict.mapper', 'server.dict.mapper', 'server.dict.service', 'server.dict.service.impl',
        'server.dict.controller', '0', NULL);

SET FOREIGN_KEY_CHECKS = 1;
