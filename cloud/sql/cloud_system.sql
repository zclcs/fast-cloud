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

 Date: 15/10/2021 10:22:24
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
  AUTO_INCREMENT = 167
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
INSERT INTO `system_log`
VALUES (81, 'zclcs', '修改角色', 210, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8, 2])\"', '127.0.0.1',
        '2021-09-13 10:37:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (82, 'zclcs', '修改角色', 83, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:42:35',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (83, 'zclcs', '修改角色', 53, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:42:57',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (84, 'zclcs', '修改角色', 73, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:45:25',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (85, 'zclcs', '修改角色', 76, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:46:41',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (86, 'zclcs', '修改角色', 71, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:47:16',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (87, 'zclcs', '修改角色', 50, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:48:12',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (88, 'zclcs', '修改角色', 81, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:51:31',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (89, 'zclcs', '修改角色', 49, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:54:01',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (90, 'zclcs', '修改角色', 82, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:54:40',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (91, 'zclcs', '修改角色', 44, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 11:13:55',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (92, 'zclcs', '修改角色', 77, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 11:32:32',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (93, 'zclcs', '修改角色', 43, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8, 2, 1])\"', '127.0.0.1',
        '2021-09-13 11:33:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (94, 'zclcs', '修改角色', 77, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[1, 2, 8])\"', '127.0.0.1',
        '2021-09-13 11:33:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (95, 'zclcs', '修改用户', 128, 'com.zclcs.server.system.controller.SystemUserController.updateUser()',
        ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[2], deptIds=[2])\"',
        '127.0.0.1', '2021-09-13 14:19:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (96, 'zclcs', '修改用户', 114, 'com.zclcs.server.system.controller.SystemUserController.updateUser()',
        ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=5, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[2], deptIds=[2])\"',
        '127.0.0.1', '2021-09-13 14:19:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (97, 'zclcs', '修改角色', 75, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 14:26:49',
        '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (98, 'zclcs', '新增菜单/按钮', 75, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=2, menuName=查看用户, path=null, component=null, perms=user:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-13 14:30:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (99, 'zclcs', '修改菜单/按钮', 46, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=2, parentId=1, menuName=用户管理, path=user, component=/cloud/system/user/index, perms=, icon=ant-design:user-switch-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-13 14:31:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (100, 'zclcs', '新增菜单/按钮', 48, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=12, menuName=查看角色, path=null, component=null, perms=role:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-13 14:33:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (101, 'zclcs', '新增菜单/按钮', 66, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=12, menuName=删除角色, path=null, component=null, perms=role:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-13 14:34:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (102, 'zclcs', '修改菜单/按钮', 35, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=, icon=ant-design:solution-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-13 14:35:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (103, 'zclcs', '删除菜单/按钮', 63, 'com.zclcs.server.system.controller.SystemMenuController.deleteMenus()',
        ' menuIds: \"21\"', '127.0.0.1', '2021-09-13 14:37:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (104, 'zclcs', '新增菜单/按钮', 46, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=12, menuName=查看角色, path=null, component=null, perms=role:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-13 14:37:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (105, 'zclcs', '新增菜单/按钮', 43, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=10, menuName=删除菜单, path=null, component=null, perms=menu:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-13 14:38:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (106, 'zclcs', '修改菜单/按钮', 37, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=24, parentId=10, menuName=查看菜单, path=null, component=null, perms=menu:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-13 14:38:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (107, 'zclcs', '修改菜单/按钮', 40, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=10, parentId=1, menuName=菜单管理, path=menu, component=/cloud/system/menu/index, perms=, icon=ant-design:menu-fold-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=3.0)\"',
        '127.0.0.1', '2021-09-13 14:39:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (108, 'zclcs', '新增菜单/按钮', 42, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=4, menuName=查看部门, path=null, component=null, perms=dept:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-13 14:40:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (109, 'zclcs', '修改菜单/按钮', 56, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=4, parentId=1, menuName=部门管理, path=dept, component=/cloud/system/dept/index, perms=, icon=ant-design:apartment-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=4.0)\"',
        '127.0.0.1', '2021-09-13 14:40:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (110, 'zclcs', '修改角色', 94, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[1, 2, 5, 6, 7, 8, 9, 20, 3, 12, 15, 16, 22, 23, 10, 11, 13, 14, 24, 4, 17, 18, 19, 25])\"',
        '127.0.0.1', '2021-09-13 14:40:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (111, 'zclcs', '修改角色', 88, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8, 20, 23, 3, 24, 25, 2, 1, 12, 10, 4])\"',
        '127.0.0.1', '2021-09-13 14:42:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (112, 'zclcs', '修改角色', 73, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[3, 23, 24, 25, 1, 12, 10, 4])\"',
        '127.0.0.1', '2021-09-13 14:54:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (113, 'zclcs', '修改角色', 42, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[3, 23, 24, 25, 20, 1, 12, 10, 4, 2])\"',
        '127.0.0.1', '2021-09-13 14:55:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (114, 'zclcs', '修改角色', 93, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[20, 3, 23, 24, 25, 8, 2, 1, 12, 10, 4])\"',
        '127.0.0.1', '2021-09-13 14:55:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (115, 'zclcs', '新增菜单/按钮', 164, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=1, menuName=重置密码, path=password, component=/cloud/system/password/index, perms=null, icon=ant-design:radius-setting-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=5.0)\"',
        '127.0.0.1', '2021-09-13 16:39:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (116, 'zclcs', '新增菜单/按钮', 41, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=26, menuName=重置密码, path=null, component=null, perms=user:reset, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"',
        '127.0.0.1', '2021-09-13 16:39:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (117, 'zclcs', '修改角色', 95, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[5, 2, 6, 7, 8, 9, 20, 3, 15, 12, 16, 22, 23, 11, 10, 13, 14, 24, 17, 4, 18, 19, 25, 26, 27, 1])\"',
        '127.0.0.1', '2021-09-13 16:50:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (118, 'zclcs', '新增菜单/按钮', 143, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=null, menuName=首页, path=dashboard, component=/dashboard/index, perms=null, icon=ant-design:align-left-outlined, type=0, hideMenu=1, ignoreKeepAlive=1, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-14 17:19:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (119, 'zclcs', '修改菜单/按钮', 106, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=1, ignoreKeepAlive=null, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-14 17:24:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (120, 'zclcs', '新增菜单/按钮', 48, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=null, menuName=分页页, path=analysis, component=/dashboard/analysis/index, perms=null, icon=ant-design:amazon-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-14 17:28:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (121, 'zclcs', '新增菜单/按钮', 39, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=28, menuName=工作台, path=workbench, component=/dashboard/workbench/index, perms=null, icon=ant-design:alert-filled, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-14 17:28:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (122, 'zclcs', '修改菜单/按钮', 55, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=29, parentId=28, menuName=分析页, path=analysis, component=/dashboard/analysis/index, perms=null, icon=ant-design:amazon-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-14 17:29:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (123, 'zclcs', '修改菜单/按钮', 46, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-14 17:29:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (124, 'zclcs', '修改角色', 114, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[5, 2, 1, 6, 7, 8, 9, 20, 3, 15, 12, 16, 22, 23, 11, 10, 13, 14, 24, 17, 4, 18, 19, 25, 27, 26, 28, 29, 30])\"',
        '127.0.0.1', '2021-09-14 17:30:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (125, 'zclcs', '修改菜单/按钮', 139, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, redirect=/dashboard/analysis, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=1, currentActiveMenu=null, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-15 09:45:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (126, 'zclcs', '修改菜单/按钮', 46, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=1, parentId=null, menuName=系统管理, path=/system, component=null, redirect=null, perms=null, icon=ant-design:setting-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-15 09:47:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (127, 'zclcs', '修改菜单/按钮', 45, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, redirect=null, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=1, currentActiveMenu=null, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-15 09:48:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (128, 'zclcs', '修改菜单/按钮', 130, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, redirect=/dashboard/analysis, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=1, currentActiveMenu=null, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-15 09:54:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (129, 'zclcs', '修改菜单/按钮', 42, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=29, parentId=28, menuName=分析页, path=analysis, component=/dashboard/analysis/index, redirect=null, perms=null, icon=ant-design:amazon-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=/dashboard, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-15 09:54:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (130, 'zclcs', '修改菜单/按钮', 40, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=1, parentId=null, menuName=系统管理, path=/system, component=null, redirect=null, perms=null, icon=ant-design:setting-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-15 09:55:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (131, 'zclcs', '修改菜单/按钮', 52, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=29, parentId=28, menuName=分析页, path=analysis, component=/dashboard/analysis/index, redirect=null, perms=null, icon=ant-design:amazon-outlined, type=0, hideMenu=1, ignoreKeepAlive=0, hideBreadcrumb=1, hideChildrenInMenu=0, currentActiveMenu=/dashboard, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-15 09:55:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (132, 'zclcs', '修改菜单/按钮', 32, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=30, parentId=28, menuName=工作台, path=workbench, component=/dashboard/workbench/index, redirect=null, perms=null, icon=ant-design:alert-filled, type=0, hideMenu=1, ignoreKeepAlive=0, hideBreadcrumb=1, hideChildrenInMenu=0, currentActiveMenu=/dashboard, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-15 09:56:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (133, 'zclcs', '修改菜单/按钮', 120, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, redirect=/dashboard/analysis, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=1, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-15 09:58:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (134, 'zclcs', '修改菜单/按钮', 58, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=29, parentId=28, menuName=分析页, path=analysis, component=/dashboard/analysis/index, redirect=null, perms=null, icon=ant-design:amazon-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=1, hideChildrenInMenu=0, currentActiveMenu=/dashboard, orderNum=1.0)\"',
        '127.0.0.1', '2021-09-15 09:59:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (135, 'zclcs', '修改菜单/按钮', 33, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=30, parentId=28, menuName=工作台, path=workbench, component=/dashboard/workbench/index, redirect=null, perms=null, icon=ant-design:alert-filled, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=1, hideChildrenInMenu=0, currentActiveMenu=/dashboard, orderNum=2.0)\"',
        '127.0.0.1', '2021-09-15 09:59:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (136, 'zclcs', '修改角色', 103, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[29, 30, 28])\"', '127.0.0.1',
        '2021-09-29 14:55:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (137, 'zclcs', '修改角色', 103, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1',
        '2021-09-29 14:59:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (138, 'zclcs', '修改角色', 98, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1',
        '2021-09-29 15:03:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (139, 'zclcs', '修改角色', 115, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1',
        '2021-09-29 15:13:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (140, 'zclcs', '修改角色', 997, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1',
        '2021-09-29 15:39:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (141, 'zclcs', '修改角色', 40, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1',
        '2021-09-29 15:40:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (142, 'zclcs', '修改角色', 991, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1',
        '2021-09-29 15:44:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (143, 'zclcs', '新增菜单/按钮', 917, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=null, menuName=快速开发, path=/gen, component=null, redirect=null, perms=null, icon=ant-design:code-filled, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=3.0)\"',
        '127.0.0.1', '2021-10-11 17:30:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (144, 'zclcs', '新增菜单/按钮', 63, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=31, menuName=配置管理, path=/gen/config, component=/cloud/gen/config/index, redirect=null, perms=null, icon=ant-design:contacts-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"',
        '127.0.0.1', '2021-10-11 17:32:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (145, 'zclcs', '新增菜单/按钮', 77, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=31, menuName=代码生成, path=/code, component=/cloud/code/index, redirect=null, perms=null, icon=ant-design:code-sandbox-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"',
        '127.0.0.1', '2021-10-12 09:05:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (146, 'zclcs', '修改菜单/按钮', 65, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=33, parentId=31, menuName=代码生成, path=/code, component=/cloud/gen/code/index, redirect=null, perms=null, icon=ant-design:code-sandbox-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"',
        '127.0.0.1', '2021-10-12 09:05:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (147, 'zclcs', '修改菜单/按钮', 70, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=32, parentId=31, menuName=代码生成配置管理, path=/gen/config, component=/cloud/gen/config/index, redirect=null, perms=null, icon=ant-design:contacts-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"',
        '127.0.0.1', '2021-10-12 15:22:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (148, 'zclcs', '修改菜单/按钮', 59, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=32, parentId=31, menuName=代码生成配置管理, path=/code/gen/config, component=/cloud/code/gen/config/index, redirect=null, perms=null, icon=ant-design:contacts-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"',
        '127.0.0.1', '2021-10-12 15:25:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (149, 'zclcs', '修改菜单/按钮', 68, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=33, parentId=31, menuName=代码生成, path=/code/gen, component=/cloud/code/gen/code/index, redirect=null, perms=null, icon=ant-design:code-sandbox-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"',
        '127.0.0.1', '2021-10-12 15:25:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (150, 'zclcs', '修改菜单/按钮', 83, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=32, parentId=31, menuName=代码生成配置管理, path=/gen/config, component=/cloud/gen/config/index, redirect=null, perms=null, icon=ant-design:contacts-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"',
        '127.0.0.1', '2021-10-12 15:25:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (151, 'zclcs', '修改菜单/按钮', 60, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=33, parentId=31, menuName=代码生成, path=/gen/gen, component=/cloud/gen/gen/index, redirect=null, perms=null, icon=ant-design:code-sandbox-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"',
        '127.0.0.1', '2021-10-12 15:25:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (152, 'zclcs', '新增菜单/按钮', 71, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=32, menuName=获取代码生成配置, path=null, component=null, redirect=null, perms=gen:config, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2021-10-12 15:30:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (153, 'zclcs', '新增菜单/按钮', 96, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=32, menuName=修改代码生成配置, path=null, component=null, redirect=null, perms=gen:config:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2021-10-12 15:31:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (154, 'zclcs', '新增菜单/按钮', 79, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=33, menuName=查看代码生成, path=null, component=null, redirect=null, perms=gen:generate, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2021-10-12 15:32:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (155, 'zclcs', '修改菜单/按钮', 63, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()',
        ' menu: \"SystemMenuAo(menuId=34, parentId=32, menuName=查看代码生成配置, path=null, component=null, redirect=null, perms=gen:config, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2021-10-12 15:32:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (156, 'zclcs', '新增菜单/按钮', 64, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()',
        ' menu: \"SystemMenuAo(menuId=null, parentId=33, menuName=生成代码, path=null, component=null, redirect=null, perms=gen:generate:gen, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"',
        '127.0.0.1', '2021-10-12 15:36:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (157, 'zclcs', '修改角色', 131, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[29, 28, 30, 5, 2, 1, 6, 7, 8, 9, 20, 3, 15, 12, 16, 22, 23, 11, 10, 13, 14, 24, 17, 4, 18, 19, 25, 27, 26, 31, 32, 34, 35, 33, 36, 37])\"',
        '127.0.0.1', '2021-10-12 15:36:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (158, 'zclcs', '修改角色', 86, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()',
        ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[29, 28, 30, 5, 2, 1, 6, 7, 8, 9, 20, 3, 12, 15, 16, 22, 23, 10, 11, 13, 14, 24, 4, 17, 18, 19, 25, 26, 27, 34, 36, 33, 37, 35, 32, 31])\"',
        '127.0.0.1', '2021-10-12 15:36:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (159, 'zclcs', '删除角色', 78, 'com.zclcs.server.system.controller.SystemRoleController.deleteRoles()',
        ' roleIds: \"3\"', '127.0.0.1', '2021-10-12 15:36:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (160, 'zclcs', '修改密码', 1050, 'com.zclcs.server.system.controller.SystemUserController.updatePassword()',
        ' username: \"test\" password: \"123456\"', '127.0.0.1', '2021-10-13 16:12:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (161, 'zclcs', '修改代码生成配置', 1296,
        'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()',
        ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=entity, aoPackage=entity.ao, voPackage=entity.vo, mapperPackage=mapper, mapperXmlPackage=mapper, servicePackage=service, serviceImplPackage=service.impl, controllerPackage=controller, isTrim=0, trimValue=null)',
        '127.0.0.1', '2021-10-14 09:37:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (162, 'zclcs', '修改代码生成配置', 61,
        'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()',
        ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=entity, aoPackage=entity.ao, voPackage=entity.vo, mapperPackage=mapper, mapperXmlPackage=mapper, servicePackage=service, serviceImplPackage=service.impl, controllerPackage=controller, isTrim=0, trimValue=null)',
        '127.0.0.1', '2021-10-14 09:39:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (163, 'zclcs', '修改代码生成配置', 68,
        'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()',
        ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=entity, aoPackage=entity.ao, voPackage=entity.vo, mapperPackage=mapper, mapperXmlPackage=mapper, servicePackage=service1, serviceImplPackage=service.impl, controllerPackage=controller, isTrim=0, trimValue=null)',
        '127.0.0.1', '2021-10-14 09:40:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (164, 'zclcs', '修改代码生成配置', 89,
        'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()',
        ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=entity, aoPackage=entity.ao, voPackage=entity.vo, mapperPackage=mapper, mapperXmlPackage=mapper, servicePackage=service, serviceImplPackage=service.impl, controllerPackage=controller, isTrim=0, trimValue=null)',
        '127.0.0.1', '2021-10-14 09:40:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (165, 'zclcs', '修改代码生成配置', 1023,
        'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()',
        ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=common.core.entity, aoPackage=common.core.entity.ao, voPackage=common.core.entity.vo, mapperPackage=server.test.mapper, mapperXmlPackage=server.test.mapper, servicePackage=server.test.service, serviceImplPackage=server.test.service.impl, controllerPackage=server.test.controller, isTrim=0, trimValue=null)',
        '127.0.0.1', '2021-10-14 16:58:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log`
