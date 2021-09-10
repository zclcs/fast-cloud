/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : cloud_system

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 10/09/2021 17:04:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`
(
    `client_id`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '客户端ID',
    `resource_ids`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '资源编号',
    `client_secret`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '客户端密钥',
    `scope`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '客户端权限',
    `authorized_grant_types`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '鉴权类型',
    `web_server_redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '跳转地址',
    `authorities`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '拥有的系统权限',
    `access_token_validity`   int(11)                                                        NOT NULL COMMENT 'token过期时间',
    `refresh_token_validity`  int(11)                                                        NULL DEFAULT NULL COMMENT 'token刷新时间',
    `additional_information`  varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '额外信息',
    `autoapprove`             tinyint(4)                                                     NULL DEFAULT NULL COMMENT '是否自动批准',
    `origin_secret`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '组织密码',
    PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '客户端配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details`
VALUES ('app', '', '$2a$10$8Qk/efslEpO1Af1kyw/rp.DdJGsdnET8UCp1vGDzpQEa.1qBklvua', 'all', 'refresh_token,password', '',
        NULL, 86400, 864000, NULL, NULL, '123456');
INSERT INTO `oauth_client_details`
VALUES ('zclcs', ' ', '$2a$10$aSZTvMOtUAYUQ.75z2n3ceJd6dCIk9Vy3J/SKZUE4hBLd6sz7.6ge', 'all', 'password,refresh_token',
        NULL, NULL, 86400, 8640000, NULL, 0, '123456');

