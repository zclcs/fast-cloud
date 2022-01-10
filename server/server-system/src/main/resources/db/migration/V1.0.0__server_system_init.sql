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

 Date: 05/01/2022 10:50:22
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
    `authorities`             varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拥有的系统权限',
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
-- Table structure for system_black_list
-- ----------------------------
DROP TABLE IF EXISTS `system_black_list`;
CREATE TABLE `system_black_list`
(
    `black_id`       bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '黑名单id',
    `black_ip`       varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '黑名单ip',
    `request_uri`    varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求uri（支持通配符）',
    `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '请求方法，如果为ALL则表示对所有方法生效',
    `limit_from`     varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '限制时间起',
    `limit_to`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '限制时间止',
    `location`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip对应地址',
    `black_status`   varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '1' COMMENT '黑名单状态 默认 1 @@enable_disable',
    `create_time`    datetime                                                NOT NULL COMMENT '创建时间',
    `modify_time`    datetime                                                NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`black_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '黑名单表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_black_list
-- ----------------------------
INSERT INTO `system_black_list`
VALUES (7, NULL, '/actuator/**', 'ALL', '00:00:00', '23:59:59', NULL, '1', '2022-01-05 10:23:50',
        '2022-01-05 10:23:50');

-- ----------------------------
-- Table structure for system_block_log
-- ----------------------------
DROP TABLE IF EXISTS `system_block_log`;
CREATE TABLE `system_block_log`
(
    `block_id`       bigint(20)                                              NOT NULL AUTO_INCREMENT COMMENT '拦截日志id',
    `block_ip`       varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拦截ip',
    `request_uri`    varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被拦截请求URI',
    `request_method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被拦截请求方法',
    `location`       varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP对应地址',
    `create_time`    datetime                                                NOT NULL COMMENT '创建时间',
    `modify_time`    datetime                                                NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`block_id`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '黑名单拦截日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_block_log
-- ----------------------------

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
VALUES (4, 0, '市场部', 2, '2018-01-04 15:42:36', '2021-09-10 15:14:54');
INSERT INTO `system_dept`
VALUES (5, 0, '人事部', 3, '2018-01-04 15:42:32', '2019-01-23 06:27:59');
INSERT INTO `system_dept`
VALUES (6, 0, '测试部', 4, '2018-01-04 15:42:38', '2019-01-17 08:15:47');

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
  AUTO_INCREMENT = 45
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户操作日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log`
VALUES (1, 'zclcs', '新增菜单/按钮', 1774, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=1, menuName=客户端管理, path=client, component=/cloud/system/client/index, redirect=null, perms=null, icon=ant-design:paper-clip-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=7.0)\"',
        '192.168.33.1', '2021-12-23 09:54:41', '');
INSERT INTO `system_log`
VALUES (2, 'zclcs', '新增菜单/按钮', 87, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=62, menuName=添加, path=null, component=null, redirect=null, perms=client:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '192.168.33.1', '2021-12-23 09:56:46', '');
INSERT INTO `system_log`
VALUES (3, 'zclcs', '新增菜单/按钮', 119, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=62, menuName=更新, path=null, component=null, redirect=null, perms=client:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '192.168.33.1', '2021-12-23 09:57:30', '');
INSERT INTO `system_log`
VALUES (4, 'zclcs', '新增菜单/按钮', 104, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=62, menuName=删除, path=null, component=null, redirect=null, perms=client:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '192.168.33.1', '2021-12-23 09:57:54', '');
INSERT INTO `system_log`
VALUES (5, 'zclcs', '新增菜单/按钮', 129, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=62, menuName=查看, path=null, component=null, redirect=null, perms=client:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '192.168.33.1', '2021-12-23 09:58:30', '');
INSERT INTO `system_log`
VALUES (6, 'zclcs', '新增菜单/按钮', 96, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=62, menuName=获取密钥, path=null, component=null, redirect=null, perms=client:decrypt, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '192.168.33.1', '2021-12-23 09:58:57', '');
INSERT INTO `system_log`
VALUES (7, 'zclcs', '修改角色', 169, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[29, 28, 30, 5, 2, 6, 7, 8, 9, 20, 3, 15, 12, 16, 22, 23, 11, 10, 13, 14, 24, 17, 4, 18, 19, 25, 27, 26, 58, 57, 48, 59, 60, 51, 49, 52, 53, 54, 50, 55, 56, 34, 32, 31, 35, 36, 33, 37, 41, 39, 38, 42, 43, 44, 40, 45, 46, 47, 62, 63, 64, 65, 66, 67, 1])\"',
        '192.168.33.1', '2021-12-23 10:24:55', '');
INSERT INTO `system_log`
VALUES (8, 'zclcs', '修改角色', 1156, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[1, 2, 5, 6, 7, 8, 9, 20, 3, 12, 15, 16, 22, 23, 10, 11, 13, 14, 24, 4, 17, 18, 19, 25, 26, 27, 48, 57, 58, 59, 60, 49, 51, 52, 53, 50, 54, 55, 56, 62, 63, 64, 65, 66, 67, 28, 29, 30, 31, 32, 34, 35, 33, 36, 37, 38, 39, 41, 42, 43, 40, 44, 45, 46, 47])\"',
        '192.168.33.1', '2021-12-23 11:52:08', '');
