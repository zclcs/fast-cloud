/*
 Navicat Premium Data Transfer

 Source Server         : docker_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : cloud_system

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 08/11/2021 10:39:53
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
  AUTO_INCREMENT = 8
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
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户操作日志表'
  ROW_FORMAT = DYNAMIC;

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
  AUTO_INCREMENT = 62
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
VALUES (31, 0, '快速开发', '/gen', 'Layout', NULL, NULL, 'ant-design:code-filled', '2', '0', '0', '0', '0', NULL, 3,
        '2021-10-11 17:30:38', NULL);
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
VALUES (38, 0, '文件管理', '/file', 'Layout', NULL, NULL, 'ant-design:file-add-filled', '2', '1', '0', '1', '1', NULL, 4,
        '2021-10-25 10:36:11', NULL);
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
VALUES (1, '管理员', '管理员', '2017-12-27 16:23:11', '2021-11-03 14:36:38');
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
