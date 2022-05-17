/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : dev_system

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 16/05/2022 18:13:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
CREATE TABLE `oauth_client_details`
(
    `client_id`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '客户端ID',
    `resource_ids`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '资源编号',
    `client_secret`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '客户端密钥',
    `scope`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '客户端权限',
    `authorized_grant_types`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '鉴权类型',
    `web_server_redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '跳转地址',
    `authorities`             varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '拥有的系统权限',
    `access_token_validity`   int(11)                                                        NOT NULL COMMENT 'token过期时间',
    `refresh_token_validity`  int(11)                                                        NULL DEFAULT NULL COMMENT 'token刷新时间',
    `additional_information`  varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '额外信息',
    `autoapprove`             tinyint(4)                                                     NULL DEFAULT NULL COMMENT '是否自动批准',
    `origin_secret`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '组织密码',
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
CREATE TABLE `system_dept`
(
    `dept_id`   bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '部门id',
    `parent_id` bigint(20)                                                    NOT NULL COMMENT '上级部门id',
    `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
    `order_num` double(20, 0)                                                 NULL     DEFAULT NULL COMMENT '排序',
    `version`   bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at` datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`dept_id`) USING BTREE,
    INDEX `system_dept_parent_id` (`parent_id`) USING BTREE,
    INDEX `system_dept_dept_name` (`dept_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '部门表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO `system_dept`
VALUES (1, 0, '开发部', 1, 1, NULL, '2022-05-16 11:46:52', NULL, NULL, NULL);
INSERT INTO `system_dept`
VALUES (2, 1, '开发一部', 1, 1, NULL, '2022-05-16 11:46:52', NULL, NULL, NULL);
INSERT INTO `system_dept`
VALUES (3, 1, '开发二部', 2, 1, NULL, '2022-05-16 11:46:52', NULL, NULL, NULL);
INSERT INTO `system_dept`
VALUES (4, 0, '市场部', 2, 1, NULL, '2022-05-16 11:46:52', NULL, NULL, NULL);
INSERT INTO `system_dept`
VALUES (5, 0, '人事部', 3, 1, NULL, '2022-05-16 11:46:52', NULL, NULL, NULL);
INSERT INTO `system_dept`
VALUES (6, 0, '测试部', 4, 1, NULL, '2022-05-16 11:46:52', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
CREATE TABLE `system_menu`
(
    `menu_id`               bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮id',
    `parent_id`             bigint(20)                                                    NOT NULL COMMENT '上级菜单id',
    `menu_name`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '目录/菜单/按钮名称',
    `keep_alive_name`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '页面缓存名称',
    `path`                  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '对应路由path',
    `component`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '对应路由组件component',
    `redirect`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '打开目录重定向的子菜单',
    `perms`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '权限标识',
    `icon`                  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '图标',
    `type`                  char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL COMMENT '类型 0菜单 1按钮 2目录',
    `hide_menu`             char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL DEFAULT '0' COMMENT '是否隐藏菜单 1是 0否',
    `ignore_keep_alive`     char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL DEFAULT '0' COMMENT '是否忽略KeepAlive缓存 1是 0否',
    `hide_breadcrumb`       char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL DEFAULT '0' COMMENT '隐藏该路由在面包屑上面的显示 1是 0否',
    `hide_children_in_menu` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL DEFAULT '0' COMMENT '隐藏所有子菜单 1是 0否',
    `current_active_menu`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '当前激活的菜单。用于配置详情页时左侧激活的菜单路径',
    `order_num`             double(20, 0)                                                 NULL     DEFAULT NULL COMMENT '排序',
    `version`               bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`             varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`             datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`             datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`             varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`             varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`menu_id`) USING BTREE,
    INDEX `system_menu_parent_id` (`parent_id`) USING BTREE,
    INDEX `system_menu_menu_id` (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 161
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '菜单表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu`
VALUES (1, 0, '系统管理', NULL, '/system', 'Layout', NULL, NULL, 'ant-design:setting-outlined', '2', '0', '0', '0', '0',
        NULL, 2, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (2, 1, '用户管理', 'AccountManagement', 'user', '/cloud/system/user/index', NULL, '',
        'ant-design:user-switch-outlined', '0', '0', '0', '0', '0', NULL, 1, 1, NULL, '2022-05-16 11:47:58', NULL, NULL,
        NULL);
INSERT INTO `system_menu`
VALUES (3, 1, '用户详情页面', 'AccountDetail', 'accountDetail/:username', '/cloud/system/user/AccountDetail', NULL,
        'user:detail:view', 'ant-design:audit-outlined', '0', '1', '1', '0', '0', NULL, 2, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (4, 1, '部门管理', 'DeptManagement', 'dept', '/cloud/system/dept/index', NULL, '', 'ant-design:apartment-outlined',
        '0', '0', '0', '0', '0', NULL, 4, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (5, 2, '添加用户', NULL, NULL, NULL, NULL, 'user:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (6, 2, '修改用户', NULL, NULL, NULL, NULL, 'user:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (7, 2, '删除用户', NULL, NULL, NULL, NULL, 'user:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (8, 2, '查看用户操作日志', NULL, NULL, NULL, NULL, 'userLog:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (9, 2, '重置用户密码', NULL, NULL, NULL, NULL, 'user:reset', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (10, 1, '菜单管理', 'MenuManagement', 'menu', '/cloud/system/menu/index', NULL, '', 'ant-design:menu-fold-outlined',
        '0', '0', '0', '0', '0', NULL, 3, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (11, 10, '添加菜单', NULL, NULL, NULL, NULL, 'menu:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (12, 1, '角色管理', 'RoleManagement', 'role', '/cloud/system/role/index', NULL, '', 'ant-design:solution-outlined',
        '0', '0', '0', '0', '0', NULL, 2, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (13, 10, '修改菜单', NULL, NULL, NULL, NULL, 'menu:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (14, 10, '删除菜单', NULL, NULL, NULL, NULL, 'menu:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (15, 12, '添加角色', NULL, NULL, NULL, NULL, 'role:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (16, 12, '修改角色', NULL, NULL, NULL, NULL, 'role:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (17, 4, '添加部门', NULL, NULL, NULL, NULL, 'dept:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (18, 4, '修改部门', NULL, NULL, NULL, NULL, 'dept:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (19, 4, '删除部门', NULL, NULL, NULL, NULL, 'dept:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (22, 12, '删除角色', NULL, NULL, NULL, NULL, 'role:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (26, 1, '重置密码', 'ChangePassword', 'password', '/cloud/system/password/index', NULL, 'user:view',
        'ant-design:radius-setting-outlined', '0', '0', '0', '0', '0', NULL, 5, 1, NULL, '2022-05-16 11:47:58', NULL,
        NULL, NULL);
INSERT INTO `system_menu`
VALUES (27, 26, '重置密码', NULL, NULL, NULL, NULL, 'user:reset', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (28, 0, '首页', NULL, '/dashboard', 'Layout', '/dashboard/analysis', NULL, 'ant-design:align-left-outlined', '2',
        '0', '1', '1', '0', NULL, 1, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (29, 28, '分析页', NULL, 'analysis', '/dashboard/analysis/index', NULL, NULL, 'ant-design:amazon-outlined', '0',
        '0', '0', '1', '0', '/dashboard', 1, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (30, 28, '工作台', NULL, 'workbench', '/dashboard/workbench/index', NULL, NULL, 'ant-design:alert-filled', '0', '0',
        '0', '1', '0', '/dashboard', 2, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (31, 0, '快速开发', NULL, '/gen', 'Layout', NULL, NULL, 'ant-design:code-filled', '2', '0', '0', '0', '0', NULL, 4,
        1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (32, 31, '代码生成配置管理', 'GenConfig', 'config', '/cloud/gen/config/index', NULL, 'gen:config',
        'ant-design:contacts-outlined', '0', '0', '0', '0', '0', NULL, 1, 1, NULL, '2022-05-16 11:47:58', NULL, NULL,
        NULL);
INSERT INTO `system_menu`
VALUES (33, 31, '代码生成', 'Gen', 'gen', '/cloud/gen/gen/index', NULL, 'gen:generate', 'ant-design:code-sandbox-outlined',
        '0', '0', '0', '0', '0', NULL, 2, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (35, 32, '修改代码生成配置', NULL, NULL, NULL, NULL, 'gen:config:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (37, 33, '生成代码', NULL, NULL, NULL, NULL, 'gen:generate:gen', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (38, 0, '文件管理', NULL, '/file', 'Layout', NULL, NULL, 'ant-design:file-add-filled', '2', '1', '0', '1', '1', NULL,
        5, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (39, 38, '桶', NULL, '/file/bucket', NULL, NULL, '', 'ant-design:tags-filled', '0', '1', '0', '0', '0', NULL, 1,
        1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (40, 38, '文件', NULL, '/file/file', NULL, NULL, '', 'ant-design:file-unknown-twotone', '0', '1', '0', '0', '0',
        NULL, 2, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (41, 39, '添加桶', NULL, NULL, NULL, NULL, 'bucket:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (42, 39, '删除桶', NULL, NULL, NULL, NULL, 'bucket:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (44, 40, '添加文件', NULL, NULL, NULL, NULL, 'file:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (45, 40, '删除文件', NULL, NULL, NULL, NULL, 'file:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (47, 40, '下载文件', NULL, NULL, NULL, NULL, 'file:download', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (48, 1, '字典管理', NULL, 'dict', '', NULL, NULL, 'ant-design:medicine-box-filled', '0', '0', '0', '0', '0', NULL, 6,
        1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (49, 48, '字典', 'DictTable', 'dict', '/cloud/system/dict/dict/index', NULL, '',
        'ant-design:medicine-box-outlined', '0', '0', '0', '0', '0', NULL, 2, 1, NULL, '2022-05-16 11:47:58', NULL,
        NULL, NULL);
INSERT INTO `system_menu`
VALUES (50, 48, '层级字典', 'DictLevelTable', 'dict/level', '/cloud/system/dict/level/index', NULL, '',
        'ant-design:medicine-box-twotone', '0', '0', '0', '0', '0', NULL, 3, 1, NULL, '2022-05-16 11:47:58', NULL, NULL,
        NULL);
INSERT INTO `system_menu`
VALUES (51, 49, '添加字典', NULL, NULL, NULL, NULL, 'table:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (52, 49, '修改字典', NULL, NULL, NULL, NULL, 'table:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (53, 49, '删除字典', NULL, NULL, NULL, NULL, 'table:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (54, 50, '新增层级字典', NULL, NULL, NULL, NULL, 'tableLevel:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (55, 50, '删除层级字典', NULL, NULL, NULL, NULL, 'tableLevel:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (56, 50, '修改层级字典', NULL, NULL, NULL, NULL, 'tableLevel:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (57, 48, '字典表', 'DictTableName', 'table', '/cloud/system/dict/table/index', NULL, '',
        'ant-design:table-outlined', '0', '0', '0', '0', '0', NULL, 1, 1, NULL, '2022-05-16 11:47:58', NULL, NULL,
        NULL);
INSERT INTO `system_menu`
VALUES (58, 57, '新增字典名表', NULL, NULL, NULL, NULL, 'tableName:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (59, 57, '删除字典名表', NULL, NULL, NULL, NULL, 'tableName:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (60, 57, '修改字典名表', NULL, NULL, NULL, NULL, 'tableName:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (62, 1, '客户端管理', 'Client', 'client', '/cloud/system/client/index', NULL, '', 'ant-design:paper-clip-outlined',
        '0', '0', '0', '0', '0', NULL, 7, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (63, 62, '添加', NULL, NULL, NULL, NULL, 'client:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (64, 62, '更新', NULL, NULL, NULL, NULL, 'client:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (65, 62, '删除', NULL, NULL, NULL, NULL, 'client:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (67, 62, '获取密钥', NULL, NULL, NULL, NULL, 'client:decrypt', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (68, 0, '网关管理', NULL, '/route', 'Layout', NULL, NULL, 'ant-design:gateway-outlined', '2', '0', '0', '0', '0',
        NULL, 3, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (69, 68, '网关日志', 'RouteLog', 'log', '/cloud/route/log/index', NULL, '', 'ant-design:login-outlined', '0', '0',
        '0', '0', '0', NULL, 1, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (70, 68, '限流规则', 'RateLimitRule', 'rate/rule', '/cloud/route/rate/rule/index', NULL, '',
        'ant-design:alert-filled', '0', '0', '0', '0', '0', NULL, 2, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (71, 68, '限流日志', 'RateLimitLog', 'rate/log', '/cloud/route/rate/log/index', NULL, '',
        'ant-design:ant-design-outlined', '0', '0', '0', '0', '0', NULL, 3, 1, NULL, '2022-05-16 11:47:58', NULL, NULL,
        NULL);
INSERT INTO `system_menu`
VALUES (72, 68, '黑名单管理', 'BlackListPage', 'black', '/cloud/route/black/index', NULL, '',
        'ant-design:eye-invisible-filled', '0', '0', '0', '0', '0', NULL, 4, 1, NULL, '2022-05-16 11:47:58', NULL, NULL,
        NULL);
INSERT INTO `system_menu`
VALUES (73, 68, '黑名单日志', 'BlockLog', 'block', '/cloud/route/block/index', NULL, '', 'ant-design:tablet-outlined', '0',
        '0', '0', '0', '0', NULL, 5, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (75, 69, '删除', NULL, NULL, NULL, NULL, 'routeLog:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (76, 70, '新增限流规则', NULL, NULL, NULL, NULL, 'rateLimitRule:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (77, 70, '删除限流规则', NULL, NULL, NULL, NULL, 'rateLimitRule:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (78, 70, '修改限流规则', NULL, NULL, NULL, NULL, 'rateLimitRule:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (81, 71, '删除限流拦截日志', NULL, NULL, NULL, NULL, 'rateLimitLog:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (83, 72, '新增', NULL, NULL, NULL, NULL, 'blackList:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (84, 72, '修改', NULL, NULL, NULL, NULL, 'blackList:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (85, 72, '删除', NULL, NULL, NULL, NULL, 'blackList:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (87, 73, '删除', NULL, NULL, NULL, NULL, 'blockLog:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (124, 0, '测试', NULL, '/test', 'Layout', NULL, NULL, 'ant-design:node-collapse-outlined', '2', '0', '0', '0', '0',
        NULL, 5, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (125, 124, '企业库', 'Company', 'company', '/cloud/labor/base/company/index', NULL, '',
        'ant-design:mac-command-outlined', '0', '0', '0', '0', '0', NULL, 1, 1, NULL, '2022-05-16 11:47:58', NULL, NULL,
        NULL);
INSERT INTO `system_menu`
VALUES (126, 125, '新增', NULL, NULL, NULL, NULL, 'company:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (127, 125, '删除', NULL, NULL, NULL, NULL, 'company:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (128, 125, '修改', NULL, NULL, NULL, NULL, 'company:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (129, 124, '项目库', NULL, 'project', '/cloud/labor/base/project/index', NULL, '', 'ant-design:project-outlined',
        '0', '0', '0', '0', '0', NULL, 2, 1, NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (130, 129, '新增', NULL, NULL, NULL, NULL, 'project:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (131, 129, '删除', NULL, NULL, NULL, NULL, 'project:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (132, 129, '修改', NULL, NULL, NULL, NULL, 'project:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (133, 124, '参建单位', NULL, 'projectCompany', '/cloud/labor/base/projectCompany/index', NULL, '',
        'ant-design:fund-projection-screen-outlined', '0', '0', '0', '0', '0', NULL, 3, 1, NULL, '2022-05-16 11:47:58',
        NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (134, 133, '新增', NULL, NULL, NULL, NULL, 'projectCompany:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (135, 133, '删除', NULL, NULL, NULL, NULL, 'projectCompany:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (136, 133, '修改', NULL, NULL, NULL, NULL, 'projectCompany:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (143, 2, '查看用户', NULL, NULL, NULL, NULL, 'user:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (144, 12, '查看角色', NULL, NULL, NULL, NULL, 'role:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (145, 10, '查看菜单', NULL, NULL, NULL, NULL, 'menu:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (146, 4, '查看部门', NULL, NULL, NULL, NULL, 'dept:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (147, 57, '查看字典名', NULL, NULL, NULL, NULL, 'tableName:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (148, 49, '查看字典', NULL, NULL, NULL, NULL, 'table:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (149, 50, '查看层级字典', NULL, NULL, NULL, NULL, 'tableLevel:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (150, 62, '查看客户端', NULL, NULL, NULL, NULL, 'client:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (151, 39, '查看桶', NULL, NULL, NULL, NULL, 'bucket:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (152, 69, '查看网关日志', NULL, NULL, NULL, NULL, 'routeLog:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (153, 70, '查看限流规则', NULL, NULL, NULL, NULL, 'rateLimitRule:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (154, 71, '查看限流日志', NULL, NULL, NULL, NULL, 'rateLimitLog:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (155, 72, '查看黑名单', NULL, NULL, NULL, NULL, 'blackList:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (156, 73, '查看黑名单日志', NULL, NULL, NULL, NULL, 'blockLog:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (157, 40, '查看文件', NULL, NULL, NULL, NULL, 'file:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (158, 125, '查看企业', NULL, NULL, NULL, NULL, 'company:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (159, 129, '查看项目', NULL, NULL, NULL, NULL, 'project:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1, NULL,
        '2022-05-16 11:47:58', NULL, NULL, NULL);
INSERT INTO `system_menu`
VALUES (160, 133, '查看参建单位', NULL, NULL, NULL, NULL, 'projectCompany:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, 1,
        NULL, '2022-05-16 11:47:58', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
CREATE TABLE `system_role`
(
    `role_id`   bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '角色id',
    `role_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '角色名称',
    `remark`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '角色描述',
    `version`   bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at` datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '角色表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role`
VALUES (1, '管理员', '管理员', 1, NULL, '2022-05-16 11:48:24', NULL, NULL, NULL);
INSERT INTO `system_role`
VALUES (2, '查看', NULL, 1, NULL, '2022-05-16 11:48:24', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
CREATE TABLE `system_role_menu`
(
    `role_id`   bigint(20)                                                    NOT NULL COMMENT '角色编号',
    `menu_id`   bigint(20)                                                    NOT NULL COMMENT '菜单编号',
    `version`   bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at` datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
    INDEX `system_role_menu_menu_id` (`menu_id`) USING BTREE,
    INDEX `system_role_menu_role_id` (`role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu`
VALUES (1, 1, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 2, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 3, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 4, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 5, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 6, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 7, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 8, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 9, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 10, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 11, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 12, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 13, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 14, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 15, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 16, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 17, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 18, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 19, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 22, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 26, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 27, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 28, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 29, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 30, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 31, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 32, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 33, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 35, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 37, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 38, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 39, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 40, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 41, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 42, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 44, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 45, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 47, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 48, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 49, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 50, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 51, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 52, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 53, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 54, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 55, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 56, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 57, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 58, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 59, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 60, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 62, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 63, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 64, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 65, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 67, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 68, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 69, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 70, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 71, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 72, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 73, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 75, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 76, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 77, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 78, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 81, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 83, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 84, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 85, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 87, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 124, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 125, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 126, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 127, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 128, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 129, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 130, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 131, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 132, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 133, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 134, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 135, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 136, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 143, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 144, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 145, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 146, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 147, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 148, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 149, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 150, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 151, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 152, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 153, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 154, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 155, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 156, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 157, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 158, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 159, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (1, 160, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 1, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 2, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 3, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 4, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 8, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 10, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 12, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 26, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 27, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 28, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 29, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 30, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 31, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 32, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 33, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 35, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 37, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 38, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 39, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 40, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 48, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 49, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 50, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 57, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 62, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 68, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 69, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 70, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 71, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 72, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 73, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 124, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 129, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 133, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 143, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 144, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 145, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 146, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 147, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 148, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 149, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 150, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 151, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 152, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 153, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 154, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 155, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 156, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 157, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 159, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);
INSERT INTO `system_role_menu`
VALUES (2, 160, 1, NULL, '2022-05-16 11:48:34', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
CREATE TABLE `system_user`
(
    `user_id`         bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '用户id',
    `username`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '用户名',
    `password`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
    `dept_id`         bigint(20)                                                    NULL     DEFAULT NULL COMMENT '部门id',
    `email`           varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '邮箱',
    `mobile`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '联系电话',
    `status`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NOT NULL COMMENT '状态 0锁定 1有效',
    `last_login_time` datetime                                                      NULL     DEFAULT NULL COMMENT '最近访问时间',
    `gender`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL     DEFAULT NULL COMMENT '性别 0男 1女 2保密',
    `is_tab`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL     DEFAULT NULL COMMENT '是否开启tab，0关闭 1开启',
    `theme`           varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '主题',
    `avatar`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '头像',
    `description`     varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '描述',
    `version`         bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`       datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`       datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`user_id`) USING BTREE,
    INDEX `system_user_username` (`username`) USING BTREE,
    INDEX `system_user_mobile` (`mobile`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user`
VALUES (1, 'zclcs', '$2a$10$jW0seNaFSgT.Iimo5PWtPu7wumhjQv29vsNVxzLb5qYwuHdDIs7iK', 2, '2371219112@qq.com',
        '17788888888', '1', '2020-04-15 16:03:13', '0', '1', 'white', 'gaOngJwsRYRaVAuXXcmB.png', '我是帅比作者。', 1, NULL,
        '2022-05-16 11:48:55', NULL, NULL, NULL);
INSERT INTO `system_user`
VALUES (9, 'test', '$2a$10$6B71x6cxjOdsrLzydosAfuwiV5G5h7q2.4SoXERNy9A4u2mru8ora', 5, NULL, NULL, '1', NULL, NULL, NULL,
        NULL, 'default.jpg', NULL, 1, NULL, '2022-05-16 11:48:55', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_user_connection
-- ----------------------------
CREATE TABLE `system_user_connection`
(
    `user_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '系统用户名',
    `provider_name`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '第三方平台名称',
    `provider_user_id`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '第三方平台账户id',
    `provider_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '第三方平台用户名',
    `nick_name`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '第三方平台昵称',
    `image_url`          varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '第三方平台头像',
    `location`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '地址',
    `remark`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '备注',
    `version`            bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at`          datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at`          datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by`          varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`user_name`, `provider_name`, `provider_user_id`) USING BTREE,
    UNIQUE INDEX `userconnectionrank` (`user_name`, `provider_name`, `provider_user_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '系统用户社交账户关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_connection
-- ----------------------------

-- ----------------------------
-- Table structure for system_user_data_permission
-- ----------------------------
CREATE TABLE `system_user_data_permission`
(
    `user_id`   bigint(20)                                                    NOT NULL COMMENT '用户编号',
    `dept_id`   bigint(20)                                                    NOT NULL COMMENT '部门编号',
    `version`   bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at` datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`user_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户数据权限关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_data_permission
-- ----------------------------
INSERT INTO `system_user_data_permission`
VALUES (1, 1, 1, NULL, '2022-05-16 11:55:45', NULL, NULL, NULL);
INSERT INTO `system_user_data_permission`
VALUES (1, 2, 1, NULL, '2022-05-16 11:55:45', NULL, NULL, NULL);
INSERT INTO `system_user_data_permission`
VALUES (1, 3, 1, NULL, '2022-05-16 11:55:45', NULL, NULL, NULL);
INSERT INTO `system_user_data_permission`
VALUES (1, 4, 1, NULL, '2022-05-16 11:55:45', NULL, NULL, NULL);
INSERT INTO `system_user_data_permission`
VALUES (1, 5, 1, NULL, '2022-05-16 11:55:45', NULL, NULL, NULL);
INSERT INTO `system_user_data_permission`
VALUES (1, 6, 1, NULL, '2022-05-16 11:55:45', NULL, NULL, NULL);
INSERT INTO `system_user_data_permission`
VALUES (9, 2, 1, NULL, '2022-05-16 11:55:45', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
CREATE TABLE `system_user_role`
(
    `user_id`   bigint(20)                                                    NOT NULL COMMENT '用户id',
    `role_id`   bigint(20)                                                    NOT NULL COMMENT '角色id',
    `version`   bigint(20)                                                    NULL     DEFAULT 1 COMMENT '版本',
    `tenant_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '租户id',
    `create_at` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_at` datetime                                                      NULL     DEFAULT NULL COMMENT '编辑时间',
    `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '创建人',
    `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '用户角色关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role`
VALUES (1, 1, 1, NULL, '2022-05-16 11:55:58', NULL, NULL, NULL);
INSERT INTO `system_user_role`
VALUES (9, 2, 1, NULL, '2022-05-16 11:55:58', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