INSERT INTO `system_log`
VALUES (9, 'zclcs', '新增菜单/按钮', 1084, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=70, menuName=新增限流规则, path=null, component=null, redirect=null, perms=rateLimitRule:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2021-12-31 16:22:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (10, 'zclcs', '新增菜单/按钮', 41, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=70, menuName=删除限流规则, path=null, component=null, redirect=null, perms=rateLimitRule:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2021-12-31 16:23:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (11, 'zclcs', '新增菜单/按钮', 32, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=70, menuName=修改限流规则, path=null, component=null, redirect=null, perms=rateLimitRule:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2021-12-31 16:23:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (12, 'zclcs', '新增菜单/按钮', 44, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=70, menuName=查看, path=null, component=null, redirect=null, perms=rateLimitRule:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2021-12-31 16:23:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (13, 'zclcs', '修改角色', 80, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[29, 28, 30, 5, 2, 1, 6, 7, 8, 9, 20, 3, 15, 12, 16, 22, 23, 11, 10, 13, 14, 24, 17, 4, 18, 19, 25, 27, 26, 58, 57, 48, 59, 60, 51, 49, 52, 53, 54, 50, 55, 56, 63, 62, 64, 65, 66, 67, 74, 69, 75, 71, 72, 73, 34, 32, 31, 35, 36, 33, 37, 41, 39, 38, 42, 43, 44, 40, 45, 46, 47, 68, 70, 76, 77, 78, 79])\"',
        '127.0.0.1', '2021-12-31 16:23:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (14, 'zclcs', '新增限流规则', 46, 'com.zclcs.server.system.controller.RateLimitRuleController.addRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=null, requestUri=/auth/captcha, requestMethod=GET, limitFrom=2021-12-31 00:00:00, limitTo=2021-12-31 23:59:59, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2021-12-31 16:46:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (15, 'zclcs', '修改限流规则', 1372, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=1, requestUri=/auth/captcha, requestMethod=GET, limitFrom=2021-12-31 00:00:00, limitTo=23:59:59, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 08:59:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (16, 'zclcs', '修改限流规则', 32, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=1, requestUri=/auth/captcha, requestMethod=GET, limitFrom=00:00:00, limitTo=23:59:59, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 09:00:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (17, 'zclcs', '修改限流规则', 48, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=1, requestUri=/auth/captcha, requestMethod=GET, limitFrom=null, limitTo=null, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 09:06:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (18, 'zclcs', '修改限流规则', 1265, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=1, requestUri=/auth/captcha, requestMethod=GET, limitFrom=null, limitTo=null, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 09:10:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (19, 'zclcs', '修改限流规则', 76, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=1, requestUri=/auth/captcha, requestMethod=GET, limitFrom=08:00:37, limitTo=09:05:40, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 10:06:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (20, 'zclcs', '修改限流规则', 46, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=1, requestUri=/auth/captcha, requestMethod=GET, limitFrom=08:00:37, limitTo=12:07:42, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 10:07:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (21, 'zclcs', '新增菜单/按钮', 996, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=71, menuName=查询, path=null, component=null, redirect=null, perms=rateLimitLog:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2022-01-04 10:55:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (22, 'zclcs', '新增菜单/按钮', 37, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=71, menuName=删除限流拦截日志, path=null, component=null, redirect=null, perms=rateLimitLog:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2022-01-04 10:56:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (23, 'zclcs', '新增菜单/按钮', 45, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=72, menuName=查看, path=null, component=null, redirect=null, perms=blackList:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2022-01-04 10:57:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (24, 'zclcs', '新增菜单/按钮', 59, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=72, menuName=新增, path=null, component=null, redirect=null, perms=blackList:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2022-01-04 10:57:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (25, 'zclcs', '新增菜单/按钮', 36, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=72, menuName=修改, path=null, component=null, redirect=null, perms=blackList:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2022-01-04 10:57:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (26, 'zclcs', '新增菜单/按钮', 35, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=72, menuName=删除, path=null, component=null, redirect=null, perms=blackList:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2022-01-04 10:58:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (27, 'zclcs', '新增菜单/按钮', 33, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=73, menuName=查看, path=null, component=null, redirect=null, perms=blockLog:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2022-01-04 10:59:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (28, 'zclcs', '新增菜单/按钮', 32, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=73, menuName=删除, path=null, component=null, redirect=null, perms=blockLog:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2022-01-04 10:59:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (29, 'zclcs', '修改角色', 111, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[29, 28, 30, 5, 2, 1, 6, 7, 8, 9, 20, 3, 12, 15, 16, 22, 23, 10, 11, 13, 14, 24, 4, 17, 18, 19, 25, 26, 27, 48, 57, 58, 59, 60, 49, 51, 52, 53, 50, 54, 55, 56, 62, 63, 64, 65, 66, 67, 34, 32, 31, 35, 33, 36, 37, 41, 39, 38, 42, 43, 40, 44, 45, 46, 47, 68, 69, 74, 75, 70, 76, 77, 78, 79, 71, 80, 81, 72, 82, 83, 84, 85, 73, 86, 87])\"',
        '127.0.0.1', '2022-01-04 10:59:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (30, 'zclcs', '修改限流规则', 49, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=1, requestUri=/auth/captcha, requestMethod=GET, limitFrom=08:00:37, limitTo=12:07:42, rateLimitCount=5, intervalSec=60, ruleStatus=0)\"',
        '127.0.0.1', '2022-01-04 11:09:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (31, 'zclcs', '修改限流规则', 43, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=1, requestUri=/auth/captcha, requestMethod=GET, limitFrom=null, limitTo=null, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 11:20:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (32, 'zclcs', '新增限流规则', 1046, 'com.zclcs.server.system.controller.RateLimitRuleController.addRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=null, requestUri=/uuu, requestMethod=GET, limitFrom=2022-01-04 00:00:00, limitTo=2022-01-04 23:59:59, rateLimitCount=5, intervalSec=20, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 16:53:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (33, 'zclcs', '修改限流规则', 58, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=2, requestUri=/uuu, requestMethod=GET, limitFrom=00:00:00, limitTo=23:59:59, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 16:54:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (34, 'zclcs', '修改限流规则', 48, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=2, requestUri=/uuu, requestMethod=GET, limitFrom=00:00:00, limitTo=23:59:59, rateLimitCount=5, intervalSec=80, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 16:54:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (35, 'zclcs', '删除限流规则', 57, 'com.zclcs.server.system.controller.RateLimitRuleController.deleteRateLimitRule()',
        ' rateLimitRuleIds: \"2\"', '127.0.0.1', '2022-01-04 16:54:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (36, 'zclcs', '新增限流规则', 40, 'com.zclcs.server.system.controller.RateLimitRuleController.addRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=null, requestUri=/opp, requestMethod=POST, limitFrom=2022-01-04 00:00:00, limitTo=2022-01-04 23:59:59, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 17:00:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (37, 'zclcs', '修改限流规则', 40, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=3, requestUri=/opp, requestMethod=POST, limitFrom=00:00:00, limitTo=23:59:59, rateLimitCount=5, intervalSec=80, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 17:00:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (38, 'zclcs', '删除限流规则', 40, 'com.zclcs.server.system.controller.RateLimitRuleController.deleteRateLimitRule()',
        ' rateLimitRuleIds: \"3\"', '127.0.0.1', '2022-01-04 17:01:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (39, 'zclcs', '新增限流规则', 1050, 'com.zclcs.server.system.controller.RateLimitRuleController.addRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=null, requestUri=/okl, requestMethod=ALL, limitFrom=2022-01-04 00:00:00, limitTo=2022-01-04 23:59:59, rateLimitCount=6, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 17:04:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (40, 'zclcs', '修改限流规则', 62, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=4, requestUri=/okl, requestMethod=ALL, limitFrom=00:00:00, limitTo=23:59:59, rateLimitCount=6, intervalSec=900, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-04 17:04:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (41, 'zclcs', '删除限流规则', 63, 'com.zclcs.server.system.controller.RateLimitRuleController.deleteRateLimitRule()',
        ' rateLimitRuleIds: \"4\"', '127.0.0.1', '2022-01-04 17:04:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (42, 'zclcs', '修改限流规则', 1009, 'com.zclcs.server.system.controller.RateLimitRuleController.updateRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=1, requestUri=/auth/captcha, requestMethod=GET, limitFrom=null, limitTo=null, rateLimitCount=5, intervalSec=80, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-05 09:37:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (43, 'zclcs', '删除限流规则', 44, 'com.zclcs.server.system.controller.RateLimitRuleController.deleteRateLimitRule()',
        ' rateLimitRuleIds: \"1\"', '127.0.0.1', '2022-01-05 09:37:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (44, 'zclcs', '新增限流规则', 87, 'com.zclcs.server.system.controller.RateLimitRuleController.addRateLimitRule()',
        ' rateLimitRuleAo: \"RateLimitRuleAo(rateLimitRuleId=null, requestUri=/auth/captcha, requestMethod=GET, limitFrom=2022-01-05 00:00:00, limitTo=2022-01-05 23:59:59, rateLimitCount=5, intervalSec=60, ruleStatus=1)\"',
        '127.0.0.1', '2022-01-05 09:38:53', '内网IP|0|0|内网IP|内网IP');

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
    `menu_id`               bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮id',
    `parent_id`             bigint(20)                                                    NOT NULL COMMENT '上级菜单id',
    `menu_name`             varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci        NOT NULL COMMENT '目录/菜单/按钮名称',
    `path`                  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT NULL COMMENT '对应路由path',
    `component`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT NULL COMMENT '对应路由组件component',
    `redirect`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '打开目录重定向的子菜单',
    `perms`                 varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci        NULL     DEFAULT NULL COMMENT '权限标识',
    `icon`                  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci        NULL     DEFAULT NULL COMMENT '图标',
    `type`                  char(40) CHARACTER SET utf8 COLLATE utf8_general_ci           NOT NULL COMMENT '类型 0菜单 1按钮 2目录',
    `hide_menu`             char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL DEFAULT '0' COMMENT '是否隐藏菜单 1是 0否',
    `ignore_keep_alive`     char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL DEFAULT '0' COMMENT '是否忽略KeepAlive缓存 1是 0否',
    `hide_breadcrumb`       char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL DEFAULT '0' COMMENT '隐藏该路由在面包屑上面的显示 1是 0否',
    `hide_children_in_menu` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL DEFAULT '0' COMMENT '隐藏所有子菜单 1是 0否',
    `current_active_menu`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '当前激活的菜单。用于配置详情页时左侧激活的菜单路径',
    `order_num`             double(20, 0)                                                 NULL     DEFAULT NULL COMMENT '排序',
    `create_time`           datetime                                                      NOT NULL COMMENT '创建时间',
    `modify_time`           datetime                                                      NULL     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`menu_id`) USING BTREE,
    INDEX `system_menu_parent_id` (`parent_id`) USING BTREE,
    INDEX `system_menu_menu_id` (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 88
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '菜单表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu`
VALUES (1, 0, '系统管理', '/system', 'Layout', NULL, NULL, 'ant-design:setting-outlined', '2', '0', '0', '0', '0', NULL, 2,
        '2017-12-27 16:39:07', '2021-09-15 09:55:30');
INSERT INTO `system_menu`
VALUES (2, 1, '用户管理', 'user', '/cloud/system/user/index', NULL, '', 'ant-design:user-switch-outlined', '0', '0', '0',
        '0', '0', NULL, 1, '2017-12-27 16:47:13', '2021-09-13 14:31:34');
INSERT INTO `system_menu`
VALUES (3, 1, '用户详情页面', 'accountDetail/:username', '/cloud/system/user/AccountDetail', NULL, 'user:detail:view',
        'ant-design:audit-outlined', '0', '1', '1', '0', '0', NULL, 2, '2021-09-02 09:40:08', '2021-09-10 15:23:24');
INSERT INTO `system_menu`
VALUES (4, 1, '部门管理', 'dept', '/cloud/system/dept/index', NULL, '', 'ant-design:apartment-outlined', '0', '0', '0', '0',
        '0', NULL, 4, '2021-09-02 11:56:30', '2021-09-13 14:40:35');
INSERT INTO `system_menu`
VALUES (5, 2, '添加用户', NULL, NULL, NULL, 'user:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-03 10:07:35',
        '2021-09-10 10:33:20');
INSERT INTO `system_menu`
VALUES (6, 2, '修改用户', NULL, NULL, NULL, 'user:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-07 09:02:52',
        NULL);
INSERT INTO `system_menu`
VALUES (7, 2, '删除用户', NULL, NULL, NULL, 'user:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-07 09:57:45',
        NULL);
INSERT INTO `system_menu`
VALUES (8, 2, '查看用户操作日志', NULL, NULL, NULL, 'log:view', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-09-07 11:26:50', NULL);
INSERT INTO `system_menu`
VALUES (9, 2, '重置用户密码', NULL, NULL, NULL, 'user:reset', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-09-07 15:16:32', NULL);
INSERT INTO `system_menu`
VALUES (10, 1, '菜单管理', 'menu', '/cloud/system/menu/index', NULL, '', 'ant-design:menu-fold-outlined', '0', '0', '0',
        '0', '0', NULL, 3, '2021-09-08 10:55:14', '2021-09-13 14:39:35');
INSERT INTO `system_menu`
VALUES (11, 10, '添加菜单', NULL, NULL, NULL, 'menu:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-08 15:08:38',
        NULL);
INSERT INTO `system_menu`
VALUES (12, 1, '角色管理', 'role', '/cloud/system/role/index', NULL, '', 'ant-design:solution-outlined', '0', '0', '0', '0',
        '0', NULL, 2, '2021-09-08 15:11:16', '2021-09-13 14:35:06');
INSERT INTO `system_menu`
VALUES (13, 10, '修改菜单', NULL, NULL, NULL, 'menu:update', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-09-08 15:34:15', NULL);
INSERT INTO `system_menu`
VALUES (14, 10, '删除菜单', NULL, NULL, NULL, 'menu:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-09-09 09:09:49', '2021-09-09 10:29:08');
INSERT INTO `system_menu`
VALUES (15, 12, '添加角色', NULL, NULL, NULL, 'role:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-09 11:26:56',
        NULL);
INSERT INTO `system_menu`
VALUES (16, 12, '修改角色', NULL, NULL, NULL, 'role:update', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-09-09 11:33:34', NULL);
INSERT INTO `system_menu`
VALUES (17, 4, '添加部门', NULL, NULL, NULL, 'dept:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-10 14:28:37',
        NULL);
INSERT INTO `system_menu`
VALUES (18, 4, '修改部门', NULL, NULL, NULL, 'dept:update', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-09-10 14:29:25', '2021-09-10 14:29:58');
INSERT INTO `system_menu`
VALUES (19, 4, '删除部门', NULL, NULL, NULL, 'dept:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-09-10 14:30:26', NULL);
INSERT INTO `system_menu`
VALUES (20, 2, '查看用户', NULL, NULL, NULL, 'user:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-13 14:30:24',
        NULL);
INSERT INTO `system_menu`
VALUES (22, 12, '删除角色', NULL, NULL, NULL, 'role:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-09-13 14:34:24', NULL);
INSERT INTO `system_menu`
VALUES (23, 12, '查看角色', NULL, NULL, NULL, 'role:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-13 14:37:57',
        NULL);
INSERT INTO `system_menu`
VALUES (24, 10, '查看菜单', NULL, NULL, NULL, 'menu:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-13 14:38:32',
        '2021-09-13 14:38:50');
INSERT INTO `system_menu`
VALUES (25, 4, '查看部门', NULL, NULL, NULL, 'dept:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-13 14:40:23',
        NULL);
INSERT INTO `system_menu`
VALUES (26, 1, '重置密码', 'password', '/cloud/system/password/index', NULL, NULL, 'ant-design:radius-setting-outlined',
        '0', '0', '0', '0', '0', NULL, 5, '2021-09-13 16:39:16', NULL);
INSERT INTO `system_menu`
VALUES (27, 26, '重置密码', NULL, NULL, NULL, 'user:reset', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-09-13 16:39:58', NULL);
INSERT INTO `system_menu`
VALUES (28, 0, '首页', '/dashboard', 'Layout', '/dashboard/analysis', NULL, 'ant-design:align-left-outlined', '2', '0',
        '1', '1', '0', NULL, 1, '2021-09-14 17:19:07', '2021-09-15 09:58:49');
INSERT INTO `system_menu`
VALUES (29, 28, '分析页', 'analysis', '/dashboard/analysis/index', NULL, NULL, 'ant-design:amazon-outlined', '0', '0', '0',
        '1', '0', '/dashboard', 1, '2021-09-14 17:28:01', '2021-09-15 09:59:08');
INSERT INTO `system_menu`
VALUES (30, 28, '工作台', 'workbench', '/dashboard/workbench/index', NULL, NULL, 'ant-design:alert-filled', '0', '0', '0',
        '1', '0', '/dashboard', 2, '2021-09-14 17:28:37', '2021-09-15 09:59:16');
INSERT INTO `system_menu`
VALUES (31, 0, '快速开发', '/gen', 'Layout', NULL, NULL, 'ant-design:code-filled', '2', '0', '0', '0', '0', NULL, 4,
        '2021-10-11 17:30:38', '2021-12-31 09:19:14');
INSERT INTO `system_menu`
VALUES (32, 31, '代码生成配置管理', 'config', '/cloud/gen/config/index', NULL, NULL, 'ant-design:contacts-outlined', '0', '0',
        '0', '0', '0', NULL, 1, '2021-10-11 17:32:55', '2021-11-03 09:00:20');
INSERT INTO `system_menu`
VALUES (33, 31, '代码生成', 'gen', '/cloud/gen/gen/index', NULL, NULL, 'ant-design:code-sandbox-outlined', '0', '0', '0',
        '0', '0', NULL, 2, '2021-10-12 09:05:22', '2021-11-03 09:00:05');
INSERT INTO `system_menu`
VALUES (34, 32, '查看代码生成配置', NULL, NULL, NULL, 'gen:config', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-10-12 15:30:37', '2021-10-12 15:32:46');
INSERT INTO `system_menu`
VALUES (35, 32, '修改代码生成配置', NULL, NULL, NULL, 'gen:config:update', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-10-12 15:31:00', NULL);
INSERT INTO `system_menu`
VALUES (36, 33, '查看代码生成', NULL, NULL, NULL, 'gen:generate', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-10-12 15:32:24', NULL);
INSERT INTO `system_menu`
VALUES (37, 33, '生成代码', NULL, NULL, NULL, 'gen:generate:gen', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-10-12 15:36:02', NULL);
INSERT INTO `system_menu`
VALUES (38, 0, '文件管理', '/file', 'Layout', NULL, NULL, 'ant-design:file-add-filled', '2', '1', '0', '1', '1', NULL, 5,
        '2021-10-25 10:36:11', '2021-12-31 09:19:24');
INSERT INTO `system_menu`
VALUES (39, 38, '桶', '/file/bucket', NULL, NULL, NULL, 'ant-design:tags-filled', '0', '1', '0', '0', '0', NULL, 1,
        '2021-10-25 10:37:56', NULL);
INSERT INTO `system_menu`
VALUES (40, 38, '文件', '/file/file', NULL, NULL, NULL, 'ant-design:file-unknown-twotone', '0', '1', '0', '0', '0', NULL,
        2, '2021-10-25 10:38:42', NULL);
INSERT INTO `system_menu`
VALUES (41, 39, '添加桶', NULL, NULL, NULL, 'bucket:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-25 10:39:51',
        NULL);
INSERT INTO `system_menu`
VALUES (42, 39, '删除桶', NULL, NULL, NULL, 'bucket:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-10-25 10:40:15', NULL);
INSERT INTO `system_menu`
VALUES (43, 39, '查看桶', NULL, NULL, NULL, 'bucket:view', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-10-25 10:40:36', NULL);
INSERT INTO `system_menu`
VALUES (44, 40, '添加文件', NULL, NULL, NULL, 'file:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-25 10:41:54',
        NULL);
INSERT INTO `system_menu`
VALUES (45, 40, '删除文件', NULL, NULL, NULL, 'file:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-10-25 10:42:18', NULL);
INSERT INTO `system_menu`
VALUES (46, 40, '查看文件', NULL, NULL, NULL, 'file:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-25 10:42:37',
        NULL);
INSERT INTO `system_menu`
VALUES (47, 40, '下载文件', NULL, NULL, NULL, 'file:download', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-10-25 10:43:14', NULL);
INSERT INTO `system_menu`
VALUES (48, 1, '字典管理', 'dict', '', NULL, NULL, 'ant-design:medicine-box-filled', '0', '0', '0', '0', '0', NULL, 6,
        '2021-11-03 09:04:26', '2021-11-03 09:05:13');
INSERT INTO `system_menu`
VALUES (49, 48, '字典', 'dict', '/cloud/system/dict/dict/index', NULL, NULL, 'ant-design:medicine-box-outlined', '0', '0',
        '0', '0', '0', NULL, 2, '2021-11-03 09:06:09', '2021-11-03 14:34:35');
INSERT INTO `system_menu`
VALUES (50, 48, '层级字典', 'dict/level', '/cloud/system/dict/level/index', NULL, NULL, 'ant-design:medicine-box-twotone',
        '0', '0', '0', '0', '0', NULL, 3, '2021-11-03 09:06:59', '2021-11-03 14:34:20');
INSERT INTO `system_menu`
VALUES (51, 49, '添加字典', NULL, NULL, NULL, 'table:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-11-03 09:07:40',
        NULL);
INSERT INTO `system_menu`
VALUES (52, 49, '修改字典', NULL, NULL, NULL, 'table:update', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-11-03 09:08:13', NULL);
INSERT INTO `system_menu`
VALUES (53, 49, '删除字典', NULL, NULL, NULL, 'table:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-11-03 09:08:47', NULL);
INSERT INTO `system_menu`
VALUES (54, 50, '新增层级字典', NULL, NULL, NULL, 'tableLevel:add', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-11-03 09:27:36', '2021-11-03 09:28:04');
INSERT INTO `system_menu`
VALUES (55, 50, '删除层级字典', NULL, NULL, NULL, 'tableLevel:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-11-03 09:28:32', NULL);
INSERT INTO `system_menu`
VALUES (56, 50, '修改层级字典', NULL, NULL, NULL, 'tableLevel:update', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-11-03 09:29:14', NULL);
INSERT INTO `system_menu`
VALUES (57, 48, '字典表', 'table', '/cloud/system/dict/table/index', NULL, NULL, 'ant-design:table-outlined', '0', '0',
        '0', '0', '0', NULL, 1, '2021-11-03 14:33:58', NULL);
INSERT INTO `system_menu`
VALUES (58, 57, '新增字典名表', NULL, NULL, NULL, 'tableName:add', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-11-03 14:35:36', NULL);
INSERT INTO `system_menu`
VALUES (59, 57, '删除字典名表', NULL, NULL, NULL, 'tableName:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-11-03 14:36:00', NULL);
INSERT INTO `system_menu`
VALUES (60, 57, '修改字典名表', NULL, NULL, NULL, 'tableName:update', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-11-03 14:36:22', NULL);
INSERT INTO `system_menu`
VALUES (62, 1, '客户端管理', 'client', '/cloud/system/client/index', NULL, NULL, 'ant-design:paper-clip-outlined', '0', '0',
        '0', '0', '0', NULL, 7, '2021-12-23 09:54:40', NULL);
INSERT INTO `system_menu`
VALUES (63, 62, '添加', NULL, NULL, NULL, 'client:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-12-23 09:56:46',
        NULL);
INSERT INTO `system_menu`
VALUES (64, 62, '更新', NULL, NULL, NULL, 'client:update', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-12-23 09:57:30', NULL);
INSERT INTO `system_menu`
VALUES (65, 62, '删除', NULL, NULL, NULL, 'client:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-12-23 09:57:54', NULL);
INSERT INTO `system_menu`
VALUES (66, 62, '查看', NULL, NULL, NULL, 'client:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-12-23 09:58:30',
        NULL);
INSERT INTO `system_menu`
VALUES (67, 62, '获取密钥', NULL, NULL, NULL, 'client:decrypt', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-12-23 09:58:57', NULL);
INSERT INTO `system_menu`
VALUES (68, 0, '网关管理', '/route', 'Layout', NULL, NULL, 'ant-design:gateway-outlined', '2', '0', '0', '0', '0', NULL, 3,
        '2021-12-31 09:18:55', NULL);
INSERT INTO `system_menu`
VALUES (69, 68, '网关日志', 'log', '/cloud/route/log/index', NULL, NULL, 'ant-design:login-outlined', '0', '0', '0', '0',
        '0', NULL, 1, '2021-12-31 09:32:24', NULL);
INSERT INTO `system_menu`
VALUES (70, 68, '限流规则', 'rate/rule', '/cloud/route/rate/rule/index', NULL, NULL, 'ant-design:alert-filled', '0', '0',
        '0', '0', '0', NULL, 2, '2021-12-31 09:36:04', NULL);
INSERT INTO `system_menu`
VALUES (71, 68, '限流日志', 'rate/log', '/cloud/route/rate/log/index', NULL, NULL, 'ant-design:ant-design-outlined', '0',
        '0', '0', '0', '0', NULL, 3, '2021-12-31 09:37:18', NULL);
INSERT INTO `system_menu`
VALUES (72, 68, '黑名单管理', 'black', '/cloud/route/black/index', NULL, NULL, 'ant-design:eye-invisible-filled', '0', '0',
        '0', '0', '0', NULL, 4, '2021-12-31 09:39:25', NULL);
INSERT INTO `system_menu`
VALUES (73, 68, '黑名单日志', 'block', '/cloud/route/block/index', NULL, NULL, 'ant-design:tablet-outlined', '0', '0', '0',
        '0', '0', NULL, 5, '2021-12-31 09:40:29', '2021-12-31 09:41:30');
INSERT INTO `system_menu`
VALUES (74, 69, '查看', NULL, NULL, NULL, 'routeLog:view', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-12-31 10:16:54', NULL);
INSERT INTO `system_menu`
VALUES (75, 69, '删除', NULL, NULL, NULL, 'routeLog:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-12-31 10:17:18', NULL);
INSERT INTO `system_menu`
VALUES (76, 70, '新增限流规则', NULL, NULL, NULL, 'rateLimitRule:add', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-12-31 16:22:35', NULL);
INSERT INTO `system_menu`
VALUES (77, 70, '删除限流规则', NULL, NULL, NULL, 'rateLimitRule:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-12-31 16:23:02', NULL);
INSERT INTO `system_menu`
VALUES (78, 70, '修改限流规则', NULL, NULL, NULL, 'rateLimitRule:update', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-12-31 16:23:21', NULL);
INSERT INTO `system_menu`
VALUES (79, 70, '查看', NULL, NULL, NULL, 'rateLimitRule:view', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2021-12-31 16:23:41', NULL);
INSERT INTO `system_menu`
VALUES (80, 71, '查询', NULL, NULL, NULL, 'rateLimitLog:view', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2022-01-04 10:55:58', NULL);
INSERT INTO `system_menu`
VALUES (81, 71, '删除限流拦截日志', NULL, NULL, NULL, 'rateLimitLog:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2022-01-04 10:56:29', NULL);
INSERT INTO `system_menu`
VALUES (82, 72, '查看', NULL, NULL, NULL, 'blackList:view', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2022-01-04 10:57:05', NULL);
INSERT INTO `system_menu`
VALUES (83, 72, '新增', NULL, NULL, NULL, 'blackList:add', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2022-01-04 10:57:33', NULL);
INSERT INTO `system_menu`
VALUES (84, 72, '修改', NULL, NULL, NULL, 'blackList:update', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2022-01-04 10:57:56', NULL);
INSERT INTO `system_menu`
VALUES (85, 72, '删除', NULL, NULL, NULL, 'blackList:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2022-01-04 10:58:24', NULL);
INSERT INTO `system_menu`
VALUES (86, 73, '查看', NULL, NULL, NULL, 'blockLog:view', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2022-01-04 10:59:03', NULL);
INSERT INTO `system_menu`
VALUES (87, 73, '删除', NULL, NULL, NULL, 'blockLog:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL,
        '2022-01-04 10:59:23', NULL);

-- ----------------------------
-- Table structure for system_rate_limit_log
-- ----------------------------
DROP TABLE IF EXISTS `system_rate_limit_log`;
CREATE TABLE `system_rate_limit_log`
(
    `rate_limit_log_id` bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '限流日志id',
    `rate_limit_log_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被拦截请求IP',
    `request_uri`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被拦截请求URI',
    `request_method`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被拦截请求方法',
    `location`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP对应地址',
    `create_time`       datetime                                                      NOT NULL COMMENT '创建时间',
    `modify_time`       datetime                                                      NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`rate_limit_log_id`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 18
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '限流拦截日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_rate_limit_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_rate_limit_rule
-- ----------------------------
DROP TABLE IF EXISTS `system_rate_limit_rule`;
CREATE TABLE `system_rate_limit_rule`
(
    `rate_limit_rule_id` bigint(20)                                                   NOT NULL AUTO_INCREMENT COMMENT '限流规则id',
    `request_uri`        varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '请求uri（不支持通配符）',
    `request_method`     varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL COMMENT '请求方法，如果为ALL则表示对所有方法生效',
    `limit_from`         varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL DEFAULT NULL COMMENT '限制时间起',
    `limit_to`           varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL DEFAULT NULL COMMENT '限制时间止',
    `rate_limit_count`   smallint(4)                                                  NOT NULL COMMENT '限制次数',
    `interval_sec`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '时间周期（单位秒）',
    `rule_status`        varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL DEFAULT '1' COMMENT '规则状态 默认 1 @@enable_disable',
    `create_time`        datetime                                                     NOT NULL COMMENT '创建时间',
    `modify_time`        datetime                                                     NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`rate_limit_rule_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '限流规则表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_rate_limit_rule
-- ----------------------------
INSERT INTO `system_rate_limit_rule`
VALUES (5, '/auth/captcha', 'GET', '00:00:00', '23:59:59', 5, '60', '1', '2022-01-05 09:38:53', '2022-01-05 09:38:53');

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
VALUES (1, '管理员', '管理员', '2017-12-27 16:23:11', '2022-01-04 10:59:51');
INSERT INTO `system_role`
VALUES (2, '查看', NULL, '2021-09-09 14:54:42', '2021-09-13 14:55:53');

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
INSERT INTO `system_role_menu`
VALUES (1, 20);
INSERT INTO `system_role_menu`
VALUES (2, 20);
INSERT INTO `system_role_menu`
VALUES (1, 22);
INSERT INTO `system_role_menu`
VALUES (1, 23);
INSERT INTO `system_role_menu`
VALUES (2, 23);
INSERT INTO `system_role_menu`
VALUES (1, 24);
INSERT INTO `system_role_menu`
VALUES (2, 24);
INSERT INTO `system_role_menu`
VALUES (1, 25);
INSERT INTO `system_role_menu`
VALUES (2, 25);
INSERT INTO `system_role_menu`
VALUES (1, 26);
INSERT INTO `system_role_menu`
VALUES (1, 27);
INSERT INTO `system_role_menu`
VALUES (1, 28);
INSERT INTO `system_role_menu`
VALUES (1, 29);
INSERT INTO `system_role_menu`
VALUES (1, 30);
INSERT INTO `system_role_menu`
VALUES (1, 31);
INSERT INTO `system_role_menu`
VALUES (1, 32);
INSERT INTO `system_role_menu`
VALUES (1, 33);
INSERT INTO `system_role_menu`
VALUES (1, 34);
INSERT INTO `system_role_menu`
VALUES (1, 35);
INSERT INTO `system_role_menu`
VALUES (1, 36);
INSERT INTO `system_role_menu`
VALUES (1, 37);
INSERT INTO `system_role_menu`
VALUES (1, 38);
INSERT INTO `system_role_menu`
VALUES (1, 39);
INSERT INTO `system_role_menu`
VALUES (1, 40);
INSERT INTO `system_role_menu`
VALUES (1, 41);
INSERT INTO `system_role_menu`
VALUES (1, 42);
INSERT INTO `system_role_menu`
VALUES (1, 43);
INSERT INTO `system_role_menu`
VALUES (1, 44);
INSERT INTO `system_role_menu`
VALUES (1, 45);
INSERT INTO `system_role_menu`
VALUES (1, 46);
INSERT INTO `system_role_menu`
VALUES (1, 47);
INSERT INTO `system_role_menu`
VALUES (1, 48);
INSERT INTO `system_role_menu`
VALUES (1, 49);
INSERT INTO `system_role_menu`
VALUES (1, 50);
INSERT INTO `system_role_menu`
VALUES (1, 51);
INSERT INTO `system_role_menu`
VALUES (1, 52);
INSERT INTO `system_role_menu`
VALUES (1, 53);
INSERT INTO `system_role_menu`
VALUES (1, 54);
INSERT INTO `system_role_menu`
VALUES (1, 55);
INSERT INTO `system_role_menu`
VALUES (1, 56);
INSERT INTO `system_role_menu`
VALUES (1, 57);
INSERT INTO `system_role_menu`
VALUES (1, 58);
INSERT INTO `system_role_menu`
VALUES (1, 59);
INSERT INTO `system_role_menu`
VALUES (1, 60);
INSERT INTO `system_role_menu`
VALUES (1, 62);
INSERT INTO `system_role_menu`
VALUES (1, 63);
INSERT INTO `system_role_menu`
VALUES (1, 64);
INSERT INTO `system_role_menu`
VALUES (1, 65);
INSERT INTO `system_role_menu`
VALUES (1, 66);
INSERT INTO `system_role_menu`
VALUES (1, 67);
INSERT INTO `system_role_menu`
VALUES (1, 68);
INSERT INTO `system_role_menu`
VALUES (1, 69);
INSERT INTO `system_role_menu`
VALUES (1, 70);
INSERT INTO `system_role_menu`
VALUES (1, 71);
INSERT INTO `system_role_menu`
VALUES (1, 72);
INSERT INTO `system_role_menu`
VALUES (1, 73);
INSERT INTO `system_role_menu`
VALUES (1, 74);
INSERT INTO `system_role_menu`
VALUES (1, 75);
INSERT INTO `system_role_menu`
VALUES (1, 76);
INSERT INTO `system_role_menu`
VALUES (1, 77);
INSERT INTO `system_role_menu`
VALUES (1, 78);
INSERT INTO `system_role_menu`
VALUES (1, 79);
INSERT INTO `system_role_menu`
VALUES (1, 80);
INSERT INTO `system_role_menu`
VALUES (1, 81);
INSERT INTO `system_role_menu`
VALUES (1, 82);
INSERT INTO `system_role_menu`
VALUES (1, 83);
INSERT INTO `system_role_menu`
VALUES (1, 84);
INSERT INTO `system_role_menu`
VALUES (1, 85);
INSERT INTO `system_role_menu`
VALUES (1, 86);
INSERT INTO `system_role_menu`
VALUES (1, 87);

-- ----------------------------
-- Table structure for system_route_log
-- ----------------------------
DROP TABLE IF EXISTS `system_route_log`;
CREATE TABLE `system_route_log`
(
    `route_id`       bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '网关转发日志id',
    `route_ip`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求ip',
    `request_uri`    varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL DEFAULT NULL COMMENT '请求uri',
    `target_uri`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目标uri',
    `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci        NULL DEFAULT NULL COMMENT '请求方法',
    `target_server`  varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '目标服务',
    `location`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL DEFAULT NULL COMMENT 'ip对应地址',
    `create_time`    datetime                                                      NOT NULL COMMENT '创建时间',
    `modify_time`    datetime                                                      NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`route_id`) USING BTREE
) ENGINE = MyISAM
  AUTO_INCREMENT = 1562
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '网关转发日志表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_route_log
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
VALUES (1, 'zclcs', '$2a$10$jW0seNaFSgT.Iimo5PWtPu7wumhjQv29vsNVxzLb5qYwuHdDIs7iK', 2, '2371219112@qq.com',
        '17788888888', '1', '2019-06-14 20:39:22', '2020-04-15 16:00:32', '2020-04-15 16:03:13', '0', '1', 'white',
        'gaOngJwsRYRaVAuXXcmB.png', '我是帅比作者。');
INSERT INTO `system_user`
VALUES (9, 'test', '$2a$10$6B71x6cxjOdsrLzydosAfuwiV5G5h7q2.4SoXERNy9A4u2mru8ora', 5, NULL, NULL, '1',
        '2021-09-08 09:19:38', '2021-09-13 14:19:49', NULL, NULL, NULL, NULL, 'default.jpg', NULL);

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
