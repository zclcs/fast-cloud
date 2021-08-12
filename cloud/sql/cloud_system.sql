/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : cloud_system

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 12/08/2021 23:24:30
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
VALUES ('febs', ' ', '$2a$10$aSZTvMOtUAYUQ.75z2n3ceJd6dCIk9Vy3J/SKZUE4hBLd6sz7.6ge', 'all', 'password,refresh_token',
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
  AUTO_INCREMENT = 7
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
VALUES (4, 0, '市场部', 2, '2018-01-04 15:42:36', '2019-01-23 06:27:56');
INSERT INTO `system_dept`
VALUES (5, 0, '人事部', 3, '2018-01-04 15:42:32', '2019-01-23 06:27:59');
INSERT INTO `system_dept`
VALUES (6, 0, '测试部', 4, '2018-01-04 15:42:38', '2019-01-17 08:15:47');

-- ----------------------------
-- Table structure for system_eximport
-- ----------------------------
DROP TABLE IF EXISTS `system_eximport`;
CREATE TABLE `system_eximport`
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
-- Records of system_eximport
-- ----------------------------
INSERT INTO `system_eximport`
VALUES ('字段1', 1, 'mrbird0@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_eximport`
VALUES ('字段1', 2, 'mrbird1@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_eximport`
VALUES ('字段1', 3, 'mrbird2@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_eximport`
VALUES ('字段1', 4, 'mrbird3@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_eximport`
VALUES ('字段1', 5, 'mrbird4@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_eximport`
VALUES ('字段1', 6, 'mrbird5@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_eximport`
VALUES ('字段1', 7, 'mrbird6@gmail.com', '2019-07-25 19:08:01');
INSERT INTO `system_eximport`
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
    INDEX `system_log_create_time` (`create_time`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户操作日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_logger
-- ----------------------------
DROP TABLE IF EXISTS `system_logger`;
CREATE TABLE `system_logger`
(
    `id`          bigint(20)                                               NOT NULL AUTO_INCREMENT COMMENT '分布式事务日志id',
    `group_id`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT '分组id',
    `unit_id`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT '事务',
    `tag`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT '标签',
    `content`     varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
    `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL COMMENT '创建时间',
    `app_name`    varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '服务名',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '分布式事务日志'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_logger
-- ----------------------------

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
    `menu_id`     bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮id',
    `parent_id`   bigint(20)                                              NOT NULL COMMENT '上级菜单id',
    `menu_name`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '菜单/按钮名称',
    `path`        varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应路由path',
    `component`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应路由组件component',
    `perms`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '图标',
    `type`        char(2) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '类型 0菜单 1按钮',
    `order_num`   double(20, 0)                                           NULL DEFAULT NULL COMMENT '排序',
    `create_time` datetime                                                NOT NULL COMMENT '创建时间',
    `modify_time` datetime                                                NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`menu_id`) USING BTREE,
    INDEX `system_menu_parent_id` (`parent_id`) USING BTREE,
    INDEX `system_menu_menu_id` (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 195
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '菜单表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu`
VALUES (1, 0, '系统管理', '/system', 'Layout', NULL, 'el-icon-set-up', '0', 1, '2017-12-27 16:39:07',
        '2019-07-20 16:19:04');
INSERT INTO `system_menu`
VALUES (2, 0, '系统监控', '/monitor', 'Layout', NULL, 'el-icon-data-line', '0', 2, '2017-12-27 16:45:51',
        '2019-01-23 06:27:12');
INSERT INTO `system_menu`
VALUES (3, 1, '用户管理', '/system/user', 'febs/system/user/Index', 'user:view', '', '0', 1, '2017-12-27 16:47:13',
        '2019-01-22 06:45:55');
INSERT INTO `system_menu`
VALUES (4, 1, '角色管理', '/system/role', 'febs/system/role/Index', 'role:view', '', '0', 2, '2017-12-27 16:48:09',
        '2018-04-25 09:01:12');
INSERT INTO `system_menu`
VALUES (5, 1, '菜单管理', '/system/menu', 'febs/system/menu/Index', 'menu:view', '', '0', 3, '2017-12-27 16:48:57',
        '2018-04-25 09:01:30');
INSERT INTO `system_menu`
VALUES (6, 1, '部门管理', '/system/dept', 'febs/system/dept/Index', 'dept:view', '', '0', 4, '2017-12-27 16:57:33',
        '2018-04-25 09:01:40');
INSERT INTO `system_menu`
VALUES (10, 2, '系统日志', '/monitor/systemlog', 'febs/monitor/systemlog/Index', 'log:view', '', '0', 2,
        '2017-12-27 17:00:50', '2020-04-13 11:38:04');
INSERT INTO `system_menu`
VALUES (11, 3, '新增用户', '', '', 'user:add', NULL, '1', NULL, '2017-12-27 17:02:58', NULL);
INSERT INTO `system_menu`
VALUES (12, 3, '修改用户', '', '', 'user:update', NULL, '1', NULL, '2017-12-27 17:04:07', NULL);
INSERT INTO `system_menu`
VALUES (13, 3, '删除用户', '', '', 'user:delete', NULL, '1', NULL, '2017-12-27 17:04:58', NULL);
INSERT INTO `system_menu`
VALUES (14, 4, '新增角色', '', '', 'role:add', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `system_menu`
VALUES (15, 4, '修改角色', '', '', 'role:update', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `system_menu`
VALUES (16, 4, '删除角色', '', '', 'role:delete', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `system_menu`
VALUES (17, 5, '新增菜单', '', '', 'menu:add', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `system_menu`
VALUES (18, 5, '修改菜单', '', '', 'menu:update', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `system_menu`
VALUES (19, 5, '删除菜单', '', '', 'menu:delete', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `system_menu`
VALUES (20, 6, '新增部门', '', '', 'dept:add', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `system_menu`
VALUES (21, 6, '修改部门', '', '', 'dept:update', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `system_menu`
VALUES (22, 6, '删除部门', '', '', 'dept:delete', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `system_menu`
VALUES (24, 10, '删除日志', '', '', 'log:delete', NULL, '1', NULL, '2017-12-27 17:11:45', NULL);
INSERT INTO `system_menu`
VALUES (130, 3, '导出Excel', NULL, NULL, 'user:export', NULL, '1', NULL, '2019-01-23 06:35:16', NULL);
INSERT INTO `system_menu`
VALUES (131, 4, '导出Excel', NULL, NULL, 'role:export', NULL, '1', NULL, '2019-01-23 06:35:36', NULL);
INSERT INTO `system_menu`
VALUES (132, 5, '导出Excel', NULL, NULL, 'menu:export', NULL, '1', NULL, '2019-01-23 06:36:05', NULL);
INSERT INTO `system_menu`
VALUES (133, 6, '导出Excel', NULL, NULL, 'dept:export', NULL, '1', NULL, '2019-01-23 06:36:25', NULL);
INSERT INTO `system_menu`
VALUES (135, 3, '密码重置', NULL, NULL, 'user:reset', NULL, '1', NULL, '2019-01-23 06:37:00', NULL);
INSERT INTO `system_menu`
VALUES (136, 10, '导出Excel', NULL, NULL, 'log:export', NULL, '1', NULL, '2019-01-23 06:37:27', NULL);
INSERT INTO `system_menu`
VALUES (150, 2, '登录日志', '/monitor/loginlog', 'febs/monitor/loginlog/Index', 'monitor:loginlog', '', '0', 3,
        '2019-07-22 13:41:17', '2020-04-13 11:38:08');
INSERT INTO `system_menu`
VALUES (151, 150, '删除日志', NULL, NULL, 'loginlog:delete', NULL, '1', NULL, '2019-07-22 13:43:04', NULL);
INSERT INTO `system_menu`
VALUES (152, 150, '导出Excel', NULL, NULL, 'loginlog:export', NULL, '1', NULL, '2019-07-22 13:43:30', NULL);
INSERT INTO `system_menu`
VALUES (154, 0, '其他模块', '/others', 'Layout', '', 'el-icon-shopping-bag-1', '0', 6, '2019-07-25 10:16:16',
        '2020-04-14 18:38:20');
INSERT INTO `system_menu`
VALUES (155, 154, '导入导出', '/others/eximport', 'febs/others/eximport/Index', 'others:eximport', '', '0', 1,
        '2019-07-25 10:19:31', NULL);
INSERT INTO `system_menu`
VALUES (156, 0, '代码生成', '/gen', 'Layout', '', 'el-icon-printer', '0', 4, '2019-07-25 10:24:03', '2020-01-16 13:59:49');
INSERT INTO `system_menu`
VALUES (157, 156, '基础配置', '/gen/config', 'febs/gen/config/Index', 'gen:config', '', '0', 1, '2019-07-25 10:24:55',
        '2020-04-09 14:21:54');
INSERT INTO `system_menu`
VALUES (158, 156, '生成代码', '/gen/generate', 'febs/gen/generate/Index', 'gen:generate', '', '0', 2, '2019-07-25 10:25:26',
        '2019-07-25 11:13:20');
INSERT INTO `system_menu`
VALUES (159, 157, '修改配置', NULL, NULL, 'gen:config:update', NULL, '1', NULL, '2019-07-26 16:22:56', NULL);
INSERT INTO `system_menu`
VALUES (160, 158, '打包生成', NULL, NULL, 'gen:generate:gen', NULL, '1', NULL, '2019-07-26 16:23:38',
        '2019-07-26 16:23:53');
INSERT INTO `system_menu`
VALUES (163, 1, '客户端管理', '/client', 'febs/system/client/Index', 'client:view', '', '0', 5, '2019-09-26 22:58:09', NULL);
INSERT INTO `system_menu`
VALUES (164, 163, '新增', NULL, NULL, 'client:add', NULL, '1', NULL, '2019-09-26 22:58:21', NULL);
INSERT INTO `system_menu`
VALUES (165, 163, '修改', NULL, NULL, 'client:update', NULL, '1', NULL, '2019-09-26 22:58:43', NULL);
INSERT INTO `system_menu`
VALUES (166, 163, '删除', NULL, NULL, 'client:delete', NULL, '1', NULL, '2019-09-26 22:58:55', NULL);
INSERT INTO `system_menu`
VALUES (167, 163, '解密', NULL, NULL, 'client:decrypt', NULL, '1', NULL, '2019-09-26 22:59:08', NULL);
INSERT INTO `system_menu`
VALUES (168, 0, '静态组件', '/components', 'Layout', '', 'el-icon-present', '0', 7, '2019-12-02 16:41:28',
        '2020-04-14 18:38:23');
INSERT INTO `system_menu`
VALUES (169, 168, '二级菜单', '/two', 'demos/two/Index', '', '', '0', 1, '2019-12-02 16:41:51', NULL);
INSERT INTO `system_menu`
VALUES (170, 169, '三级菜单', '/three', 'demos/two/three/Index', '', '', '0', 1, '2019-12-02 16:42:09', NULL);
INSERT INTO `system_menu`
VALUES (171, 168, 'MarkDown', '/components/markdown', 'demos/markdown', '', '', '0', 2, '2019-12-02 16:42:34', NULL);
INSERT INTO `system_menu`
VALUES (172, 168, '富文本编辑器', '/components/tinymce', 'demos/tinymce', '', '', '0', 3, '2019-12-02 16:42:50', NULL);
INSERT INTO `system_menu`
VALUES (173, 0, '网关管理', '/route', 'Layout', '', 'el-icon-odometer', '0', 3, '2020-01-16 14:00:15', NULL);
INSERT INTO `system_menu`
VALUES (174, 173, '网关用户', '/route/user', 'febs/route/routeuser/Index', '', '', '0', 1, '2020-01-16 14:00:32', NULL);
INSERT INTO `system_menu`
VALUES (175, 173, '网关日志', '/route/log', 'febs/route/routelog/Index', '', '', '0', 2, '2020-01-16 14:00:47', NULL);
INSERT INTO `system_menu`
VALUES (176, 173, '限流规则', '/route/ratelimitrule', 'febs/route/ratelimitrule/Index', '', '', '0', 3,
        '2020-01-16 14:01:01', NULL);
INSERT INTO `system_menu`
VALUES (177, 173, '限流日志', '/route/ratelimitlog', 'febs/route/ratelimitlog/Index', '', '', '0', 4, '2020-01-16 14:01:17',
        NULL);
INSERT INTO `system_menu`
VALUES (178, 173, '黑名单管理', '/route/blacklist', 'febs/route/blacklist/Index', '', '', '0', 5, '2020-01-16 14:01:32',
        NULL);
INSERT INTO `system_menu`
VALUES (179, 173, '黑名单日志', '/route/blocklog', 'febs/route/blocklog/Index', '', '', '0', 6, '2020-01-16 14:01:49', NULL);
INSERT INTO `system_menu`
VALUES (180, 2, '监控面板', '/monitor/dashboard', 'febs/monitor/dashboard/Index', 'monitor:dashboard', '', '0', 1,
        '2020-04-13 09:44:09', '2020-04-13 11:38:00');
INSERT INTO `system_menu`
VALUES (181, 154, '个人博客', '/others/blog', 'febs/others/blog/Index', '', '', '0', 2, '2020-04-13 16:11:48',
        '2020-04-13 16:12:26');
INSERT INTO `system_menu`
VALUES (182, 154, '数据权限', '/others/datapermission', 'febs/others/datapermission/Index', 'others:datapermission', '',
        '0', 3, '2020-04-14 14:51:35', '2020-04-14 15:37:19');
INSERT INTO `system_menu`
VALUES (183, 0, '任务调度', '/job', 'Layout', '', 'el-icon-alarm-clock', '0', 5, '2020-04-14 18:39:35',
        '2020-04-14 18:39:53');
INSERT INTO `system_menu`
VALUES (184, 183, '任务列表', '/job/list', 'febs/job/job/Index', 'job:view', '', '0', 1, '2020-04-14 18:40:37',
        '2020-04-14 18:41:36');
INSERT INTO `system_menu`
VALUES (185, 183, '调度日志', '/job/log', 'febs/job/log/Index', 'job:log:view', '', '0', 2, '2020-04-14 18:42:25', NULL);
INSERT INTO `system_menu`
VALUES (186, 184, '新增任务', NULL, NULL, 'job:add', NULL, '1', NULL, '2020-04-14 18:59:55', '2020-04-15 08:56:03');
INSERT INTO `system_menu`
VALUES (187, 184, '修改任务', NULL, NULL, 'job:update', NULL, '1', NULL, '2020-04-14 19:00:13', NULL);
INSERT INTO `system_menu`
VALUES (188, 184, '删除任务', NULL, NULL, 'job:delete', NULL, '1', NULL, '2020-04-14 19:00:26', NULL);
INSERT INTO `system_menu`
VALUES (189, 184, '暂停任务', NULL, NULL, 'job:pause', NULL, '1', NULL, '2020-04-14 19:00:42', NULL);
INSERT INTO `system_menu`
VALUES (190, 184, '恢复任务', NULL, NULL, 'job:resume', NULL, '1', NULL, '2020-04-14 19:00:56', NULL);
INSERT INTO `system_menu`
VALUES (191, 184, '立即执行一次', NULL, NULL, 'job:run', NULL, '1', NULL, '2020-04-14 19:01:42', NULL);
INSERT INTO `system_menu`
VALUES (192, 184, '导出Excel', NULL, NULL, 'job:export', NULL, '1', NULL, '2020-04-14 19:01:59', NULL);
INSERT INTO `system_menu`
VALUES (193, 185, '删除', NULL, NULL, 'job:log:delete', NULL, '1', NULL, '2020-04-15 14:01:33', NULL);
INSERT INTO `system_menu`
VALUES (194, 185, '导出', NULL, NULL, 'job:log:export', NULL, '1', NULL, '2020-04-15 14:01:45', NULL);

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
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '角色表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role`
VALUES (1, '管理员', '管理员', '2017-12-27 16:23:11', '2020-04-15 14:02:27');
INSERT INTO `system_role`
VALUES (2, '注册用户', '可查看，新增，导出', '2019-01-04 14:11:28', '2020-04-15 16:00:16');
INSERT INTO `system_role`
VALUES (3, '系统监控员', '负责系统监控模块', '2019-09-01 10:30:25', '2019-09-01 10:30:37');
INSERT INTO `system_role`
VALUES (4, '测试角色', '测试角色', '2020-03-08 19:16:01', '2020-04-13 11:26:13');

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
VALUES (4, 1);
INSERT INTO `system_role_menu`
VALUES (1, 2);
INSERT INTO `system_role_menu`
VALUES (2, 2);
INSERT INTO `system_role_menu`
VALUES (3, 2);
INSERT INTO `system_role_menu`
VALUES (1, 3);
INSERT INTO `system_role_menu`
VALUES (2, 3);
INSERT INTO `system_role_menu`
VALUES (4, 3);
INSERT INTO `system_role_menu`
VALUES (1, 4);
INSERT INTO `system_role_menu`
VALUES (2, 4);
INSERT INTO `system_role_menu`
VALUES (1, 5);
INSERT INTO `system_role_menu`
VALUES (2, 5);
INSERT INTO `system_role_menu`
VALUES (1, 6);
INSERT INTO `system_role_menu`
VALUES (2, 6);
INSERT INTO `system_role_menu`
VALUES (1, 10);
INSERT INTO `system_role_menu`
VALUES (2, 10);
INSERT INTO `system_role_menu`
VALUES (3, 10);
INSERT INTO `system_role_menu`
VALUES (1, 11);
INSERT INTO `system_role_menu`
VALUES (4, 11);
INSERT INTO `system_role_menu`
VALUES (1, 12);
INSERT INTO `system_role_menu`
VALUES (4, 12);
INSERT INTO `system_role_menu`
VALUES (1, 13);
INSERT INTO `system_role_menu`
VALUES (4, 13);
INSERT INTO `system_role_menu`
VALUES (1, 14);
INSERT INTO `system_role_menu`
VALUES (2, 14);
INSERT INTO `system_role_menu`
VALUES (1, 15);
INSERT INTO `system_role_menu`
VALUES (1, 16);
INSERT INTO `system_role_menu`
VALUES (1, 17);
INSERT INTO `system_role_menu`
VALUES (2, 17);
INSERT INTO `system_role_menu`
VALUES (1, 18);
INSERT INTO `system_role_menu`
VALUES (1, 19);
INSERT INTO `system_role_menu`
VALUES (1, 20);
INSERT INTO `system_role_menu`
VALUES (2, 20);
INSERT INTO `system_role_menu`
VALUES (1, 21);
INSERT INTO `system_role_menu`
VALUES (1, 22);
INSERT INTO `system_role_menu`
VALUES (1, 24);
INSERT INTO `system_role_menu`
VALUES (3, 24);
INSERT INTO `system_role_menu`
VALUES (1, 130);
INSERT INTO `system_role_menu`
VALUES (2, 130);
INSERT INTO `system_role_menu`
VALUES (4, 130);
INSERT INTO `system_role_menu`
VALUES (1, 131);
INSERT INTO `system_role_menu`
VALUES (2, 131);
INSERT INTO `system_role_menu`
VALUES (1, 132);
INSERT INTO `system_role_menu`
VALUES (2, 132);
INSERT INTO `system_role_menu`
VALUES (1, 133);
INSERT INTO `system_role_menu`
VALUES (2, 133);
INSERT INTO `system_role_menu`
VALUES (1, 135);
INSERT INTO `system_role_menu`
VALUES (4, 135);
INSERT INTO `system_role_menu`
VALUES (1, 136);
INSERT INTO `system_role_menu`
VALUES (2, 136);
INSERT INTO `system_role_menu`
VALUES (3, 136);
INSERT INTO `system_role_menu`
VALUES (3, 148);
INSERT INTO `system_role_menu`
VALUES (3, 149);
INSERT INTO `system_role_menu`
VALUES (1, 150);
INSERT INTO `system_role_menu`
VALUES (2, 150);
INSERT INTO `system_role_menu`
VALUES (3, 150);
INSERT INTO `system_role_menu`
VALUES (1, 151);
INSERT INTO `system_role_menu`
VALUES (3, 151);
INSERT INTO `system_role_menu`
VALUES (1, 152);
INSERT INTO `system_role_menu`
VALUES (2, 152);
INSERT INTO `system_role_menu`
VALUES (3, 152);
INSERT INTO `system_role_menu`
VALUES (3, 153);
INSERT INTO `system_role_menu`
VALUES (1, 154);
INSERT INTO `system_role_menu`
VALUES (2, 154);
INSERT INTO `system_role_menu`
VALUES (1, 155);
INSERT INTO `system_role_menu`
VALUES (2, 155);
INSERT INTO `system_role_menu`
VALUES (1, 156);
INSERT INTO `system_role_menu`
VALUES (2, 156);
INSERT INTO `system_role_menu`
VALUES (1, 157);
INSERT INTO `system_role_menu`
VALUES (2, 157);
INSERT INTO `system_role_menu`
VALUES (1, 158);
INSERT INTO `system_role_menu`
VALUES (2, 158);
INSERT INTO `system_role_menu`
VALUES (1, 159);
INSERT INTO `system_role_menu`
VALUES (1, 160);
INSERT INTO `system_role_menu`
VALUES (2, 160);
INSERT INTO `system_role_menu`
VALUES (1, 163);
INSERT INTO `system_role_menu`
VALUES (2, 163);
INSERT INTO `system_role_menu`
VALUES (1, 164);
INSERT INTO `system_role_menu`
VALUES (2, 164);
INSERT INTO `system_role_menu`
VALUES (1, 165);
INSERT INTO `system_role_menu`
VALUES (1, 166);
INSERT INTO `system_role_menu`
VALUES (1, 167);
INSERT INTO `system_role_menu`
VALUES (2, 167);
INSERT INTO `system_role_menu`
VALUES (1, 168);
INSERT INTO `system_role_menu`
VALUES (2, 168);
INSERT INTO `system_role_menu`
VALUES (1, 169);
INSERT INTO `system_role_menu`
VALUES (2, 169);
INSERT INTO `system_role_menu`
VALUES (1, 170);
INSERT INTO `system_role_menu`
VALUES (2, 170);
INSERT INTO `system_role_menu`
VALUES (1, 171);
INSERT INTO `system_role_menu`
VALUES (2, 171);
INSERT INTO `system_role_menu`
VALUES (1, 172);
INSERT INTO `system_role_menu`
VALUES (2, 172);
INSERT INTO `system_role_menu`
VALUES (1, 173);
INSERT INTO `system_role_menu`
VALUES (2, 173);
INSERT INTO `system_role_menu`
VALUES (1, 174);
INSERT INTO `system_role_menu`
VALUES (2, 174);
INSERT INTO `system_role_menu`
VALUES (1, 175);
INSERT INTO `system_role_menu`
VALUES (2, 175);
INSERT INTO `system_role_menu`
VALUES (1, 176);
INSERT INTO `system_role_menu`
VALUES (2, 176);
INSERT INTO `system_role_menu`
VALUES (1, 177);
INSERT INTO `system_role_menu`
VALUES (2, 177);
INSERT INTO `system_role_menu`
VALUES (1, 178);
INSERT INTO `system_role_menu`
VALUES (2, 178);
INSERT INTO `system_role_menu`
VALUES (1, 179);
INSERT INTO `system_role_menu`
VALUES (2, 179);
INSERT INTO `system_role_menu`
VALUES (1, 180);
INSERT INTO `system_role_menu`
VALUES (2, 180);
INSERT INTO `system_role_menu`
VALUES (1, 181);
INSERT INTO `system_role_menu`
VALUES (2, 181);
INSERT INTO `system_role_menu`
VALUES (1, 182);
INSERT INTO `system_role_menu`
VALUES (2, 182);
INSERT INTO `system_role_menu`
VALUES (1, 183);
INSERT INTO `system_role_menu`
VALUES (2, 183);
INSERT INTO `system_role_menu`
VALUES (1, 184);
INSERT INTO `system_role_menu`
VALUES (2, 184);
INSERT INTO `system_role_menu`
VALUES (1, 185);
INSERT INTO `system_role_menu`
VALUES (2, 185);
INSERT INTO `system_role_menu`
VALUES (1, 186);
INSERT INTO `system_role_menu`
VALUES (1, 187);
INSERT INTO `system_role_menu`
VALUES (1, 188);
INSERT INTO `system_role_menu`
VALUES (1, 189);
INSERT INTO `system_role_menu`
VALUES (1, 190);
INSERT INTO `system_role_menu`
VALUES (1, 191);
INSERT INTO `system_role_menu`
VALUES (1, 192);
INSERT INTO `system_role_menu`
VALUES (2, 192);
INSERT INTO `system_role_menu`
VALUES (1, 193);
INSERT INTO `system_role_menu`
VALUES (1, 194);
INSERT INTO `system_role_menu`
VALUES (2, 194);

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
-- Table structure for system_tx_exception
-- ----------------------------
DROP TABLE IF EXISTS `system_tx_exception`;
CREATE TABLE `system_tx_exception`
(
    `id`                bigint(20)                                                      NOT NULL AUTO_INCREMENT COMMENT '系统事务日志id',
    `group_id`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    NULL DEFAULT NULL COMMENT '分租id',
    `unit_id`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    NULL DEFAULT NULL COMMENT '事务id',
    `mod_id`            varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '方法id',
    `transaction_state` tinyint(4)                                                      NULL DEFAULT NULL COMMENT '事务状态',
    `registrar`         tinyint(4)                                                      NULL DEFAULT NULL COMMENT '是否创建',
    `ex_state`          tinyint(4)                                                      NULL DEFAULT NULL COMMENT '0 待处理 1已处理',
    `remark`            varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time`       datetime                                                        NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '系统事务日志'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_tx_exception
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
  AUTO_INCREMENT = 17
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user`
VALUES (1, 'MrBird', '$2a$10$gzhiUb1ldc1Rf3lka4k/WOoFKKGPepHSzJxzcPSN5/65SzkMdc.SK', 2, 'mrbird@qq.com', '17788888888',
        '1', '2019-06-14 20:39:22', '2020-04-15 16:00:32', '2020-04-15 16:03:13', '0', '1', 'white',
        'gaOngJwsRYRaVAuXXcmB.png', '我是帅比作者。');
INSERT INTO `system_user`
VALUES (15, 'scott', '$2a$10$7tATi2STciLHnEgO/RfIxOYf2MQBu/SDVMRDs54rlSYVj2VmwwCHC', 5, 'scott@hotmail.com',
        '17720888888', '1', '2019-07-20 19:00:32', '2020-04-15 16:00:42', '2020-04-14 16:49:27', '2', NULL, NULL,
        'BiazfanxmamNRoxxVxka.png', NULL);
INSERT INTO `system_user`
VALUES (16, 'Jane', '$2a$10$ECkfipOPY7hORVdlSzIOX.8hnig0shAZQPG8pQ7D5iVP.uVogmmHy', 4, 'Jane@hotmail.com',
        '13489898989', '1', '2019-09-01 10:31:21', '2020-04-15 16:00:48', '2019-09-01 10:32:27', '1', NULL, NULL,
        '2dd7a2d09fa94bf8b5c52e5318868b4d9.jpg', NULL);

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
VALUES (15, 1);
INSERT INTO `system_user_data_permission`
VALUES (15, 2);
INSERT INTO `system_user_data_permission`
VALUES (16, 4);
INSERT INTO `system_user_data_permission`
VALUES (16, 5);

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
VALUES (15, 2);
INSERT INTO `system_user_role`
VALUES (16, 3);

SET FOREIGN_KEY_CHECKS = 1;
