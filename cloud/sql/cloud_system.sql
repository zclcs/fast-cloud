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
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端ID',
  `resource_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源编号',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端密钥',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端权限',
  `authorized_grant_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '鉴权类型',
  `web_server_redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `authorities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拥有的系统权限',
  `access_token_validity` int(11) NOT NULL COMMENT 'token过期时间',
  `refresh_token_validity` int(11) NULL DEFAULT NULL COMMENT 'token刷新时间',
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '额外信息',
  `autoapprove` tinyint(4) NULL DEFAULT NULL COMMENT '是否自动批准',
  `origin_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织密码',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户端配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('app', '', '$2a$10$8Qk/efslEpO1Af1kyw/rp.DdJGsdnET8UCp1vGDzpQEa.1qBklvua', 'all', 'refresh_token,password', '', NULL, 86400, 864000, NULL, NULL, '123456');
INSERT INTO `oauth_client_details` VALUES ('zclcs', ' ', '$2a$10$aSZTvMOtUAYUQ.75z2n3ceJd6dCIk9Vy3J/SKZUE4hBLd6sz7.6ge', 'all', 'password,refresh_token', NULL, NULL, 86400, 8640000, NULL, 0, '123456');

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门id',
  `dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `order_num` double(20, 0) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  INDEX `system_dept_parent_id`(`parent_id`) USING BTREE,
  INDEX `system_dept_dept_name`(`dept_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO `system_dept` VALUES (1, 0, '开发部', 1, '2018-01-04 15:42:26', '2019-01-05 21:08:27');
INSERT INTO `system_dept` VALUES (2, 1, '开发一部', 1, '2018-01-04 15:42:34', '2019-01-18 00:59:37');
INSERT INTO `system_dept` VALUES (3, 1, '开发二部', 2, '2018-01-04 15:42:29', '2019-01-05 14:09:39');
INSERT INTO `system_dept` VALUES (4, 0, '市场部', 2, '2018-01-04 15:42:36', '2021-09-10 15:14:54');
INSERT INTO `system_dept` VALUES (5, 0, '人事部', 3, '2018-01-04 15:42:32', '2019-01-23 06:27:59');
INSERT INTO `system_dept` VALUES (6, 0, '测试部', 4, '2018-01-04 15:42:38', '2019-01-17 08:15:47');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `operation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `time` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `method` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作方法',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者ip',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_log_create_time`(`create_time`) USING BTREE,
  INDEX `system_log_username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 293 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES (1, 'zclcs', '新增用户', 49, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(username=test, password=null, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, deptIds=null)\"', '127.0.0.1', '2021-09-03 10:12:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (2, 'zclcs', '新增用户', 27, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(username=test, password=null, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, deptIds=null)\"', '127.0.0.1', '2021-09-03 11:02:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (3, 'zclcs', '新增用户', 18, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=null)\"', '127.0.0.1', '2021-09-06 16:30:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (4, 'zclcs', '新增用户', 285, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[3])\"', '127.0.0.1', '2021-09-06 17:00:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (5, 'zclcs', '新增用户', 247, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(userId=null, username=test1, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"', '127.0.0.1', '2021-09-07 09:44:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (6, 'zclcs', '修改用户', 96, 'com.zclcs.server.system.controller.SystemUserController.updateUser()', ' user: \"SystemUserAo(userId=3, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[3])\"', '127.0.0.1', '2021-09-07 09:45:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (7, 'zclcs', '修改用户', 75, 'com.zclcs.server.system.controller.SystemUserController.updateUser()', ' user: \"SystemUserAo(userId=3, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=11, roleIds=[1], deptIds=[3])\"', '127.0.0.1', '2021-09-07 09:47:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (8, 'zclcs', '删除用户', 76, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()', ' userIds: \"4\"', '127.0.0.1', '2021-09-07 09:58:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (9, 'zclcs', '修改用户', 86, 'com.zclcs.server.system.controller.SystemUserController.updateUser()', ' user: \"SystemUserAo(userId=3, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=11222, roleIds=[1], deptIds=[3])\"', '127.0.0.1', '2021-09-07 10:00:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (10, 'zclcs', '新增用户', 160, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(userId=null, username=test2, password=null, deptId=5, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[4])\"', '127.0.0.1', '2021-09-07 10:01:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (11, 'zclcs', '新增用户', 174, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(userId=null, username=test3, password=null, deptId=5, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"', '127.0.0.1', '2021-09-07 10:06:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (12, 'zclcs', '新增用户', 152, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(userId=null, username=test3, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[5])\"', '127.0.0.1', '2021-09-07 10:06:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (13, 'zclcs', '删除用户', 74, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()', ' userIds: \"6\"', '127.0.0.1', '2021-09-07 10:07:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (14, 'zclcs', '删除用户', 10, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()', ' userIds: \"6\"', '127.0.0.1', '2021-09-07 10:08:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (15, 'zclcs', '删除用户', 42, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()', ' userIds: \"7\"', '127.0.0.1', '2021-09-07 10:08:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (16, 'zclcs', '删除用户', 45, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()', ' userIds: \"5\"', '127.0.0.1', '2021-09-07 10:11:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (17, 'zclcs', '删除用户', 45, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()', ' userIds: \"3\"', '127.0.0.1', '2021-09-07 10:13:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (18, 'zclcs', '新增用户', 246, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(userId=null, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"', '127.0.0.1', '2021-09-07 16:56:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (19, 'zclcs', '删除用户', 65, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()', ' userIds: \"8\"', '127.0.0.1', '2021-09-08 09:16:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (20, 'zclcs', '新增用户', 215, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(userId=null, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"', '127.0.0.1', '2021-09-08 09:19:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (21, 'zclcs', '修改用户', 147, 'com.zclcs.server.system.controller.SystemUserController.updateUser()', ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=0, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"', '127.0.0.1', '2021-09-08 10:29:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (22, 'zclcs', '新增菜单/按钮', 156, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=1, menuName=角色管理, path=/cloud/system/role/index, component=null, perms=role:view, icon=ant-design:bell-twotone, type=0, orderNum=3.0)\"', '127.0.0.1', '2021-09-08 15:11:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (23, 'zclcs', '新增菜单/按钮', 50, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=10, menuName=修改菜单, path=null, component=null, perms=menu:update, icon=null, type=1, orderNum=2.0)\"', '127.0.0.1', '2021-09-08 15:34:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (24, 'zclcs', '修改菜单/按钮', 57, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=1, parentId=null, menuName=系统管理, path=/system, component=null, perms=null, icon=ant-design:setting-outlined, type=2, orderNum=1.0)\"', '127.0.0.1', '2021-09-08 16:50:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (25, 'zclcs', '新增菜单/按钮', 38, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=10, menuName=删除菜单, path=null, component=null, perms=menu:delete, icon=null, type=1, orderNum=3.0)\"', '127.0.0.1', '2021-09-09 09:09:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (26, 'zclcs', '修改菜单/按钮', 50, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=2, parentId=1, menuName=用户管理, path=user, component=/cloud/system/user/index, perms=user:view, icon=ant-design:user-switch-outlined, type=0, orderNum=1.0)\"', '127.0.0.1', '2021-09-09 09:10:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (27, 'zclcs', '修改菜单/按钮', 42, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=4, parentId=1, menuName=部门管理, path=dept, component=/cloud/system/dept/index, perms=dept:view, icon=ant-design:apartment-outlined, type=0, orderNum=2.0)\"', '127.0.0.1', '2021-09-09 09:11:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (28, 'zclcs', '修改菜单/按钮', 44, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=10, parentId=1, menuName=菜单管理, path=menu, component=/cloud/system/menu/index, perms=menu:view, icon=ant-design:menu-fold-outlined, type=0, orderNum=3.0)\"', '127.0.0.1', '2021-09-09 09:11:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (29, 'zclcs', '修改菜单/按钮', 42, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=3, parentId=1, menuName=用户详情页面, path=accountDetail/:username, component=/cloud/system/user/AccountDetail, perms=user:view, icon=ant-design:audit-outlined, type=0, orderNum=2.0)\"', '127.0.0.1', '2021-09-09 09:15:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (30, 'zclcs', '修改菜单/按钮', 43, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:bell-twotone, type=0, orderNum=3.0)\"', '127.0.0.1', '2021-09-09 09:15:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (31, 'zclcs', '修改菜单/按钮', 39, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:bell-twotone, type=0, orderNum=3.0)\"', '127.0.0.1', '2021-09-09 09:15:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (32, 'zclcs', '修改菜单/按钮', 45, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=14, parentId=10, menuName=删除菜单, path=null, component=null, perms=menu:delete, icon=null, type=1, orderNum=null)\"', '127.0.0.1', '2021-09-09 10:29:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (33, 'zclcs', '修改菜单/按钮', 39, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=3, parentId=1, menuName=用户详情页面, path=accountDetail/:username, component=/cloud/system/user/AccountDetail, perms=user:view, icon=ant-design:audit-outlined, type=0, orderNum=2.0)\"', '127.0.0.1', '2021-09-09 10:29:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (34, 'zclcs', '修改菜单/按钮', 113, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:bell-twotone, type=0, hideMenu=1, ignoreKeepAlive=1, orderNum=3.0)\"', '127.0.0.1', '2021-09-09 10:40:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (35, 'zclcs', '修改菜单/按钮', 56, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:bell-twotone, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=3.0)\"', '127.0.0.1', '2021-09-09 10:41:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (36, 'zclcs', '新增菜单/按钮', 119, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=12, menuName=添加角色, path=null, component=null, perms=role:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-09 11:26:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (37, 'zclcs', '新增用户', 154, 'com.zclcs.server.system.controller.SystemUserController.addUser()', ' user: \"SystemUserAo(userId=null, username=test1, password=null, deptId=5, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"', '127.0.0.1', '2021-09-09 11:27:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (38, 'zclcs', '删除用户', 81, 'com.zclcs.server.system.controller.SystemUserController.deleteUsers()', ' userIds: \"10\"', '127.0.0.1', '2021-09-09 11:27:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (39, 'zclcs', '新增菜单/按钮', 82, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=12, menuName=修改角色, path=null, component=null, perms=role:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-09 11:33:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (40, 'zclcs', '修改菜单/按钮', 51, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:solution-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=3.0)\"', '127.0.0.1', '2021-09-09 11:34:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (41, 'zclcs', '新增角色', 117, 'com.zclcs.server.system.controller.SystemRoleController.addRole()', ' role: \"SystemRoleAo(roleId=null, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1', '2021-09-09 14:54:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (42, 'zclcs', '修改用户', 95, 'com.zclcs.server.system.controller.SystemUserController.updateUser()', ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"', '127.0.0.1', '2021-09-09 14:58:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (43, 'zclcs', '修改用户', 85, 'com.zclcs.server.system.controller.SystemUserController.updateUser()', ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[2], deptIds=[2])\"', '127.0.0.1', '2021-09-09 14:58:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (44, 'zclcs', '修改用户', 80, 'com.zclcs.server.system.controller.SystemUserController.updateUser()', ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[1], deptIds=[2])\"', '127.0.0.1', '2021-09-09 15:01:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (45, 'zclcs', '修改用户', 83, 'com.zclcs.server.system.controller.SystemUserController.updateUser()', ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[2], deptIds=[2])\"', '127.0.0.1', '2021-09-09 15:01:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (46, 'zclcs', '修改角色', 84, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1', '2021-09-09 15:04:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (47, 'zclcs', '修改角色', 46, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1', '2021-09-09 15:17:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (48, 'zclcs', '修改角色', 45, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1', '2021-09-09 15:19:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (49, 'zclcs', '修改角色', 74, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1', '2021-09-09 15:20:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (50, 'zclcs', '修改角色', 54, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1', '2021-09-09 16:38:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (51, 'zclcs', '修改角色', 47, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1', '2021-09-09 16:38:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (52, 'zclcs', '修改角色', 106, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4, 1])\"', '127.0.0.1', '2021-09-09 16:40:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (53, 'zclcs', '修改角色', 169, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[1, 4])\"', '127.0.0.1', '2021-09-10 09:48:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (54, 'zclcs', '修改角色', 103, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[1, 4])\"', '127.0.0.1', '2021-09-10 09:50:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (55, 'zclcs', '修改角色', 81, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[4])\"', '127.0.0.1', '2021-09-10 09:53:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (56, 'zclcs', '修改角色', 257, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[])\"', '127.0.0.1', '2021-09-10 10:30:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (57, 'zclcs', '修改角色', 83, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[5])\"', '127.0.0.1', '2021-09-10 10:30:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (58, 'zclcs', '修改菜单/按钮', 49, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=role:view, icon=ant-design:solution-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=2.0)\"', '127.0.0.1', '2021-09-10 10:31:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (59, 'zclcs', '修改菜单/按钮', 56, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=4, parentId=1, menuName=部门管理, path=dept, component=/cloud/system/dept/index, perms=dept:view, icon=ant-design:apartment-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=4.0)\"', '127.0.0.1', '2021-09-10 10:32:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (60, 'zclcs', '修改菜单/按钮', 52, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=5, parentId=2, menuName=添加用户, path=null, component=null, perms=user:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-10 10:33:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (61, 'zclcs', '新增菜单/按钮', 168, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=4, menuName=添加部门, path=null, component=null, perms=dept:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-10 14:28:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (62, 'zclcs', '新增菜单/按钮', 47, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=4, menuName=修改部门, path=null, component=null, perms=dept:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-10 14:29:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (63, 'zclcs', '修改菜单/按钮', 50, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=18, parentId=4, menuName=修改部门, path=null, component=null, perms=dept:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-10 14:29:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (64, 'zclcs', '新增菜单/按钮', 50, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=4, menuName=删除部门, path=null, component=null, perms=dept:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-10 14:30:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (65, 'zclcs', '修改角色', 118, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19])\"', '127.0.0.1', '2021-09-10 14:30:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (66, 'zclcs', '新增部门', 50, 'com.zclcs.server.system.controller.SystemDeptController.addDept()', ' dept: \"SystemDeptAo(deptId=null, parentId=null, deptName=5, orderNum=5.0, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2021-09-10 15:04:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (67, 'zclcs', '修改部门', 56, 'com.zclcs.server.system.controller.SystemDeptController.updateDept()', ' dept: \"SystemDeptAo(deptId=7, parentId=null, deptName=6, orderNum=5.0, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2021-09-10 15:05:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (68, 'zclcs', '删除部门', 372, 'com.zclcs.server.system.controller.SystemDeptController.deleteDepts()', ' deptIds: \"8\"', '127.0.0.1', '2021-09-10 15:10:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (69, 'zclcs', '删除部门', 46, 'com.zclcs.server.system.controller.SystemDeptController.deleteDepts()', ' deptIds: \"7\"', '127.0.0.1', '2021-09-10 15:10:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (70, 'zclcs', '修改部门', 98, 'com.zclcs.server.system.controller.SystemDeptController.updateDept()', ' dept: \"SystemDeptAo(deptId=4, parentId=1, deptName=市场部, orderNum=2.0, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2021-09-10 15:14:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (71, 'zclcs', '修改部门', 43, 'com.zclcs.server.system.controller.SystemDeptController.updateDept()', ' dept: \"SystemDeptAo(deptId=4, parentId=null, deptName=市场部, orderNum=2.0, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2021-09-10 15:14:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (72, 'zclcs', '修改菜单/按钮', 116, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=3, parentId=1, menuName=用户详情页面, path=accountDetail/:username, component=/cloud/system/user/AccountDetail, perms=user:detail:view, icon=ant-design:audit-outlined, type=0, hideMenu=1, ignoreKeepAlive=1, orderNum=2.0)\"', '127.0.0.1', '2021-09-10 15:23:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (73, 'zclcs', '修改角色', 103, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19])\"', '127.0.0.1', '2021-09-10 15:34:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (74, 'zclcs', '修改角色', 103, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 3])\"', '127.0.0.1', '2021-09-10 15:56:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (75, 'zclcs', '修改角色', 69, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[2, 12, 3, 4, 10])\"', '127.0.0.1', '2021-09-10 15:56:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (76, 'zclcs', '修改角色', 210, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[1, 2, 3, 4, 10, 12, 8])\"', '127.0.0.1', '2021-09-10 15:59:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (77, 'zclcs', '修改角色', 154, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[8, 2])\"', '127.0.0.1', '2021-09-10 16:17:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (78, 'zclcs', '修改角色', 75, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[1, 2])\"', '127.0.0.1', '2021-09-10 16:18:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (79, 'zclcs', '修改角色', 78, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=部门管理, remark=null, menuIds=[2])\"', '127.0.0.1', '2021-09-10 16:18:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (80, 'zclcs', '修改角色', 140, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[1, 2, 3, 12, 10, 4, 8])\"', '127.0.0.1', '2021-09-10 16:59:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (81, 'zclcs', '修改角色', 210, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8, 2])\"', '127.0.0.1', '2021-09-13 10:37:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (82, 'zclcs', '修改角色', 83, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:42:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (83, 'zclcs', '修改角色', 53, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:42:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (84, 'zclcs', '修改角色', 73, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:45:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (85, 'zclcs', '修改角色', 76, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:46:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (86, 'zclcs', '修改角色', 71, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:47:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (87, 'zclcs', '修改角色', 50, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:48:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (88, 'zclcs', '修改角色', 81, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:51:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (89, 'zclcs', '修改角色', 49, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:54:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (90, 'zclcs', '修改角色', 82, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 10:54:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (91, 'zclcs', '修改角色', 44, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 11:13:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (92, 'zclcs', '修改角色', 77, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 11:32:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (93, 'zclcs', '修改角色', 43, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8, 2, 1])\"', '127.0.0.1', '2021-09-13 11:33:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (94, 'zclcs', '修改角色', 77, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[1, 2, 8])\"', '127.0.0.1', '2021-09-13 11:33:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (95, 'zclcs', '修改用户', 128, 'com.zclcs.server.system.controller.SystemUserController.updateUser()', ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=4, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[2], deptIds=[2])\"', '127.0.0.1', '2021-09-13 14:19:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (96, 'zclcs', '修改用户', 114, 'com.zclcs.server.system.controller.SystemUserController.updateUser()', ' user: \"SystemUserAo(userId=9, username=test, password=null, deptId=5, email=null, mobile=null, status=1, lastLoginTime=null, gender=null, isTab=null, theme=null, avatar=null, description=null, roleIds=[2], deptIds=[2])\"', '127.0.0.1', '2021-09-13 14:19:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (97, 'zclcs', '修改角色', 75, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8])\"', '127.0.0.1', '2021-09-13 14:26:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (98, 'zclcs', '新增菜单/按钮', 75, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=2, menuName=查看用户, path=null, component=null, perms=user:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-13 14:30:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (99, 'zclcs', '修改菜单/按钮', 46, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=2, parentId=1, menuName=用户管理, path=user, component=/cloud/system/user/index, perms=, icon=ant-design:user-switch-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=1.0)\"', '127.0.0.1', '2021-09-13 14:31:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (100, 'zclcs', '新增菜单/按钮', 48, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=12, menuName=查看角色, path=null, component=null, perms=role:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-13 14:33:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (101, 'zclcs', '新增菜单/按钮', 66, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=12, menuName=删除角色, path=null, component=null, perms=role:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-13 14:34:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (102, 'zclcs', '修改菜单/按钮', 35, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=12, parentId=1, menuName=角色管理, path=role, component=/cloud/system/role/index, perms=, icon=ant-design:solution-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=2.0)\"', '127.0.0.1', '2021-09-13 14:35:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (103, 'zclcs', '删除菜单/按钮', 63, 'com.zclcs.server.system.controller.SystemMenuController.deleteMenus()', ' menuIds: \"21\"', '127.0.0.1', '2021-09-13 14:37:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (104, 'zclcs', '新增菜单/按钮', 46, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=12, menuName=查看角色, path=null, component=null, perms=role:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-13 14:37:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (105, 'zclcs', '新增菜单/按钮', 43, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=10, menuName=删除菜单, path=null, component=null, perms=menu:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-13 14:38:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (106, 'zclcs', '修改菜单/按钮', 37, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=24, parentId=10, menuName=查看菜单, path=null, component=null, perms=menu:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-13 14:38:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (107, 'zclcs', '修改菜单/按钮', 40, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=10, parentId=1, menuName=菜单管理, path=menu, component=/cloud/system/menu/index, perms=, icon=ant-design:menu-fold-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=3.0)\"', '127.0.0.1', '2021-09-13 14:39:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (108, 'zclcs', '新增菜单/按钮', 42, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=4, menuName=查看部门, path=null, component=null, perms=dept:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-13 14:40:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (109, 'zclcs', '修改菜单/按钮', 56, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=4, parentId=1, menuName=部门管理, path=dept, component=/cloud/system/dept/index, perms=, icon=ant-design:apartment-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=4.0)\"', '127.0.0.1', '2021-09-13 14:40:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (110, 'zclcs', '修改角色', 94, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[1, 2, 5, 6, 7, 8, 9, 20, 3, 12, 15, 16, 22, 23, 10, 11, 13, 14, 24, 4, 17, 18, 19, 25])\"', '127.0.0.1', '2021-09-13 14:40:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (111, 'zclcs', '修改角色', 88, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[8, 20, 23, 3, 24, 25, 2, 1, 12, 10, 4])\"', '127.0.0.1', '2021-09-13 14:42:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (112, 'zclcs', '修改角色', 73, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[3, 23, 24, 25, 1, 12, 10, 4])\"', '127.0.0.1', '2021-09-13 14:54:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (113, 'zclcs', '修改角色', 42, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[3, 23, 24, 25, 20, 1, 12, 10, 4, 2])\"', '127.0.0.1', '2021-09-13 14:55:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (114, 'zclcs', '修改角色', 93, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=2, roleName=查看, remark=null, menuIds=[20, 3, 23, 24, 25, 8, 2, 1, 12, 10, 4])\"', '127.0.0.1', '2021-09-13 14:55:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (115, 'zclcs', '新增菜单/按钮', 164, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=1, menuName=重置密码, path=password, component=/cloud/system/password/index, perms=null, icon=ant-design:radius-setting-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=5.0)\"', '127.0.0.1', '2021-09-13 16:39:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (116, 'zclcs', '新增菜单/按钮', 41, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=26, menuName=重置密码, path=null, component=null, perms=user:reset, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, orderNum=null)\"', '127.0.0.1', '2021-09-13 16:39:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (117, 'zclcs', '修改角色', 95, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[5, 2, 6, 7, 8, 9, 20, 3, 15, 12, 16, 22, 23, 11, 10, 13, 14, 24, 17, 4, 18, 19, 25, 26, 27, 1])\"', '127.0.0.1', '2021-09-13 16:50:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (118, 'zclcs', '新增菜单/按钮', 143, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=null, menuName=首页, path=dashboard, component=/dashboard/index, perms=null, icon=ant-design:align-left-outlined, type=0, hideMenu=1, ignoreKeepAlive=1, orderNum=1.0)\"', '127.0.0.1', '2021-09-14 17:19:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (119, 'zclcs', '修改菜单/按钮', 106, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=1, ignoreKeepAlive=null, orderNum=1.0)\"', '127.0.0.1', '2021-09-14 17:24:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (120, 'zclcs', '新增菜单/按钮', 48, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=null, menuName=分页页, path=analysis, component=/dashboard/analysis/index, perms=null, icon=ant-design:amazon-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=1.0)\"', '127.0.0.1', '2021-09-14 17:28:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (121, 'zclcs', '新增菜单/按钮', 39, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=28, menuName=工作台, path=workbench, component=/dashboard/workbench/index, perms=null, icon=ant-design:alert-filled, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=2.0)\"', '127.0.0.1', '2021-09-14 17:28:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (122, 'zclcs', '修改菜单/按钮', 55, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=29, parentId=28, menuName=分析页, path=analysis, component=/dashboard/analysis/index, perms=null, icon=ant-design:amazon-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, orderNum=1.0)\"', '127.0.0.1', '2021-09-14 17:29:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (123, 'zclcs', '修改菜单/按钮', 46, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, orderNum=1.0)\"', '127.0.0.1', '2021-09-14 17:29:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (124, 'zclcs', '修改角色', 114, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[5, 2, 1, 6, 7, 8, 9, 20, 3, 15, 12, 16, 22, 23, 11, 10, 13, 14, 24, 17, 4, 18, 19, 25, 27, 26, 28, 29, 30])\"', '127.0.0.1', '2021-09-14 17:30:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (125, 'zclcs', '修改菜单/按钮', 139, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, redirect=/dashboard/analysis, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=1, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-09-15 09:45:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (126, 'zclcs', '修改菜单/按钮', 46, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=1, parentId=null, menuName=系统管理, path=/system, component=null, redirect=null, perms=null, icon=ant-design:setting-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"', '127.0.0.1', '2021-09-15 09:47:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (127, 'zclcs', '修改菜单/按钮', 45, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, redirect=null, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=1, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-09-15 09:48:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (128, 'zclcs', '修改菜单/按钮', 130, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, redirect=/dashboard/analysis, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=1, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-09-15 09:54:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (129, 'zclcs', '修改菜单/按钮', 42, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=29, parentId=28, menuName=分析页, path=analysis, component=/dashboard/analysis/index, redirect=null, perms=null, icon=ant-design:amazon-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=/dashboard, orderNum=1.0)\"', '127.0.0.1', '2021-09-15 09:54:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (130, 'zclcs', '修改菜单/按钮', 40, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=1, parentId=null, menuName=系统管理, path=/system, component=null, redirect=null, perms=null, icon=ant-design:setting-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"', '127.0.0.1', '2021-09-15 09:55:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (131, 'zclcs', '修改菜单/按钮', 52, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=29, parentId=28, menuName=分析页, path=analysis, component=/dashboard/analysis/index, redirect=null, perms=null, icon=ant-design:amazon-outlined, type=0, hideMenu=1, ignoreKeepAlive=0, hideBreadcrumb=1, hideChildrenInMenu=0, currentActiveMenu=/dashboard, orderNum=1.0)\"', '127.0.0.1', '2021-09-15 09:55:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (132, 'zclcs', '修改菜单/按钮', 32, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=30, parentId=28, menuName=工作台, path=workbench, component=/dashboard/workbench/index, redirect=null, perms=null, icon=ant-design:alert-filled, type=0, hideMenu=1, ignoreKeepAlive=0, hideBreadcrumb=1, hideChildrenInMenu=0, currentActiveMenu=/dashboard, orderNum=2.0)\"', '127.0.0.1', '2021-09-15 09:56:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (133, 'zclcs', '修改菜单/按钮', 120, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=28, parentId=null, menuName=首页, path=/dashboard, component=null, redirect=/dashboard/analysis, perms=null, icon=ant-design:align-left-outlined, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=1, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-09-15 09:58:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (134, 'zclcs', '修改菜单/按钮', 58, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=29, parentId=28, menuName=分析页, path=analysis, component=/dashboard/analysis/index, redirect=null, perms=null, icon=ant-design:amazon-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=1, hideChildrenInMenu=0, currentActiveMenu=/dashboard, orderNum=1.0)\"', '127.0.0.1', '2021-09-15 09:59:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (135, 'zclcs', '修改菜单/按钮', 33, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=30, parentId=28, menuName=工作台, path=workbench, component=/dashboard/workbench/index, redirect=null, perms=null, icon=ant-design:alert-filled, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=1, hideChildrenInMenu=0, currentActiveMenu=/dashboard, orderNum=2.0)\"', '127.0.0.1', '2021-09-15 09:59:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (136, 'zclcs', '修改角色', 103, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[29, 30, 28])\"', '127.0.0.1', '2021-09-29 14:55:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (137, 'zclcs', '修改角色', 103, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1', '2021-09-29 14:59:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (138, 'zclcs', '修改角色', 98, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1', '2021-09-29 15:03:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (139, 'zclcs', '修改角色', 115, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1', '2021-09-29 15:13:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (140, 'zclcs', '修改角色', 997, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1', '2021-09-29 15:39:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (141, 'zclcs', '修改角色', 40, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1', '2021-09-29 15:40:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (142, 'zclcs', '修改角色', 991, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=3, roleName=111, remark=null, menuIds=[28, 29, 30])\"', '127.0.0.1', '2021-09-29 15:44:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (143, 'zclcs', '新增菜单/按钮', 917, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=null, menuName=快速开发, path=/gen, component=null, redirect=null, perms=null, icon=ant-design:code-filled, type=2, hideMenu=0, ignoreKeepAlive=null, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=3.0)\"', '127.0.0.1', '2021-10-11 17:30:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (144, 'zclcs', '新增菜单/按钮', 63, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=31, menuName=配置管理, path=/gen/config, component=/cloud/gen/config/index, redirect=null, perms=null, icon=ant-design:contacts-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-10-11 17:32:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (145, 'zclcs', '新增菜单/按钮', 77, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=31, menuName=代码生成, path=/code, component=/cloud/code/index, redirect=null, perms=null, icon=ant-design:code-sandbox-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"', '127.0.0.1', '2021-10-12 09:05:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (146, 'zclcs', '修改菜单/按钮', 65, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=33, parentId=31, menuName=代码生成, path=/code, component=/cloud/gen/code/index, redirect=null, perms=null, icon=ant-design:code-sandbox-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"', '127.0.0.1', '2021-10-12 09:05:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (147, 'zclcs', '修改菜单/按钮', 70, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=32, parentId=31, menuName=代码生成配置管理, path=/gen/config, component=/cloud/gen/config/index, redirect=null, perms=null, icon=ant-design:contacts-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-10-12 15:22:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (148, 'zclcs', '修改菜单/按钮', 59, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=32, parentId=31, menuName=代码生成配置管理, path=/code/gen/config, component=/cloud/code/gen/config/index, redirect=null, perms=null, icon=ant-design:contacts-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-10-12 15:25:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (149, 'zclcs', '修改菜单/按钮', 68, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=33, parentId=31, menuName=代码生成, path=/code/gen, component=/cloud/code/gen/code/index, redirect=null, perms=null, icon=ant-design:code-sandbox-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"', '127.0.0.1', '2021-10-12 15:25:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (150, 'zclcs', '修改菜单/按钮', 83, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=32, parentId=31, menuName=代码生成配置管理, path=/gen/config, component=/cloud/gen/config/index, redirect=null, perms=null, icon=ant-design:contacts-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-10-12 15:25:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (151, 'zclcs', '修改菜单/按钮', 60, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=33, parentId=31, menuName=代码生成, path=/gen/gen, component=/cloud/gen/gen/index, redirect=null, perms=null, icon=ant-design:code-sandbox-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"', '127.0.0.1', '2021-10-12 15:25:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (152, 'zclcs', '新增菜单/按钮', 71, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=32, menuName=获取代码生成配置, path=null, component=null, redirect=null, perms=gen:config, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-12 15:30:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (153, 'zclcs', '新增菜单/按钮', 96, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=32, menuName=修改代码生成配置, path=null, component=null, redirect=null, perms=gen:config:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-12 15:31:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (154, 'zclcs', '新增菜单/按钮', 79, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=33, menuName=查看代码生成, path=null, component=null, redirect=null, perms=gen:generate, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-12 15:32:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (155, 'zclcs', '修改菜单/按钮', 63, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=34, parentId=32, menuName=查看代码生成配置, path=null, component=null, redirect=null, perms=gen:config, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-12 15:32:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (156, 'zclcs', '新增菜单/按钮', 64, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=33, menuName=生成代码, path=null, component=null, redirect=null, perms=gen:generate:gen, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-12 15:36:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (157, 'zclcs', '修改角色', 131, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[29, 28, 30, 5, 2, 1, 6, 7, 8, 9, 20, 3, 15, 12, 16, 22, 23, 11, 10, 13, 14, 24, 17, 4, 18, 19, 25, 27, 26, 31, 32, 34, 35, 33, 36, 37])\"', '127.0.0.1', '2021-10-12 15:36:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (158, 'zclcs', '修改角色', 86, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[29, 28, 30, 5, 2, 1, 6, 7, 8, 9, 20, 3, 12, 15, 16, 22, 23, 10, 11, 13, 14, 24, 4, 17, 18, 19, 25, 26, 27, 34, 36, 33, 37, 35, 32, 31])\"', '127.0.0.1', '2021-10-12 15:36:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (159, 'zclcs', '删除角色', 78, 'com.zclcs.server.system.controller.SystemRoleController.deleteRoles()', ' roleIds: \"3\"', '127.0.0.1', '2021-10-12 15:36:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (160, 'zclcs', '修改密码', 1050, 'com.zclcs.server.system.controller.SystemUserController.updatePassword()', ' username: \"test\" password: \"123456\"', '127.0.0.1', '2021-10-13 16:12:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (161, 'zclcs', '修改代码生成配置', 1296, 'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()', ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=entity, aoPackage=entity.ao, voPackage=entity.vo, mapperPackage=mapper, mapperXmlPackage=mapper, servicePackage=service, serviceImplPackage=service.impl, controllerPackage=controller, isTrim=0, trimValue=null)', '127.0.0.1', '2021-10-14 09:37:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (162, 'zclcs', '修改代码生成配置', 61, 'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()', ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=entity, aoPackage=entity.ao, voPackage=entity.vo, mapperPackage=mapper, mapperXmlPackage=mapper, servicePackage=service, serviceImplPackage=service.impl, controllerPackage=controller, isTrim=0, trimValue=null)', '127.0.0.1', '2021-10-14 09:39:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (163, 'zclcs', '修改代码生成配置', 68, 'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()', ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=entity, aoPackage=entity.ao, voPackage=entity.vo, mapperPackage=mapper, mapperXmlPackage=mapper, servicePackage=service1, serviceImplPackage=service.impl, controllerPackage=controller, isTrim=0, trimValue=null)', '127.0.0.1', '2021-10-14 09:40:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (164, 'zclcs', '修改代码生成配置', 89, 'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()', ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=entity, aoPackage=entity.ao, voPackage=entity.vo, mapperPackage=mapper, mapperXmlPackage=mapper, servicePackage=service, serviceImplPackage=service.impl, controllerPackage=controller, isTrim=0, trimValue=null)', '127.0.0.1', '2021-10-14 09:40:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (165, 'zclcs', '修改代码生成配置', 1023, 'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()', ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=common.core.entity, aoPackage=common.core.entity.ao, voPackage=common.core.entity.vo, mapperPackage=server.test.mapper, mapperXmlPackage=server.test.mapper, servicePackage=server.test.service, serviceImplPackage=server.test.service.impl, controllerPackage=server.test.controller, isTrim=0, trimValue=null)', '127.0.0.1', '2021-10-14 16:58:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (166, 'zclcs', '修改代码生成配置', 87, 'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()', ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=common.core.entity.test, aoPackage=common.core.entity.test.ao, voPackage=common.core.entity.test.vo, mapperPackage=server.test.mapper, mapperXmlPackage=server.test.mapper, servicePackage=server.test.service, serviceImplPackage=server.test.service.impl, controllerPackage=server.test.controller, isTrim=0, trimValue=null)', '127.0.0.1', '2021-10-14 17:00:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (167, 'zclcs', '新增文件', 2234, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@60d74b49\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:39:18', '');
INSERT INTO `system_log` VALUES (168, 'zclcs', '新增文件', 170, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@5714c87\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:47:49', '');
INSERT INTO `system_log` VALUES (169, 'zclcs', '新增文件', 184, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@e6157d8\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:49:33', '');
INSERT INTO `system_log` VALUES (170, 'zclcs', '新增文件', 161, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@7843e93a\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:49:53', '');
INSERT INTO `system_log` VALUES (171, 'zclcs', '新增文件', 139, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@183a9e83\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:49:54', '');
INSERT INTO `system_log` VALUES (172, 'zclcs', '新增文件', 99, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@659614e4\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:49:55', '');
INSERT INTO `system_log` VALUES (173, 'zclcs', '新增文件', 105, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@29dcf9af\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:49:56', '');
INSERT INTO `system_log` VALUES (174, 'zclcs', '新增文件', 143, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@3d089bb6\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:49:57', '');
INSERT INTO `system_log` VALUES (175, 'zclcs', '新增文件', 214, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@cdead9c\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:49:58', '');
INSERT INTO `system_log` VALUES (176, 'zclcs', '新增文件', 136, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@5e36415b\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:49:58', '');
INSERT INTO `system_log` VALUES (177, 'zclcs', '新增文件', 97, 'com.zclcs.server.minio.controller.MinioFileController.addMinioFile()', ' file: \"org.springframework.web.multipart.support.StandardMultipartHttpServletRequest$StandardMultipartFile@2c139637\" bucketName: \"null\"', '192.168.33.1', '2021-10-19 10:50:07', '');
INSERT INTO `system_log` VALUES (178, 'zclcs', '新增菜单/按钮', 1052, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=null, menuName=文件管理, path=/file, component=null, redirect=null, perms=null, icon=ant-design:file-add-filled, type=2, hideMenu=1, ignoreKeepAlive=null, hideBreadcrumb=1, hideChildrenInMenu=1, currentActiveMenu=null, orderNum=4.0)\"', '127.0.0.1', '2021-10-25 10:36:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (179, 'zclcs', '新增菜单/按钮', 55, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=38, menuName=桶, path=/file/bucket, component=null, redirect=null, perms=null, icon=ant-design:tags-filled, type=0, hideMenu=1, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-10-25 10:37:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (180, 'zclcs', '新增菜单/按钮', 39, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=38, menuName=文件, path=/file/file, component=null, redirect=null, perms=null, icon=ant-design:file-unknown-twotone, type=0, hideMenu=1, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"', '127.0.0.1', '2021-10-25 10:38:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (181, 'zclcs', '新增菜单/按钮', 39, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=39, menuName=添加桶, path=null, component=null, redirect=null, perms=bucket:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-25 10:39:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (182, 'zclcs', '新增菜单/按钮', 35, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=39, menuName=删除桶, path=null, component=null, redirect=null, perms=bucket:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-25 10:40:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (183, 'zclcs', '新增菜单/按钮', 42, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=39, menuName=查看桶, path=null, component=null, redirect=null, perms=bucket:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-25 10:40:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (184, 'zclcs', '新增菜单/按钮', 37, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=40, menuName=添加文件, path=null, component=null, redirect=null, perms=file:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-25 10:41:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (185, 'zclcs', '新增菜单/按钮', 43, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=40, menuName=删除文件, path=null, component=null, redirect=null, perms=file:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-25 10:42:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (186, 'zclcs', '新增菜单/按钮', 35, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=40, menuName=查看文件, path=null, component=null, redirect=null, perms=file:view, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-25 10:42:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (187, 'zclcs', '新增菜单/按钮', 29, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=40, menuName=下载文件, path=null, component=null, redirect=null, perms=file:download, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-10-25 10:43:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (188, 'zclcs', '修改角色', 1052, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[29, 28, 30, 5, 2, 1, 6, 7, 8, 9, 20, 3, 15, 12, 16, 22, 23, 11, 10, 13, 14, 24, 17, 4, 18, 19, 25, 27, 26, 34, 32, 31, 35, 36, 33, 37, 38, 39, 41, 42, 43, 40, 44, 45, 46, 47])\"', '127.0.0.1', '2021-10-25 10:48:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (189, 'zclcs', '修改代码生成配置', 1086, 'com.zclcs.server.generator.controller.GeneratorConfigController.updateGeneratorConfig()', ' generatorConfig: GeneratorConfigAo(id=1, author=zclcs, basePackage=com.zclcs, entityPackage=common.core.entity.dict, aoPackage=common.core.entity.dict.ao, voPackage=common.core.entity.dict.vo, mapperPackage=server.dict.mapper, mapperXmlPackage=server.dict.mapper, servicePackage=server.dict.service, serviceImplPackage=server.dict.service.impl, controllerPackage=server.dict.controller, isTrim=0, trimValue=null)', '127.0.0.1', '2021-11-02 15:21:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (190, 'zclcs', '修改菜单/按钮', 1336, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=33, parentId=31, menuName=代码生成, path=gen, component=/cloud/gen/gen/index, redirect=null, perms=null, icon=ant-design:code-sandbox-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"', '127.0.0.1', '2021-11-03 09:00:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (191, 'zclcs', '修改菜单/按钮', 38, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=32, parentId=31, menuName=代码生成配置管理, path=config, component=/cloud/gen/config/index, redirect=null, perms=null, icon=ant-design:contacts-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-11-03 09:00:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (192, 'zclcs', '新增菜单/按钮', 47, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=1, menuName=字典管理, path=dict, component=/cloud/system/dict/dict/index, redirect=null, perms=null, icon=ant-design:medicine-box-filled, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=6.0)\"', '127.0.0.1', '2021-11-03 09:04:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (193, 'zclcs', '修改菜单/按钮', 43, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=48, parentId=1, menuName=字典管理, path=dict, component=, redirect=null, perms=null, icon=ant-design:medicine-box-filled, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=6.0)\"', '127.0.0.1', '2021-11-03 09:05:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (194, 'zclcs', '新增菜单/按钮', 39, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=48, menuName=字典, path=dict, component=/cloud/system/dict/dict/index, redirect=null, perms=null, icon=ant-design:medicine-box-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-11-03 09:06:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (195, 'zclcs', '新增菜单/按钮', 36, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=48, menuName=层级字典, path=dict/level, component=/cloud/system/dict/level/index, redirect=null, perms=null, icon=ant-design:medicine-box-twotone, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"', '127.0.0.1', '2021-11-03 09:06:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (196, 'zclcs', '新增菜单/按钮', 45, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=49, menuName=添加字典, path=null, component=null, redirect=null, perms=table:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-03 09:07:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (197, 'zclcs', '新增菜单/按钮', 35, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=49, menuName=修改字典, path=null, component=null, redirect=null, perms=table:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-03 09:08:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (198, 'zclcs', '新增菜单/按钮', 43, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=49, menuName=删除字典, path=null, component=null, redirect=null, perms=table:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-03 09:08:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (199, 'zclcs', '新增菜单/按钮', 37, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=50, menuName=层级字典, path=null, component=null, redirect=null, perms=tableLevel:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-03 09:27:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (200, 'zclcs', '修改菜单/按钮', 32, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=54, parentId=50, menuName=新增层级字典, path=null, component=null, redirect=null, perms=tableLevel:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-03 09:28:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (201, 'zclcs', '新增菜单/按钮', 36, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=50, menuName=删除层级字典, path=null, component=null, redirect=null, perms=tableLevel:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-03 09:28:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (202, 'zclcs', '新增菜单/按钮', 43, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=50, menuName=修改层级字典, path=null, component=null, redirect=null, perms=tableLevel:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-03 09:29:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (203, 'zclcs', '修改角色', 1265, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[29, 28, 30, 34, 32, 31, 35, 33, 36, 37, 41, 39, 38, 42, 43, 40, 44, 45, 46, 47, 1, 2, 5, 6, 7, 8, 9, 20, 3, 12, 15, 16, 22, 23, 10, 11, 13, 14, 24, 4, 17, 18, 19, 25, 26, 27, 48, 49, 51, 52, 53, 50, 54, 55, 56])\"', '127.0.0.1', '2021-11-03 11:39:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (204, 'zclcs', '新增菜单/按钮', 41, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=48, menuName=字典表, path=table, component=/cloud/system/dict/table/index, redirect=null, perms=null, icon=ant-design:table-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=1.0)\"', '127.0.0.1', '2021-11-03 14:33:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (205, 'zclcs', '修改菜单/按钮', 39, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=50, parentId=48, menuName=层级字典, path=dict/level, component=/cloud/system/dict/level/index, redirect=null, perms=null, icon=ant-design:medicine-box-twotone, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=3.0)\"', '127.0.0.1', '2021-11-03 14:34:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (206, 'zclcs', '修改菜单/按钮', 64, 'com.zclcs.server.system.controller.SystemMenuController.updateMenu()', ' menu: \"SystemMenuAo(menuId=49, parentId=48, menuName=字典, path=dict, component=/cloud/system/dict/dict/index, redirect=null, perms=null, icon=ant-design:medicine-box-outlined, type=0, hideMenu=0, ignoreKeepAlive=0, hideBreadcrumb=0, hideChildrenInMenu=0, currentActiveMenu=null, orderNum=2.0)\"', '127.0.0.1', '2021-11-03 14:34:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (207, 'zclcs', '新增菜单/按钮', 31, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=57, menuName=新增字典名表, path=null, component=null, redirect=null, perms=tableName:add, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-03 14:35:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (208, 'zclcs', '新增菜单/按钮', 37, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=57, menuName=删除字典名表, path=null, component=null, redirect=null, perms=tableName:delete, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-03 14:36:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (209, 'zclcs', '新增菜单/按钮', 29, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=57, menuName=修改字典名表, path=null, component=null, redirect=null, perms=tableName:update, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-03 14:36:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (210, 'zclcs', '修改角色', 58, 'com.zclcs.server.system.controller.SystemRoleController.updateRole()', ' role: \"SystemRoleAo(roleId=1, roleName=管理员, remark=管理员, menuIds=[29, 28, 30, 5, 2, 6, 7, 8, 9, 20, 3, 15, 12, 16, 22, 23, 11, 10, 13, 14, 24, 17, 4, 18, 19, 25, 27, 26, 51, 49, 52, 53, 54, 50, 55, 56, 34, 32, 31, 35, 36, 33, 37, 41, 39, 38, 42, 43, 44, 40, 45, 46, 47, 48, 57, 58, 59, 60, 1])\"', '127.0.0.1', '2021-11-03 14:36:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (211, 'zclcs', '新增字典', 954, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=2, code=1, title=11, remark=null)\"', '127.0.0.1', '2021-11-03 15:51:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (212, 'zclcs', '删除字典', 38, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"10\"', '127.0.0.1', '2021-11-03 15:51:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (213, 'zclcs', '新增字典', 38, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=1, code=11, title=11, remark=null)\"', '127.0.0.1', '2021-11-03 17:10:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (214, 'zclcs', '删除字典', 39, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"11\"', '127.0.0.1', '2021-11-03 17:10:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (215, 'zclcs', '新增字典', 37, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=1, code=222, title=333, remark=null)\"', '127.0.0.1', '2021-11-03 17:10:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (216, 'zclcs', '修改字典', 30, 'com.zclcs.server.dict.controller.DictTableController.updateDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=1, code=222, title=555, remark=null)\"', '127.0.0.1', '2021-11-03 17:10:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (217, 'zclcs', '删除字典', 32, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"12\"', '127.0.0.1', '2021-11-03 17:10:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (218, 'zclcs', '新增字典名表', 912, 'com.zclcs.server.dict.controller.DictTableNameController.addDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=ce, dictTitle=ce, sort=null, type=null, remark=null)\"', '127.0.0.1', '2021-11-03 17:15:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (219, 'zclcs', '修改字典名表', 35, 'com.zclcs.server.dict.controller.DictTableNameController.updateDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=ce, dictTitle=ce, sort=null, type=1, remark=null)\"', '127.0.0.1', '2021-11-03 17:15:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (220, 'zclcs', '新增字典', 32, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=1, code=22, title=22, remark=null)\"', '127.0.0.1', '2021-11-03 17:18:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (221, 'zclcs', '修改字典', 37, 'com.zclcs.server.dict.controller.DictTableController.updateDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=1, code=22, title=44, remark=null)\"', '127.0.0.1', '2021-11-03 17:18:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (222, 'zclcs', '修改字典名表', 33, 'com.zclcs.server.dict.controller.DictTableNameController.updateDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=5, dictName=ce, dictTitle=ce, sort=null, type=1, remark=null)\"', '127.0.0.1', '2021-11-03 17:18:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (223, 'zclcs', '修改字典', 27, 'com.zclcs.server.dict.controller.DictTableController.updateDictTable()', ' dictTableAo: \"DictTableAo(id=13, dictNameId=1, code=22, title=88, remark=null)\"', '127.0.0.1', '2021-11-03 17:18:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (224, 'zclcs', '删除字典', 34, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"13\"', '127.0.0.1', '2021-11-03 17:18:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (225, 'zclcs', '删除字典名表', 26, 'com.zclcs.server.dict.controller.DictTableNameController.deleteDictTableName()', ' tableNameIds: \"5\"', '127.0.0.1', '2021-11-03 17:18:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (226, 'zclcs', '新增字典名表', 1196, 'com.zclcs.server.dict.controller.DictTableNameController.addDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=test, dictTitle=测试, sort=null, type=null, remark=null)\"', '127.0.0.1', '2021-11-04 11:03:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (227, 'zclcs', '新增字典', 1061, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=5, code=1, title=1, remark=null)\"', '127.0.0.1', '2021-11-04 11:05:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (228, 'zclcs', '删除字典', 1052, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"11\"', '127.0.0.1', '2021-11-04 11:10:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (229, 'zclcs', '新增字典', 104, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=5, code=1, title=1, remark=null)\"', '127.0.0.1', '2021-11-04 11:12:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (230, 'zclcs', '删除字典', 974, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"12\"', '127.0.0.1', '2021-11-04 11:19:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (231, 'zclcs', '新增字典', 1007, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=5, code=1, title=1, remark=null)\"', '127.0.0.1', '2021-11-04 11:37:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (232, 'zclcs', '删除字典', 48, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"13\"', '127.0.0.1', '2021-11-04 11:37:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (233, 'zclcs', '新增字典名表', 49, 'com.zclcs.server.dict.controller.DictTableNameController.addDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=area_code, dictTitle=行政区划, sort=null, type=1, remark=null)\"', '127.0.0.1', '2021-11-04 15:17:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (234, 'zclcs', '新增层级字典', 927, 'com.zclcs.server.dict.controller.DictTableLevelController.addDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=null, parentId=null, dictNameId=6, code=110000, title=北京市, remark=null)\"', '127.0.0.1', '2021-11-04 15:44:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (235, 'zclcs', '新增层级字典', 980, 'com.zclcs.server.dict.controller.DictTableLevelController.addDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=null, parentId=null, dictNameId=6, code=110101, title=东城区, remark=null)\"', '127.0.0.1', '2021-11-04 16:03:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (236, 'zclcs', '修改层级字典', 40, 'com.zclcs.server.dict.controller.DictTableLevelController.updateDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=2, parentId=null, dictNameId=6, code=110101, title=东城区, remark=null)\"', '127.0.0.1', '2021-11-04 16:03:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (237, 'zclcs', '修改层级字典', 39, 'com.zclcs.server.dict.controller.DictTableLevelController.updateDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=2, parentId=1, dictNameId=6, code=110101, title=东城区, remark=null)\"', '127.0.0.1', '2021-11-04 16:11:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (238, 'zclcs', '新增层级字典', 59, 'com.zclcs.server.dict.controller.DictTableLevelController.addDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=null, parentId=1, dictNameId=6, code=110102, title=西城区, remark=null)\"', '127.0.0.1', '2021-11-04 16:20:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (239, 'zclcs', '新增部门', 2033, 'com.zclcs.server.system.controller.SystemDeptController.addDept()', ' dept: \"SystemDeptAo(deptId=null, parentId=1, deptName=开发二部二, orderNum=3.0, createTimeFrom=null, createTimeTo=null)\"', '127.0.0.1', '2021-11-04 16:25:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (240, 'zclcs', '新增层级字典', 934, 'com.zclcs.server.dict.controller.DictTableLevelController.addDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=null, parentId=3, dictNameId=6, code=1, title=1, remark=null)\"', '127.0.0.1', '2021-11-04 16:58:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (241, 'zclcs', '修改层级字典', 54, 'com.zclcs.server.dict.controller.DictTableLevelController.updateDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=4, parentId=3, dictNameId=6, code=01, title=01, remark=null)\"', '127.0.0.1', '2021-11-04 17:00:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (242, 'zclcs', '修改层级字典', 44, 'com.zclcs.server.dict.controller.DictTableLevelController.updateDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=3, parentId=null, dictNameId=6, code=110102, title=01, remark=null)\"', '127.0.0.1', '2021-11-04 17:01:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (243, 'zclcs', '修改层级字典', 37, 'com.zclcs.server.dict.controller.DictTableLevelController.updateDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=2, parentId=1, dictNameId=6, code=110101, title=01, remark=null)\"', '127.0.0.1', '2021-11-04 17:02:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (244, 'zclcs', '修改层级字典', 930, 'com.zclcs.server.dict.controller.DictTableLevelController.updateDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=2, parentId=1, dictNameId=6, code=110101, title=西城区, remark=null)\"', '127.0.0.1', '2021-11-04 17:24:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (245, 'zclcs', '删除层级字典', 69, 'com.zclcs.server.dict.controller.DictTableLevelController.deleteDictTableLevel()', ' tableLevelIds: \"4\"', '127.0.0.1', '2021-11-04 17:24:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (246, 'zclcs', '修改层级字典', 78, 'com.zclcs.server.dict.controller.DictTableLevelController.updateDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=3, parentId=1, dictNameId=6, code=110102, title=朝阳区, remark=null)\"', '127.0.0.1', '2021-11-04 17:24:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (247, 'zclcs', '修改层级字典', 200, 'com.zclcs.server.dict.controller.DictTableLevelController.updateDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=2, parentId=1, dictNameId=6, code=110101, title=西城区, remark=null)\"', '127.0.0.1', '2021-11-05 08:40:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (248, 'zclcs', '新增字典', 1016, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=5, code=1, title=1, remark=null)\"', '127.0.0.1', '2021-11-05 14:40:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (249, 'zclcs', '新增字典名表', 33, 'com.zclcs.server.dict.controller.DictTableNameController.addDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=test_level, dictTitle=测试层级, sort=null, type=1, remark=null)\"', '127.0.0.1', '2021-11-05 14:41:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (250, 'zclcs', '新增层级字典', 46, 'com.zclcs.server.dict.controller.DictTableLevelController.addDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=null, parentId=null, dictNameId=7, code=1, title=1, remark=null)\"', '127.0.0.1', '2021-11-05 14:46:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (251, 'zclcs', '修改层级字典', 40, 'com.zclcs.server.dict.controller.DictTableLevelController.updateDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=5, parentId=null, dictNameId=7, code=555, title=测试, remark=null)\"', '127.0.0.1', '2021-11-05 14:47:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (252, 'zclcs', '新增层级字典', 34, 'com.zclcs.server.dict.controller.DictTableLevelController.addDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=null, parentId=null, dictNameId=7, code=666, title=测试2, remark=null)\"', '127.0.0.1', '2021-11-05 14:52:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (253, 'zclcs', '修改层级字典', 74, 'com.zclcs.server.dict.controller.DictTableLevelController.updateDictTableLevel()', ' dictTableLevelAo: \"DictTableLevelAo(id=6, parentId=5, dictNameId=7, code=666, title=测试2, remark=null)\"', '127.0.0.1', '2021-11-05 15:54:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (254, 'zclcs', '新增菜单/按钮', 1014, 'com.zclcs.server.system.controller.SystemMenuController.addMenu()', ' menu: \"SystemMenuAo(menuId=null, parentId=2, menuName=添加用户, path=null, component=null, redirect=null, perms=user:insert, icon=null, type=1, hideMenu=null, ignoreKeepAlive=null, hideBreadcrumb=null, hideChildrenInMenu=null, currentActiveMenu=null, orderNum=null)\"', '127.0.0.1', '2021-11-05 16:27:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (255, 'zclcs', '删除菜单/按钮', 36, 'com.zclcs.server.system.controller.SystemMenuController.deleteMenus()', ' menuIds: \"61\"', '127.0.0.1', '2021-11-05 16:27:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (256, 'zclcs', '删除部门', 73, 'com.zclcs.server.system.controller.SystemDeptController.deleteDepts()', ' deptIds: \"7\"', '127.0.0.1', '2021-11-05 16:28:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (257, 'zclcs', '删除字典名表', 1042, 'com.zclcs.server.dict.controller.DictTableNameController.deleteDictTableName()', ' tableNameIds: \"5\"', '127.0.0.1', '2021-11-05 17:00:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (258, 'zclcs', '删除字典名表', 50, 'com.zclcs.server.dict.controller.DictTableNameController.deleteDictTableName()', ' tableNameIds: \"7\"', '127.0.0.1', '2021-11-05 17:01:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (259, 'zclcs', '删除字典名表', 962, 'com.zclcs.server.dict.controller.DictTableNameController.deleteDictTableName()', ' tableNameIds: \"3\"', '127.0.0.1', '2021-11-05 17:15:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (260, 'zclcs', '新增字典名表', 60, 'com.zclcs.server.dict.controller.DictTableNameController.addDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=yes_no, dictTitle=是否, sort=null, type=0, remark=null)\"', '127.0.0.1', '2021-11-05 17:16:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (261, 'zclcs', '修改字典名表', 44, 'com.zclcs.server.dict.controller.DictTableNameController.updateDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=8, dictName=yes_no, dictTitle=是否字典表, sort=null, type=0, remark=null)\"', '127.0.0.1', '2021-11-05 17:16:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (262, 'zclcs', '新增字典', 40, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=8, code=0, title=否, remark=null)\"', '127.0.0.1', '2021-11-05 17:16:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (263, 'zclcs', '新增字典', 48, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=8, code=1, title=是, remark=null)\"', '127.0.0.1', '2021-11-05 17:16:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (264, 'zclcs', '新增字典名表', 29, 'com.zclcs.server.dict.controller.DictTableNameController.addDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=menu_type, dictTitle=菜单类型, sort=null, type=null, remark=null)\"', '127.0.0.1', '2021-11-05 17:17:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (265, 'zclcs', '新增字典', 35, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=9, code=0, title=菜单, remark=null)\"', '127.0.0.1', '2021-11-05 17:18:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (266, 'zclcs', '新增字典', 38, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=9, code=1, title=按钮, remark=null)\"', '127.0.0.1', '2021-11-05 17:18:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (267, 'zclcs', '新增字典', 51, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=9, code=2, title=目录, remark=null)\"', '127.0.0.1', '2021-11-05 17:18:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (268, 'zclcs', '新增字典名表', 41, 'com.zclcs.server.dict.controller.DictTableNameController.addDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=user_is_tab, dictTitle=是否开启tab, sort=null, type=null, remark=null)\"', '127.0.0.1', '2021-11-05 17:21:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (269, 'zclcs', '新增字典', 35, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=10, code=0, title=关闭, remark=null)\"', '127.0.0.1', '2021-11-05 17:21:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (270, 'zclcs', '新增字典', 35, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=10, code=1, title=开启, remark=null)\"', '127.0.0.1', '2021-11-05 17:21:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (271, 'zclcs', '新增字典名表', 1070, 'com.zclcs.server.dict.controller.DictTableNameController.addDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=test, dictTitle=1, sort=null, type=null, remark=null)\"', '127.0.0.1', '2021-11-08 09:05:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (272, 'zclcs', '新增字典', 98, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=11, code=1, title=1, remark=null)\"', '127.0.0.1', '2021-11-08 09:05:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (273, 'zclcs', '新增字典', 77, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=11, code=2, title=2, remark=null)\"', '127.0.0.1', '2021-11-08 09:06:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (274, 'zclcs', '删除字典', 60, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"23\"', '127.0.0.1', '2021-11-08 09:06:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (275, 'zclcs', '删除字典名表', 1037, 'com.zclcs.server.dict.controller.DictTableNameController.deleteDictTableName()', ' tableNameIds: \"11\"', '127.0.0.1', '2021-11-08 09:58:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (276, 'zclcs', '新增字典名表', 81, 'com.zclcs.server.dict.controller.DictTableNameController.addDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=test, dictTitle=1, sort=null, type=null, remark=null)\"', '127.0.0.1', '2021-11-08 10:01:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (277, 'zclcs', '新增字典', 52, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=12, code=11, title=11, remark=null)\"', '127.0.0.1', '2021-11-08 10:01:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (278, 'zclcs', '新增字典', 50, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=12, code=22, title=22, remark=null)\"', '127.0.0.1', '2021-11-08 10:01:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (279, 'zclcs', '删除字典', 40, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"25\"', '127.0.0.1', '2021-11-08 10:04:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (280, 'zclcs', '删除字典', 926, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"24\"', '127.0.0.1', '2021-11-08 10:07:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (281, 'zclcs', '新增字典', 966, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=12, code=11, title=11, remark=null)\"', '127.0.0.1', '2021-11-08 10:10:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (282, 'zclcs', '新增字典', 46, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=12, code=22, title=22, remark=null)\"', '127.0.0.1', '2021-11-08 10:10:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (283, 'zclcs', '删除字典', 63, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"27\"', '127.0.0.1', '2021-11-08 10:11:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (284, 'zclcs', '删除字典', 39, 'com.zclcs.server.dict.controller.DictTableController.deleteDictTable()', ' tableIds: \"26\"', '127.0.0.1', '2021-11-08 10:13:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (285, 'zclcs', '新增字典', 964, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=12, code=11, title=11, remark=null)\"', '127.0.0.1', '2021-11-08 10:24:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (286, 'zclcs', '新增字典', 47, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=12, code=22, title=22, remark=null)\"', '127.0.0.1', '2021-11-08 10:24:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (287, 'zclcs', '删除字典名表', 83, 'com.zclcs.server.dict.controller.DictTableNameController.deleteDictTableName()', ' tableNameIds: \"12\"', '127.0.0.1', '2021-11-08 10:24:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (288, 'zclcs', '新增字典名表', 48, 'com.zclcs.server.dict.controller.DictTableNameController.addDictTableName()', ' dictTableNameAo: \"DictTableNameAo(id=null, dictName=test, dictTitle=test, sort=null, type=null, remark=null)\"', '127.0.0.1', '2021-11-08 10:33:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (289, 'zclcs', '新增字典', 39, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=13, code=11, title=11, remark=null)\"', '127.0.0.1', '2021-11-08 10:33:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (290, 'zclcs', '新增字典', 43, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=13, code=22, title=22, remark=null)\"', '127.0.0.1', '2021-11-08 10:33:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (291, 'zclcs', '新增字典', 43, 'com.zclcs.server.dict.controller.DictTableController.addDictTable()', ' dictTableAo: \"DictTableAo(id=null, dictNameId=13, code=33, title=33, remark=null)\"', '127.0.0.1', '2021-11-08 10:33:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `system_log` VALUES (292, 'zclcs', '删除字典名表', 42, 'com.zclcs.server.dict.controller.DictTableNameController.deleteDictTableName()', ' tableNameIds: \"13\"', '127.0.0.1', '2021-11-08 10:34:33', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
DROP TABLE IF EXISTS `system_login_log`;
CREATE TABLE `system_login_log`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `system` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_login_log_login_time`(`login_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮id',
  `parent_id` bigint(20) NOT NULL COMMENT '上级菜单id',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目录/菜单/按钮名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应路由path',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应路由组件component',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '打开目录重定向的子菜单',
  `perms` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型 0菜单 1按钮 2目录',
  `hide_menu` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否隐藏菜单 1是 0否',
  `ignore_keep_alive` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否忽略KeepAlive缓存 1是 0否',
  `hide_breadcrumb` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '隐藏该路由在面包屑上面的显示 1是 0否',
  `hide_children_in_menu` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '隐藏所有子菜单 1是 0否',
  `current_active_menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前激活的菜单。用于配置详情页时左侧激活的菜单路径',
  `order_num` double(20, 0) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `system_menu_parent_id`(`parent_id`) USING BTREE,
  INDEX `system_menu_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, 0, '系统管理', '/system', 'Layout', NULL, NULL, 'ant-design:setting-outlined', '2', '0', '0', '0', '0', NULL, 2, '2017-12-27 16:39:07', '2021-09-15 09:55:30');
INSERT INTO `system_menu` VALUES (2, 1, '用户管理', 'user', '/cloud/system/user/index', NULL, '', 'ant-design:user-switch-outlined', '0', '0', '0', '0', '0', NULL, 1, '2017-12-27 16:47:13', '2021-09-13 14:31:34');
INSERT INTO `system_menu` VALUES (3, 1, '用户详情页面', 'accountDetail/:username', '/cloud/system/user/AccountDetail', NULL, 'user:detail:view', 'ant-design:audit-outlined', '0', '1', '1', '0', '0', NULL, 2, '2021-09-02 09:40:08', '2021-09-10 15:23:24');
INSERT INTO `system_menu` VALUES (4, 1, '部门管理', 'dept', '/cloud/system/dept/index', NULL, '', 'ant-design:apartment-outlined', '0', '0', '0', '0', '0', NULL, 4, '2021-09-02 11:56:30', '2021-09-13 14:40:35');
INSERT INTO `system_menu` VALUES (5, 2, '添加用户', NULL, NULL, NULL, 'user:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-03 10:07:35', '2021-09-10 10:33:20');
INSERT INTO `system_menu` VALUES (6, 2, '修改用户', NULL, NULL, NULL, 'user:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-07 09:02:52', NULL);
INSERT INTO `system_menu` VALUES (7, 2, '删除用户', NULL, NULL, NULL, 'user:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-07 09:57:45', NULL);
INSERT INTO `system_menu` VALUES (8, 2, '查看用户操作日志', NULL, NULL, NULL, 'log:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-07 11:26:50', NULL);
INSERT INTO `system_menu` VALUES (9, 2, '重置用户密码', NULL, NULL, NULL, 'user:reset', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-07 15:16:32', NULL);
INSERT INTO `system_menu` VALUES (10, 1, '菜单管理', 'menu', '/cloud/system/menu/index', NULL, '', 'ant-design:menu-fold-outlined', '0', '0', '0', '0', '0', NULL, 3, '2021-09-08 10:55:14', '2021-09-13 14:39:35');
INSERT INTO `system_menu` VALUES (11, 10, '添加菜单', NULL, NULL, NULL, 'menu:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-08 15:08:38', NULL);
INSERT INTO `system_menu` VALUES (12, 1, '角色管理', 'role', '/cloud/system/role/index', NULL, '', 'ant-design:solution-outlined', '0', '0', '0', '0', '0', NULL, 2, '2021-09-08 15:11:16', '2021-09-13 14:35:06');
INSERT INTO `system_menu` VALUES (13, 10, '修改菜单', NULL, NULL, NULL, 'menu:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-08 15:34:15', NULL);
INSERT INTO `system_menu` VALUES (14, 10, '删除菜单', NULL, NULL, NULL, 'menu:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-09 09:09:49', '2021-09-09 10:29:08');
INSERT INTO `system_menu` VALUES (15, 12, '添加角色', NULL, NULL, NULL, 'role:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-09 11:26:56', NULL);
INSERT INTO `system_menu` VALUES (16, 12, '修改角色', NULL, NULL, NULL, 'role:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-09 11:33:34', NULL);
INSERT INTO `system_menu` VALUES (17, 4, '添加部门', NULL, NULL, NULL, 'dept:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-10 14:28:37', NULL);
INSERT INTO `system_menu` VALUES (18, 4, '修改部门', NULL, NULL, NULL, 'dept:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-10 14:29:25', '2021-09-10 14:29:58');
INSERT INTO `system_menu` VALUES (19, 4, '删除部门', NULL, NULL, NULL, 'dept:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-10 14:30:26', NULL);
INSERT INTO `system_menu` VALUES (20, 2, '查看用户', NULL, NULL, NULL, 'user:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-13 14:30:24', NULL);
INSERT INTO `system_menu` VALUES (22, 12, '删除角色', NULL, NULL, NULL, 'role:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-13 14:34:24', NULL);
INSERT INTO `system_menu` VALUES (23, 12, '查看角色', NULL, NULL, NULL, 'role:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-13 14:37:57', NULL);
INSERT INTO `system_menu` VALUES (24, 10, '查看菜单', NULL, NULL, NULL, 'menu:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-13 14:38:32', '2021-09-13 14:38:50');
INSERT INTO `system_menu` VALUES (25, 4, '查看部门', NULL, NULL, NULL, 'dept:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-13 14:40:23', NULL);
INSERT INTO `system_menu` VALUES (26, 1, '重置密码', 'password', '/cloud/system/password/index', NULL, NULL, 'ant-design:radius-setting-outlined', '0', '0', '0', '0', '0', NULL, 5, '2021-09-13 16:39:16', NULL);
INSERT INTO `system_menu` VALUES (27, 26, '重置密码', NULL, NULL, NULL, 'user:reset', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-09-13 16:39:58', NULL);
INSERT INTO `system_menu` VALUES (28, 0, '首页', '/dashboard', 'Layout', '/dashboard/analysis', NULL, 'ant-design:align-left-outlined', '2', '0', '1', '1', '0', NULL, 1, '2021-09-14 17:19:07', '2021-09-15 09:58:49');
INSERT INTO `system_menu` VALUES (29, 28, '分析页', 'analysis', '/dashboard/analysis/index', NULL, NULL, 'ant-design:amazon-outlined', '0', '0', '0', '1', '0', '/dashboard', 1, '2021-09-14 17:28:01', '2021-09-15 09:59:08');
INSERT INTO `system_menu` VALUES (30, 28, '工作台', 'workbench', '/dashboard/workbench/index', NULL, NULL, 'ant-design:alert-filled', '0', '0', '0', '1', '0', '/dashboard', 2, '2021-09-14 17:28:37', '2021-09-15 09:59:16');
INSERT INTO `system_menu` VALUES (31, 0, '快速开发', '/gen', 'Layout', NULL, NULL, 'ant-design:code-filled', '2', '0', '0', '0', '0', NULL, 3, '2021-10-11 17:30:38', NULL);
INSERT INTO `system_menu` VALUES (32, 31, '代码生成配置管理', 'config', '/cloud/gen/config/index', NULL, NULL, 'ant-design:contacts-outlined', '0', '0', '0', '0', '0', NULL, 1, '2021-10-11 17:32:55', '2021-11-03 09:00:20');
INSERT INTO `system_menu` VALUES (33, 31, '代码生成', 'gen', '/cloud/gen/gen/index', NULL, NULL, 'ant-design:code-sandbox-outlined', '0', '0', '0', '0', '0', NULL, 2, '2021-10-12 09:05:22', '2021-11-03 09:00:05');
INSERT INTO `system_menu` VALUES (34, 32, '查看代码生成配置', NULL, NULL, NULL, 'gen:config', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-12 15:30:37', '2021-10-12 15:32:46');
INSERT INTO `system_menu` VALUES (35, 32, '修改代码生成配置', NULL, NULL, NULL, 'gen:config:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-12 15:31:00', NULL);
INSERT INTO `system_menu` VALUES (36, 33, '查看代码生成', NULL, NULL, NULL, 'gen:generate', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-12 15:32:24', NULL);
INSERT INTO `system_menu` VALUES (37, 33, '生成代码', NULL, NULL, NULL, 'gen:generate:gen', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-12 15:36:02', NULL);
INSERT INTO `system_menu` VALUES (38, 0, '文件管理', '/file', 'Layout', NULL, NULL, 'ant-design:file-add-filled', '2', '1', '0', '1', '1', NULL, 4, '2021-10-25 10:36:11', NULL);
INSERT INTO `system_menu` VALUES (39, 38, '桶', '/file/bucket', NULL, NULL, NULL, 'ant-design:tags-filled', '0', '1', '0', '0', '0', NULL, 1, '2021-10-25 10:37:56', NULL);
INSERT INTO `system_menu` VALUES (40, 38, '文件', '/file/file', NULL, NULL, NULL, 'ant-design:file-unknown-twotone', '0', '1', '0', '0', '0', NULL, 2, '2021-10-25 10:38:42', NULL);
INSERT INTO `system_menu` VALUES (41, 39, '添加桶', NULL, NULL, NULL, 'bucket:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-25 10:39:51', NULL);
INSERT INTO `system_menu` VALUES (42, 39, '删除桶', NULL, NULL, NULL, 'bucket:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-25 10:40:15', NULL);
INSERT INTO `system_menu` VALUES (43, 39, '查看桶', NULL, NULL, NULL, 'bucket:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-25 10:40:36', NULL);
INSERT INTO `system_menu` VALUES (44, 40, '添加文件', NULL, NULL, NULL, 'file:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-25 10:41:54', NULL);
INSERT INTO `system_menu` VALUES (45, 40, '删除文件', NULL, NULL, NULL, 'file:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-25 10:42:18', NULL);
INSERT INTO `system_menu` VALUES (46, 40, '查看文件', NULL, NULL, NULL, 'file:view', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-25 10:42:37', NULL);
INSERT INTO `system_menu` VALUES (47, 40, '下载文件', NULL, NULL, NULL, 'file:download', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-10-25 10:43:14', NULL);
INSERT INTO `system_menu` VALUES (48, 1, '字典管理', 'dict', '', NULL, NULL, 'ant-design:medicine-box-filled', '0', '0', '0', '0', '0', NULL, 6, '2021-11-03 09:04:26', '2021-11-03 09:05:13');
INSERT INTO `system_menu` VALUES (49, 48, '字典', 'dict', '/cloud/system/dict/dict/index', NULL, NULL, 'ant-design:medicine-box-outlined', '0', '0', '0', '0', '0', NULL, 2, '2021-11-03 09:06:09', '2021-11-03 14:34:35');
INSERT INTO `system_menu` VALUES (50, 48, '层级字典', 'dict/level', '/cloud/system/dict/level/index', NULL, NULL, 'ant-design:medicine-box-twotone', '0', '0', '0', '0', '0', NULL, 3, '2021-11-03 09:06:59', '2021-11-03 14:34:20');
INSERT INTO `system_menu` VALUES (51, 49, '添加字典', NULL, NULL, NULL, 'table:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-11-03 09:07:40', NULL);
INSERT INTO `system_menu` VALUES (52, 49, '修改字典', NULL, NULL, NULL, 'table:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-11-03 09:08:13', NULL);
INSERT INTO `system_menu` VALUES (53, 49, '删除字典', NULL, NULL, NULL, 'table:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-11-03 09:08:47', NULL);
INSERT INTO `system_menu` VALUES (54, 50, '新增层级字典', NULL, NULL, NULL, 'tableLevel:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-11-03 09:27:36', '2021-11-03 09:28:04');
INSERT INTO `system_menu` VALUES (55, 50, '删除层级字典', NULL, NULL, NULL, 'tableLevel:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-11-03 09:28:32', NULL);
INSERT INTO `system_menu` VALUES (56, 50, '修改层级字典', NULL, NULL, NULL, 'tableLevel:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-11-03 09:29:14', NULL);
INSERT INTO `system_menu` VALUES (57, 48, '字典表', 'table', '/cloud/system/dict/table/index', NULL, NULL, 'ant-design:table-outlined', '0', '0', '0', '0', '0', NULL, 1, '2021-11-03 14:33:58', NULL);
INSERT INTO `system_menu` VALUES (58, 57, '新增字典名表', NULL, NULL, NULL, 'tableName:add', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-11-03 14:35:36', NULL);
INSERT INTO `system_menu` VALUES (59, 57, '删除字典名表', NULL, NULL, NULL, 'tableName:delete', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-11-03 14:36:00', NULL);
INSERT INTO `system_menu` VALUES (60, 57, '修改字典名表', NULL, NULL, NULL, 'tableName:update', NULL, '1', '0', '0', '0', '0', NULL, NULL, '2021-11-03 14:36:22', NULL);

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES (1, '管理员', '管理员', '2017-12-27 16:23:11', '2021-11-03 14:36:38');
INSERT INTO `system_role` VALUES (2, '查看', NULL, '2021-09-09 14:54:42', '2021-09-13 14:55:53');

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `system_role_menu_menu_id`(`menu_id`) USING BTREE,
  INDEX `system_role_menu_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu` VALUES (1, 1);
INSERT INTO `system_role_menu` VALUES (2, 1);
INSERT INTO `system_role_menu` VALUES (1, 2);
INSERT INTO `system_role_menu` VALUES (2, 2);
INSERT INTO `system_role_menu` VALUES (1, 3);
INSERT INTO `system_role_menu` VALUES (2, 3);
INSERT INTO `system_role_menu` VALUES (1, 4);
INSERT INTO `system_role_menu` VALUES (2, 4);
INSERT INTO `system_role_menu` VALUES (1, 5);
INSERT INTO `system_role_menu` VALUES (1, 6);
INSERT INTO `system_role_menu` VALUES (1, 7);
INSERT INTO `system_role_menu` VALUES (1, 8);
INSERT INTO `system_role_menu` VALUES (2, 8);
INSERT INTO `system_role_menu` VALUES (1, 9);
INSERT INTO `system_role_menu` VALUES (1, 10);
INSERT INTO `system_role_menu` VALUES (2, 10);
INSERT INTO `system_role_menu` VALUES (1, 11);
INSERT INTO `system_role_menu` VALUES (1, 12);
INSERT INTO `system_role_menu` VALUES (2, 12);
INSERT INTO `system_role_menu` VALUES (1, 13);
INSERT INTO `system_role_menu` VALUES (1, 14);
INSERT INTO `system_role_menu` VALUES (1, 15);
INSERT INTO `system_role_menu` VALUES (1, 16);
INSERT INTO `system_role_menu` VALUES (1, 17);
INSERT INTO `system_role_menu` VALUES (1, 18);
INSERT INTO `system_role_menu` VALUES (1, 19);
INSERT INTO `system_role_menu` VALUES (1, 20);
INSERT INTO `system_role_menu` VALUES (2, 20);
INSERT INTO `system_role_menu` VALUES (1, 22);
INSERT INTO `system_role_menu` VALUES (1, 23);
INSERT INTO `system_role_menu` VALUES (2, 23);
INSERT INTO `system_role_menu` VALUES (1, 24);
INSERT INTO `system_role_menu` VALUES (2, 24);
INSERT INTO `system_role_menu` VALUES (1, 25);
INSERT INTO `system_role_menu` VALUES (2, 25);
INSERT INTO `system_role_menu` VALUES (1, 26);
INSERT INTO `system_role_menu` VALUES (1, 27);
INSERT INTO `system_role_menu` VALUES (1, 28);
INSERT INTO `system_role_menu` VALUES (1, 29);
INSERT INTO `system_role_menu` VALUES (1, 30);
INSERT INTO `system_role_menu` VALUES (1, 31);
INSERT INTO `system_role_menu` VALUES (1, 32);
INSERT INTO `system_role_menu` VALUES (1, 33);
INSERT INTO `system_role_menu` VALUES (1, 34);
INSERT INTO `system_role_menu` VALUES (1, 35);
INSERT INTO `system_role_menu` VALUES (1, 36);
INSERT INTO `system_role_menu` VALUES (1, 37);
INSERT INTO `system_role_menu` VALUES (1, 38);
INSERT INTO `system_role_menu` VALUES (1, 39);
INSERT INTO `system_role_menu` VALUES (1, 40);
INSERT INTO `system_role_menu` VALUES (1, 41);
INSERT INTO `system_role_menu` VALUES (1, 42);
INSERT INTO `system_role_menu` VALUES (1, 43);
INSERT INTO `system_role_menu` VALUES (1, 44);
INSERT INTO `system_role_menu` VALUES (1, 45);
INSERT INTO `system_role_menu` VALUES (1, 46);
INSERT INTO `system_role_menu` VALUES (1, 47);
INSERT INTO `system_role_menu` VALUES (1, 48);
INSERT INTO `system_role_menu` VALUES (1, 49);
INSERT INTO `system_role_menu` VALUES (1, 50);
INSERT INTO `system_role_menu` VALUES (1, 51);
INSERT INTO `system_role_menu` VALUES (1, 52);
INSERT INTO `system_role_menu` VALUES (1, 53);
INSERT INTO `system_role_menu` VALUES (1, 54);
INSERT INTO `system_role_menu` VALUES (1, 55);
INSERT INTO `system_role_menu` VALUES (1, 56);
INSERT INTO `system_role_menu` VALUES (1, 57);
INSERT INTO `system_role_menu` VALUES (1, 58);
INSERT INTO `system_role_menu` VALUES (1, 59);
INSERT INTO `system_role_menu` VALUES (1, 60);

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门id',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 0锁定 1有效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最近访问时间',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `is_tab` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启tab，0关闭 1开启',
  `theme` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `system_user_username`(`username`) USING BTREE,
  INDEX `system_user_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (1, 'zclcs', '$2a$10$jW0seNaFSgT.Iimo5PWtPu7wumhjQv29vsNVxzLb5qYwuHdDIs7iK', 2, '2371219112@qq.com', '17788888888', '1', '2019-06-14 20:39:22', '2020-04-15 16:00:32', '2020-04-15 16:03:13', '0', '1', 'white', 'gaOngJwsRYRaVAuXXcmB.png', '我是帅比作者。');
INSERT INTO `system_user` VALUES (9, 'test', '$2a$10$6B71x6cxjOdsrLzydosAfuwiV5G5h7q2.4SoXERNy9A4u2mru8ora', 5, NULL, NULL, '1', '2021-09-08 09:19:38', '2021-09-13 14:19:49', NULL, NULL, NULL, NULL, 'default.jpg', NULL);

-- ----------------------------
-- Table structure for system_user_connection
-- ----------------------------
DROP TABLE IF EXISTS `system_user_connection`;
CREATE TABLE `system_user_connection`  (
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统用户名',
  `provider_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第三方平台名称',
  `provider_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '第三方平台账户id',
  `provider_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台用户名',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台昵称',
  `image_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方平台头像',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_name`, `provider_name`, `provider_user_id`) USING BTREE,
  UNIQUE INDEX `userconnectionrank`(`user_name`, `provider_name`, `provider_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户社交账户关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_connection
-- ----------------------------

-- ----------------------------
-- Table structure for system_user_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `system_user_data_permission`;
CREATE TABLE `system_user_data_permission`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `dept_id` bigint(20) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`user_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户数据权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_data_permission
-- ----------------------------
INSERT INTO `system_user_data_permission` VALUES (1, 1);
INSERT INTO `system_user_data_permission` VALUES (1, 2);
INSERT INTO `system_user_data_permission` VALUES (1, 3);
INSERT INTO `system_user_data_permission` VALUES (1, 4);
INSERT INTO `system_user_data_permission` VALUES (1, 5);
INSERT INTO `system_user_data_permission` VALUES (1, 6);
INSERT INTO `system_user_data_permission` VALUES (9, 2);

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES (1, 1);
INSERT INTO `system_user_role` VALUES (9, 2);

SET FOREIGN_KEY_CHECKS = 1;