-- ----------------------------
-- Table structure for system_data_permission_test
-- ----------------------------
DROP TABLE IF EXISTS `system_data_permission_test`;
CREATE TABLE `system_data_permission_test`
(
    `id`          int(11)                                                NOT NULL,
    `field1`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `field2`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `field3`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `field4`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `dept_id`     int(11)                                                NOT NULL,
    `create_time` datetime                                               NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户权限测试'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_data_permission_test
-- ----------------------------
INSERT INTO `system_data_permission_test`
VALUES (1, '小米', '小米10Pro', '4999', '珍珠白', 1, '2020-04-14 15:00:38');
INSERT INTO `system_data_permission_test`
VALUES (2, '腾讯', '黑鲨游戏手机3', '3799', '铠甲灰', 2, '2020-04-14 15:01:36');
INSERT INTO `system_data_permission_test`
VALUES (3, '华为', '华为P30', '3299', '天空之境', 1, '2020-04-14 15:03:11');
INSERT INTO `system_data_permission_test`
VALUES (4, '华为', '华为P40Pro', '6488', '亮黑色', 3, '2020-04-14 15:04:31');
INSERT INTO `system_data_permission_test`
VALUES (5, 'vivo', 'Vivo iQOO 3', '3998', '拉力橙', 4, '2020-04-14 15:05:55');
INSERT INTO `system_data_permission_test`
VALUES (6, '一加', '一加7T', '3199', '冰际蓝', 5, '2020-04-14 15:06:53');
INSERT INTO `system_data_permission_test`
VALUES (7, '三星', '三星Galaxy S10', '4098', '浩玉白', 6, '2020-04-14 15:08:25');
INSERT INTO `system_data_permission_test`
VALUES (8, '苹果', 'iPhone 11 pro max', '9198', '暗夜绿', 4, '2020-04-14 15:09:20');

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`
(
    `dept_id`     bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id`   bigint(20)                                              NOT NULL COMMENT '上级部门id',
    `dept_name`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
    `order_num`   double(20, 0)                                           NULL DEFAULT NULL COMMENT '排序',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `modify_time` datetime                                                NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`dept_id`) USING BTREE,
    INDEX `system_dept_parent_id` (`parent_id`) USING BTREE,
    INDEX `system_dept_dept_name` (`dept_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '部门表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO `system_dept`
VALUES (1, 0, '开发部', 1, '2018-01-04 15:42:26', '2019-01-05 21:08:27');
INSERT INTO `system_dept`
VALUES (2, 1, '开发一部', 1, '2018-01-04 15:42:34', '2019-01-18 00:59:37');
INSERT INTO `system_dept`
VALUES (3, 1, '开发二部', 2, '2018-01-04 15:42:29', '2019-01-05 14:09:39');
INSERT INTO `system_dept`
VALUES (4, 0, '市场部', 2, '2018-01-04 15:42:36', '2021-09-10 15:14:54');
INSERT INTO `system_dept`
VALUES (5, 0, '人事部', 3, '2018-01-04 15:42:32', '2019-01-23 06:27:59');
INSERT INTO `system_dept`
VALUES (6, 0, '测试部', 4, '2018-01-04 15:42:38', '2019-01-17 08:15:47');

-- ----------------------------
-- Table structure for system_export
-- ----------------------------
DROP TABLE IF EXISTS `system_export`;
CREATE TABLE `system_export`
(
    `field1`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `field2`      int(11)                                                 NOT NULL,
    `field3`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `create_time` datetime                                                NOT NULL
) ENGINE = MyISAM
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = 'excel导入导出测试'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_export
-- ----------------------------
INSERT INTO `system_export`
VALUES ('字段1', 1, 'mrbird0@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_export`
VALUES ('字段1', 2, 'mrbird1@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_export`
VALUES ('字段1', 3, 'mrbird2@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_export`
VALUES ('字段1', 4, 'mrbird3@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_export`
VALUES ('字段1', 5, 'mrbird4@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_export`
VALUES ('字段1', 6, 'mrbird5@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_export`
VALUES ('字段1', 7, 'mrbird6@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_export`
VALUES ('字段1', 8, 'mrbird7@gmail.com', '2019-07-25 19:08:01');

-- ----------------------------
-- Table structure for system_generator_config
-- ----------------------------
DROP TABLE IF EXISTS `system_generator_config`;
CREATE TABLE `system_generator_config`
(
    `id`                   int(11)                                                 NOT NULL COMMENT '主键',
    `author`               varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '作者',
    `base_package`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '基础包名',
    `entity_package`       varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'entity文件存放路径',
    `mapper_package`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'mapper文件存放路径',
    `mapper_xml_package`   varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'mapper xml文件存放路径',
    `service_package`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'servcie文件存放路径',
    `service_impl_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'serviceimpl文件存放路径',
    `controller_package`   varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT 'controller文件存放路径',
    `is_trim`              char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '是否去除前缀 1是 0否',
    `trim_value`           varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '前缀内容',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '代码生成配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_generator_config
-- ----------------------------
INSERT INTO `system_generator_config`
VALUES (1, 'MrBird', 'cc.mrbird.febs.server.generator.gen', 'com.zclcs.common.core.entity', 'mapper', 'mapper',
        'service', 'service.impl', 'controller', '1', 't_');

-- ----------------------------
-- Table structure for system_job
-- ----------------------------
DROP TABLE IF EXISTS `system_job`;
CREATE TABLE `system_job`
(
    `job_id`          bigint(20)                                             NOT NULL AUTO_INCREMENT COMMENT '任务id',
    `bean_name`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring bean名称',
    `method_name`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
    `params`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
    `cron_expression` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
    `status`          char(2) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL COMMENT '任务状态  0：正常  1：暂停',
    `remark`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time`     datetime                                               NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`job_id`) USING BTREE,
    INDEX `system_job_create_time` (`create_time`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '定时任务表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_job
-- ----------------------------
INSERT INTO `system_job`
VALUES (1, 'taskList', 'test', 'hello', '0/1 * * * * ?', '1', '有参任务调度测试', '2018-02-24 16:26:14');
INSERT INTO `system_job`
VALUES (2, 'taskList', 'test1', NULL, '0/10 * * * * ?', '1', '无参任务调度测试', '2018-02-24 17:06:23');
INSERT INTO `system_job`
VALUES (3, 'taskList', 'test2', '{\"name\":\"mrbird\",\"age\":18}', '0/1 * * * * ?', '1', 'JSON类型参数任务测试',
        '2018-02-26 09:28:26');
INSERT INTO `system_job`
VALUES (4, 'taskList', 'test3', '', '0/5 * * * * ?', '1', '测试异常，没有编写test3任务', '2018-02-26 11:15:30');

-- ----------------------------
-- Table structure for system_job_log
-- ----------------------------
DROP TABLE IF EXISTS `system_job_log`;
CREATE TABLE `system_job_log`
(
    `log_id`      bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
    `job_id`      bigint(20)                                              NOT NULL COMMENT '任务id',
    `bean_name`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring bean名称',
    `method_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
    `params`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
    `status`      char(2) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '任务状态    0：成功    1：失败',
    `error`       text CHARACTER SET utf8 COLLATE utf8_general_ci         NULL COMMENT '失败信息',
    `times`       decimal(11, 0)                                          NULL DEFAULT NULL COMMENT '耗时(单位：毫秒)',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`log_id`) USING BTREE,
    INDEX `system_job_log_create_time` (`create_time`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '调度日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log`
(
    `id`          bigint(20)                                             NOT NULL AUTO_INCREMENT COMMENT '日志id',
    `username`    varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
    `operation`   text CHARACTER SET utf8 COLLATE utf8_general_ci        NULL COMMENT '操作内容',
    `time`        decimal(11, 0)                                         NULL DEFAULT NULL COMMENT '耗时',
    `method`      text CHARACTER SET utf8 COLLATE utf8_general_ci        NULL COMMENT '操作方法',
    `params`      text CHARACTER SET utf8 COLLATE utf8_general_ci        NULL COMMENT '方法参数',
    `ip`          varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者ip',
    `create_time` datetime                                               NULL DEFAULT NULL COMMENT '创建时间',
    `location`    varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `system_log_create_time` (`create_time`) USING BTREE,
    INDEX `system_log_username` (`username`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 81
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户操作日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log`
VALUES (1, 'zclcs', '新增用户', 49, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(username=test, password=null, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, deptIds=null)\"',
        '127.0.0.1', '2021-09-03 10:12:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (2, 'zclcs', '新增用户', 27, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(username=test, password=null, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, deptIds=null)\"',
        '127.0.0.1', '2021-09-03 11:02:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (3, 'zclcs', '新增用户', 18, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=null)\"',
        '127.0.0.1', '2021-09-06 16:30:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (4, 'zclcs', '新增用户', 285, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[3])\"',
        '127.0.0.1', '2021-09-06 17:00:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (5, 'zclcs', '新增用户', 247, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(userId=null, username=test1, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"',
        '127.0.0.1', '2021-09-07 09:44:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (6, 'zclcs', '修改用户', 96, 'com.zclcs.server.system.controller.SystemUserController.updateUser()',
        ' user: \"SystemUserAo(userId=3, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[3])\"',
        '127.0.0.1', '2021-09-07 09:45:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (7, 'zclcs', '修改用户', 75, 'com.zclcs.server.system.controller.SystemUserController.updateUser()',
        ' user: \"SystemUserAo(userId=3, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=11, roleIds=[1], deptIds=[3])\"',
        '127.0.0.1', '2021-09-07 09:47:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (8, 'zclcs', '删除用户', 76, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()',
        ' userIds: \"4\"', '127.0.0.1', '2021-09-07 09:58:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (9, 'zclcs', '修改用户', 86, 'com.zclcs.server.system.controller.SystemUserController.updateUser()',
        ' user: \"SystemUserAo(userId=3, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=11222, roleIds=[1], deptIds=[3])\"',
        '127.0.0.1', '2021-09-07 10:00:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (10, 'zclcs', '新增用户', 160, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(userId=null, username=test2, password=null, deptId=5, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[4])\"',
        '127.0.0.1', '2021-09-07 10:01:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (11, 'zclcs', '新增用户', 174, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(userId=null, username=test3, password=null, deptId=5, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"',
        '127.0.0.1', '2021-09-07 10:06:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (12, 'zclcs', '新增用户', 152, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(userId=null, username=test3, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[5])\"',
        '127.0.0.1', '2021-09-07 10:06:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (13, 'zclcs', '删除用户', 74, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()',
        ' userIds: \"6\"', '127.0.0.1', '2021-09-07 10:07:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (14, 'zclcs', '删除用户', 10, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()',
        ' userIds: \"6\"', '127.0.0.1', '2021-09-07 10:08:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (15, 'zclcs', '删除用户', 42, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()',
        ' userIds: \"7\"', '127.0.0.1', '2021-09-07 10:08:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (16, 'zclcs', '删除用户', 45, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()',
        ' userIds: \"5\"', '127.0.0.1', '2021-09-07 10:11:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (17, 'zclcs', '删除用户', 45, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()',
        ' userIds: \"3\"', '127.0.0.1', '2021-09-07 10:13:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (18, 'zclcs', '新增用户', 246, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(userId=null, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"',
        '127.0.0.1', '2021-09-07 16:56:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (19, 'zclcs', '删除用户', 65, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()',
        ' userIds: \"8\"', '127.0.0.1', '2021-09-08 09:16:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (20, 'zclcs', '新增用户', 215, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(userId=null, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"',
        '127.0.0.1', '2021-09-08 09:19:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (21, 'zclcs', '修改用户', 147, 'com.zclcs.server.system.controller.SystemUserController.updateUser()',
        ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=0, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"',
        '127.0.0.1', '2021-09-08 10:29:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (22, 'zclcs', '新增菜单/按钮', 156, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=1, menuName=角色管理, path=/cloud/system/role/index, component=null, perms=role:view, icon=ant-design:bell-twotone, type=0, orderNum=3.0)\"',
        '127.0.0.1', '2021-09-08 15:11:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (23, 'zclcs', '新增菜单/按钮', 50, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=10, menuName=修改菜单, path=null, component=null, perms=menu:update, icon=null, type=1, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-08 15:34:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (24, 'zclcs', '修改菜单/按钮', 57, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=1, parentId=null, menuName=系统管理, path=/system, component=null, perms=null, icon=ant-design:setting-outlined, type=2, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-08 16:50:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (25, 'zclcs', '新增菜单/按钮', 38, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=10, menuName=删除菜单, path=null, component=null, perms=menu:delete, icon=null, type=1, orderNum=3.0)\"',
        '127.0.0.1', '2021-09-09 09:09:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (26, 'zclcs', '修改菜单/按钮', 50, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=2, parentId=1, menuName=用户管理, path=user, component=/cloud/system/user/index, perms=user:view, icon=ant-design:user-switch-outlined, type=0, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-09 09:10:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (27, 'zclcs', '修改菜单/按钮', 42, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=4, parentId=1, menuName=部门管理, path=dept, component=/cloud/system/dept/index, perms=dept:view, icon=ant-design:apartment-outlined, type=0, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-09 09:11:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (28, 'zclcs', '修改菜单/按钮', 44, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=10, parentId=1, menuName=菜单管理, path=menu, component=/cloud/system/menu/index, perms=menu:view, icon=ant-design:menu-fold-outlined, type=0, orderNum=3.0)\"',
        '127.0.0.1', '2021-09-09 09:11:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (29, 'zclcs', '修改菜单/按钮', 42, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=3, parentId=1, menuName=用户详情页面, path=accountDetail/:username, component=/cloud/system/user/AccountDetail, perms=user:view, icon=ant-design:audit-outlined, type=0, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-09 09:15:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (30, 'zclcs', '修改菜单/按钮', 43, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:bell-twotone, type=0, orderNum=3.0)\"',
        '127.0.0.1', '2021-09-09 09:15:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (31, 'zclcs', '修改菜单/按钮', 39, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:bell-twotone, type=0, orderNum=3.0)\"',
        '127.0.0.1', '2021-09-09 09:15:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (32, 'zclcs', '修改菜单/按钮', 45, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=14, parentId=10, menuName=删除菜单, path=null, component=null, perms=menu:delete, icon=null, type=1, orderNum=null)\"',
        '127.0.0.1', '2021-09-09 10:29:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (33, 'zclcs', '修改菜单/按钮', 39, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=3, parentId=1, menuName=用户详情页面, path=accountDetail/:username, component=/cloud/system/user/AccountDetail, perms=user:view, icon=ant-design:audit-outlined, type=0, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-09 10:29:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (34, 'zclcs', '修改菜单/按钮', 113, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:bell-twotone, type=0, hideMenu=1, ignoreKeepAlive=1, orderNum=3.0)\"',
        '127.0.0.1', '2021-09-09 10:40:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (35, 'zclcs', '修改菜单/按钮', 56, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:bell-twotone, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=3.0)\"',
        '127.0.0.1', '2021-09-09 10:41:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (36, 'zclcs', '新增菜单/按钮', 119, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=12, menuName=添加角色, path=null, component=null, perms=role:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-09 11:26:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (37, 'zclcs', '新增用户', 154, 'com.zclcs.server.system.controller.SystemUserController.addUser()',
        ' user: \"SystemUserAo(userId=null, username=test1, password=null, deptId=5, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"',
        '127.0.0.1', '2021-09-09 11:27:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (38, 'zclcs', '删除用户', 81, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()',
        ' userIds: \"10\"', '127.0.0.1', '2021-09-09 11:27:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (39, 'zclcs', '新增菜单/按钮', 82, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=12, menuName=修改角色, path=null, component=null, perms=role:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-09 11:33:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (40, 'zclcs', '修改菜单/按钮', 51, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:solution-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=3.0)\"',
        '127.0.0.1', '2021-09-09 11:34:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (41, 'zclcs', '新增角色', 117, 'com.zclcs.server.system.controller.SystemRoleController.addRole()',
        ' role: \"SystemRoleAo(roleId=null, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1',
        '2021-09-09 14:54:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (42, 'zclcs', '修改用户', 95, 'com.zclcs.server.system.controller.SystemUserController.updateUser()',
        ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"',
        '127.0.0.1', '2021-09-09 14:58:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (43, 'zclcs', '修改用户', 85, 'com.zclcs.server.system.controller.SystemUserController.updateUser()',
        ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[2], deptIds=[2])\"',
        '127.0.0.1', '2021-09-09 14:58:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (44, 'zclcs', '修改用户', 80, 'com.zclcs.server.system.controller.SystemUserController.updateUser()',
        ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"',
        '127.0.0.1', '2021-09-09 15:01:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (45, 'zclcs', '修改用户', 83, 'com.zclcs.server.system.controller.SystemUserController.updateUser()',
        ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[2], deptIds=[2])\"',
        '127.0.0.1', '2021-09-09 15:01:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (46, 'zclcs', '修改角色', 84, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1',
        '2021-09-09 15:04:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (47, 'zclcs', '修改角色', 46, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1',
        '2021-09-09 15:17:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (48, 'zclcs', '修改角色', 45, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1',
        '2021-09-09 15:19:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (49, 'zclcs', '修改角色', 74, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1',
        '2021-09-09 15:20:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (50, 'zclcs', '修改角色', 54, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1',
        '2021-09-09 16:38:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (51, 'zclcs', '修改角色', 47, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1',
        '2021-09-09 16:38:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (52, 'zclcs', '修改角色', 106, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4, 1])\"', '127.0.0.1',
        '2021-09-09 16:40:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (53, 'zclcs', '修改角色', 169, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[1, 4])\"', '127.0.0.1',
        '2021-09-10 09:48:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (54, 'zclcs', '修改角色', 103, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[1, 4])\"', '127.0.0.1',
        '2021-09-10 09:50:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (55, 'zclcs', '修改角色', 81, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1',
        '2021-09-10 09:53:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (56, 'zclcs', '修改角色', 257, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[])\"', '127.0.0.1', '2021-09-10 10:30:12',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (57, 'zclcs', '修改角色', 83, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[5])\"', '127.0.0.1',
        '2021-09-10 10:30:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (58, 'zclcs', '修改菜单/按钮', 49, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:solution-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-10 10:31:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (59, 'zclcs', '修改菜单/按钮', 56, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=4, parentId=1, menuName=部门管理, path=dept, component=/cloud/system/dept/index, perms=dept:view, icon=ant-design:apartment-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=4.0)\"',
        '127.0.0.1', '2021-09-10 10:32:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (60, 'zclcs', '修改菜单/按钮', 52, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=5, parentId=2, menuName=添加用户, path=null, component=null, perms=user:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-10 10:33:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (61, 'zclcs', '新增菜单/按钮', 168, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=4, menuName=添加部门, path=null, component=null, perms=dept:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-10 14:28:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (62, 'zclcs', '新增菜单/按钮', 47, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=4, menuName=修改部门, path=null, component=null, perms=dept:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-10 14:29:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (63, 'zclcs', '修改菜单/按钮', 50, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=18, parentId=4, menuName=修改部门, path=null, component=null, perms=dept:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-10 14:29:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (64, 'zclcs', '新增菜单/按钮', 50, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=4, menuName=删除部门, path=null, component=null, perms=dept:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-10 14:30:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (65, 'zclcs', '修改角色', 118, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19])\"',
        '127.0.0.1', '2021-09-10 14:30:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (66, 'zclcs', '新增部门', 50, 'com.zclcs.server.system.controller.SystemDeptController.addDept()',
        ' dept: \"SystemDeptAo(deptId=null, parentId=null, deptName=5, orderNum=5.0, createTimeFrom=null, createTimeTo=null)\"',
        '127.0.0.1', '2021-09-10 15:04:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (67, 'zclcs', '修改部门', 56, 'com.zclcs.server.system.controller.SystemDeptController.updateDept()',
        ' dept: \"SystemDeptAo(deptId=7, parentId=null, deptName=6, orderNum=5.0, createTimeFrom=null, createTimeTo=null)\"',
        '127.0.0.1', '2021-09-10 15:05:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (68, 'zclcs', '删除部门', 372, 'com.zclcs.server.system.controller.SystemDeptController.deleteDepts()',
        ' deptIds: \"8\"', '127.0.0.1', '2021-09-10 15:10:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (69, 'zclcs', '删除部门', 46, 'com.zclcs.server.system.controller.SystemDeptController.deleteDepts()',
        ' deptIds: \"7\"', '127.0.0.1', '2021-09-10 15:10:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (70, 'zclcs', '修改部门', 98, 'com.zclcs.server.system.controller.SystemDeptController.updateDept()',
        ' dept: \"SystemDeptAo(deptId=4, parentId=1, deptName=市场部, orderNum=2.0, createTimeFrom=null, createTimeTo=null)\"',
        '127.0.0.1', '2021-09-10 15:14:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (71, 'zclcs', '修改部门', 43, 'com.zclcs.server.system.controller.SystemDeptController.updateDept()',
        ' dept: \"SystemDeptAo(deptId=4, parentId=null, deptName=市场部, orderNum=2.0, createTimeFrom=null, createTimeTo=null)\"',
        '127.0.0.1', '2021-09-10 15:14:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (72, 'zclcs', '修改菜单/按钮', 116, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=3, parentId=1, menuName=用户详情页面, path=accountDetail/:username, component=/cloud/system/user/AccountDetail, perms=user:detail:view, icon=ant-design:audit-outlined, type=0, hideMenu=1, ignoreKeepAlive=1, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-10 15:23:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (73, 'zclcs', '修改角色', 103, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19])\"',
        '127.0.0.1', '2021-09-10 15:34:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (74, 'zclcs', '修改角色', 103, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 3])\"',
        '127.0.0.1', '2021-09-10 15:56:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (75, 'zclcs', '修改角色', 69, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[2, 12, 3, 4, 10])\"', '127.0.0.1',
        '2021-09-10 15:56:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (76, 'zclcs', '修改角色', 210, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[1, 2, 3, 4, 10, 12, 8])\"', '127.0.0.1',
        '2021-09-10 15:59:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (77, 'zclcs', '修改角色', 154, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[8, 2])\"', '127.0.0.1',
        '2021-09-10 16:17:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (78, 'zclcs', '修改角色', 75, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[1, 2])\"', '127.0.0.1',
        '2021-09-10 16:18:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (79, 'zclcs', '修改角色', 78, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[2])\"', '127.0.0.1',
        '2021-09-10 16:18:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (80, 'zclcs', '修改角色', 140, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[1, 2, 3, 12, 10, 4, 8])\"', '127.0.0.1',
        '2021-09-10 16:59:22', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
DROP TABLE IF EXISTS `system_login_log`;
CREATE TABLE `system_login_log`
(
    `id`         bigint(11)                                             NOT NULL AUTO_INCREMENT COMMENT 'id',
    `username`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
    `login_time` datetime                                               NOT NULL COMMENT '登录时间',
    `location`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
    `ip`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
    `system`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
    `browser`    varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `system_login_log_login_time` (`login_time`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '登录日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`
(
    `menu_id`           bigint(20)                                               NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮id',
    `parent_id`         bigint(20)                                               NOT NULL COMMENT '上级菜单id',
    `menu_name`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT '菜单/按钮名称',
    `path`              varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT NULL COMMENT '对应路由path',
    `component`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT NULL COMMENT '对应路由组件component',
    `perms`             varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL     DEFAULT NULL COMMENT '权限标识',
    `icon`              varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL     DEFAULT NULL COMMENT '图标',
    `type`              char(2) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL COMMENT '类型 0菜单 1按钮 2菜单',
    `hide_menu`         char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否隐藏菜单 1是 0否',
    `ignore_keep_alive` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否忽略KeepAlive缓存 1是 0否',
    `order_num`         double(20, 0)                                            NULL     DEFAULT NULL COMMENT '排序',
    `create_time`       datetime                                                 NOT NULL COMMENT '创建时间',
    `modify_time`       datetime                                                 NULL     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`menu_id`) USING BTREE,
    INDEX `system_menu_parent_id` (`parent_id`) USING BTREE,
    INDEX `system_menu_menu_id` (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '菜单表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu`
VALUES (1, 0, '系统管理', '/system', 'Layout', NULL, 'ant-design:setting-outlined', '2', '0', '0', 1, '2017-12-27 16:39:07',
        '2021-09-08 16:50:54');
INSERT INTO `system_menu`
VALUES (2, 1, '用户管理', 'user', '/cloud/system/user/index', 'user:view', 'ant-design:user-switch-outlined', '0', '0', '0',
        1, '2017-12-27 16:47:13', '2021-09-09 09:10:20');
INSERT INTO `system_menu`
VALUES (3, 1, '用户详情页面', 'accountDetail/:username', '/cloud/system/user/AccountDetail', 'user:detail:view',
        'ant-design:audit-outlined', '0', '1', '1', 2, '2021-09-02 09:40:08', '2021-09-10 15:23:24');
INSERT INTO `system_menu`
VALUES (4, 1, '部门管理', 'dept', '/cloud/system/dept/index', 'dept:view', 'ant-design:apartment-outlined', '0', '0', '0',
        4, '2021-09-02 11:56:30', '2021-09-10 10:32:25');
INSERT INTO `system_menu`
VALUES (5, 2, '添加用户', NULL, NULL, 'user:add', NULL, '1', '0', '0', 1, '2021-09-03 10:07:35', '2021-09-10 10:33:20');
INSERT INTO `system_menu`
VALUES (6, 2, '修改用户', NULL, NULL, 'user:update', NULL, '1', '0', '0', 2, '2021-09-07 09:02:52', NULL);
INSERT INTO `system_menu`
VALUES (7, 2, '删除用户', NULL, NULL, 'user:delete', NULL, '1', '0', '0', 3, '2021-09-07 09:57:45', NULL);
INSERT INTO `system_menu`
VALUES (8, 2, '查看用户操作日志', NULL, NULL, 'log:view', NULL, '1', '0', '0', 4, '2021-09-07 11:26:50', NULL);
INSERT INTO `system_menu`
VALUES (9, 2, '重置用户密码', NULL, NULL, 'user:reset', NULL, '1', '0', '0', 5, '2021-09-07 15:16:32', NULL);
INSERT INTO `system_menu`
VALUES (10, 1, '菜单管理', 'menu', '/cloud/system/menu/index', 'menu:view', 'ant-design:menu-fold-outlined', '0', '0', '0',
        3, '2021-09-08 10:55:14', '2021-09-09 09:11:47');
INSERT INTO `system_menu`
VALUES (11, 10, '添加菜单', NULL, NULL, 'menu:add', NULL, '1', '0', '0', NULL, '2021-09-08 15:08:38', NULL);
INSERT INTO `system_menu`
VALUES (12, 1, '角色管理', 'role', '/cloud/system/role/index', 'role:view', 'ant-design:solution-outlined', '0', '0', '0',
        2, '2021-09-08 15:11:16', '2021-09-10 10:31:41');
INSERT INTO `system_menu`
VALUES (13, 10, '修改菜单', NULL, NULL, 'menu:update', NULL, '1', '0', '0', NULL, '2021-09-08 15:34:15', NULL);
INSERT INTO `system_menu`
VALUES (14, 10, '删除菜单', NULL, NULL, 'menu:delete', NULL, '1', '0', '0', NULL, '2021-09-09 09:09:49',
        '2021-09-09 10:29:08');
INSERT INTO `system_menu`
VALUES (15, 12, '添加角色', NULL, NULL, 'role:add', NULL, '1', '0', '0', NULL, '2021-09-09 11:26:56', NULL);
INSERT INTO `system_menu`
VALUES (16, 12, '修改角色', NULL, NULL, 'role:update', NULL, '1', '0', '0', NULL, '2021-09-09 11:33:34', NULL);
INSERT INTO `system_menu`
VALUES (17, 4, '添加部门', NULL, NULL, 'dept:add', NULL, '1', '0', '0', NULL, '2021-09-10 14:28:37', NULL);
INSERT INTO `system_menu`
VALUES (18, 4, '修改部门', NULL, NULL, 'dept:update', NULL, '1', '0', '0', NULL, '2021-09-10 14:29:25',
        '2021-09-10 14:29:58');
INSERT INTO `system_menu`
VALUES (19, 4, '删除部门', NULL, NULL, 'dept:delete', NULL, '1', '0', '0', NULL, '2021-09-10 14:30:26', NULL);

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`
(
    `role_id`     bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '角色id',
    `role_name`   varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '角色名称',
    `remark`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
    `create_time` datetime                                                NOT NULL COMMENT '创建时间',
    `modify_time` datetime                                                NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '角色表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role`
VALUES (1, '管理员', '管理员', '2017-12-27 16:23:11', '2021-09-10 15:56:12');
INSERT INTO `system_role`
VALUES (2, '查看', NULL, '2021-09-09 14:54:42', '2021-09-10 16:59:22');

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`
(
    `role_id` bigint(20) NOT NULL COMMENT '角色编号',
    `menu_id` bigint(20) NOT NULL COMMENT '菜单编号',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
    INDEX `system_role_menu_menu_id` (`menu_id`) USING BTREE,
    INDEX `system_role_menu_role_id` (`role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '角色菜单关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu`
VALUES (1, 1);
INSERT INTO `system_role_menu`
VALUES (2, 1);
INSERT INTO `system_role_menu`
VALUES (1, 2);
INSERT INTO `system_role_menu`
VALUES (2, 2);
INSERT INTO `system_role_menu`
VALUES (1, 3);
INSERT INTO `system_role_menu`
VALUES (2, 3);
INSERT INTO `system_role_menu`
VALUES (1, 4);
INSERT INTO `system_role_menu`
VALUES (2, 4);
INSERT INTO `system_role_menu`
VALUES (1, 5);
INSERT INTO `system_role_menu`
VALUES (1, 6);
INSERT INTO `system_role_menu`
VALUES (1, 7);
INSERT INTO `system_role_menu`
VALUES (1, 8);
INSERT INTO `system_role_menu`
VALUES (2, 8);
INSERT INTO `system_role_menu`
VALUES (1, 9);
INSERT INTO `system_role_menu`
VALUES (1, 10);
INSERT INTO `system_role_menu`
VALUES (2, 10);
INSERT INTO `system_role_menu`
VALUES (1, 11);
INSERT INTO `system_role_menu`
VALUES (1, 12);
INSERT INTO `system_role_menu`
VALUES (2, 12);
INSERT INTO `system_role_menu`
VALUES (1, 13);
INSERT INTO `system_role_menu`
VALUES (1, 14);
INSERT INTO `system_role_menu`
VALUES (1, 15);
INSERT INTO `system_role_menu`
VALUES (1, 16);
INSERT INTO `system_role_menu`
VALUES (1, 17);
INSERT INTO `system_role_menu`
VALUES (1, 18);
INSERT INTO `system_role_menu`
VALUES (1, 19);

-- ----------------------------
-- Table structure for system_trade_log
-- ----------------------------
DROP TABLE IF EXISTS `system_trade_log`;
CREATE TABLE `system_trade_log`
(
    `id`          int(11)                                                NOT NULL AUTO_INCREMENT COMMENT 'id',
    `goods_id`    int(11)                                                NOT NULL COMMENT '商品id',
    `goods_name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
    `status`      varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
    `create_time` datetime                                               NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '分布式事务测试'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_trade_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`
(
    `user_id`         bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '用户id',
    `username`        varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '用户名',
    `password`        varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
    `dept_id`         bigint(20)                                              NULL DEFAULT NULL COMMENT '部门id',
    `email`           varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `mobile`          varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '联系电话',
    `status`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '状态 0锁定 1有效',
    `create_time`     datetime                                                NOT NULL COMMENT '创建时间',
    `modify_time`     datetime                                                NULL DEFAULT NULL COMMENT '修改时间',
    `last_login_time` datetime                                                NULL DEFAULT NULL COMMENT '最近访问时间',
    `gender`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
    `is_tab`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT NULL COMMENT '是否开启tab，0关闭 1开启',
    `theme`           varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '主题',
    `avatar`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
    `description`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
    PRIMARY KEY (`user_id`) USING BTREE,
    INDEX `system_user_username` (`username`) USING BTREE,
    INDEX `system_user_mobile` (`mobile`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user`
VALUES (1, 'zclcs', '$2a$10$gzhiUb1ldc1Rf3lka4k/WOoFKKGPepHSzJxzcPSN5/65SzkMdc.SK', 2, '2371219112@qq.com',
        '17788888888', '1', '2019-06-14 20:39:22', '2020-04-15 16:00:32', '2020-04-15 16:03:13', '0', '1', 'white',
        'gaOngJwsRYRaVAuXXcmB.png', '我是帅比作者。');
INSERT INTO `system_user`
VALUES (9, 'test', '$2a$10$URqQzGO9Hw9v5lyb2vsJFOBccfrxmuGdziyflizqEAH.LaonKk2mi', 4, NULL, NULL, '1',
        '2021-09-08 09:19:38', '2021-09-09 15:01:13', NULL, NULL, NULL, NULL, 'default.jpg', NULL);

-- ----------------------------
-- Table structure for system_user_connection
-- ----------------------------
DROP TABLE IF EXISTS `system_user_connection`;
CREATE TABLE `system_user_connection`
(
    `user_name`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '系统用户名',
    `provider_name`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '第三方平台名称',
    `provider_user_id`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '第三方平台账户id',
    `provider_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '第三方平台用户名',
    `nick_name`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '第三方平台昵称',
    `image_url`          varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台头像',
    `location`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
    `remark`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`user_name`, `provider_name`, `provider_user_id`) USING BTREE,
    UNIQUE INDEX `userconnectionrank` (`user_name`, `provider_name`, `provider_user_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '系统用户社交账户关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_connection
-- ----------------------------

-- ----------------------------
-- Table structure for system_user_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `system_user_data_permission`;
CREATE TABLE `system_user_data_permission`
(
    `user_id` bigint(20) NOT NULL COMMENT '用户编号',
    `dept_id` bigint(20) NOT NULL COMMENT '部门编号',
    PRIMARY KEY (`user_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户数据权限关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_data_permission
-- ----------------------------
INSERT INTO `system_user_data_permission`
VALUES (1, 1);
INSERT INTO `system_user_data_permission`
VALUES (1, 2);
INSERT INTO `system_user_data_permission`
VALUES (1, 3);
INSERT INTO `system_user_data_permission`
VALUES (1, 4);
INSERT INTO `system_user_data_permission`
VALUES (1, 5);
INSERT INTO `system_user_data_permission`
VALUES (1, 6);
INSERT INTO `system_user_data_permission`
VALUES (9, 2);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`
(
    `user_id` bigint(20) NOT NULL COMMENT '用户id',
    `role_id` bigint(20) NOT NULL COMMENT '角色id',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户角色关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role`
VALUES (1, 1);
INSERT INTO `system_user_role`
VALUES (9, 2);

SET FOREIGN_KEY_CHECKS = 1;