VALUES (166, 'zclcs', '修改代码生成配置', 87,
        'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()',
        ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=common.core.entity.test, aoPackage=common.core.entity.test.ao, voPackage=common.core.entity.test.vo, mapperPackage=server.test.mapper, mapperXmlPackage=server.test.mapper, servicePackage=server.test.service, serviceImplPackage=server.test.service.impl, controllerPackage=server.test.controller, isTrim=0, trimValue=null)',
        '127.0.0.1', '2021-10-14 17:00:21', '内网IP|0|0|内网IP|内网IP');

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
    `menu_name`             varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci        NOT NULL COMMENT '菜单/按钮名称',
    `path`                  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT NULL COMMENT '对应路由path',
    `component`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL     DEFAULT NULL COMMENT '对应路由组件component',
    `redirect`              varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '打开目录重定向的子菜单',
    `perms`                 varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci        NULL     DEFAULT NULL COMMENT '权限标识',
    `icon`                  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci        NULL     DEFAULT NULL COMMENT '图标',
    `type`                  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci            NOT NULL COMMENT '类型 0菜单 1按钮 2菜单',
    `hide_menu`             char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL DEFAULT '0' COMMENT '是否隐藏菜单 1是 0否',
    `ignore_keep_alive`     char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL DEFAULT '0' COMMENT '是否忽略KeepAlive缓存 1是 0否',
    `hide_breadcrumb`       char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL DEFAULT '0' COMMENT '隐藏该路由在面包屑上面的显示 1是 0否',
    `hide_children_in_menu` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL DEFAULT '0' COMMENT '隐藏所有子菜单 1是 0否',
    `current_active_menu`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '当前激活的菜单。用于配置详情页时左侧激活的菜单路径',
    `order_num`             double(20, 0)                                                 NULL     DEFAULT NULL COMMENT '排序',
    `create_time`           datetime                                                      NOT NULL COMMENT '创建时间',
    `modify_time`           datetime                                                      NULL     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`menu_id`) USING BTREE,
    INDEX `system_menu_parent_id` (`parent_id`) USING BTREE,
    INDEX `system_menu_menu_id` (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 38
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
VALUES (32, 31, '代码生成配置管理', '/gen/config', '/cloud/gen/config/index', NULL, NULL, 'ant-design:contacts-outlined', '0',
        '0', '0', '0', '0', NULL, 1, '2021-10-11 17:32:55', '2021-10-12 15:25:41');
INSERT INTO `system_menu`
VALUES (33, 31, '代码生成', '/gen/gen', '/cloud/gen/gen/index', NULL, NULL, 'ant-design:code-sandbox-outlined', '0', '0',
        '0', '0', '0', NULL, 2, '2021-10-12 09:05:22', '2021-10-12 15:25:55');
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
VALUES (1, '管理员', '管理员', '2017-12-27 16:23:11', '2021-10-12 15:36:51');
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
