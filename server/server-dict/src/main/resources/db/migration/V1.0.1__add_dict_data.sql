/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : dev_dict

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 16/05/2022 18:05:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Records of dict_table
-- ----------------------------
INSERT INTO `dict_table`
VALUES (1, 'user_status', '0', '锁定', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (2, 'user_status', '1', '有效', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (3, 'user_gender', '0', '男', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (4, 'user_gender', '1', '女', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (5, 'user_gender', '2', '保密', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (8, 'dict_type', '0', '普通', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (9, 'dict_type', '1', '层级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (15, 'yes_no', '0', '否', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (16, 'yes_no', '1', '是', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (17, 'menu_type', '0', '菜单', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (18, 'menu_type', '1', '按钮', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (19, 'menu_type', '2', '目录', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (20, 'user_is_tab', '0', '关闭', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (21, 'user_is_tab', '1', '开启', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (33, 'approval_level', '001', '部级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (34, 'approval_level', '002', '省级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (35, 'approval_level', '003', '地市级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (36, 'approval_level', '004', '区县级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (37, 'approval_level', '005', '国家级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (38, 'approval_level', '006', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (39, 'public_async_status_dict', '0', '待处理', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (40, 'public_async_status_dict', '10', '处理失败', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (41, 'public_async_status_dict', '20', '处理成功', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (42, 'public_attendance_direction_dict', '01', '入场', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (43, 'public_attendance_direction_dict', '02', '出场', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (44, 'public_bank_code_dict', '102', '中国工商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (45, 'public_bank_code_dict', '103', '中国农业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (46, 'public_bank_code_dict', '104', '中国银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (47, 'public_bank_code_dict', '105', '中国建设银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (48, 'public_bank_code_dict', '301', '交通银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (49, 'public_bank_code_dict', '302', '中信银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (50, 'public_bank_code_dict', '310', '上海浦东发展银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (51, 'public_bank_code_dict', '316', '浙商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (52, 'public_bank_code_dict', '403', '中国邮政储蓄银行（代收付）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (53, 'public_bank_code_dict', '100', '中国邮政储蓄银行（收单）-新表', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (54, 'public_bank_code_dict', '201', '国家开发银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (55, 'public_bank_code_dict', '202', '中国进出口银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (56, 'public_bank_code_dict', '203', '中国农业发展银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (57, 'public_bank_code_dict', '307', '深圳发展银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (58, 'public_bank_code_dict', '311', '上海银联商务/东莞商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (59, 'public_bank_code_dict', '314', '农村商业银行（江苏）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (60, 'public_bank_code_dict', '315', '恒丰银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (61, 'public_bank_code_dict', '317', '农村合作银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (62, 'public_bank_code_dict', '318', '渤海银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (63, 'public_bank_code_dict', '319', '徽商银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (64, 'public_bank_code_dict', '320', '镇银行有限责任公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (65, 'public_bank_code_dict', '401', '城市信用社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (66, 'public_bank_code_dict', '402', '农村信用社（含北京农村商业银行）、东莞农信', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (67, 'public_bank_code_dict', '501', '汇丰银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (68, 'public_bank_code_dict', '502', '东亚银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (69, 'public_bank_code_dict', '503', '南洋商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (70, 'public_bank_code_dict', '504', '恒生银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (71, 'public_bank_code_dict', '505', '中国银行（香港）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (72, 'public_bank_code_dict', '507', '创兴银行有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (73, 'public_bank_code_dict', '509', '星展银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (74, 'public_bank_code_dict', '510', '永亨银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (75, 'public_bank_code_dict', '512', '永隆银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (76, 'public_bank_code_dict', '531', '花旗银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (77, 'public_bank_code_dict', '532', '美国银行有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (78, 'public_bank_code_dict', '533', '摩根大通银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (79, 'public_bank_code_dict', '561', '三菱东京日联银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (80, 'public_bank_code_dict', '563', '日本三井住友银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (81, 'public_bank_code_dict', '564', '瑞穗实业银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (82, 'public_bank_code_dict', '565', '日本山口银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (83, 'public_bank_code_dict', '591', '韩国外换银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (84, 'public_bank_code_dict', '593', '友利银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (85, 'public_bank_code_dict', '594', '韩国产业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (86, 'public_bank_code_dict', '595', '新韩银行(中国)有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (87, 'public_bank_code_dict', '596', '韩国中小企业银行有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (88, 'public_bank_code_dict', '597', '韩亚银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (89, 'public_bank_code_dict', '621', '华侨银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (90, 'public_bank_code_dict', '622', '大华银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (91, 'public_bank_code_dict', '623', '星展银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (92, 'public_bank_code_dict', '631', '泰国盘谷银行（大众有限公司）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (93, 'public_bank_code_dict', '641', '奥地利中央合作银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (94, 'public_bank_code_dict', '651', '比利时联合银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (95, 'public_bank_code_dict', '652', '比利时富通银行有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (96, 'public_bank_code_dict', '661', '荷兰银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (97, 'public_bank_code_dict', '662', '荷兰安智银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (98, 'public_bank_code_dict', '671', '渣打银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (99, 'public_bank_code_dict', '672', '英国苏格兰皇家银行公众有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (100, 'public_bank_code_dict', '691', '法国兴业银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (101, 'public_bank_code_dict', '694', '法国东方汇理银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (102, 'public_bank_code_dict', '695', '法国外贸银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (103, 'public_bank_code_dict', '711', '德国德累斯登银行股份公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (104, 'public_bank_code_dict', '712', '德意志银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (105, 'public_bank_code_dict', '713', '德国商业银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (106, 'public_bank_code_dict', '714', '德国西德银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (107, 'public_bank_code_dict', '715', '德国巴伐利亚州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (108, 'public_bank_code_dict', '716', '德国北德意志州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (109, 'public_bank_code_dict', '732', '意大利联合圣保罗银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (110, 'public_bank_code_dict', '741', '瑞士信贷银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (111, 'public_bank_code_dict', '742', '瑞士银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (112, 'public_bank_code_dict', '751', '加拿大丰业银行有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (113, 'public_bank_code_dict', '752', '加拿大蒙特利尔银行有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (114, 'public_bank_code_dict', '761', '澳大利亚和新西兰银行集团有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (115, 'public_bank_code_dict', '771', '摩根士丹利国际银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (116, 'public_bank_code_dict', '775', '联合银行(中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (117, 'public_bank_code_dict', '776', '荷兰合作银行有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (118, 'public_bank_code_dict', '781', '厦门国际银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (119, 'public_bank_code_dict', '782', '法国巴黎银行（中国）有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (120, 'public_bank_code_dict', '785', '华商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (121, 'public_bank_code_dict', '787', '华一银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (122, 'public_bank_code_dict', '897', '广东农村信用合作社（收单）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (123, 'public_bank_code_dict', '898', '银联商务（收单）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (124, 'public_bank_code_dict', '969', '(澳门地区)银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (125, 'public_bank_code_dict', '989', '(香港地区)银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (126, 'public_bank_code_dict', '9998', '浙江网商银行股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (127, 'public_bank_code_dict', 'SRCB', '深圳农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (128, 'public_bank_code_dict', 'BGB', '广西北部湾银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (129, 'public_bank_code_dict', 'SHRCB', '上海农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (130, 'public_bank_code_dict', 'BJBANK', '北京银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (131, 'public_bank_code_dict', 'WHCCB', '威海市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (132, 'public_bank_code_dict', 'BOZK', '周口银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (133, 'public_bank_code_dict', 'KORLABANK', '库尔勒市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (134, 'public_bank_code_dict', 'SPABANK', '平安银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (135, 'public_bank_code_dict', 'SDEB', '顺德农商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (136, 'public_bank_code_dict', 'HURCB', '湖北省农村信用社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (137, 'public_bank_code_dict', 'WRCB', '无锡农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (138, 'public_bank_code_dict', 'BOCY', '朝阳银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (139, 'public_bank_code_dict', 'HDBANK', '邯郸银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (140, 'public_bank_code_dict', 'BOD', '东莞银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (141, 'public_bank_code_dict', 'ZYCBANK', '遵义市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (142, 'public_bank_code_dict', 'SXCB', '绍兴银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (143, 'public_bank_code_dict', 'GZRCU', '贵州省农村信用社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (144, 'public_bank_code_dict', 'ZJKCCB', '张家口市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (145, 'public_bank_code_dict', 'BOJZ', '锦州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (146, 'public_bank_code_dict', 'BOP', '平顶山银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (147, 'public_bank_code_dict', 'HKB', '汉口银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (148, 'public_bank_code_dict', 'NXRCU', '宁夏黄河农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (149, 'public_bank_code_dict', 'NYNB', '广东南粤银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (150, 'public_bank_code_dict', 'GRCB', '广州农商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (151, 'public_bank_code_dict', 'BOSZ', '苏州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (152, 'public_bank_code_dict', 'HZCB', '杭州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (153, 'public_bank_code_dict', 'HSBK', '衡水银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (154, 'public_bank_code_dict', 'HBC', '湖北银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (155, 'public_bank_code_dict', 'JXBANK', '嘉兴银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (156, 'public_bank_code_dict', 'HRXJB', '华融湘江银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (157, 'public_bank_code_dict', 'BODD', '丹东银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (158, 'public_bank_code_dict', 'AYCB', '安阳银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (159, 'public_bank_code_dict', 'TCRCB', '江苏太仓农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (160, 'public_bank_code_dict', 'NJCB', '南京银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (161, 'public_bank_code_dict', 'ZZBANK', '郑州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (162, 'public_bank_code_dict', 'DYCB', '德阳商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (163, 'public_bank_code_dict', 'YBCCB', '宜宾市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (164, 'public_bank_code_dict', 'SCRCU', '四川省农村信用', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (165, 'public_bank_code_dict', 'KLB', '昆仑银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (166, 'public_bank_code_dict', 'LSBANK', '莱商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (167, 'public_bank_code_dict', 'YDRCB', '尧都农商行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (168, 'public_bank_code_dict', 'CCQTGB', '重庆三峡银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (169, 'public_bank_code_dict', 'FDB', '富滇银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (170, 'public_bank_code_dict', 'JSRCU', '江苏省农村信用联合社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (171, 'public_bank_code_dict', 'JNBANK', '济宁银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (172, 'public_bank_code_dict', 'JINCHB', '晋城银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (173, 'public_bank_code_dict', 'FXCB', '阜新银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (174, 'public_bank_code_dict', 'WHRCB', '武汉农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (175, 'public_bank_code_dict', 'HBYCBANK', '湖北银行宜昌分行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (176, 'public_bank_code_dict', 'TZCB', '台州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (177, 'public_bank_code_dict', 'TACCB', '泰安市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (178, 'public_bank_code_dict', 'XCYH', '许昌银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (179, 'public_bank_code_dict', 'NXBANK', '宁夏银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (180, 'public_bank_code_dict', 'HSBANK', '徽商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (181, 'public_bank_code_dict', 'JJBANK', '九江银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (182, 'public_bank_code_dict', 'NHQS', '农信银清算中心', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (183, 'public_bank_code_dict', 'MTBANK', '浙江民泰商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (184, 'public_bank_code_dict', 'LANGFB', '廊坊银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (185, 'public_bank_code_dict', 'ASCB', '鞍山银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (186, 'public_bank_code_dict', 'KSRB', '昆山农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (187, 'public_bank_code_dict', 'YXCCB', '玉溪市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (188, 'public_bank_code_dict', 'DLB', '大连银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (189, 'public_bank_code_dict', 'DRCBCL', '东莞农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (190, 'public_bank_code_dict', 'GCB', '广州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (191, 'public_bank_code_dict', 'NBBANK', '宁波银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (192, 'public_bank_code_dict', 'BOYK', '营口银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (193, 'public_bank_code_dict', 'SXRCCU', '陕西信合', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (194, 'public_bank_code_dict', 'GLBANK', '桂林银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (195, 'public_bank_code_dict', 'BOQH', '青海银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (196, 'public_bank_code_dict', 'CDRCB', '成都农商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (197, 'public_bank_code_dict', 'QDCCB', '青岛银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (198, 'public_bank_code_dict', 'HBHSBANK', '湖北银行黄石分行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (199, 'public_bank_code_dict', 'WZCB', '温州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (200, 'public_bank_code_dict', 'TRCB', '天津农商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (201, 'public_bank_code_dict', 'QLBANK', '齐鲁银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (202, 'public_bank_code_dict', 'GDRCC', '广东省农村信用社联合社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (203, 'public_bank_code_dict', 'ZJTLCB', '浙江泰隆商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (204, 'public_bank_code_dict', 'GZB', '赣州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (205, 'public_bank_code_dict', 'GYCB', '贵阳市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (206, 'public_bank_code_dict', 'CQBANK', '重庆银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (207, 'public_bank_code_dict', 'DAQINGB', '龙江银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (208, 'public_bank_code_dict', 'CGNB', '南充市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (209, 'public_bank_code_dict', 'SCCB', '三门峡银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (210, 'public_bank_code_dict', 'CSRCB', '常熟农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (211, 'public_bank_code_dict', 'SHBANK', '上海银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (212, 'public_bank_code_dict', 'JLBANK', '吉林银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (213, 'public_bank_code_dict', 'CZRCB', '常州农村信用联社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (214, 'public_bank_code_dict', 'BANKWF', '潍坊银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (215, 'public_bank_code_dict', 'ZRCBANK', '张家港农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (216, 'public_bank_code_dict', 'FJHXBC', '福建海峡银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (217, 'public_bank_code_dict', 'ZJNX', '浙江省农村信用社联合社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (218, 'public_bank_code_dict', 'LZYH', '兰州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (219, 'public_bank_code_dict', 'JSB', '晋商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (220, 'public_bank_code_dict', 'BOHAIB', '渤海银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (221, 'public_bank_code_dict', 'CZCB', '浙江稠州商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (222, 'public_bank_code_dict', 'YQCCB', '阳泉银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (223, 'public_bank_code_dict', 'SJBANK', '盛京银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (224, 'public_bank_code_dict', 'XABANK', '西安银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (225, 'public_bank_code_dict', 'BSB', '包商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (226, 'public_bank_code_dict', 'JSBANK', '江苏银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (227, 'public_bank_code_dict', 'FSCB', '抚顺银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (228, 'public_bank_code_dict', 'HNRCU', '河南省农村信用', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (229, 'public_bank_code_dict', 'XTB', '邢台银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (230, 'public_bank_code_dict', 'HNRCC', '湖南省农村信用社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (231, 'public_bank_code_dict', 'DYCCB', '东营市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (232, 'public_bank_code_dict', 'ORBANK', '鄂尔多斯银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (233, 'public_bank_code_dict', 'BJRCB', '北京农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (234, 'public_bank_code_dict', 'XYBANK', '信阳银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (235, 'public_bank_code_dict', 'ZGCCB', '自贡市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (236, 'public_bank_code_dict', 'CDCB', '成都银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (237, 'public_bank_code_dict', 'HANABANK', '韩亚银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (238, 'public_bank_code_dict', 'LYBANK', '洛阳银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (239, 'public_bank_code_dict', 'ZBCB', '齐商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (240, 'public_bank_code_dict', 'CBKF', '开封市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (241, 'public_bank_code_dict', 'H3CB', '内蒙古银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (242, 'public_bank_code_dict', 'CRCBANK', '重庆农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (243, 'public_bank_code_dict', 'SZSBK', '石嘴山银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (244, 'public_bank_code_dict', 'DZBANK', '德州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (245, 'public_bank_code_dict', 'SRBANK', '上饶银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (246, 'public_bank_code_dict', 'LSCCB', '乐山市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (247, 'public_bank_code_dict', 'JXRCU', '江西省农村信用', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (248, 'public_bank_code_dict', 'JZBANK', '晋中市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (249, 'public_bank_code_dict', 'HZCCB', '湖州市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (250, 'public_bank_code_dict', 'NHB', '南海农村信用联社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (251, 'public_bank_code_dict', 'XXBANK', '新乡银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (252, 'public_bank_code_dict', 'JRCB', '江苏江阴农村商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (253, 'public_bank_code_dict', 'YNRCC', '云南省农村信用社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (254, 'public_bank_code_dict', 'GXRCU', '广西省农村信用', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (255, 'public_bank_code_dict', 'PSBC', '中国邮政储蓄银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (256, 'public_bank_code_dict', 'BZMD', '驻马店银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (257, 'public_bank_code_dict', 'ARCU', '安徽省农村信用社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (258, 'public_bank_code_dict', 'GSRCU', '甘肃省农村信用', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (259, 'public_bank_code_dict', 'LYCB', '辽阳市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (260, 'public_bank_code_dict', 'JLRCU', '吉林农信', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (261, 'public_bank_code_dict', 'URMQCCB', '乌鲁木齐市商业银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (262, 'public_bank_code_dict', 'XLBANK', '中山小榄村镇银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (263, 'public_bank_code_dict', 'CSCB', '长沙银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (264, 'public_bank_code_dict', 'JHBANK', '金华银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (265, 'public_bank_code_dict', 'BHB', '河北银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (266, 'public_bank_code_dict', 'NBYZ', '鄞州银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (267, 'public_bank_code_dict', 'LSBC', '临商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (268, 'public_bank_code_dict', 'BOCD', '承德银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (269, 'public_bank_code_dict', 'SDRCU', '山东农信', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (270, 'public_bank_code_dict', 'NCB', '南昌银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (271, 'public_bank_code_dict', 'TCCB', '天津银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (272, 'public_bank_code_dict', 'WJRCB', '吴江农商银行', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (273, 'public_bank_code_dict', 'CBBQS', '城市商业银行资金清算中心', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (274, 'public_bank_code_dict', 'HBRCU', '河北省农村信用社', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (275, 'public_bank_code_dict', '9997', '支付宝', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (276, 'public_bank_code_dict', '000', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (277, 'project_category', '01', '房屋建筑工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (278, 'project_category', '02', '市政公用工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (279, 'project_category', '03', '机电安装工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (280, 'project_category', '04', '铁路工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (281, 'project_category', '05', '公路工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (282, 'project_category', '06', '港口与航道工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (283, 'project_category', '07', '水利水电工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (284, 'project_category', '08', '电力工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (285, 'project_category', '09', '矿山工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (286, 'project_category', '10', '冶炼工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (287, 'project_category', '11', '化工石油工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (288, 'project_category', '12', '通信工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (289, 'project_category', '99', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (290, 'project_category', '91', '装饰工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (291, 'public_certificate_status_dict', '1', '有效', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (292, 'public_certificate_status_dict', '2', '注销', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (293, 'public_certificate_status_dict', '3', '暂扣', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (294, 'public_certificate_status_dict', '4', '过期', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (295, 'public_collection_type_dict', '001', '移动应用', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (296, 'public_collection_type_dict', '002', '设备', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (297, 'public_construction_license_status_dict', '01', '正常', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (298, 'public_construction_license_status_dict', '02', '注销', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (299, 'public_construction_license_status_dict', '03', '竣工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (300, 'public_contract_period_type_dict', '0', '固定期限合同', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (301, 'public_contract_period_type_dict', '1', '以完成一定工作为期限的合同', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (302, 'company_role', '001', '专业分包', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (303, 'company_role', '002', '设备分包', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (304, 'company_role', '003', '材料分包', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (305, 'company_role', '004', '后勤服务', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (306, 'company_role', '005', '特殊设备', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (307, 'company_role', '006', '劳务分包', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (308, 'company_role', '007', '监理', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (309, 'company_role', '008', '建设单位', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (310, 'company_role', '009', '总承包单位', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (311, 'company_role', '010', '勘察', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (312, 'company_role', '011', '设计单位', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (313, 'company_role', '012', '其它', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (314, 'company_role', '013', '质量安全监督公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (315, 'company_role', '014', '代管单位', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (316, 'public_culture_level_dict', '01', '小学', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (317, 'public_culture_level_dict', '02', '初中', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (318, 'public_culture_level_dict', '03', '高中', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (319, 'public_culture_level_dict', '04', '中专', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (320, 'public_culture_level_dict', '05', '大专', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (321, 'public_culture_level_dict', '06', '本科', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (322, 'public_culture_level_dict', '07', '硕士', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (323, 'public_culture_level_dict', '08', '博士', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (324, 'public_culture_level_dict', '99', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (325, 'currency_type', '004', '阿富汗尼', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (326, 'currency_type', '008', '列克', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (327, 'currency_type', '012', '阿尔及利亚第纳尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (328, 'currency_type', '020', '安道尔比塞塔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (329, 'currency_type', '031', '阿塞拜疆马纳特', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (330, 'currency_type', '032', '阿根廷比索', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (331, 'currency_type', '036', '澳大利亚元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (332, 'currency_type', '040', '先令', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (333, 'currency_type', '044', '巴哈马元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (334, 'currency_type', '048', '巴林第纳尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (335, 'currency_type', '050', '塔卡', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (336, 'currency_type', '051', '亚美尼亚达姆', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (337, 'currency_type', '052', '巴巴多斯元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (338, 'currency_type', '056', '比利时法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (339, 'currency_type', '060', '百慕大元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (340, 'currency_type', '064', '努尔特鲁姆', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (341, 'currency_type', '068', '玻利瓦诺', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (342, 'currency_type', '072', '普拉', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (343, 'currency_type', '084', '伯利兹元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (344, 'currency_type', '090', '所罗门群岛元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (345, 'currency_type', '096', '文莱元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (346, 'currency_type', '100', '列弗', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (347, 'currency_type', '104', '缅元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (348, 'currency_type', '108', '布隆迪法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (349, 'currency_type', '116', '瑞尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (350, 'currency_type', '124', '加元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (351, 'currency_type', '132', '佛得角埃斯库多', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (352, 'currency_type', '136', '开曼群岛元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (353, 'currency_type', '144', '斯里兰卡卢比', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (354, 'currency_type', '152', '智利比索', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (355, 'currency_type', '156', '人民币元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (356, 'currency_type', '170', '哥伦比亚比索', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (357, 'currency_type', '174', '科摩罗法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (358, 'currency_type', '188', '哥斯达黎加科郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (359, 'currency_type', '191', '克罗地亚库纳', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (360, 'currency_type', '192', '古巴比索', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (361, 'currency_type', '196', '塞浦路斯镑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (362, 'currency_type', '203', '捷克克朗', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (363, 'currency_type', '208', '丹麦克朗', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (364, 'currency_type', '214', '多米尼加比索', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (365, 'currency_type', '222', '萨尔瓦多科郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (366, 'currency_type', '230', '埃塞俄比亚比尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (367, 'currency_type', '232', '纳克法', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (368, 'currency_type', '233', '克罗姆', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (369, 'currency_type', '238', '福克兰群岛镑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (370, 'currency_type', '242', '斐济元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (371, 'currency_type', '246', '马克', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (372, 'currency_type', '250', '法国法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (373, 'currency_type', '262', '吉布提法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (374, 'currency_type', '270', '达拉西', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (375, 'currency_type', '276', '德国马克', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (376, 'currency_type', '288', '塞地', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (377, 'currency_type', '292', '直布罗陀镑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (378, 'currency_type', '300', '德拉克马', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (379, 'currency_type', '320', '格查尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (380, 'currency_type', '324', '几内亚法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (381, 'currency_type', '328', '圭亚那元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (382, 'currency_type', '332', '古德', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (383, 'currency_type', '340', '伦皮拉', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (384, 'currency_type', '344', '香港元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (385, 'currency_type', '348', '福林', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (386, 'currency_type', '352', '冰岛克朗', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (387, 'currency_type', '356', '印度卢比', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (388, 'currency_type', '360', '卢比', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (389, 'currency_type', '364', '伊朗里亚尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (390, 'currency_type', '368', '伊拉克第纳尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (391, 'currency_type', '372', '爱尔兰镑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (392, 'currency_type', '376', '新谢客尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (393, 'currency_type', '380', '意大利里拉', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (394, 'currency_type', '388', '牙买加元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (395, 'currency_type', '392', '日元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (396, 'currency_type', '398', '坚戈', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (397, 'currency_type', '400', '约旦第纳尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (398, 'currency_type', '404', '肯尼亚先令', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (399, 'currency_type', '408', '北朝鲜圆', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (400, 'currency_type', '410', '圆', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (401, 'currency_type', '414', '科威特第纳尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (402, 'currency_type', '417', '索姆', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (403, 'currency_type', '418', '基普', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (404, 'currency_type', '422', '黎巴嫩镑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (405, 'currency_type', '426', '罗提', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (406, 'currency_type', '428', '拉脱维亚拉特', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (407, 'currency_type', '430', '利比里亚元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (408, 'currency_type', '434', '利比亚第纳尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (409, 'currency_type', '440', '立陶宛', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (410, 'currency_type', '442', '卢森堡法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (411, 'currency_type', '446', '澳门元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (412, 'currency_type', '450', '马尔加什法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (413, 'currency_type', '454', '克瓦查', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (414, 'currency_type', '458', '马来西亚林吉特', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (415, 'currency_type', '462', '卢菲亚', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (416, 'currency_type', '470', '马尔他里拉', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (417, 'currency_type', '478', '乌吉亚', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (418, 'currency_type', '480', '毛里求斯卢比', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (419, 'currency_type', '484', '墨西哥比索', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (420, 'currency_type', '496', '图格里克', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (421, 'currency_type', '498', '摩尔瓦多列伊', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (422, 'currency_type', '504', '摩洛哥迪拉姆', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (423, 'currency_type', '508', '麦梯卡尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (424, 'currency_type', '512', '阿曼里亚尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (425, 'currency_type', '516', '纳米比亚元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (426, 'currency_type', '524', '尼泊尔卢比', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (427, 'currency_type', '528', '荷兰盾', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (428, 'currency_type', '532', '荷属安的列斯盾', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (429, 'currency_type', '533', '阿鲁巴盾', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (430, 'currency_type', '548', '瓦图', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (431, 'currency_type', '554', '新西兰元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (432, 'currency_type', '558', '金科多巴', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (433, 'currency_type', '566', '奈拉', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (434, 'currency_type', '578', '挪威克朗', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (435, 'currency_type', '586', '巴基斯坦卢比', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (436, 'currency_type', '590', '巴波亚', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (437, 'currency_type', '598', '基那', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (438, 'currency_type', '600', '瓜拉尼', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (439, 'currency_type', '604', '索尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (440, 'currency_type', '608', '非律宾比索', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (441, 'currency_type', '620', '葡萄牙埃斯库多', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (442, 'currency_type', '624', '几内亚比绍比索', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (443, 'currency_type', '626', '东帝汶埃斯库多', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (444, 'currency_type', '534', '卡塔尔里亚尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (445, 'currency_type', '642', '列伊', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (446, 'currency_type', '643', '俄罗斯卢布', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (447, 'currency_type', '646', '卢旺达法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (448, 'currency_type', '654', '圣赫勒拿磅', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (449, 'currency_type', '678', '多布拉', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (450, 'currency_type', '682', '沙特里亚尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (451, 'currency_type', '690', '塞舌尔卢比', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (452, 'currency_type', '694', '利昂', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (453, 'currency_type', '702', '新加坡元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (454, 'currency_type', '703', '斯洛伐克克朗', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (455, 'currency_type', '704', '盾', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (456, 'currency_type', '705', '托拉尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (457, 'currency_type', '706', '索马里先令', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (458, 'currency_type', '710', '兰特', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (459, 'currency_type', '716', '津巴布韦元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (460, 'currency_type', '724', '西班牙比塞塔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (461, 'currency_type', '736', '苏丹第纳尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (462, 'currency_type', '740', '苏里南盾', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (463, 'currency_type', '748', '里兰吉尼', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (464, 'currency_type', '752', '瑞典克朗', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (465, 'currency_type', '756', '瑞士法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (466, 'currency_type', '760', '叙利亚镑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (467, 'currency_type', '764', '铢', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (468, 'currency_type', '776', '邦加', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (469, 'currency_type', '780', '特立尼达和多巴哥元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (470, 'currency_type', '784', 'UAE迪拉姆', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (471, 'currency_type', '788', '突尼斯第纳尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (472, 'currency_type', '792', '土耳其里拉', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (473, 'currency_type', '795', '马纳特', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (474, 'currency_type', '800', '乌干达先令', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (475, 'currency_type', '807', '第纳尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (476, 'currency_type', '810', '俄罗斯卢布', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (477, 'currency_type', '818', '埃及镑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (478, 'currency_type', '826', '英镑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (479, 'currency_type', '834', '坦桑尼亚先令', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (480, 'currency_type', '840', '美元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (481, 'currency_type', '858', '乌拉圭比索', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (482, 'currency_type', '860', '乌兹别克斯坦苏姆', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (483, 'currency_type', '882', '塔拉', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (484, 'currency_type', '886', '也门里亚尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (485, 'currency_type', '891', '南斯拉夫第纳尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (486, 'currency_type', '894', '克瓦查', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (487, 'currency_type', '901', '新台湾元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (488, 'currency_type', '950', 'CFA法郎BEAC', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (489, 'currency_type', '951', '东加勒比元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (490, 'currency_type', '952', 'CFA法郎BCEAO', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (491, 'currency_type', '953', 'CFP法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (492, 'currency_type', '955', '欧洲货币合成单位', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (493, 'currency_type', '956', '欧洲货币单位(E.M.U.-6)', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (494, 'currency_type', '957', '欧洲账户9单位', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (495, 'currency_type', '958', '欧洲账户17单位', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (496, 'currency_type', '959', '黄金', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (497, 'currency_type', '960', '特别提款权', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (498, 'currency_type', '961', '银', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (499, 'currency_type', '962', '铂白金', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (500, 'currency_type', '963', '测试特别保留', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (501, 'currency_type', '964', '钯', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (502, 'currency_type', '972', '索莫尼', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (503, 'currency_type', '973', '宽扎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (504, 'currency_type', '974', '白俄罗斯卢布', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (505, 'currency_type', '975', '保加利亚列弗', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (506, 'currency_type', '976', '刚果法郎', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (507, 'currency_type', '977', '可自由兑换标记', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (508, 'currency_type', '978', '欧元', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (509, 'currency_type', '979', '墨西哥发展单位', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (510, 'currency_type', '980', '格里夫纳', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (511, 'currency_type', '98l', '拉里', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (512, 'currency_type', '984', 'Mvdol(玻利维亚)', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (513, 'currency_type', '985', '兹罗提', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (514, 'currency_type', '986', '巴西瑞尔', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (515, 'currency_type', '990', '发展单位', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (516, 'currency_type', '997', '(次日)', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (517, 'currency_type', '998', '(同日)', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (518, 'currency_type', '999', '未包括的交易货币', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (519, 'public_data_sources_dict', '01', '页面录入', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (520, 'public_device_binding_dict', '01', '绑定', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (521, 'public_device_binding_dict', '02', '解绑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (522, 'public_device_status_dict', '01', '正常', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (523, 'public_device_status_dict', '02', '报废', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (524, 'public_device_status_dict', '03', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (525, 'public_device_type_dict', '01', '采集设备', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (526, 'public_device_type_dict', '02', '考勤设备', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (527, 'public_device_type_dict', '03', '视频设备', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (528, 'public_device_type_dict', '04', '噪音扬尘', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (529, 'public_device_type_dict', '05', '塔吊', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (530, 'public_device_type_dict', '06', '升降机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (531, 'public_device_type_dict', '07', '车牌识别', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (532, 'public_device_type_dict', '08', '用电设备', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (533, 'public_direction_dict', '01', '入场', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (534, 'public_direction_dict', '02', '出场', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (535, 'public_docking_status_dict', '01', '正常', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (536, 'public_docking_status_dict', '02', '停用', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (537, 'public_docking_status_dict', '03', '禁用', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (538, 'public_docking_progress_dict', '01', '未开始', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (539, 'public_docking_progress_dict', '02', '资料待审核', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (540, 'public_docking_progress_dict', '03', '资料审核不通过', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (541, 'public_docking_progress_dict', '04', '测试中', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (542, 'public_docking_progress_dict', '05', '测试通过', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (543, 'public_docking_progress_dict', '06', '测试结果待审核', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (544, 'public_docking_progress_dict', '07', '测试结果审核不通过', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (545, 'public_docking_progress_dict', '08', '已完成', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (546, 'public_entry_exit_type_dict', '1', '在场', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (547, 'public_entry_exit_type_dict', '0', '已退场', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (548, 'public_file_status_dict', '01', '正常', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (549, 'public_file_status_dict', '02', '删除', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (550, 'public_file_type_dict', '01', '图片', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (551, 'public_file_type_dict', '02', '文件', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (552, 'function_num', '100', '居住建筑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (553, 'function_num', '200', '居住建筑配套工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (554, 'function_num', '300', '公共建筑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (555, 'function_num', '301', '办公建筑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (556, 'function_num', '302', '商业建筑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (557, 'function_num', '303', '旅游建筑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (558, 'function_num', '304', '科教文卫建筑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (559, 'function_num', '305', '交通运输类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (560, 'function_num', '306', '通信建筑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (561, 'function_num', '307', '公共建筑配套工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (562, 'function_num', '400', '商住楼', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (563, 'function_num', '500', '农业建筑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (564, 'function_num', '600', '农业建筑配套工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (565, 'function_num', '700', '工业建筑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (566, 'function_num', '800', '工业建筑配套工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (567, 'function_num', '999', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (568, 'function_num', '010', '给水', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (569, 'function_num', '011', '排水', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (570, 'public_gender_dict', '0', '男', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (571, 'public_gender_dict', '1', '女', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (572, 'id_card_type', '01', '居民身份证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (573, 'id_card_type', '02', '军官证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (574, 'id_card_type', '03', '武警警官证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (575, 'id_card_type', '04', '士兵证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (576, 'id_card_type', '05', '军队离退休干部证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (577, 'id_card_type', '06', '残疾人证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (578, 'id_card_type', '07', '残疾军人证（1-8级）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (579, 'id_card_type', '08', '护照', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (580, 'id_card_type', '09', '港澳同胞回乡证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (581, 'id_card_type', '10', '港澳居民来往内地通行证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (582, 'id_card_type', '11', '中华人民共和国往来港澳通行证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (583, 'id_card_type', '12', '台湾居民来往大陆通行证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (584, 'id_card_type', '13', '大陆居民往来台湾通行证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (585, 'id_card_type', '14', '外交官证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (586, 'id_card_type', '15', '领事馆证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (587, 'id_card_type', '16', '海员证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (588, 'id_card_type', '17', '香港身份证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (589, 'id_card_type', '18', '台湾身份证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (590, 'id_card_type', '19', '澳门身份证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (591, 'id_card_type', '20', '外国人身份证件', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (592, 'id_card_type', '21', '高校毕业生自主创业证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (593, 'id_card_type', '22', '就业失业登记证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (594, 'id_card_type', '23', '台胞证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (595, 'id_card_type', '24', '退休证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (596, 'id_card_type', '25', '离休证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (597, 'id_card_type', '99', '其他证件', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (598, 'public_identify_dict', '001', '人脸识别', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (599, 'public_identify_dict', '002', '虹膜识别', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (600, 'public_identify_dict', '003', '指纹识别', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (601, 'public_identify_dict', '004', '掌纹识别', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (602, 'public_job_certificate_dict', '14002001', '房屋建筑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (603, 'public_job_certificate_dict', '14002002', '市政公用工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (604, 'public_job_certificate_dict', '14002003', '土建', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (605, 'public_job_certificate_dict', '14002004', '电气', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (606, 'public_job_certificate_dict', '14002005', '水暖', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (607, 'public_job_certificate_dict', '14002006', '不分专业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (608, 'public_job_certificate_dict', '14002007', '安装', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (609, 'public_job_certificate_dict', '14002008', '建筑工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (610, 'public_job_certificate_dict', '14002009', '公路工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (611, 'public_job_certificate_dict', '14002010', '机电工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (612, 'public_job_certificate_dict', '14002011', '水利水电工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (613, 'public_license_plate_color_dict', '01', '蓝色', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (614, 'public_license_plate_color_dict', '02', '黄色', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (615, 'public_license_plate_color_dict', '03', '白色', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (616, 'public_license_plate_color_dict', '04', '黑色', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (617, 'public_license_plate_color_dict', '05', '绿色', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (618, 'public_license_plate_color_dict', '06', '未知', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (619, 'public_license_plate_type_dict', '01', '蓝牌小汽车', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (620, 'public_license_plate_type_dict', '02', '黑牌小汽车 ', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (621, 'public_license_plate_type_dict', '03', '单排黄牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (622, 'public_license_plate_type_dict', '04', '双排黄牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (623, 'public_license_plate_type_dict', '05', '警车车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (624, 'public_license_plate_type_dict', '06', '武警车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (625, 'public_license_plate_type_dict', '07', '个性化车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (626, 'public_license_plate_type_dict', '08', '单排军车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (627, 'public_license_plate_type_dict', '09', '双排军车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (628, 'public_license_plate_type_dict', '10', '使馆车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (629, 'public_license_plate_type_dict', '11', '香港进出中国大陆车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (630, 'public_license_plate_type_dict', '12', '农用车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (631, 'public_license_plate_type_dict', '13', '教练车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (632, 'public_license_plate_type_dict', '14', '澳门进出中国大陆车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (633, 'public_license_plate_type_dict', '15', '双层武警车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (634, 'public_license_plate_type_dict', '16', '武警总队车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (635, 'public_license_plate_type_dict', '17', '双层武警总队车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (636, 'public_license_plate_type_dict', '18', '民航车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (637, 'public_license_plate_type_dict', '19', '新能源车牌 ', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (638, 'public_license_plate_type_dict', '20', '未知车牌', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (639, 'public_manage_type_dict', '1001', '总监理工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (640, 'public_manage_type_dict', '1002', '副总监理工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (641, 'public_manage_type_dict', '1003', '安全监理工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (642, 'public_manage_type_dict', '1004', '专业监理工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (643, 'public_manage_type_dict', '1005', '监理工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (644, 'public_manage_type_dict', '1006', '监理员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (645, 'public_manage_type_dict', '1007', '监理安全员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (646, 'public_manage_type_dict', '1008', '项目总工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (647, 'public_manage_type_dict', '1009', '项目经理', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (648, 'public_manage_type_dict', '1010', '工程经理', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (649, 'public_manage_type_dict', '1011', '项目技术负责人', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (650, 'public_manage_type_dict', '1012', '项目工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (651, 'public_manage_type_dict', '1013', '项目管理员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (652, 'public_manage_type_dict', '1014', '项目副经理', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (653, 'public_manage_type_dict', '1015', '项目总监', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (654, 'public_manage_type_dict', '1016', '施工员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (655, 'public_manage_type_dict', '1017', '质量员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (656, 'public_manage_type_dict', '1018', '安全员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (657, 'public_manage_type_dict', '1019', '标准员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (658, 'public_manage_type_dict', '1020', '材料员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (659, 'public_manage_type_dict', '1021', '机械员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (660, 'public_manage_type_dict', '1022', '劳务员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (661, 'public_manage_type_dict', '1023', '资料员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (662, 'public_manage_type_dict', '1024', '总监理工程师代表', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (663, 'public_manage_type_dict', '1025', '测量员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (664, 'public_manage_type_dict', '1026', '试验员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (665, 'public_manage_type_dict', '1027', '造价员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (666, 'public_manage_type_dict', '1028', '质量负责人', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (667, 'public_manage_type_dict', '1029', '安全负责人', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (668, 'public_manage_type_dict', '1030', '技术负责人', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (669, 'public_manage_type_dict', '1031', '生产经理', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (670, 'public_manage_type_dict', '1032', '物资材料工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (671, 'public_manage_type_dict', '1099', '其它', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (672, 'public_marital_status_dict', '01', '未婚', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (673, 'public_marital_status_dict', '02', '已婚', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (674, 'public_marital_status_dict', '03', '离异', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (675, 'public_marital_status_dict', '04', '丧偶', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (676, 'public_personnel_certificate_dict', '1', '职业技能证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (677, 'public_personnel_certificate_dict', '2', '安装证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (678, 'public_personnel_certificate_dict', '3', '岗位证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (679, 'public_personnel_certificate_dict', '4', '职称证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (680, 'public_personnel_certificate_dict', '5', '职业注册证', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (681, 'public_personnel_certificate_dict', '6', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (682, 'public_politics_type_dict', '01', '中共党员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (683, 'public_politics_type_dict', '02', '中共预备党员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (684, 'public_politics_type_dict', '03', '共青团员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (685, 'public_politics_type_dict', '04', '民革党员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (686, 'public_politics_type_dict', '05', '民盟盟员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (687, 'public_politics_type_dict', '06', '民建会员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (688, 'public_politics_type_dict', '07', '民进会员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (689, 'public_politics_type_dict', '08', '农工党党员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (690, 'public_politics_type_dict', '09', '致公党党员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (691, 'public_politics_type_dict', '10', '九三学社社员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (692, 'public_politics_type_dict', '11', '台盟盟员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (693, 'public_politics_type_dict', '12', '无党派人士', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (694, 'public_politics_type_dict', '13', '群众', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (695, 'public_practice_dict', '100', '注册监理工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (696, 'public_practice_dict', '200', '注册建造师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (697, 'public_practice_dict', '300', '注册造价工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (698, 'public_practice_dict', '1400501', '房屋建筑工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (699, 'public_practice_dict', '1400502', '冶炼工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (700, 'public_practice_dict', '1400503', '矿山工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (701, 'public_practice_dict', '1400504', '化工石油工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (702, 'public_practice_dict', '1400505', '水利水电工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (703, 'public_practice_dict', '1400506', '电力工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (704, 'public_practice_dict', '1400507', '农林工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (705, 'public_practice_dict', '1400508', '铁路工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (706, 'public_practice_dict', '1400509', '公路工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (707, 'public_practice_dict', '1400510', '港口与航道工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (708, 'public_practice_dict', '1400511', '航天航空工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (709, 'public_practice_dict', '1400512', '通信工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (710, 'public_practice_dict', '1400513', '市政公用工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (711, 'public_practice_dict', '1400514', '机电安装工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (712, 'public_practice_dict', '1400515', '矿业工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (713, 'public_practice_dict', '1400516', '机电工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (714, 'public_practice_dict', '1400517', '建筑工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (715, 'public_practice_dict', '1400518', '公路工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (716, 'public_practice_dict', '1400519', '铁路工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (717, 'public_practice_dict', '1400520', '港口与航道工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (718, 'public_practice_dict', '1400521', '水利水电工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (719, 'public_practice_dict', '1400522', '矿业工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (720, 'public_practice_dict', '1400523', '市政公用工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (721, 'public_practice_dict', '1400524', '通信与广电工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (722, 'public_practice_dict', '1400525', '机电工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (723, 'public_practice_dict', '1400526', '民航机场工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (724, 'public_practice_dict', '1400527', '安装', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (725, 'public_practice_dict', '1400528', '土建', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (726, 'public_practice_type_dict', '1', '一级注册建筑师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (727, 'public_practice_type_dict', '2', '二级注册建筑师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (728, 'public_practice_type_dict', '3', '一级注册结构工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (729, 'public_practice_type_dict', '4', '二级注册结构师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (730, 'public_practice_type_dict', '5', '注册土木工程师（岩土）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (731, 'public_practice_type_dict', '6', '注册土木工程师（港口与航道工程）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (732, 'public_practice_type_dict', '7', '注册公用设备工程师（暖通空调）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (733, 'public_practice_type_dict', '8', '注册公用设备工程师（给水排水）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (734, 'public_practice_type_dict', '9', '注册公用设备工程师（动力）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (735, 'public_practice_type_dict', '10', '注册电气工程师（发输变电）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (736, 'public_practice_type_dict', '11', '注册电气工程师（供配电）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (737, 'public_practice_type_dict', '12', '注册化工工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (738, 'public_practice_type_dict', '13', '注册建造师（一级）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (739, 'public_practice_type_dict', '14', '注册建造师（二级）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (740, 'public_practice_type_dict', '15', '注册监理工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (741, 'public_practice_type_dict', '16', '造价工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (742, 'public_practice_type_dict', '17', '注册建造师（一级临时）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (743, 'public_practice_type_dict', '18', '注册建造师（二级临时）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (744, 'public_practice_type_dict', '19', '注册环保工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (745, 'public_practice_type_dict', '20', '注册城市规划师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (746, 'public_practice_type_dict', '21', '房地产经纪人', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (747, 'public_practice_type_dict', '22', '注册房地产估价师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (748, 'public_practice_type_dict', '23', '物业管理师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (749, 'public_practice_type_dict', '24', '园林项目经理', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (750, 'public_practice_type_dict', '25', '招标师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (751, 'public_practice_type_dict', '26', '一级注册消防工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (752, 'public_practice_type_dict', '27', '注册机械工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (753, 'public_practice_type_dict', '28', '一级防护工程师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (754, 'public_practice_type_dict', '29', '建造员（三级项目经理）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (755, 'project_size', '01', '大型', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (756, 'project_size', '02', '中型', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (757, 'project_size', '03', '小型', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (758, 'project_status', '001', '筹备', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (759, 'project_status', '002', '立项', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (760, 'project_status', '003', '在建', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (761, 'project_status', '004', '竣工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (762, 'project_status', '005', '停工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (763, 'project_status', '006', '完工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (764, 'public_professional_skill_level_dict', '1', '普工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (765, 'public_professional_skill_level_dict', '2', '初级工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (766, 'public_professional_skill_level_dict', '3', '中级工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (767, 'public_professional_skill_level_dict', '4', '高级工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (768, 'public_professional_skill_level_dict', '5', '技师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (769, 'public_professional_skill_level_dict', '6', '高级技师', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (770, 'property_num', '001', '新建', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (771, 'property_num', '002', '改建', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (772, 'property_num', '003', '扩建', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (773, 'property_num', '004', '恢复', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (774, 'property_num', '005', '迁建', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (775, 'property_num', '006', '拆除', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (776, 'property_num', '099', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (777, 'public_security_certificate_dict', '014001001', '不分专业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (778, 'public_skill_type_dict', '001', '土建类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (779, 'public_skill_type_dict', '002', '安装类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (780, 'public_skill_type_dict', '003', '建筑机械类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (781, 'public_skill_type_dict', '004', '装饰类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (782, 'public_skill_type_dict', '005', '市政工程类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (783, 'public_skill_type_dict', '006', '古建筑类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (784, 'public_skill_type_dict', '007', '燃气类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (785, 'public_skill_type_dict', '008', '供排水类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (786, 'public_skill_type_dict', '009', '特种作业人员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (787, 'public_skill_type_dict', '010', '其他类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (788, 'public_skill_type_dict', '1', ' 建筑油漆工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (789, 'public_skill_type_dict', '2', ' 测量放线工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (790, 'public_skill_type_dict', '3', ' 石工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (791, 'public_skill_type_dict', '4', ' 架子工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (792, 'public_skill_type_dict', '5', ' 砌筑工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (793, 'public_skill_type_dict', '6', ' 防水工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (794, 'public_skill_type_dict', '7', ' 抹灰工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (795, 'public_skill_type_dict', '8', ' 钢筋工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (796, 'public_skill_type_dict', '9', ' 混凝土工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (797, 'public_skill_type_dict', '10', ' 木工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (798, 'public_skill_type_dict', '11', ' 模板工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (799, 'public_skill_type_dict', '12', ' 建筑电工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (800, 'public_skill_type_dict', '13', ' 试验工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (801, 'public_skill_type_dict', '14', ' 水暖工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (802, 'public_skill_type_dict', '15', ' 工程安装钳工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (803, 'public_skill_type_dict', '16', ' 管道工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (804, 'public_skill_type_dict', '17', ' 安装起重工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (805, 'public_skill_type_dict', '18', ' 筑炉工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (806, 'public_skill_type_dict', '19', ' 工程电气设备安装调试工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (807, 'public_skill_type_dict', '20', ' 通风工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (808, 'public_skill_type_dict', '21', ' 推土、铲运机驾驶员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (809, 'public_skill_type_dict', '22', ' 挖掘机驾驶员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (810, 'public_skill_type_dict', '23', ' 起重机驾驶员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (811, 'public_skill_type_dict', '24', ' 塔式起重机驾驶员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (812, 'public_skill_type_dict', '25', ' 中小型建筑机械操纵员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (813, 'public_skill_type_dict', '26', ' 工程机械修理员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (814, 'public_skill_type_dict', '27', ' 打桩工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (815, 'public_skill_type_dict', '28', ' 装饰涂表工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (816, 'public_skill_type_dict', '29', ' 装饰金属工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (817, 'public_skill_type_dict', '30', ' 装饰镶贴工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (818, 'public_skill_type_dict', '31', ' 装饰幕墙工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (819, 'public_skill_type_dict', '32', ' 装饰木工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (820, 'public_skill_type_dict', '33', ' 下水道工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (821, 'public_skill_type_dict', '34', ' 下水道养护工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (822, 'public_skill_type_dict', '35', ' 沥青工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (823, 'public_skill_type_dict', '36', ' 污水处理工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (824, 'public_skill_type_dict', '37', ' 沥青混凝土摊铺机操作工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (825, 'public_skill_type_dict', '38', ' 筑路工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (826, 'public_skill_type_dict', '39', ' 泵站操作工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (827, 'public_skill_type_dict', '40', ' 道路养护工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (828, 'public_skill_type_dict', '41', ' 园林绿化类', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (829, 'public_skill_type_dict', '42', ' 盆景工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (830, 'public_skill_type_dict', '43', ' 观赏动植饲养工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (831, 'public_skill_type_dict', '44', ' 植保工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (832, 'public_skill_type_dict', '45', ' 绿化工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (833, 'public_skill_type_dict', '46', ' 花卉工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (834, 'public_skill_type_dict', '47', ' 育苗工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (835, 'public_skill_type_dict', '48', ' 古建彩画工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (836, 'public_skill_type_dict', '49', ' 古建木工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (837, 'public_skill_type_dict', '50', ' 古建瓦工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (838, 'public_skill_type_dict', '51', ' 古建油漆工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (839, 'public_skill_type_dict', '52', ' 假山工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (840, 'public_skill_type_dict', '53', ' 燃气用具安装检修工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (841, 'public_skill_type_dict', '54', ' 燃气管道工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (842, 'public_skill_type_dict', '55', ' 液化石油气机械修理工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (843, 'public_skill_type_dict', '56', ' 燃气输送工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (844, 'public_skill_type_dict', '57', ' 燃起用具修理工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (845, 'public_skill_type_dict', '58', ' 燃气化验工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (846, 'public_skill_type_dict', '59', ' 燃气净化工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (847, 'public_skill_type_dict', '60', ' 液化石油气罐区运行工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (848, 'public_skill_type_dict', '61', ' 热力司炉工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (849, 'public_skill_type_dict', '62', ' 燃气调压工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (850, 'public_skill_type_dict', '63', ' 液化石油钢瓶检修工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (851, 'public_skill_type_dict', '64', ' 液化石油气罐瓶工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (852, 'public_skill_type_dict', '65', ' 供气营销员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (853, 'public_skill_type_dict', '66', ' 燃气表装修工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (854, 'public_skill_type_dict', '67', ' 变配电运行工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (855, 'public_skill_type_dict', '68', ' 供水管道工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (856, 'public_skill_type_dict', '69', ' 供水设备维修电工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (857, 'public_skill_type_dict', '70', ' 机泵运行工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (858, 'public_skill_type_dict', '71', ' 污水化验检测工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (859, 'public_skill_type_dict', '72', ' 净水工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (860, 'public_skill_type_dict', '73', ' 水质监测员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (861, 'public_skill_type_dict', '74', ' 水表装修工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (862, 'public_skill_type_dict', '75', ' 供水调度员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (863, 'public_skill_type_dict', '76', ' 供水营销员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (864, 'public_skill_type_dict', '77', ' 供水设备维修钳工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (865, 'public_skill_type_dict', '78', ' 供水仪表工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (866, 'public_skill_type_dict', '79', ' 建筑电工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (867, 'public_skill_type_dict', '80', ' 高处作业吊篮安装拆卸工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (868, 'public_skill_type_dict', '81', ' 塔式起重机司机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (869, 'public_skill_type_dict', '82', ' 施工升降机司机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (870, 'public_skill_type_dict', '83', ' 电焊工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (871, 'public_skill_type_dict', '84', ' 其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (872, 'public_skill_type_dict', '85', ' 建筑架工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (873, 'public_skill_type_dict', '86', ' 普通脚手架工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (874, 'public_skill_type_dict', '87', ' 附着升降脚手架工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (875, 'public_skill_type_dict', '88', ' 建筑起重信号、司索工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (876, 'public_skill_type_dict', '89', ' 建筑起重机、司机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (877, 'public_skill_type_dict', '90', ' 物料提升机司机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (878, 'public_skill_type_dict', '91', ' 门式起重机司机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (879, 'public_skill_type_dict', '92', ' 桥式起重机司机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (880, 'public_skill_type_dict', '93', ' 汽车式起重机司机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (881, 'public_skill_type_dict', '94', ' 建筑起重机械安装拆卸工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (882, 'public_skill_type_dict', '95', ' 塔机安（拆）工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (883, 'public_skill_type_dict', '96', ' 施工升降机安（拆）工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (884, 'public_skill_type_dict', '97', ' 物料提升机安（拆）工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (885, 'public_skill_type_dict', '98', ' 门式起重机安（拆）工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (886, 'public_skill_type_dict', '99', ' 桥式起重机安（拆）工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (887, 'public_skill_type_dict', '100', ' 其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (888, 'public_skill_type_dict', '101', ' 拆卸工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (889, 'public_skill_type_dict', '102', ' 瓦工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (890, 'public_skill_type_dict', '103', ' 送电线路架设工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (891, 'public_skill_type_dict', '104', ' 维修电工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (892, 'public_skill_type_dict', '105', ' 污水化验监测工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (893, 'public_skill_type_dict', '106', ' 水质检验工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (894, 'public_skill_type_dict', '107', ' 废水处理工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (895, 'public_skill_type_dict', '108', ' 古建筑油漆工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (896, 'public_skill_type_dict', '109', ' 建筑起重机械安装拆卸工（施工升降机）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (897, 'public_skill_type_dict', '110', ' 砌花街工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (898, 'public_skill_type_dict', '111', ' 草坪建植工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (899, 'public_skill_type_dict', '112', ' 推光漆工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (900, 'public_skill_type_dict', '113', ' 古建筑石工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (901, 'public_skill_type_dict', '114', ' 建筑起重机械司机（塔式起重机）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (902, 'public_skill_type_dict', '115', ' 工程机械修理工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (903, 'public_skill_type_dict', '116', ' 水环境监测工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (904, 'public_skill_type_dict', '117', ' 建筑焊工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (905, 'public_skill_type_dict', '118', ' 操作工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (906, 'public_skill_type_dict', '119', ' 镶贴工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (907, 'public_skill_type_dict', '120', ' 建筑起重司索信号工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (908, 'public_skill_type_dict', '121', ' 钣金', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (909, 'public_skill_type_dict', '122', ' 机械设备安装工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (910, 'public_skill_type_dict', '123', ' 建筑架子工（普通脚手架）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (911, 'public_skill_type_dict', '124', ' 电工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (912, 'public_skill_type_dict', '125', ' 养护工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (913, 'public_skill_type_dict', '126', ' 司索工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (914, 'public_skill_type_dict', '127', ' 油漆工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (915, 'public_skill_type_dict', '128', ' 建筑起重机械安装拆卸工（塔式起重机）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (916, 'public_skill_type_dict', '129', ' 起重机械指挥', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (917, 'public_skill_type_dict', '130', ' 高压电工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (918, 'public_skill_type_dict', '131', ' 高压电工（安监局发证）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (919, 'public_skill_type_dict', '132', ' 变电安装工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (920, 'public_skill_type_dict', '133', ' 沥青混凝土摊铺', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (921, 'public_skill_type_dict', '134', ' 泥塑工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (922, 'public_skill_type_dict', '135', ' 管工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (923, 'public_skill_type_dict', '136', ' 建筑电焊工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (924, 'public_skill_type_dict', '137', ' 焊工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (925, 'public_skill_type_dict', '138', ' 混凝土制品模具', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (926, 'public_skill_type_dict', '139', ' 建筑起重机械司机（施工升降机）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (927, 'public_skill_type_dict', '140', ' 石制作', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (928, 'public_skill_type_dict', '141', ' 道路养护工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (929, 'public_skill_type_dict', '142', ' 装饰装修工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (930, 'public_skill_type_dict', '143', ' 建筑起重机械司机（物料提升机）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (931, 'public_skill_type_dict', '144', ' 石雕工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (932, 'public_skill_type_dict', '145', ' 古建筑瓦工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (933, 'public_skill_type_dict', '146', ' 砧刻工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (934, 'public_skill_type_dict', '147', ' 门窗工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (935, 'public_skill_type_dict', '148', ' 匠额工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (936, 'public_skill_type_dict', '149', ' 砧细工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (937, 'public_skill_type_dict', '150', ' 继电保护+电力电缆', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (938, 'public_skill_type_dict', '151', ' 检验工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (939, 'public_skill_type_dict', '152', ' 测量放射线工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (940, 'public_skill_type_dict', '153', ' 果树工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (941, 'public_skill_type_dict', '154', ' 彩绘工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (942, 'public_skill_type_dict', '155', ' 建筑起重机械安装拆卸工（物料提升机）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (943, 'public_skill_type_dict', '156', ' 路面工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (944, 'public_skill_type_dict', '157', ' 建筑架子工（附着升降脚手架）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (945, 'public_skill_type_dict', '158', ' 木雕工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (946, 'public_skill_type_dict', '159', ' 钳工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (947, 'public_skill_type_dict', '160', ' 测量工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (948, 'public_skill_type_dict', '161', ' 古建筑彩绘工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (949, 'public_skill_type_dict', '162', ' 沥青加工工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (950, 'public_staff_status_dict', '01', '离职', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (951, 'public_staff_status_dict', '02', '在职', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (952, 'public_title_level_dict', '1', '初级职称', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (953, 'public_title_level_dict', '2', '中级职称', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (954, 'public_title_level_dict', '3', '高级职称', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (955, 'public_training_type_dict', '003001', '安全教育', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (956, 'public_training_type_dict', '003002', '入场教育', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (957, 'public_training_type_dict', '003003', '退场教育', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (958, 'public_training_type_dict', '003004', '技能培训', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (959, 'public_unit_dict', '80', '米', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (960, 'public_unit_dict', '81', '平方米', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (961, 'public_unit_dict', '82', '立方米', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (962, 'public_work_type_dict', '010', '砌筑工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (963, 'public_work_type_dict', '020', '钢筋工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (964, 'public_work_type_dict', '030', '架子工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (965, 'public_work_type_dict', '040', '混凝土工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (966, 'public_work_type_dict', '050', '模板工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (967, 'public_work_type_dict', '060', '机械设备安装工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (968, 'public_work_type_dict', '070', '通风工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (969, 'public_work_type_dict', '080', '安装起重工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (970, 'public_work_type_dict', '090', '安装钳工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (971, 'public_work_type_dict', '100', '电气设备安装调试工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (972, 'public_work_type_dict', '110', '管道工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (973, 'public_work_type_dict', '120', '变电安装工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (974, 'public_work_type_dict', '130', '建筑电工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (975, 'public_work_type_dict', '140', '司泵工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (976, 'public_work_type_dict', '150', '挖掘铲运和桩工机械司机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (977, 'public_work_type_dict', '160', '桩机操作工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (978, 'public_work_type_dict', '170', '起重信号工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (979, 'public_work_type_dict', '180', '建筑起重机械安装拆卸工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (980, 'public_work_type_dict', '190', '装饰装修工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (981, 'public_work_type_dict', '200', '室内成套设施安装工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (982, 'public_work_type_dict', '210', '建筑门窗幕墙安装工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (983, 'public_work_type_dict', '220', '幕墙制作工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (984, 'public_work_type_dict', '230', '防水工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (985, 'public_work_type_dict', '240', '木工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (986, 'public_work_type_dict', '250', '石工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (987, 'public_work_type_dict', '270', '电焊工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (988, 'public_work_type_dict', '280', '爆破工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (989, 'public_work_type_dict', '290', '除尘工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (990, 'public_work_type_dict', '300', '测量放线工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (991, 'public_work_type_dict', '310', '线路架设工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (992, 'public_work_type_dict', '320', '古建筑传统石工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (993, 'public_work_type_dict', '330', '古建筑传统瓦工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (994, 'public_work_type_dict', '340', '古建筑传统彩画工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (995, 'public_work_type_dict', '350', '古建筑传统木工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (996, 'public_work_type_dict', '360', '古建筑传统油工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (997, 'public_work_type_dict', '380', '金属工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (998, 'public_work_type_dict', '900', '管理人员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (999, 'public_work_type_dict', '390', '杂工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1000, 'public_work_type_dict', '1000', '其它', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1001, 'public_worker_role_dict', '10', '管理人员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1002, 'public_worker_role_dict', '20', '建筑工人', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1003, 'public_yes_no_dict', '1', '是', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1004, 'public_yes_no_dict', '0', '否', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1005, 'public_tower_crane_type_dict', '01', '塔帽式', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1006, 'public_tower_crane_type_dict', '02', '平头式', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1007, 'public_tower_crane_type_dict', '03', '动臂式', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1008, 'public_tower_crane_type_dict', '04', '行走塔帽式', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1009, 'public_tower_crane_type_dict', '05', '行走平头式', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1010, 'public_tower_crane_type_dict', '06', '行走动臂式', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1011, 'public_switch_type_dict', '01', '开机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1012, 'public_switch_type_dict', '02', '关机', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1013, 'public_switch_type_dict', '03', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1014, 'public_noise_dust_collection_type_dict', '01', '实时数据', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1015, 'public_noise_dust_collection_type_dict', '02', '分钟数据', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1016, 'public_noise_dust_collection_type_dict', '03', '小时数据', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1017, 'public_noise_dust_collection_type_dict', '04', '天数据', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1018, 'public_trading_status_dict', '1', '成功', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1019, 'public_trading_status_dict', '0', '失败', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1020, 'public_nation_dict', '1', '汉族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1021, 'public_nation_dict', '2', '满族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1022, 'public_nation_dict', '3', '蒙古族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1023, 'public_nation_dict', '4', '回族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1024, 'public_nation_dict', '5', '藏族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1025, 'public_nation_dict', '6', '维吾尔族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1026, 'public_nation_dict', '7', '苗族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1027, 'public_nation_dict', '8', '彝族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1028, 'public_nation_dict', '9', '壮族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1029, 'public_nation_dict', '10', '布依族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1030, 'public_nation_dict', '11', '侗族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1031, 'public_nation_dict', '12', '瑶族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1032, 'public_nation_dict', '13', '白族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1033, 'public_nation_dict', '14', '土家族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1034, 'public_nation_dict', '15', '哈尼族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1035, 'public_nation_dict', '16', '哈萨克族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1036, 'public_nation_dict', '17', '傣族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1037, 'public_nation_dict', '18', '黎族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1038, 'public_nation_dict', '19', '傈僳族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1039, 'public_nation_dict', '20', '佤族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1040, 'public_nation_dict', '21', '畲族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1041, 'public_nation_dict', '22', '高山族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1042, 'public_nation_dict', '23', '拉祜族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1043, 'public_nation_dict', '24', '水族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1044, 'public_nation_dict', '25', '东乡族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1045, 'public_nation_dict', '26', '纳西族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1046, 'public_nation_dict', '27', '景颇族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1047, 'public_nation_dict', '28', '柯尔克孜族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1048, 'public_nation_dict', '29', '土族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1049, 'public_nation_dict', '30', '达斡尔族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1050, 'public_nation_dict', '31', '仫佬族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1051, 'public_nation_dict', '32', '羌族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1052, 'public_nation_dict', '33', '布朗族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1053, 'public_nation_dict', '34', '撒拉族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1054, 'public_nation_dict', '35', '毛南族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1055, 'public_nation_dict', '36', '仡佬族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1056, 'public_nation_dict', '37', '锡伯族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1057, 'public_nation_dict', '38', '阿昌族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1058, 'public_nation_dict', '39', '普米族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1059, 'public_nation_dict', '40', '朝鲜族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1060, 'public_nation_dict', '41', '塔吉克族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1061, 'public_nation_dict', '42', '怒族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1062, 'public_nation_dict', '43', '乌孜别克族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1063, 'public_nation_dict', '44', '俄罗斯族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1064, 'public_nation_dict', '45', '鄂温克族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1065, 'public_nation_dict', '46', '德昂族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1066, 'public_nation_dict', '47', '保安族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1067, 'public_nation_dict', '48', '裕固族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1068, 'public_nation_dict', '49', '京族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1069, 'public_nation_dict', '50', '塔塔尔族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1070, 'public_nation_dict', '51', '独龙族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1071, 'public_nation_dict', '52', '鄂伦春族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1072, 'public_nation_dict', '53', '赫哲族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1073, 'public_nation_dict', '54', '门巴族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1074, 'public_nation_dict', '55', '珞巴族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1075, 'public_nation_dict', '56', '基诺族', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1076, 'public_special_account_status_dict', '1', '正常', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1077, 'public_special_account_status_dict', '0', '销户', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1078, 'public_distribution_channel_dict', '1', '线上', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1079, 'public_distribution_channel_dict', '0', '线下', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1080, 'public_investment_nature_dict', '1', '国际组织外国政府贷款', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1081, 'public_investment_nature_dict', '2', '集体资金', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1082, 'public_investment_nature_dict', '3', '私营资金', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1083, 'public_investment_nature_dict', '4', '港澳台资金', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1084, 'public_investment_nature_dict', '5', '外商资金', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1085, 'public_investment_nature_dict', '6', '政府专项建设资金', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1086, 'public_investment_nature_dict', '7', '财政资金', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1087, 'public_investment_nature_dict', '8', '国有企业资金', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1088, 'public_investment_nature_dict', '9', '国家融资', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1089, 'functional_unit', '1', '住房城乡建设', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1090, 'functional_unit', '2', '交通运输', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1091, 'functional_unit', '3', '水利', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1092, 'functional_unit', '4', '林业园林', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1093, 'functional_unit', '5', '其它', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1094, 'public_device_distribution_state', '1', '成功', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1095, 'public_device_distribution_state', '0', '失败', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1096, 'public_device_distribution_state', '2', '下发中', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1097, 'public_video_platform_type', '01', '海康', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1098, 'public_video_platform_type', '02', '大华', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1099, 'public_institutions_status_dict', '0', '正常工作', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1100, 'public_institutions_status_dict', '1', '风速传感器故障', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1101, 'public_institutions_status_dict', '2', '称重传感器故障', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1102, 'public_institutions_status_dict', '4', '回转传感器故障', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1103, 'public_institutions_status_dict', '8', '幅度传感器故障', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1104, 'public_institutions_status_dict', '16', '高度传感器故障', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1105, 'public_work_early_warning_status_dict', '0', '正常工作', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1106, 'public_work_early_warning_status_dict', '1', '回转左限位预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1107, 'public_work_early_warning_status_dict', '2', '回转右限位预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1108, 'public_work_early_warning_status_dict', '4', '高度上限位预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1109, 'public_work_early_warning_status_dict', '8', '高度下限位预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1110, 'public_work_early_warning_status_dict', '16', '幅度前限位预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1111, 'public_work_early_warning_status_dict', '32', '幅度后限位预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1112, 'public_work_early_warning_status_dict', '64', '力矩预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1113, 'public_work_early_warning_status_dict', '128', '风速预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1114, 'public_work_alarm_status_dict', '0', '正常工作', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1115, 'public_work_alarm_status_dict', '1', '左回转报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1116, 'public_work_alarm_status_dict', '2', '右回转报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1117, 'public_work_alarm_status_dict', '4', '高度上限位报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1118, 'public_work_alarm_status_dict', '8', '高度下限位报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1119, 'public_work_alarm_status_dict', '16', '幅度前限位报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1120, 'public_work_alarm_status_dict', '32', '幅度后限位报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1121, 'public_area_early_warning_status_dict', '0', '正常工作', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1122, 'public_area_early_warning_status_dict', '1', '右转环境预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1123, 'public_area_early_warning_status_dict', '2', '左转环境预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1124, 'public_area_early_warning_status_dict', '4', '小车进环境预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1125, 'public_area_early_warning_status_dict', '8', '小车出环境预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1126, 'public_area_early_warning_status_dict', '16', '吊钩下预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1127, 'public_area_alarm_status_dict', '0', '正常工作', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1128, 'public_area_alarm_status_dict', '1', '右转环境报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1129, 'public_area_alarm_status_dict', '2', '左转环境报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1130, 'public_area_alarm_status_dict', '4', '小车进环境报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1131, 'public_area_alarm_status_dict', '8', '小车出环境报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1132, 'public_area_alarm_status_dict', '16', '吊钩下报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1133, 'public_group_tower_early_warning_status_dict', '0', '正常工作', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1134, 'public_group_tower_early_warning_status_dict', '1', '右转预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1135, 'public_group_tower_early_warning_status_dict', '2', '左转预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1136, 'public_group_tower_early_warning_status_dict', '4', '小车前进预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1137, 'public_group_tower_early_warning_status_dict', '8', '小车后退预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1138, 'public_group_tower_early_warning_status_dict', '16', '吊钩下降预警', NULL, 1, NULL, '2022-05-16 11:19:31',
        NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1139, 'public_group_tower_alarm_status_dict', '0', '正常工作', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1140, 'public_group_tower_alarm_status_dict', '1', '右转报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1141, 'public_group_tower_alarm_status_dict', '2', '左转报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1142, 'public_group_tower_alarm_status_dict', '4', '小车前进报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1143, 'public_group_tower_alarm_status_dict', '8', '小车后退报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1144, 'public_group_tower_alarm_status_dict', '16', '吊钩下降报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1145, 'public_real_time_status_dict', '0', '正常状态', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1146, 'public_real_time_status_dict', '1', 'IC卡无效', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1147, 'public_real_time_status_dict', '2', '安全器故障', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1148, 'public_real_time_status_dict', '4', '上高度预警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1149, 'public_real_time_status_dict', '8', '上高度报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1150, 'public_real_time_status_dict', '16', '非本人操作', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1151, 'public_real_time_status_dict', '32', '监理授权', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1152, 'public_real_time_status_dict', '64', '加节模式', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1153, 'public_real_time_status_dict', '128', '下限位报警', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1154, 'public_level_dict', '0', '国家级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1155, 'public_level_dict', '1', '省级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1156, 'public_level_dict', '2', '区县级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1157, 'public_clause_point_type_dict', '0', '基础分', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1158, 'public_clause_point_type_dict', '1', '调级分', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1159, 'public_faith_user_dict', '0', '企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1160, 'public_faith_user_dict', '1', '项目', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1161, 'public_faith_user_dict', '2', '人员', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1162, 'public_effect_status_dict', '0', '已失效', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1163, 'public_effect_status_dict', '1', '已生效', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1164, 'public_calculate_type_dict', '0', '审核通过当天', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1165, 'public_calculate_type_dict', '1', '每年固定月日', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1166, 'public_calculate_type_dict', '2', '自定义日期', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1167, 'public_scoring_type_dict', '0', '自定义分值', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1168, 'public_scoring_type_dict', '1', '动态分值', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1169, 'public_scoring_type_dict', '2', '固定分值', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1170, 'public_clause_category_dict', '1', '良好行为标准', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1171, 'public_clause_category_dict', '2', '不良行为标准', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1172, 'public_level_division_dict', '1', '排名', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1173, 'public_level_division_dict', '2', '分数', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1174, 'public_business_type_dict', '1', '安监业务', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1175, 'public_business_type_dict', '2', '诚信业务', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1176, 'public_supervision_type_dict', '1', '市站一级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1177, 'public_supervision_type_dict', '2', '市镇二级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1178, 'public_supervision_type_dict', '3', '区一级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1179, 'public_supervision_type_dict', '4', '区镇二级', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1180, 'child_project_status', '1', '在建', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1181, 'child_project_status', '2', '在建（处罚停工）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1182, 'child_project_status', '3', '在建（普通停工）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1183, 'child_project_status', '4', '未开工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1184, 'child_project_status', '5', '未办理手续', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1185, 'child_project_status', '6', '完工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1186, 'child_project_status', '7', '竣工', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1187, 'child_project_status', '8', '终止监督', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1188, 'child_project_type', '1', '主体', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1189, 'child_project_type', '2', '基坑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1190, 'child_project_type', '3', '桩基', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1191, 'child_project_type', '4', '主体基础及基坑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1192, 'child_project_type', '5', '基桩及基坑', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1193, 'child_project_type', '6', '装修', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1194, 'child_project_type', '7', '幕墙', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1195, 'child_project_type', '8', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1196, 'structure_type', '1', '框架结构', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1197, 'structure_type', '2', '框架-剪力墙', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1198, 'structure_type', '3', '剪力墙', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1199, 'structure_type', '4', '框架-核心筒', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1200, 'structure_type', '5', '筒中筒', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1201, 'structure_type', '6', '排架', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1202, 'structure_type', '7', '底部框架-砖混', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1203, 'structure_type', '8', '砖混结构', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1204, 'structure_type', '9', '钢结构', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1205, 'structure_type', '10', '木结构', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1206, 'structure_type', '11', '简体结构', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1207, 'foundation_type', '1', '天然地基', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1208, 'foundation_type', '2', '灰土地基', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1209, 'foundation_type', '3', '砂和砂石地基', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1210, 'foundation_type', '4', '复合地基', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1211, 'foundation_type', '5', '土工合成材料地基', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1212, 'basic_type', '1', '桩基础', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1213, 'basic_type', '2', '条形基础', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1214, 'basic_type', '3', '筏板基础', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1215, 'basic_type', '4', '独立基础', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1216, 'basic_type', '5', '箱型基础', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1217, 'basic_type', '6', '天然基础', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1218, 'basic_type', '7', '冲孔灌注桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1219, 'basic_type', '8', '锤击灌注桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1220, 'basic_type', '9', '粉喷桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1221, 'basic_type', '10', '夯扩桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1222, 'basic_type', '11', '搅拌桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1223, 'basic_type', '12', '静压桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1224, 'basic_type', '13', '人工挖孔桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1225, 'basic_type', '14', '碎石桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1226, 'basic_type', '15', '预应力管桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1227, 'basic_type', '16', '预制方桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1228, 'basic_type', '17', '钻孔桩', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1229, 'public_device_online_status_dict', '01', '在线', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1230, 'public_device_online_status_dict', '02', '异常', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1231, 'public_car_type_dict', '01', '泥头车', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1232, 'public_car_type_dict', '02', '混凝土车', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1233, 'public_car_type_dict', '03', '货车', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1234, 'public_car_type_dict', '04', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1235, 'public_project_type_hainan_dict', '0', '房建项目', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1236, 'public_project_type_hainan_dict', '1', '市政项目', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1237, 'public_project_type_hainan_dict', '3', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1238, 'public_region_hainan_dict', '0', '科教城', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1239, 'public_region_hainan_dict', '1', '南繁科技城', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1240, 'public_region_hainan_dict', '2', '南山港', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1241, 'public_region_hainan_dict', '3', '深海科技城', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1242, 'public_region_hainan_dict', '4', '中转基地', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1243, 'public_region_hainan_dict', '5', '崖城综合服务板块', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1244, 'public_investors_nature_hainan_dict', '0', '政府投资', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1245, 'public_investors_nature_hainan_dict', '1', '社会投资', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1246, 'public_plan_construct_progress_0_hainan_dict', '1', '设计阶段', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1247, 'public_plan_construct_progress_0_hainan_dict', '2', '桩基础', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1248, 'public_plan_construct_progress_0_hainan_dict', '3', '地下室', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1249, 'public_plan_construct_progress_0_hainan_dict', '4', '结构封顶', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1250, 'public_plan_construct_progress_0_hainan_dict', '5', '室外与配套', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1251, 'public_plan_construct_progress_0_hainan_dict', '6', '装修工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1252, 'public_plan_construct_progress_1_hainan_dict', '1', '设计阶段', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1253, 'public_plan_construct_progress_1_hainan_dict', '2', '沟槽开挖', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1254, 'public_plan_construct_progress_1_hainan_dict', '3', '管沟埋设', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1255, 'public_plan_construct_progress_1_hainan_dict', '4', '土方回填', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1256, 'public_plan_construct_progress_1_hainan_dict', '5', '路基工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1257, 'public_plan_construct_progress_1_hainan_dict', '6', '路面工程', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1258, 'public_plan_construct_progress_1_hainan_dict', '7', '交通及绿化', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1259, 'public_file_type_hainan_dict', '0', '设计审查证明文件', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1260, 'public_file_type_hainan_dict', '1', '招标投标证明文件', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1261, 'public_file_type_hainan_dict', '2', '合同证明文件', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1262, 'public_file_type_hainan_dict', '3', '施工许可', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1263, 'public_file_type_hainan_dict', '4', '其他', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1264, 'public_team_data_source_from_dict', '1', '本平台录入', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1265, 'public_team_data_source_from_dict', '2', '部平台下发', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL,
        NULL);
INSERT INTO `dict_table`
VALUES (1266, 'public_message_type_dict', '1', '设备离线通知', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1267, 'public_message_type_dict', '2', '扬尘告警通知', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1268, 'public_message_type_dict', '3', '噪音告警通知', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1269, 'public_message_type_dict', '4', '视频巡查告警通知', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1270, 'public_message_type_dict', '5', '项目状态合规变动通知', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1271, 'public_message_type_dict', '6', '设备上线通知', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1272, 'public_warn_video_inspect_process_result_dict', '1', '未处理', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1273, 'public_warn_video_inspect_process_result_dict', '2', '待审查', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1274, 'public_warn_video_inspect_process_result_dict', '3', '已整改', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1275, 'public_warn_video_inspect_process_result_dict', '4', '未按要求整改', NULL, 1, NULL, '2022-05-16 11:19:31',
        NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1276, 'public_warn_video_inspect_issue_level_dict', '1', '较大问题', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1277, 'public_warn_video_inspect_issue_level_dict', '2', '重大问题', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1278, 'public_warn_video_inspect_issue_level_dict', '3', '一般问题', NULL, 1, NULL, '2022-05-16 11:19:31', NULL,
        NULL, NULL);
INSERT INTO `dict_table`
VALUES (1279, 'company_type', '100', '内资企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1280, 'company_type', '200', '港、澳、台商投资企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1281, 'company_type', '300', '外商投资企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1282, 'company_type', '810', '军队单位', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1283, 'company_type', '110', '国有企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1284, 'company_type', '120', '集体企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1285, 'company_type', '130', '股份合作企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1286, 'company_type', '140', '联营企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1287, 'company_type', '150', '有限责任公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1288, 'company_type', '160', '股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1289, 'company_type', '170', '私营企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1290, 'company_type', '190', '其他企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1291, 'company_type', '210', '合资经营企业（港或澳、台资）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1292, 'company_type', '220', '合作经营企业（港或澳、台资）', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1293, 'company_type', '230', '港、澳、台商独资经营企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1294, 'company_type', '240', '港、澳、台商投资股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1295, 'company_type', '290', '其他港、澳、台商投资企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1296, 'company_type', '310', '中外合资经营企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1297, 'company_type', '320', '中外合作经营企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1298, 'company_type', '330', '外资企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1299, 'company_type', '340', '外商投资股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1300, 'company_type', '390', '其他外商投资企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1301, 'company_type', '141', '国有联营企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1302, 'company_type', '142', '集体联营企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1303, 'company_type', '143', '国有与集体联营企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1304, 'company_type', '149', '其他联营企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1305, 'company_type', '151', '国有独资公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1306, 'company_type', '159', '其他有限责任公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1307, 'company_type', '171', '私营独资企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1308, 'company_type', '172', '私营合伙企业', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1309, 'company_type', '173', '私营有限责任公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1310, 'company_type', '174', '私营股份有限公司', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1311, 'enable_disable', '1', '开启', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);
INSERT INTO `dict_table`
VALUES (1312, 'enable_disable', '0', '关闭', NULL, 1, NULL, '2022-05-16 11:19:31', NULL, NULL, NULL);

-- ----------------------------
-- Records of dict_table_level
-- ----------------------------
INSERT INTO `dict_table_level`
VALUES (1, 0, '0', 'area_code', 1, '110000', '北京市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2, 0, '0', 'area_code', 1, '120000', '天津市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3, 0, '0', 'area_code', 1, '130000', '河北省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (4, 0, '0', 'area_code', 1, '140000', '山西省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (5, 0, '0', 'area_code', 1, '150000', '内蒙古自治区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (6, 0, '0', 'area_code', 1, '210000', '辽宁省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (7, 0, '0', 'area_code', 1, '220000', '吉林省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (8, 0, '0', 'area_code', 1, '230000', '黑龙江省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (9, 0, '0', 'area_code', 1, '310000', '上海市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (10, 0, '0', 'area_code', 1, '320000', '江苏省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (11, 0, '0', 'area_code', 1, '330000', '浙江省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (12, 0, '0', 'area_code', 1, '340000', '安徽省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (13, 0, '0', 'area_code', 1, '350000', '福建省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (14, 0, '0', 'area_code', 1, '360000', '江西省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (15, 0, '0', 'area_code', 1, '370000', '山东省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (16, 0, '0', 'area_code', 1, '410000', '河南省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (17, 0, '0', 'area_code', 1, '420000', '湖北省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (18, 0, '0', 'area_code', 1, '430000', '湖南省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (19, 0, '0', 'area_code', 1, '440000', '广东省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (20, 0, '0', 'area_code', 1, '450000', '广西壮族自治区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (21, 0, '0', 'area_code', 1, '460000', '海南省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (22, 0, '0', 'area_code', 1, '500000', '重庆市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (23, 0, '0', 'area_code', 1, '510000', '四川省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (24, 0, '0', 'area_code', 1, '520000', '贵州省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (25, 0, '0', 'area_code', 1, '530000', '云南省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (26, 0, '0', 'area_code', 1, '540000', '西藏自治区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (27, 0, '0', 'area_code', 1, '610000', '陕西省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (28, 0, '0', 'area_code', 1, '620000', '甘肃省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (29, 0, '0', 'area_code', 1, '630000', '青海省', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (30, 0, '0', 'area_code', 1, '640000', '宁夏回族自治区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (31, 0, '0', 'area_code', 1, '650000', '新疆维吾尔自治区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (32, 1, '110000', 'area_code', 2, '110100', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (33, 2, '120000', 'area_code', 2, '120100', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (34, 3, '130000', 'area_code', 2, '130100', '石家庄市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (35, 3, '130000', 'area_code', 2, '130200', '唐山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (36, 3, '130000', 'area_code', 2, '130300', '秦皇岛市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (37, 3, '130000', 'area_code', 2, '130400', '邯郸市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (38, 3, '130000', 'area_code', 2, '130500', '邢台市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (39, 3, '130000', 'area_code', 2, '130600', '保定市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (40, 3, '130000', 'area_code', 2, '130700', '张家口市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (41, 3, '130000', 'area_code', 2, '130800', '承德市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (42, 3, '130000', 'area_code', 2, '130900', '沧州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (43, 3, '130000', 'area_code', 2, '131000', '廊坊市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (44, 3, '130000', 'area_code', 2, '131100', '衡水市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (45, 4, '140000', 'area_code', 2, '140100', '太原市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (46, 4, '140000', 'area_code', 2, '140200', '大同市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (47, 4, '140000', 'area_code', 2, '140300', '阳泉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (48, 4, '140000', 'area_code', 2, '140400', '长治市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (49, 4, '140000', 'area_code', 2, '140500', '晋城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (50, 4, '140000', 'area_code', 2, '140600', '朔州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (51, 4, '140000', 'area_code', 2, '140700', '晋中市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (52, 4, '140000', 'area_code', 2, '140800', '运城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (53, 4, '140000', 'area_code', 2, '140900', '忻州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (54, 4, '140000', 'area_code', 2, '141000', '临汾市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (55, 4, '140000', 'area_code', 2, '141100', '吕梁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (56, 5, '150000', 'area_code', 2, '150100', '呼和浩特市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (57, 5, '150000', 'area_code', 2, '150200', '包头市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (58, 5, '150000', 'area_code', 2, '150300', '乌海市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (59, 5, '150000', 'area_code', 2, '150400', '赤峰市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (60, 5, '150000', 'area_code', 2, '150500', '通辽市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (61, 5, '150000', 'area_code', 2, '150600', '鄂尔多斯市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (62, 5, '150000', 'area_code', 2, '150700', '呼伦贝尔市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (63, 5, '150000', 'area_code', 2, '150800', '巴彦淖尔市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (64, 5, '150000', 'area_code', 2, '150900', '乌兰察布市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (65, 5, '150000', 'area_code', 2, '152200', '兴安盟', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (66, 5, '150000', 'area_code', 2, '152500', '锡林郭勒盟', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (67, 5, '150000', 'area_code', 2, '152900', '阿拉善盟', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (68, 6, '210000', 'area_code', 2, '210100', '沈阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (69, 6, '210000', 'area_code', 2, '210200', '大连市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (70, 6, '210000', 'area_code', 2, '210300', '鞍山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (71, 6, '210000', 'area_code', 2, '210400', '抚顺市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (72, 6, '210000', 'area_code', 2, '210500', '本溪市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (73, 6, '210000', 'area_code', 2, '210600', '丹东市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (74, 6, '210000', 'area_code', 2, '210700', '锦州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (75, 6, '210000', 'area_code', 2, '210800', '营口市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (76, 6, '210000', 'area_code', 2, '210900', '阜新市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (77, 6, '210000', 'area_code', 2, '211000', '辽阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (78, 6, '210000', 'area_code', 2, '211100', '盘锦市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (79, 6, '210000', 'area_code', 2, '211200', '铁岭市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (80, 6, '210000', 'area_code', 2, '211300', '朝阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (81, 6, '210000', 'area_code', 2, '211400', '葫芦岛市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (82, 7, '220000', 'area_code', 2, '220100', '长春市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (83, 7, '220000', 'area_code', 2, '220200', '吉林市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (84, 7, '220000', 'area_code', 2, '220300', '四平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (85, 7, '220000', 'area_code', 2, '220400', '辽源市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (86, 7, '220000', 'area_code', 2, '220500', '通化市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (87, 7, '220000', 'area_code', 2, '220600', '白山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (88, 7, '220000', 'area_code', 2, '220700', '松原市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (89, 7, '220000', 'area_code', 2, '220800', '白城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (90, 7, '220000', 'area_code', 2, '222400', '延边朝鲜族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (91, 8, '230000', 'area_code', 2, '230100', '哈尔滨市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (92, 8, '230000', 'area_code', 2, '230200', '齐齐哈尔市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (93, 8, '230000', 'area_code', 2, '230300', '鸡西市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (94, 8, '230000', 'area_code', 2, '230400', '鹤岗市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (95, 8, '230000', 'area_code', 2, '230500', '双鸭山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (96, 8, '230000', 'area_code', 2, '230600', '大庆市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (97, 8, '230000', 'area_code', 2, '230700', '伊春市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (98, 8, '230000', 'area_code', 2, '230800', '佳木斯市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (99, 8, '230000', 'area_code', 2, '230900', '七台河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (100, 8, '230000', 'area_code', 2, '231000', '牡丹江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (101, 8, '230000', 'area_code', 2, '231100', '黑河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (102, 8, '230000', 'area_code', 2, '231200', '绥化市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (103, 8, '230000', 'area_code', 2, '232700', '大兴安岭地区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (104, 9, '310000', 'area_code', 2, '310100', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (105, 10, '320000', 'area_code', 2, '320100', '南京市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (106, 10, '320000', 'area_code', 2, '320200', '无锡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (107, 10, '320000', 'area_code', 2, '320300', '徐州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (108, 10, '320000', 'area_code', 2, '320400', '常州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (109, 10, '320000', 'area_code', 2, '320500', '苏州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (110, 10, '320000', 'area_code', 2, '320600', '南通市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (111, 10, '320000', 'area_code', 2, '320700', '连云港市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (112, 10, '320000', 'area_code', 2, '320800', '淮安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (113, 10, '320000', 'area_code', 2, '320900', '盐城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (114, 10, '320000', 'area_code', 2, '321000', '扬州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (115, 10, '320000', 'area_code', 2, '321100', '镇江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (116, 10, '320000', 'area_code', 2, '321200', '泰州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (117, 10, '320000', 'area_code', 2, '321300', '宿迁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (118, 11, '330000', 'area_code', 2, '330100', '杭州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (119, 11, '330000', 'area_code', 2, '330200', '宁波市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (120, 11, '330000', 'area_code', 2, '330300', '温州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (121, 11, '330000', 'area_code', 2, '330400', '嘉兴市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (122, 11, '330000', 'area_code', 2, '330500', '湖州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (123, 11, '330000', 'area_code', 2, '330600', '绍兴市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (124, 11, '330000', 'area_code', 2, '330700', '金华市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (125, 11, '330000', 'area_code', 2, '330800', '衢州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (126, 11, '330000', 'area_code', 2, '330900', '舟山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (127, 11, '330000', 'area_code', 2, '331000', '台州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (128, 11, '330000', 'area_code', 2, '331100', '丽水市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (129, 12, '340000', 'area_code', 2, '340100', '合肥市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (130, 12, '340000', 'area_code', 2, '340200', '芜湖市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (131, 12, '340000', 'area_code', 2, '340300', '蚌埠市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (132, 12, '340000', 'area_code', 2, '340400', '淮南市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (133, 12, '340000', 'area_code', 2, '340500', '马鞍山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (134, 12, '340000', 'area_code', 2, '340600', '淮北市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (135, 12, '340000', 'area_code', 2, '340700', '铜陵市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (136, 12, '340000', 'area_code', 2, '340800', '安庆市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (137, 12, '340000', 'area_code', 2, '341000', '黄山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (138, 12, '340000', 'area_code', 2, '341100', '滁州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (139, 12, '340000', 'area_code', 2, '341200', '阜阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (140, 12, '340000', 'area_code', 2, '341300', '宿州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (141, 12, '340000', 'area_code', 2, '341500', '六安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (142, 12, '340000', 'area_code', 2, '341600', '亳州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (143, 12, '340000', 'area_code', 2, '341700', '池州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (144, 12, '340000', 'area_code', 2, '341800', '宣城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (145, 13, '350000', 'area_code', 2, '350100', '福州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (146, 13, '350000', 'area_code', 2, '350200', '厦门市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (147, 13, '350000', 'area_code', 2, '350300', '莆田市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (148, 13, '350000', 'area_code', 2, '350400', '三明市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (149, 13, '350000', 'area_code', 2, '350500', '泉州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (150, 13, '350000', 'area_code', 2, '350600', '漳州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (151, 13, '350000', 'area_code', 2, '350700', '南平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (152, 13, '350000', 'area_code', 2, '350800', '龙岩市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (153, 13, '350000', 'area_code', 2, '350900', '宁德市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (154, 14, '360000', 'area_code', 2, '360100', '南昌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (155, 14, '360000', 'area_code', 2, '360200', '景德镇市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (156, 14, '360000', 'area_code', 2, '360300', '萍乡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (157, 14, '360000', 'area_code', 2, '360400', '九江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (158, 14, '360000', 'area_code', 2, '360500', '新余市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (159, 14, '360000', 'area_code', 2, '360600', '鹰潭市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (160, 14, '360000', 'area_code', 2, '360700', '赣州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (161, 14, '360000', 'area_code', 2, '360800', '吉安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (162, 14, '360000', 'area_code', 2, '360900', '宜春市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (163, 14, '360000', 'area_code', 2, '361000', '抚州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (164, 14, '360000', 'area_code', 2, '361100', '上饶市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (165, 15, '370000', 'area_code', 2, '370100', '济南市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (166, 15, '370000', 'area_code', 2, '370200', '青岛市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (167, 15, '370000', 'area_code', 2, '370300', '淄博市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (168, 15, '370000', 'area_code', 2, '370400', '枣庄市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (169, 15, '370000', 'area_code', 2, '370500', '东营市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (170, 15, '370000', 'area_code', 2, '370600', '烟台市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (171, 15, '370000', 'area_code', 2, '370700', '潍坊市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (172, 15, '370000', 'area_code', 2, '370800', '济宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (173, 15, '370000', 'area_code', 2, '370900', '泰安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (174, 15, '370000', 'area_code', 2, '371000', '威海市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (175, 15, '370000', 'area_code', 2, '371100', '日照市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (176, 15, '370000', 'area_code', 2, '371300', '临沂市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (177, 15, '370000', 'area_code', 2, '371400', '德州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (178, 15, '370000', 'area_code', 2, '371500', '聊城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (179, 15, '370000', 'area_code', 2, '371600', '滨州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (180, 15, '370000', 'area_code', 2, '371700', '菏泽市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (181, 16, '410000', 'area_code', 2, '410100', '郑州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (182, 16, '410000', 'area_code', 2, '410200', '开封市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (183, 16, '410000', 'area_code', 2, '410300', '洛阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (184, 16, '410000', 'area_code', 2, '410400', '平顶山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (185, 16, '410000', 'area_code', 2, '410500', '安阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (186, 16, '410000', 'area_code', 2, '410600', '鹤壁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (187, 16, '410000', 'area_code', 2, '410700', '新乡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (188, 16, '410000', 'area_code', 2, '410800', '焦作市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (189, 16, '410000', 'area_code', 2, '410900', '濮阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (190, 16, '410000', 'area_code', 2, '411000', '许昌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (191, 16, '410000', 'area_code', 2, '411100', '漯河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (192, 16, '410000', 'area_code', 2, '411200', '三门峡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (193, 16, '410000', 'area_code', 2, '411300', '南阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (194, 16, '410000', 'area_code', 2, '411400', '商丘市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (195, 16, '410000', 'area_code', 2, '411500', '信阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (196, 16, '410000', 'area_code', 2, '411600', '周口市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (197, 16, '410000', 'area_code', 2, '411700', '驻马店市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (198, 16, '410000', 'area_code', 2, '419000', '省直辖县级行政区划', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (199, 17, '420000', 'area_code', 2, '420100', '武汉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (200, 17, '420000', 'area_code', 2, '420200', '黄石市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (201, 17, '420000', 'area_code', 2, '420300', '十堰市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (202, 17, '420000', 'area_code', 2, '420500', '宜昌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (203, 17, '420000', 'area_code', 2, '420600', '襄阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (204, 17, '420000', 'area_code', 2, '420700', '鄂州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (205, 17, '420000', 'area_code', 2, '420800', '荆门市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (206, 17, '420000', 'area_code', 2, '420900', '孝感市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (207, 17, '420000', 'area_code', 2, '421000', '荆州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (208, 17, '420000', 'area_code', 2, '421100', '黄冈市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (209, 17, '420000', 'area_code', 2, '421200', '咸宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (210, 17, '420000', 'area_code', 2, '421300', '随州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (211, 17, '420000', 'area_code', 2, '422800', '恩施土家族苗族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (212, 17, '420000', 'area_code', 2, '429000', '省直辖县级行政区划', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (213, 18, '430000', 'area_code', 2, '430100', '长沙市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (214, 18, '430000', 'area_code', 2, '430200', '株洲市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (215, 18, '430000', 'area_code', 2, '430300', '湘潭市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (216, 18, '430000', 'area_code', 2, '430400', '衡阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (217, 18, '430000', 'area_code', 2, '430500', '邵阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (218, 18, '430000', 'area_code', 2, '430600', '岳阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (219, 18, '430000', 'area_code', 2, '430700', '常德市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (220, 18, '430000', 'area_code', 2, '430800', '张家界市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (221, 18, '430000', 'area_code', 2, '430900', '益阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (222, 18, '430000', 'area_code', 2, '431000', '郴州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (223, 18, '430000', 'area_code', 2, '431100', '永州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (224, 18, '430000', 'area_code', 2, '431200', '怀化市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (225, 18, '430000', 'area_code', 2, '431300', '娄底市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (226, 18, '430000', 'area_code', 2, '433100', '湘西土家族苗族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (227, 19, '440000', 'area_code', 2, '440100', '广州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (228, 19, '440000', 'area_code', 2, '440200', '韶关市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (229, 19, '440000', 'area_code', 2, '440300', '深圳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (230, 19, '440000', 'area_code', 2, '440400', '珠海市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (231, 19, '440000', 'area_code', 2, '440500', '汕头市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (232, 19, '440000', 'area_code', 2, '440600', '佛山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (233, 19, '440000', 'area_code', 2, '440700', '江门市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (234, 19, '440000', 'area_code', 2, '440800', '湛江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (235, 19, '440000', 'area_code', 2, '440900', '茂名市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (236, 19, '440000', 'area_code', 2, '441200', '肇庆市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (237, 19, '440000', 'area_code', 2, '441300', '惠州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (238, 19, '440000', 'area_code', 2, '441400', '梅州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (239, 19, '440000', 'area_code', 2, '441500', '汕尾市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (240, 19, '440000', 'area_code', 2, '441600', '河源市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (241, 19, '440000', 'area_code', 2, '441700', '阳江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (242, 19, '440000', 'area_code', 2, '441800', '清远市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (243, 19, '440000', 'area_code', 2, '441900', '东莞市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (244, 19, '440000', 'area_code', 2, '442000', '中山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (245, 19, '440000', 'area_code', 2, '445100', '潮州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (246, 19, '440000', 'area_code', 2, '445200', '揭阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (247, 19, '440000', 'area_code', 2, '445300', '云浮市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (248, 20, '450000', 'area_code', 2, '450100', '南宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (249, 20, '450000', 'area_code', 2, '450200', '柳州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (250, 20, '450000', 'area_code', 2, '450300', '桂林市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (251, 20, '450000', 'area_code', 2, '450400', '梧州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (252, 20, '450000', 'area_code', 2, '450500', '北海市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (253, 20, '450000', 'area_code', 2, '450600', '防城港市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (254, 20, '450000', 'area_code', 2, '450700', '钦州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (255, 20, '450000', 'area_code', 2, '450800', '贵港市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (256, 20, '450000', 'area_code', 2, '450900', '玉林市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (257, 20, '450000', 'area_code', 2, '451000', '百色市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (258, 20, '450000', 'area_code', 2, '451100', '贺州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (259, 20, '450000', 'area_code', 2, '451200', '河池市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (260, 20, '450000', 'area_code', 2, '451300', '来宾市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (261, 20, '450000', 'area_code', 2, '451400', '崇左市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (262, 21, '460000', 'area_code', 2, '460100', '海口市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (263, 21, '460000', 'area_code', 2, '460200', '三亚市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (264, 21, '460000', 'area_code', 2, '460300', '三沙市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (265, 21, '460000', 'area_code', 2, '460400', '儋州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (266, 21, '460000', 'area_code', 2, '469000', '省直辖县级行政区划', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (267, 22, '500000', 'area_code', 2, '500100', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (268, 22, '500000', 'area_code', 2, '500200', '县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (269, 23, '510000', 'area_code', 2, '510100', '成都市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (270, 23, '510000', 'area_code', 2, '510300', '自贡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (271, 23, '510000', 'area_code', 2, '510400', '攀枝花市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (272, 23, '510000', 'area_code', 2, '510500', '泸州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (273, 23, '510000', 'area_code', 2, '510600', '德阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (274, 23, '510000', 'area_code', 2, '510700', '绵阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (275, 23, '510000', 'area_code', 2, '510800', '广元市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (276, 23, '510000', 'area_code', 2, '510900', '遂宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (277, 23, '510000', 'area_code', 2, '511000', '内江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (278, 23, '510000', 'area_code', 2, '511100', '乐山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (279, 23, '510000', 'area_code', 2, '511300', '南充市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (280, 23, '510000', 'area_code', 2, '511400', '眉山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (281, 23, '510000', 'area_code', 2, '511500', '宜宾市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (282, 23, '510000', 'area_code', 2, '511600', '广安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (283, 23, '510000', 'area_code', 2, '511700', '达州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (284, 23, '510000', 'area_code', 2, '511800', '雅安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (285, 23, '510000', 'area_code', 2, '511900', '巴中市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (286, 23, '510000', 'area_code', 2, '512000', '资阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (287, 23, '510000', 'area_code', 2, '513200', '阿坝藏族羌族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (288, 23, '510000', 'area_code', 2, '513300', '甘孜藏族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (289, 23, '510000', 'area_code', 2, '513400', '凉山彝族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (290, 24, '520000', 'area_code', 2, '520100', '贵阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (291, 24, '520000', 'area_code', 2, '520200', '六盘水市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (292, 24, '520000', 'area_code', 2, '520300', '遵义市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (293, 24, '520000', 'area_code', 2, '520400', '安顺市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (294, 24, '520000', 'area_code', 2, '520500', '毕节市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (295, 24, '520000', 'area_code', 2, '520600', '铜仁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (296, 24, '520000', 'area_code', 2, '522300', '黔西南布依族苗族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (297, 24, '520000', 'area_code', 2, '522600', '黔东南苗族侗族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (298, 24, '520000', 'area_code', 2, '522700', '黔南布依族苗族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (299, 25, '530000', 'area_code', 2, '530100', '昆明市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (300, 25, '530000', 'area_code', 2, '530300', '曲靖市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (301, 25, '530000', 'area_code', 2, '530400', '玉溪市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (302, 25, '530000', 'area_code', 2, '530500', '保山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (303, 25, '530000', 'area_code', 2, '530600', '昭通市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (304, 25, '530000', 'area_code', 2, '530700', '丽江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (305, 25, '530000', 'area_code', 2, '530800', '普洱市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (306, 25, '530000', 'area_code', 2, '530900', '临沧市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (307, 25, '530000', 'area_code', 2, '532300', '楚雄彝族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (308, 25, '530000', 'area_code', 2, '532500', '红河哈尼族彝族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (309, 25, '530000', 'area_code', 2, '532600', '文山壮族苗族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (310, 25, '530000', 'area_code', 2, '532800', '西双版纳傣族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (311, 25, '530000', 'area_code', 2, '532900', '大理白族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (312, 25, '530000', 'area_code', 2, '533100', '德宏傣族景颇族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (313, 25, '530000', 'area_code', 2, '533300', '怒江傈僳族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (314, 25, '530000', 'area_code', 2, '533400', '迪庆藏族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (315, 26, '540000', 'area_code', 2, '540100', '拉萨市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (316, 26, '540000', 'area_code', 2, '540200', '日喀则市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (317, 26, '540000', 'area_code', 2, '540300', '昌都市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (318, 26, '540000', 'area_code', 2, '540400', '林芝市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (319, 26, '540000', 'area_code', 2, '540500', '山南市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (320, 26, '540000', 'area_code', 2, '540600', '那曲市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (321, 26, '540000', 'area_code', 2, '542500', '阿里地区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (322, 27, '610000', 'area_code', 2, '610100', '西安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (323, 27, '610000', 'area_code', 2, '610200', '铜川市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (324, 27, '610000', 'area_code', 2, '610300', '宝鸡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (325, 27, '610000', 'area_code', 2, '610400', '咸阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (326, 27, '610000', 'area_code', 2, '610500', '渭南市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (327, 27, '610000', 'area_code', 2, '610600', '延安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (328, 27, '610000', 'area_code', 2, '610700', '汉中市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (329, 27, '610000', 'area_code', 2, '610800', '榆林市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (330, 27, '610000', 'area_code', 2, '610900', '安康市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (331, 27, '610000', 'area_code', 2, '611000', '商洛市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (332, 28, '620000', 'area_code', 2, '620100', '兰州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (333, 28, '620000', 'area_code', 2, '620200', '嘉峪关市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (334, 28, '620000', 'area_code', 2, '620300', '金昌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (335, 28, '620000', 'area_code', 2, '620400', '白银市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (336, 28, '620000', 'area_code', 2, '620500', '天水市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (337, 28, '620000', 'area_code', 2, '620600', '武威市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (338, 28, '620000', 'area_code', 2, '620700', '张掖市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (339, 28, '620000', 'area_code', 2, '620800', '平凉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (340, 28, '620000', 'area_code', 2, '620900', '酒泉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (341, 28, '620000', 'area_code', 2, '621000', '庆阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (342, 28, '620000', 'area_code', 2, '621100', '定西市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (343, 28, '620000', 'area_code', 2, '621200', '陇南市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (344, 28, '620000', 'area_code', 2, '622900', '临夏回族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (345, 28, '620000', 'area_code', 2, '623000', '甘南藏族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (346, 29, '630000', 'area_code', 2, '630100', '西宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (347, 29, '630000', 'area_code', 2, '630200', '海东市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (348, 29, '630000', 'area_code', 2, '632200', '海北藏族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (349, 29, '630000', 'area_code', 2, '632300', '黄南藏族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (350, 29, '630000', 'area_code', 2, '632500', '海南藏族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (351, 29, '630000', 'area_code', 2, '632600', '果洛藏族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (352, 29, '630000', 'area_code', 2, '632700', '玉树藏族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (353, 29, '630000', 'area_code', 2, '632800', '海西蒙古族藏族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (354, 30, '640000', 'area_code', 2, '640100', '银川市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (355, 30, '640000', 'area_code', 2, '640200', '石嘴山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (356, 30, '640000', 'area_code', 2, '640300', '吴忠市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (357, 30, '640000', 'area_code', 2, '640400', '固原市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (358, 30, '640000', 'area_code', 2, '640500', '中卫市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (359, 31, '650000', 'area_code', 2, '650100', '乌鲁木齐市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (360, 31, '650000', 'area_code', 2, '650200', '克拉玛依市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (361, 31, '650000', 'area_code', 2, '650400', '吐鲁番市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (362, 31, '650000', 'area_code', 2, '650500', '哈密市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (363, 31, '650000', 'area_code', 2, '652300', '昌吉回族自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (364, 31, '650000', 'area_code', 2, '652700', '博尔塔拉蒙古自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (365, 31, '650000', 'area_code', 2, '652800', '巴音郭楞蒙古自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (366, 31, '650000', 'area_code', 2, '652900', '阿克苏地区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (367, 31, '650000', 'area_code', 2, '653000', '克孜勒苏柯尔克孜自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (368, 31, '650000', 'area_code', 2, '653100', '喀什地区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (369, 31, '650000', 'area_code', 2, '653200', '和田地区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (370, 31, '650000', 'area_code', 2, '654000', '伊犁哈萨克自治州', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (371, 31, '650000', 'area_code', 2, '654200', '塔城地区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (372, 31, '650000', 'area_code', 2, '654300', '阿勒泰地区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (373, 31, '650000', 'area_code', 2, '659000', '自治区直辖县级行政区划', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (374, 32, '110100', 'area_code', 3, '110101', '东城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (375, 32, '110100', 'area_code', 3, '110102', '西城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (376, 32, '110100', 'area_code', 3, '110105', '朝阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (377, 32, '110100', 'area_code', 3, '110106', '丰台区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (378, 32, '110100', 'area_code', 3, '110107', '石景山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (379, 32, '110100', 'area_code', 3, '110108', '海淀区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (380, 32, '110100', 'area_code', 3, '110109', '门头沟区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (381, 32, '110100', 'area_code', 3, '110111', '房山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (382, 32, '110100', 'area_code', 3, '110112', '通州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (383, 32, '110100', 'area_code', 3, '110113', '顺义区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (384, 32, '110100', 'area_code', 3, '110114', '昌平区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (385, 32, '110100', 'area_code', 3, '110115', '大兴区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (386, 32, '110100', 'area_code', 3, '110116', '怀柔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (387, 32, '110100', 'area_code', 3, '110117', '平谷区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (388, 32, '110100', 'area_code', 3, '110118', '密云区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (389, 32, '110100', 'area_code', 3, '110119', '延庆区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (390, 33, '120100', 'area_code', 3, '120101', '和平区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (391, 33, '120100', 'area_code', 3, '120102', '河东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (392, 33, '120100', 'area_code', 3, '120103', '河西区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (393, 33, '120100', 'area_code', 3, '120104', '南开区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (394, 33, '120100', 'area_code', 3, '120105', '河北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (395, 33, '120100', 'area_code', 3, '120106', '红桥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (396, 33, '120100', 'area_code', 3, '120110', '东丽区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (397, 33, '120100', 'area_code', 3, '120111', '西青区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (398, 33, '120100', 'area_code', 3, '120112', '津南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (399, 33, '120100', 'area_code', 3, '120113', '北辰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (400, 33, '120100', 'area_code', 3, '120114', '武清区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (401, 33, '120100', 'area_code', 3, '120115', '宝坻区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (402, 33, '120100', 'area_code', 3, '120116', '滨海新区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (403, 33, '120100', 'area_code', 3, '120117', '宁河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (404, 33, '120100', 'area_code', 3, '120118', '静海区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (405, 33, '120100', 'area_code', 3, '120119', '蓟州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (406, 34, '130100', 'area_code', 3, '130101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (407, 34, '130100', 'area_code', 3, '130102', '长安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (408, 34, '130100', 'area_code', 3, '130104', '桥西区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (409, 34, '130100', 'area_code', 3, '130105', '新华区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (410, 34, '130100', 'area_code', 3, '130107', '井陉矿区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (411, 34, '130100', 'area_code', 3, '130108', '裕华区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (412, 34, '130100', 'area_code', 3, '130109', '藁城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (413, 34, '130100', 'area_code', 3, '130110', '鹿泉区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (414, 34, '130100', 'area_code', 3, '130111', '栾城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (415, 34, '130100', 'area_code', 3, '130121', '井陉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (416, 34, '130100', 'area_code', 3, '130123', '正定县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (417, 34, '130100', 'area_code', 3, '130125', '行唐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (418, 34, '130100', 'area_code', 3, '130126', '灵寿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (419, 34, '130100', 'area_code', 3, '130127', '高邑县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (420, 34, '130100', 'area_code', 3, '130128', '深泽县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (421, 34, '130100', 'area_code', 3, '130129', '赞皇县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (422, 34, '130100', 'area_code', 3, '130130', '无极县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (423, 34, '130100', 'area_code', 3, '130131', '平山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (424, 34, '130100', 'area_code', 3, '130132', '元氏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (425, 34, '130100', 'area_code', 3, '130133', '赵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (426, 34, '130100', 'area_code', 3, '130171', '石家庄高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (427, 34, '130100', 'area_code', 3, '130172', '石家庄循环化工园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (428, 34, '130100', 'area_code', 3, '130181', '辛集市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (429, 34, '130100', 'area_code', 3, '130183', '晋州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (430, 34, '130100', 'area_code', 3, '130184', '新乐市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (431, 35, '130200', 'area_code', 3, '130201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (432, 35, '130200', 'area_code', 3, '130202', '路南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (433, 35, '130200', 'area_code', 3, '130203', '路北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (434, 35, '130200', 'area_code', 3, '130204', '古冶区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (435, 35, '130200', 'area_code', 3, '130205', '开平区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (436, 35, '130200', 'area_code', 3, '130207', '丰南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (437, 35, '130200', 'area_code', 3, '130208', '丰润区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (438, 35, '130200', 'area_code', 3, '130209', '曹妃甸区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (439, 35, '130200', 'area_code', 3, '130224', '滦南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (440, 35, '130200', 'area_code', 3, '130225', '乐亭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (441, 35, '130200', 'area_code', 3, '130227', '迁西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (442, 35, '130200', 'area_code', 3, '130229', '玉田县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (443, 35, '130200', 'area_code', 3, '130271', '河北唐山芦台经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (444, 35, '130200', 'area_code', 3, '130272', '唐山市汉沽管理区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (445, 35, '130200', 'area_code', 3, '130273', '唐山高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (446, 35, '130200', 'area_code', 3, '130274', '河北唐山海港经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (447, 35, '130200', 'area_code', 3, '130281', '遵化市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (448, 35, '130200', 'area_code', 3, '130283', '迁安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (449, 35, '130200', 'area_code', 3, '130284', '滦州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (450, 36, '130300', 'area_code', 3, '130301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (451, 36, '130300', 'area_code', 3, '130302', '海港区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (452, 36, '130300', 'area_code', 3, '130303', '山海关区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (453, 36, '130300', 'area_code', 3, '130304', '北戴河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (454, 36, '130300', 'area_code', 3, '130306', '抚宁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (455, 36, '130300', 'area_code', 3, '130321', '青龙满族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (456, 36, '130300', 'area_code', 3, '130322', '昌黎县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (457, 36, '130300', 'area_code', 3, '130324', '卢龙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (458, 36, '130300', 'area_code', 3, '130371', '秦皇岛市经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (459, 36, '130300', 'area_code', 3, '130372', '北戴河新区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (460, 37, '130400', 'area_code', 3, '130401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (461, 37, '130400', 'area_code', 3, '130402', '邯山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (462, 37, '130400', 'area_code', 3, '130403', '丛台区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (463, 37, '130400', 'area_code', 3, '130404', '复兴区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (464, 37, '130400', 'area_code', 3, '130406', '峰峰矿区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (465, 37, '130400', 'area_code', 3, '130407', '肥乡区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (466, 37, '130400', 'area_code', 3, '130408', '永年区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (467, 37, '130400', 'area_code', 3, '130423', '临漳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (468, 37, '130400', 'area_code', 3, '130424', '成安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (469, 37, '130400', 'area_code', 3, '130425', '大名县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (470, 37, '130400', 'area_code', 3, '130426', '涉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (471, 37, '130400', 'area_code', 3, '130427', '磁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (472, 37, '130400', 'area_code', 3, '130430', '邱县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (473, 37, '130400', 'area_code', 3, '130431', '鸡泽县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (474, 37, '130400', 'area_code', 3, '130432', '广平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (475, 37, '130400', 'area_code', 3, '130433', '馆陶县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (476, 37, '130400', 'area_code', 3, '130434', '魏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (477, 37, '130400', 'area_code', 3, '130435', '曲周县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (478, 37, '130400', 'area_code', 3, '130471', '邯郸经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (479, 37, '130400', 'area_code', 3, '130473', '邯郸冀南新区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (480, 37, '130400', 'area_code', 3, '130481', '武安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (481, 38, '130500', 'area_code', 3, '130501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (482, 38, '130500', 'area_code', 3, '130502', '襄都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (483, 38, '130500', 'area_code', 3, '130503', '信都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (484, 38, '130500', 'area_code', 3, '130505', '任泽区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (485, 38, '130500', 'area_code', 3, '130506', '南和区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (486, 38, '130500', 'area_code', 3, '130522', '临城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (487, 38, '130500', 'area_code', 3, '130523', '内丘县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (488, 38, '130500', 'area_code', 3, '130524', '柏乡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (489, 38, '130500', 'area_code', 3, '130525', '隆尧县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (490, 38, '130500', 'area_code', 3, '130528', '宁晋县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (491, 38, '130500', 'area_code', 3, '130529', '巨鹿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (492, 38, '130500', 'area_code', 3, '130530', '新河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (493, 38, '130500', 'area_code', 3, '130531', '广宗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (494, 38, '130500', 'area_code', 3, '130532', '平乡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (495, 38, '130500', 'area_code', 3, '130533', '威县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (496, 38, '130500', 'area_code', 3, '130534', '清河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (497, 38, '130500', 'area_code', 3, '130535', '临西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (498, 38, '130500', 'area_code', 3, '130571', '河北邢台经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (499, 38, '130500', 'area_code', 3, '130581', '南宫市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (500, 38, '130500', 'area_code', 3, '130582', '沙河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (501, 39, '130600', 'area_code', 3, '130601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (502, 39, '130600', 'area_code', 3, '130602', '竞秀区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (503, 39, '130600', 'area_code', 3, '130606', '莲池区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (504, 39, '130600', 'area_code', 3, '130607', '满城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (505, 39, '130600', 'area_code', 3, '130608', '清苑区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (506, 39, '130600', 'area_code', 3, '130609', '徐水区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (507, 39, '130600', 'area_code', 3, '130623', '涞水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (508, 39, '130600', 'area_code', 3, '130624', '阜平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (509, 39, '130600', 'area_code', 3, '130626', '定兴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (510, 39, '130600', 'area_code', 3, '130627', '唐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (511, 39, '130600', 'area_code', 3, '130628', '高阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (512, 39, '130600', 'area_code', 3, '130629', '容城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (513, 39, '130600', 'area_code', 3, '130630', '涞源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (514, 39, '130600', 'area_code', 3, '130631', '望都县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (515, 39, '130600', 'area_code', 3, '130632', '安新县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (516, 39, '130600', 'area_code', 3, '130633', '易县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (517, 39, '130600', 'area_code', 3, '130634', '曲阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (518, 39, '130600', 'area_code', 3, '130635', '蠡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (519, 39, '130600', 'area_code', 3, '130636', '顺平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (520, 39, '130600', 'area_code', 3, '130637', '博野县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (521, 39, '130600', 'area_code', 3, '130638', '雄县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (522, 39, '130600', 'area_code', 3, '130671', '保定高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (523, 39, '130600', 'area_code', 3, '130672', '保定白沟新城', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (524, 39, '130600', 'area_code', 3, '130681', '涿州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (525, 39, '130600', 'area_code', 3, '130682', '定州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (526, 39, '130600', 'area_code', 3, '130683', '安国市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (527, 39, '130600', 'area_code', 3, '130684', '高碑店市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (528, 40, '130700', 'area_code', 3, '130701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (529, 40, '130700', 'area_code', 3, '130702', '桥东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (530, 40, '130700', 'area_code', 3, '130703', '桥西区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (531, 40, '130700', 'area_code', 3, '130705', '宣化区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (532, 40, '130700', 'area_code', 3, '130706', '下花园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (533, 40, '130700', 'area_code', 3, '130708', '万全区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (534, 40, '130700', 'area_code', 3, '130709', '崇礼区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (535, 40, '130700', 'area_code', 3, '130722', '张北县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (536, 40, '130700', 'area_code', 3, '130723', '康保县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (537, 40, '130700', 'area_code', 3, '130724', '沽源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (538, 40, '130700', 'area_code', 3, '130725', '尚义县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (539, 40, '130700', 'area_code', 3, '130726', '蔚县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (540, 40, '130700', 'area_code', 3, '130727', '阳原县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (541, 40, '130700', 'area_code', 3, '130728', '怀安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (542, 40, '130700', 'area_code', 3, '130730', '怀来县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (543, 40, '130700', 'area_code', 3, '130731', '涿鹿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (544, 40, '130700', 'area_code', 3, '130732', '赤城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (545, 40, '130700', 'area_code', 3, '130771', '张家口经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (546, 40, '130700', 'area_code', 3, '130772', '张家口市察北管理区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (547, 40, '130700', 'area_code', 3, '130773', '张家口市塞北管理区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (548, 41, '130800', 'area_code', 3, '130801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (549, 41, '130800', 'area_code', 3, '130802', '双桥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (550, 41, '130800', 'area_code', 3, '130803', '双滦区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (551, 41, '130800', 'area_code', 3, '130804', '鹰手营子矿区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (552, 41, '130800', 'area_code', 3, '130821', '承德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (553, 41, '130800', 'area_code', 3, '130822', '兴隆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (554, 41, '130800', 'area_code', 3, '130824', '滦平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (555, 41, '130800', 'area_code', 3, '130825', '隆化县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (556, 41, '130800', 'area_code', 3, '130826', '丰宁满族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (557, 41, '130800', 'area_code', 3, '130827', '宽城满族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (558, 41, '130800', 'area_code', 3, '130828', '围场满族蒙古族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (559, 41, '130800', 'area_code', 3, '130871', '承德高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (560, 41, '130800', 'area_code', 3, '130881', '平泉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (561, 42, '130900', 'area_code', 3, '130901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (562, 42, '130900', 'area_code', 3, '130902', '新华区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (563, 42, '130900', 'area_code', 3, '130903', '运河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (564, 42, '130900', 'area_code', 3, '130921', '沧县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (565, 42, '130900', 'area_code', 3, '130922', '青县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (566, 42, '130900', 'area_code', 3, '130923', '东光县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (567, 42, '130900', 'area_code', 3, '130924', '海兴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (568, 42, '130900', 'area_code', 3, '130925', '盐山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (569, 42, '130900', 'area_code', 3, '130926', '肃宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (570, 42, '130900', 'area_code', 3, '130927', '南皮县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (571, 42, '130900', 'area_code', 3, '130928', '吴桥县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (572, 42, '130900', 'area_code', 3, '130929', '献县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (573, 42, '130900', 'area_code', 3, '130930', '孟村回族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (574, 42, '130900', 'area_code', 3, '130971', '河北沧州经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (575, 42, '130900', 'area_code', 3, '130972', '沧州高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (576, 42, '130900', 'area_code', 3, '130973', '沧州渤海新区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (577, 42, '130900', 'area_code', 3, '130981', '泊头市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (578, 42, '130900', 'area_code', 3, '130982', '任丘市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (579, 42, '130900', 'area_code', 3, '130983', '黄骅市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (580, 42, '130900', 'area_code', 3, '130984', '河间市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (581, 43, '131000', 'area_code', 3, '131001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (582, 43, '131000', 'area_code', 3, '131002', '安次区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (583, 43, '131000', 'area_code', 3, '131003', '广阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (584, 43, '131000', 'area_code', 3, '131022', '固安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (585, 43, '131000', 'area_code', 3, '131023', '永清县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (586, 43, '131000', 'area_code', 3, '131024', '香河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (587, 43, '131000', 'area_code', 3, '131025', '大城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (588, 43, '131000', 'area_code', 3, '131026', '文安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (589, 43, '131000', 'area_code', 3, '131028', '大厂回族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (590, 43, '131000', 'area_code', 3, '131071', '廊坊经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (591, 43, '131000', 'area_code', 3, '131081', '霸州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (592, 43, '131000', 'area_code', 3, '131082', '三河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (593, 44, '131100', 'area_code', 3, '131101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (594, 44, '131100', 'area_code', 3, '131102', '桃城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (595, 44, '131100', 'area_code', 3, '131103', '冀州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (596, 44, '131100', 'area_code', 3, '131121', '枣强县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (597, 44, '131100', 'area_code', 3, '131122', '武邑县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (598, 44, '131100', 'area_code', 3, '131123', '武强县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (599, 44, '131100', 'area_code', 3, '131124', '饶阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (600, 44, '131100', 'area_code', 3, '131125', '安平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (601, 44, '131100', 'area_code', 3, '131126', '故城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (602, 44, '131100', 'area_code', 3, '131127', '景县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (603, 44, '131100', 'area_code', 3, '131128', '阜城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (604, 44, '131100', 'area_code', 3, '131171', '河北衡水高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (605, 44, '131100', 'area_code', 3, '131172', '衡水滨湖新区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (606, 44, '131100', 'area_code', 3, '131182', '深州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (607, 45, '140100', 'area_code', 3, '140101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (608, 45, '140100', 'area_code', 3, '140105', '小店区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (609, 45, '140100', 'area_code', 3, '140106', '迎泽区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (610, 45, '140100', 'area_code', 3, '140107', '杏花岭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (611, 45, '140100', 'area_code', 3, '140108', '尖草坪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (612, 45, '140100', 'area_code', 3, '140109', '万柏林区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (613, 45, '140100', 'area_code', 3, '140110', '晋源区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (614, 45, '140100', 'area_code', 3, '140121', '清徐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (615, 45, '140100', 'area_code', 3, '140122', '阳曲县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (616, 45, '140100', 'area_code', 3, '140123', '娄烦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (617, 45, '140100', 'area_code', 3, '140171', '山西转型综合改革示范区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (618, 45, '140100', 'area_code', 3, '140181', '古交市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (619, 46, '140200', 'area_code', 3, '140201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (620, 46, '140200', 'area_code', 3, '140212', '新荣区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (621, 46, '140200', 'area_code', 3, '140213', '平城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (622, 46, '140200', 'area_code', 3, '140214', '云冈区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (623, 46, '140200', 'area_code', 3, '140215', '云州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (624, 46, '140200', 'area_code', 3, '140221', '阳高县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (625, 46, '140200', 'area_code', 3, '140222', '天镇县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (626, 46, '140200', 'area_code', 3, '140223', '广灵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (627, 46, '140200', 'area_code', 3, '140224', '灵丘县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (628, 46, '140200', 'area_code', 3, '140225', '浑源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (629, 46, '140200', 'area_code', 3, '140226', '左云县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (630, 46, '140200', 'area_code', 3, '140271', '山西大同经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (631, 47, '140300', 'area_code', 3, '140301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (632, 47, '140300', 'area_code', 3, '140302', '城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (633, 47, '140300', 'area_code', 3, '140303', '矿区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (634, 47, '140300', 'area_code', 3, '140311', '郊区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (635, 47, '140300', 'area_code', 3, '140321', '平定县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (636, 47, '140300', 'area_code', 3, '140322', '盂县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (637, 48, '140400', 'area_code', 3, '140401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (638, 48, '140400', 'area_code', 3, '140403', '潞州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (639, 48, '140400', 'area_code', 3, '140404', '上党区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (640, 48, '140400', 'area_code', 3, '140405', '屯留区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (641, 48, '140400', 'area_code', 3, '140406', '潞城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (642, 48, '140400', 'area_code', 3, '140423', '襄垣县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (643, 48, '140400', 'area_code', 3, '140425', '平顺县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (644, 48, '140400', 'area_code', 3, '140426', '黎城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (645, 48, '140400', 'area_code', 3, '140427', '壶关县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (646, 48, '140400', 'area_code', 3, '140428', '长子县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (647, 48, '140400', 'area_code', 3, '140429', '武乡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (648, 48, '140400', 'area_code', 3, '140430', '沁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (649, 48, '140400', 'area_code', 3, '140431', '沁源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (650, 48, '140400', 'area_code', 3, '140471', '山西长治高新技术产业园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (651, 49, '140500', 'area_code', 3, '140501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (652, 49, '140500', 'area_code', 3, '140502', '城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (653, 49, '140500', 'area_code', 3, '140521', '沁水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (654, 49, '140500', 'area_code', 3, '140522', '阳城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (655, 49, '140500', 'area_code', 3, '140524', '陵川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (656, 49, '140500', 'area_code', 3, '140525', '泽州县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (657, 49, '140500', 'area_code', 3, '140581', '高平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (658, 50, '140600', 'area_code', 3, '140601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (659, 50, '140600', 'area_code', 3, '140602', '朔城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (660, 50, '140600', 'area_code', 3, '140603', '平鲁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (661, 50, '140600', 'area_code', 3, '140621', '山阴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (662, 50, '140600', 'area_code', 3, '140622', '应县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (663, 50, '140600', 'area_code', 3, '140623', '右玉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (664, 50, '140600', 'area_code', 3, '140671', '山西朔州经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (665, 50, '140600', 'area_code', 3, '140681', '怀仁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (666, 51, '140700', 'area_code', 3, '140701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (667, 51, '140700', 'area_code', 3, '140702', '榆次区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (668, 51, '140700', 'area_code', 3, '140703', '太谷区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (669, 51, '140700', 'area_code', 3, '140721', '榆社县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (670, 51, '140700', 'area_code', 3, '140722', '左权县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (671, 51, '140700', 'area_code', 3, '140723', '和顺县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (672, 51, '140700', 'area_code', 3, '140724', '昔阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (673, 51, '140700', 'area_code', 3, '140725', '寿阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (674, 51, '140700', 'area_code', 3, '140727', '祁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (675, 51, '140700', 'area_code', 3, '140728', '平遥县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (676, 51, '140700', 'area_code', 3, '140729', '灵石县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (677, 51, '140700', 'area_code', 3, '140781', '介休市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (678, 52, '140800', 'area_code', 3, '140801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (679, 52, '140800', 'area_code', 3, '140802', '盐湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (680, 52, '140800', 'area_code', 3, '140821', '临猗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (681, 52, '140800', 'area_code', 3, '140822', '万荣县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (682, 52, '140800', 'area_code', 3, '140823', '闻喜县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (683, 52, '140800', 'area_code', 3, '140824', '稷山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (684, 52, '140800', 'area_code', 3, '140825', '新绛县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (685, 52, '140800', 'area_code', 3, '140826', '绛县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (686, 52, '140800', 'area_code', 3, '140827', '垣曲县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (687, 52, '140800', 'area_code', 3, '140828', '夏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (688, 52, '140800', 'area_code', 3, '140829', '平陆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (689, 52, '140800', 'area_code', 3, '140830', '芮城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (690, 52, '140800', 'area_code', 3, '140881', '永济市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (691, 52, '140800', 'area_code', 3, '140882', '河津市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (692, 53, '140900', 'area_code', 3, '140901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (693, 53, '140900', 'area_code', 3, '140902', '忻府区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (694, 53, '140900', 'area_code', 3, '140921', '定襄县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (695, 53, '140900', 'area_code', 3, '140922', '五台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (696, 53, '140900', 'area_code', 3, '140923', '代县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (697, 53, '140900', 'area_code', 3, '140924', '繁峙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (698, 53, '140900', 'area_code', 3, '140925', '宁武县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (699, 53, '140900', 'area_code', 3, '140926', '静乐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (700, 53, '140900', 'area_code', 3, '140927', '神池县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (701, 53, '140900', 'area_code', 3, '140928', '五寨县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (702, 53, '140900', 'area_code', 3, '140929', '岢岚县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (703, 53, '140900', 'area_code', 3, '140930', '河曲县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (704, 53, '140900', 'area_code', 3, '140931', '保德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (705, 53, '140900', 'area_code', 3, '140932', '偏关县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (706, 53, '140900', 'area_code', 3, '140971', '五台山风景名胜区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (707, 53, '140900', 'area_code', 3, '140981', '原平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (708, 54, '141000', 'area_code', 3, '141001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (709, 54, '141000', 'area_code', 3, '141002', '尧都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (710, 54, '141000', 'area_code', 3, '141021', '曲沃县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (711, 54, '141000', 'area_code', 3, '141022', '翼城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (712, 54, '141000', 'area_code', 3, '141023', '襄汾县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (713, 54, '141000', 'area_code', 3, '141024', '洪洞县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (714, 54, '141000', 'area_code', 3, '141025', '古县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (715, 54, '141000', 'area_code', 3, '141026', '安泽县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (716, 54, '141000', 'area_code', 3, '141027', '浮山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (717, 54, '141000', 'area_code', 3, '141028', '吉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (718, 54, '141000', 'area_code', 3, '141029', '乡宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (719, 54, '141000', 'area_code', 3, '141030', '大宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (720, 54, '141000', 'area_code', 3, '141031', '隰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (721, 54, '141000', 'area_code', 3, '141032', '永和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (722, 54, '141000', 'area_code', 3, '141033', '蒲县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (723, 54, '141000', 'area_code', 3, '141034', '汾西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (724, 54, '141000', 'area_code', 3, '141081', '侯马市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (725, 54, '141000', 'area_code', 3, '141082', '霍州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (726, 55, '141100', 'area_code', 3, '141101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (727, 55, '141100', 'area_code', 3, '141102', '离石区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (728, 55, '141100', 'area_code', 3, '141121', '文水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (729, 55, '141100', 'area_code', 3, '141122', '交城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (730, 55, '141100', 'area_code', 3, '141123', '兴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (731, 55, '141100', 'area_code', 3, '141124', '临县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (732, 55, '141100', 'area_code', 3, '141125', '柳林县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (733, 55, '141100', 'area_code', 3, '141126', '石楼县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (734, 55, '141100', 'area_code', 3, '141127', '岚县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (735, 55, '141100', 'area_code', 3, '141128', '方山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (736, 55, '141100', 'area_code', 3, '141129', '中阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (737, 55, '141100', 'area_code', 3, '141130', '交口县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (738, 55, '141100', 'area_code', 3, '141181', '孝义市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (739, 55, '141100', 'area_code', 3, '141182', '汾阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (740, 56, '150100', 'area_code', 3, '150101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (741, 56, '150100', 'area_code', 3, '150102', '新城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (742, 56, '150100', 'area_code', 3, '150103', '回民区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (743, 56, '150100', 'area_code', 3, '150104', '玉泉区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (744, 56, '150100', 'area_code', 3, '150105', '赛罕区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (745, 56, '150100', 'area_code', 3, '150121', '土默特左旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (746, 56, '150100', 'area_code', 3, '150122', '托克托县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (747, 56, '150100', 'area_code', 3, '150123', '和林格尔县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (748, 56, '150100', 'area_code', 3, '150124', '清水河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (749, 56, '150100', 'area_code', 3, '150125', '武川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (750, 56, '150100', 'area_code', 3, '150172', '呼和浩特经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (751, 57, '150200', 'area_code', 3, '150201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (752, 57, '150200', 'area_code', 3, '150202', '东河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (753, 57, '150200', 'area_code', 3, '150203', '昆都仑区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (754, 57, '150200', 'area_code', 3, '150204', '青山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (755, 57, '150200', 'area_code', 3, '150205', '石拐区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (756, 57, '150200', 'area_code', 3, '150206', '白云鄂博矿区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (757, 57, '150200', 'area_code', 3, '150207', '九原区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (758, 57, '150200', 'area_code', 3, '150221', '土默特右旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (759, 57, '150200', 'area_code', 3, '150222', '固阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (760, 57, '150200', 'area_code', 3, '150223', '达尔罕茂明安联合旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (761, 57, '150200', 'area_code', 3, '150271', '包头稀土高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (762, 58, '150300', 'area_code', 3, '150301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (763, 58, '150300', 'area_code', 3, '150302', '海勃湾区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (764, 58, '150300', 'area_code', 3, '150303', '海南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (765, 58, '150300', 'area_code', 3, '150304', '乌达区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (766, 59, '150400', 'area_code', 3, '150401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (767, 59, '150400', 'area_code', 3, '150402', '红山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (768, 59, '150400', 'area_code', 3, '150403', '元宝山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (769, 59, '150400', 'area_code', 3, '150404', '松山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (770, 59, '150400', 'area_code', 3, '150421', '阿鲁科尔沁旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (771, 59, '150400', 'area_code', 3, '150422', '巴林左旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (772, 59, '150400', 'area_code', 3, '150423', '巴林右旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (773, 59, '150400', 'area_code', 3, '150424', '林西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (774, 59, '150400', 'area_code', 3, '150425', '克什克腾旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (775, 59, '150400', 'area_code', 3, '150426', '翁牛特旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (776, 59, '150400', 'area_code', 3, '150428', '喀喇沁旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (777, 59, '150400', 'area_code', 3, '150429', '宁城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (778, 59, '150400', 'area_code', 3, '150430', '敖汉旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (779, 60, '150500', 'area_code', 3, '150501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (780, 60, '150500', 'area_code', 3, '150502', '科尔沁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (781, 60, '150500', 'area_code', 3, '150521', '科尔沁左翼中旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (782, 60, '150500', 'area_code', 3, '150522', '科尔沁左翼后旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (783, 60, '150500', 'area_code', 3, '150523', '开鲁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (784, 60, '150500', 'area_code', 3, '150524', '库伦旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (785, 60, '150500', 'area_code', 3, '150525', '奈曼旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (786, 60, '150500', 'area_code', 3, '150526', '扎鲁特旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (787, 60, '150500', 'area_code', 3, '150571', '通辽经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (788, 60, '150500', 'area_code', 3, '150581', '霍林郭勒市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (789, 61, '150600', 'area_code', 3, '150601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (790, 61, '150600', 'area_code', 3, '150602', '东胜区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (791, 61, '150600', 'area_code', 3, '150603', '康巴什区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (792, 61, '150600', 'area_code', 3, '150621', '达拉特旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (793, 61, '150600', 'area_code', 3, '150622', '准格尔旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (794, 61, '150600', 'area_code', 3, '150623', '鄂托克前旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (795, 61, '150600', 'area_code', 3, '150624', '鄂托克旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (796, 61, '150600', 'area_code', 3, '150625', '杭锦旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (797, 61, '150600', 'area_code', 3, '150626', '乌审旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (798, 61, '150600', 'area_code', 3, '150627', '伊金霍洛旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (799, 62, '150700', 'area_code', 3, '150701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (800, 62, '150700', 'area_code', 3, '150702', '海拉尔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (801, 62, '150700', 'area_code', 3, '150703', '扎赉诺尔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (802, 62, '150700', 'area_code', 3, '150721', '阿荣旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (803, 62, '150700', 'area_code', 3, '150722', '莫力达瓦达斡尔族自治旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (804, 62, '150700', 'area_code', 3, '150723', '鄂伦春自治旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (805, 62, '150700', 'area_code', 3, '150724', '鄂温克族自治旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (806, 62, '150700', 'area_code', 3, '150725', '陈巴尔虎旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (807, 62, '150700', 'area_code', 3, '150726', '新巴尔虎左旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (808, 62, '150700', 'area_code', 3, '150727', '新巴尔虎右旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (809, 62, '150700', 'area_code', 3, '150781', '满洲里市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (810, 62, '150700', 'area_code', 3, '150782', '牙克石市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (811, 62, '150700', 'area_code', 3, '150783', '扎兰屯市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (812, 62, '150700', 'area_code', 3, '150784', '额尔古纳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (813, 62, '150700', 'area_code', 3, '150785', '根河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (814, 63, '150800', 'area_code', 3, '150801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (815, 63, '150800', 'area_code', 3, '150802', '临河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (816, 63, '150800', 'area_code', 3, '150821', '五原县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (817, 63, '150800', 'area_code', 3, '150822', '磴口县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (818, 63, '150800', 'area_code', 3, '150823', '乌拉特前旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (819, 63, '150800', 'area_code', 3, '150824', '乌拉特中旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (820, 63, '150800', 'area_code', 3, '150825', '乌拉特后旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (821, 63, '150800', 'area_code', 3, '150826', '杭锦后旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (822, 64, '150900', 'area_code', 3, '150901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (823, 64, '150900', 'area_code', 3, '150902', '集宁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (824, 64, '150900', 'area_code', 3, '150921', '卓资县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (825, 64, '150900', 'area_code', 3, '150922', '化德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (826, 64, '150900', 'area_code', 3, '150923', '商都县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (827, 64, '150900', 'area_code', 3, '150924', '兴和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (828, 64, '150900', 'area_code', 3, '150925', '凉城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (829, 64, '150900', 'area_code', 3, '150926', '察哈尔右翼前旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (830, 64, '150900', 'area_code', 3, '150927', '察哈尔右翼中旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (831, 64, '150900', 'area_code', 3, '150928', '察哈尔右翼后旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (832, 64, '150900', 'area_code', 3, '150929', '四子王旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (833, 64, '150900', 'area_code', 3, '150981', '丰镇市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (834, 65, '152200', 'area_code', 3, '152201', '乌兰浩特市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (835, 65, '152200', 'area_code', 3, '152202', '阿尔山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (836, 65, '152200', 'area_code', 3, '152221', '科尔沁右翼前旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (837, 65, '152200', 'area_code', 3, '152222', '科尔沁右翼中旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (838, 65, '152200', 'area_code', 3, '152223', '扎赉特旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (839, 65, '152200', 'area_code', 3, '152224', '突泉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (840, 66, '152500', 'area_code', 3, '152501', '二连浩特市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (841, 66, '152500', 'area_code', 3, '152502', '锡林浩特市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (842, 66, '152500', 'area_code', 3, '152522', '阿巴嘎旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (843, 66, '152500', 'area_code', 3, '152523', '苏尼特左旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (844, 66, '152500', 'area_code', 3, '152524', '苏尼特右旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (845, 66, '152500', 'area_code', 3, '152525', '东乌珠穆沁旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (846, 66, '152500', 'area_code', 3, '152526', '西乌珠穆沁旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (847, 66, '152500', 'area_code', 3, '152527', '太仆寺旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (848, 66, '152500', 'area_code', 3, '152528', '镶黄旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (849, 66, '152500', 'area_code', 3, '152529', '正镶白旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (850, 66, '152500', 'area_code', 3, '152530', '正蓝旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (851, 66, '152500', 'area_code', 3, '152531', '多伦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (852, 66, '152500', 'area_code', 3, '152571', '乌拉盖管委会', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (853, 67, '152900', 'area_code', 3, '152921', '阿拉善左旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (854, 67, '152900', 'area_code', 3, '152922', '阿拉善右旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (855, 67, '152900', 'area_code', 3, '152923', '额济纳旗', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (856, 67, '152900', 'area_code', 3, '152971', '内蒙古阿拉善经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (857, 68, '210100', 'area_code', 3, '210101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (858, 68, '210100', 'area_code', 3, '210102', '和平区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (859, 68, '210100', 'area_code', 3, '210103', '沈河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (860, 68, '210100', 'area_code', 3, '210104', '大东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (861, 68, '210100', 'area_code', 3, '210105', '皇姑区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (862, 68, '210100', 'area_code', 3, '210106', '铁西区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (863, 68, '210100', 'area_code', 3, '210111', '苏家屯区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (864, 68, '210100', 'area_code', 3, '210112', '浑南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (865, 68, '210100', 'area_code', 3, '210113', '沈北新区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (866, 68, '210100', 'area_code', 3, '210114', '于洪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (867, 68, '210100', 'area_code', 3, '210115', '辽中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (868, 68, '210100', 'area_code', 3, '210123', '康平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (869, 68, '210100', 'area_code', 3, '210124', '法库县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (870, 68, '210100', 'area_code', 3, '210181', '新民市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (871, 69, '210200', 'area_code', 3, '210201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (872, 69, '210200', 'area_code', 3, '210202', '中山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (873, 69, '210200', 'area_code', 3, '210203', '西岗区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (874, 69, '210200', 'area_code', 3, '210204', '沙河口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (875, 69, '210200', 'area_code', 3, '210211', '甘井子区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (876, 69, '210200', 'area_code', 3, '210212', '旅顺口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (877, 69, '210200', 'area_code', 3, '210213', '金州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (878, 69, '210200', 'area_code', 3, '210214', '普兰店区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (879, 69, '210200', 'area_code', 3, '210224', '长海县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (880, 69, '210200', 'area_code', 3, '210281', '瓦房店市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (881, 69, '210200', 'area_code', 3, '210283', '庄河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (882, 70, '210300', 'area_code', 3, '210301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (883, 70, '210300', 'area_code', 3, '210302', '铁东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (884, 70, '210300', 'area_code', 3, '210303', '铁西区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (885, 70, '210300', 'area_code', 3, '210304', '立山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (886, 70, '210300', 'area_code', 3, '210311', '千山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (887, 70, '210300', 'area_code', 3, '210321', '台安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (888, 70, '210300', 'area_code', 3, '210323', '岫岩满族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (889, 70, '210300', 'area_code', 3, '210381', '海城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (890, 71, '210400', 'area_code', 3, '210401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (891, 71, '210400', 'area_code', 3, '210402', '新抚区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (892, 71, '210400', 'area_code', 3, '210403', '东洲区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (893, 71, '210400', 'area_code', 3, '210404', '望花区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (894, 71, '210400', 'area_code', 3, '210411', '顺城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (895, 71, '210400', 'area_code', 3, '210421', '抚顺县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (896, 71, '210400', 'area_code', 3, '210422', '新宾满族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (897, 71, '210400', 'area_code', 3, '210423', '清原满族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (898, 72, '210500', 'area_code', 3, '210501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (899, 72, '210500', 'area_code', 3, '210502', '平山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (900, 72, '210500', 'area_code', 3, '210503', '溪湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (901, 72, '210500', 'area_code', 3, '210504', '明山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (902, 72, '210500', 'area_code', 3, '210505', '南芬区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (903, 72, '210500', 'area_code', 3, '210521', '本溪满族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (904, 72, '210500', 'area_code', 3, '210522', '桓仁满族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (905, 73, '210600', 'area_code', 3, '210601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (906, 73, '210600', 'area_code', 3, '210602', '元宝区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (907, 73, '210600', 'area_code', 3, '210603', '振兴区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (908, 73, '210600', 'area_code', 3, '210604', '振安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (909, 73, '210600', 'area_code', 3, '210624', '宽甸满族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (910, 73, '210600', 'area_code', 3, '210681', '东港市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (911, 73, '210600', 'area_code', 3, '210682', '凤城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (912, 74, '210700', 'area_code', 3, '210701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (913, 74, '210700', 'area_code', 3, '210702', '古塔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (914, 74, '210700', 'area_code', 3, '210703', '凌河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (915, 74, '210700', 'area_code', 3, '210711', '太和区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (916, 74, '210700', 'area_code', 3, '210726', '黑山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (917, 74, '210700', 'area_code', 3, '210727', '义县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (918, 74, '210700', 'area_code', 3, '210781', '凌海市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (919, 74, '210700', 'area_code', 3, '210782', '北镇市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (920, 75, '210800', 'area_code', 3, '210801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (921, 75, '210800', 'area_code', 3, '210802', '站前区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (922, 75, '210800', 'area_code', 3, '210803', '西市区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (923, 75, '210800', 'area_code', 3, '210804', '鲅鱼圈区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (924, 75, '210800', 'area_code', 3, '210811', '老边区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (925, 75, '210800', 'area_code', 3, '210881', '盖州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (926, 75, '210800', 'area_code', 3, '210882', '大石桥市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (927, 76, '210900', 'area_code', 3, '210901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (928, 76, '210900', 'area_code', 3, '210902', '海州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (929, 76, '210900', 'area_code', 3, '210903', '新邱区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (930, 76, '210900', 'area_code', 3, '210904', '太平区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (931, 76, '210900', 'area_code', 3, '210905', '清河门区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (932, 76, '210900', 'area_code', 3, '210911', '细河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (933, 76, '210900', 'area_code', 3, '210921', '阜新蒙古族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (934, 76, '210900', 'area_code', 3, '210922', '彰武县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (935, 77, '211000', 'area_code', 3, '211001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (936, 77, '211000', 'area_code', 3, '211002', '白塔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (937, 77, '211000', 'area_code', 3, '211003', '文圣区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (938, 77, '211000', 'area_code', 3, '211004', '宏伟区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (939, 77, '211000', 'area_code', 3, '211005', '弓长岭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (940, 77, '211000', 'area_code', 3, '211011', '太子河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (941, 77, '211000', 'area_code', 3, '211021', '辽阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (942, 77, '211000', 'area_code', 3, '211081', '灯塔市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (943, 78, '211100', 'area_code', 3, '211101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (944, 78, '211100', 'area_code', 3, '211102', '双台子区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (945, 78, '211100', 'area_code', 3, '211103', '兴隆台区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (946, 78, '211100', 'area_code', 3, '211104', '大洼区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (947, 78, '211100', 'area_code', 3, '211122', '盘山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (948, 79, '211200', 'area_code', 3, '211201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (949, 79, '211200', 'area_code', 3, '211202', '银州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (950, 79, '211200', 'area_code', 3, '211204', '清河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (951, 79, '211200', 'area_code', 3, '211221', '铁岭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (952, 79, '211200', 'area_code', 3, '211223', '西丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (953, 79, '211200', 'area_code', 3, '211224', '昌图县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (954, 79, '211200', 'area_code', 3, '211281', '调兵山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (955, 79, '211200', 'area_code', 3, '211282', '开原市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (956, 80, '211300', 'area_code', 3, '211301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (957, 80, '211300', 'area_code', 3, '211302', '双塔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (958, 80, '211300', 'area_code', 3, '211303', '龙城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (959, 80, '211300', 'area_code', 3, '211321', '朝阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (960, 80, '211300', 'area_code', 3, '211322', '建平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (961, 80, '211300', 'area_code', 3, '211324', '喀喇沁左翼蒙古族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (962, 80, '211300', 'area_code', 3, '211381', '北票市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (963, 80, '211300', 'area_code', 3, '211382', '凌源市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (964, 81, '211400', 'area_code', 3, '211401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (965, 81, '211400', 'area_code', 3, '211402', '连山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (966, 81, '211400', 'area_code', 3, '211403', '龙港区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (967, 81, '211400', 'area_code', 3, '211404', '南票区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (968, 81, '211400', 'area_code', 3, '211421', '绥中县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (969, 81, '211400', 'area_code', 3, '211422', '建昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (970, 81, '211400', 'area_code', 3, '211481', '兴城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (971, 82, '220100', 'area_code', 3, '220101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (972, 82, '220100', 'area_code', 3, '220102', '南关区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (973, 82, '220100', 'area_code', 3, '220103', '宽城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (974, 82, '220100', 'area_code', 3, '220104', '朝阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (975, 82, '220100', 'area_code', 3, '220105', '二道区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (976, 82, '220100', 'area_code', 3, '220106', '绿园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (977, 82, '220100', 'area_code', 3, '220112', '双阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (978, 82, '220100', 'area_code', 3, '220113', '九台区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (979, 82, '220100', 'area_code', 3, '220122', '农安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (980, 82, '220100', 'area_code', 3, '220171', '长春经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (981, 82, '220100', 'area_code', 3, '220172', '长春净月高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (982, 82, '220100', 'area_code', 3, '220173', '长春高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (983, 82, '220100', 'area_code', 3, '220174', '长春汽车经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (984, 82, '220100', 'area_code', 3, '220182', '榆树市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (985, 82, '220100', 'area_code', 3, '220183', '德惠市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (986, 82, '220100', 'area_code', 3, '220184', '公主岭市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (987, 83, '220200', 'area_code', 3, '220201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (988, 83, '220200', 'area_code', 3, '220202', '昌邑区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (989, 83, '220200', 'area_code', 3, '220203', '龙潭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (990, 83, '220200', 'area_code', 3, '220204', '船营区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (991, 83, '220200', 'area_code', 3, '220211', '丰满区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (992, 83, '220200', 'area_code', 3, '220221', '永吉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (993, 83, '220200', 'area_code', 3, '220271', '吉林经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (994, 83, '220200', 'area_code', 3, '220272', '吉林高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (995, 83, '220200', 'area_code', 3, '220273', '吉林中国新加坡食品区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (996, 83, '220200', 'area_code', 3, '220281', '蛟河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (997, 83, '220200', 'area_code', 3, '220282', '桦甸市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (998, 83, '220200', 'area_code', 3, '220283', '舒兰市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (999, 83, '220200', 'area_code', 3, '220284', '磐石市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1000, 84, '220300', 'area_code', 3, '220301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1001, 84, '220300', 'area_code', 3, '220302', '铁西区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1002, 84, '220300', 'area_code', 3, '220303', '铁东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1003, 84, '220300', 'area_code', 3, '220322', '梨树县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1004, 84, '220300', 'area_code', 3, '220323', '伊通满族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1005, 84, '220300', 'area_code', 3, '220382', '双辽市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1006, 85, '220400', 'area_code', 3, '220401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1007, 85, '220400', 'area_code', 3, '220402', '龙山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1008, 85, '220400', 'area_code', 3, '220403', '西安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1009, 85, '220400', 'area_code', 3, '220421', '东丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1010, 85, '220400', 'area_code', 3, '220422', '东辽县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1011, 86, '220500', 'area_code', 3, '220501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1012, 86, '220500', 'area_code', 3, '220502', '东昌区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1013, 86, '220500', 'area_code', 3, '220503', '二道江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1014, 86, '220500', 'area_code', 3, '220521', '通化县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1015, 86, '220500', 'area_code', 3, '220523', '辉南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1016, 86, '220500', 'area_code', 3, '220524', '柳河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1017, 86, '220500', 'area_code', 3, '220581', '梅河口市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1018, 86, '220500', 'area_code', 3, '220582', '集安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1019, 87, '220600', 'area_code', 3, '220601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1020, 87, '220600', 'area_code', 3, '220602', '浑江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1021, 87, '220600', 'area_code', 3, '220605', '江源区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1022, 87, '220600', 'area_code', 3, '220621', '抚松县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1023, 87, '220600', 'area_code', 3, '220622', '靖宇县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1024, 87, '220600', 'area_code', 3, '220623', '长白朝鲜族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1025, 87, '220600', 'area_code', 3, '220681', '临江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1026, 88, '220700', 'area_code', 3, '220701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1027, 88, '220700', 'area_code', 3, '220702', '宁江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1028, 88, '220700', 'area_code', 3, '220721', '前郭尔罗斯蒙古族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1029, 88, '220700', 'area_code', 3, '220722', '长岭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1030, 88, '220700', 'area_code', 3, '220723', '乾安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1031, 88, '220700', 'area_code', 3, '220771', '吉林松原经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1032, 88, '220700', 'area_code', 3, '220781', '扶余市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1033, 89, '220800', 'area_code', 3, '220801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1034, 89, '220800', 'area_code', 3, '220802', '洮北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1035, 89, '220800', 'area_code', 3, '220821', '镇赉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1036, 89, '220800', 'area_code', 3, '220822', '通榆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1037, 89, '220800', 'area_code', 3, '220871', '吉林白城经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1038, 89, '220800', 'area_code', 3, '220881', '洮南市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1039, 89, '220800', 'area_code', 3, '220882', '大安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1040, 90, '222400', 'area_code', 3, '222401', '延吉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1041, 90, '222400', 'area_code', 3, '222402', '图们市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1042, 90, '222400', 'area_code', 3, '222403', '敦化市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1043, 90, '222400', 'area_code', 3, '222404', '珲春市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1044, 90, '222400', 'area_code', 3, '222405', '龙井市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1045, 90, '222400', 'area_code', 3, '222406', '和龙市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1046, 90, '222400', 'area_code', 3, '222424', '汪清县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1047, 90, '222400', 'area_code', 3, '222426', '安图县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1048, 91, '230100', 'area_code', 3, '230101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1049, 91, '230100', 'area_code', 3, '230102', '道里区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1050, 91, '230100', 'area_code', 3, '230103', '南岗区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1051, 91, '230100', 'area_code', 3, '230104', '道外区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1052, 91, '230100', 'area_code', 3, '230108', '平房区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1053, 91, '230100', 'area_code', 3, '230109', '松北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1054, 91, '230100', 'area_code', 3, '230110', '香坊区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1055, 91, '230100', 'area_code', 3, '230111', '呼兰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1056, 91, '230100', 'area_code', 3, '230112', '阿城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1057, 91, '230100', 'area_code', 3, '230113', '双城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1058, 91, '230100', 'area_code', 3, '230123', '依兰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1059, 91, '230100', 'area_code', 3, '230124', '方正县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1060, 91, '230100', 'area_code', 3, '230125', '宾县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1061, 91, '230100', 'area_code', 3, '230126', '巴彦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1062, 91, '230100', 'area_code', 3, '230127', '木兰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1063, 91, '230100', 'area_code', 3, '230128', '通河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1064, 91, '230100', 'area_code', 3, '230129', '延寿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1065, 91, '230100', 'area_code', 3, '230183', '尚志市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1066, 91, '230100', 'area_code', 3, '230184', '五常市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1067, 92, '230200', 'area_code', 3, '230201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1068, 92, '230200', 'area_code', 3, '230202', '龙沙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1069, 92, '230200', 'area_code', 3, '230203', '建华区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1070, 92, '230200', 'area_code', 3, '230204', '铁锋区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1071, 92, '230200', 'area_code', 3, '230205', '昂昂溪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1072, 92, '230200', 'area_code', 3, '230206', '富拉尔基区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1073, 92, '230200', 'area_code', 3, '230207', '碾子山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1074, 92, '230200', 'area_code', 3, '230208', '梅里斯达斡尔族区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1075, 92, '230200', 'area_code', 3, '230221', '龙江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1076, 92, '230200', 'area_code', 3, '230223', '依安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1077, 92, '230200', 'area_code', 3, '230224', '泰来县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1078, 92, '230200', 'area_code', 3, '230225', '甘南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1079, 92, '230200', 'area_code', 3, '230227', '富裕县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1080, 92, '230200', 'area_code', 3, '230229', '克山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1081, 92, '230200', 'area_code', 3, '230230', '克东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1082, 92, '230200', 'area_code', 3, '230231', '拜泉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1083, 92, '230200', 'area_code', 3, '230281', '讷河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1084, 93, '230300', 'area_code', 3, '230301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1085, 93, '230300', 'area_code', 3, '230302', '鸡冠区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1086, 93, '230300', 'area_code', 3, '230303', '恒山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1087, 93, '230300', 'area_code', 3, '230304', '滴道区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1088, 93, '230300', 'area_code', 3, '230305', '梨树区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1089, 93, '230300', 'area_code', 3, '230306', '城子河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1090, 93, '230300', 'area_code', 3, '230307', '麻山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1091, 93, '230300', 'area_code', 3, '230321', '鸡东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1092, 93, '230300', 'area_code', 3, '230381', '虎林市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1093, 93, '230300', 'area_code', 3, '230382', '密山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1094, 94, '230400', 'area_code', 3, '230401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1095, 94, '230400', 'area_code', 3, '230402', '向阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1096, 94, '230400', 'area_code', 3, '230403', '工农区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1097, 94, '230400', 'area_code', 3, '230404', '南山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1098, 94, '230400', 'area_code', 3, '230405', '兴安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1099, 94, '230400', 'area_code', 3, '230406', '东山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1100, 94, '230400', 'area_code', 3, '230407', '兴山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1101, 94, '230400', 'area_code', 3, '230421', '萝北县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1102, 94, '230400', 'area_code', 3, '230422', '绥滨县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1103, 95, '230500', 'area_code', 3, '230501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1104, 95, '230500', 'area_code', 3, '230502', '尖山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1105, 95, '230500', 'area_code', 3, '230503', '岭东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1106, 95, '230500', 'area_code', 3, '230505', '四方台区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1107, 95, '230500', 'area_code', 3, '230506', '宝山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1108, 95, '230500', 'area_code', 3, '230521', '集贤县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1109, 95, '230500', 'area_code', 3, '230522', '友谊县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1110, 95, '230500', 'area_code', 3, '230523', '宝清县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1111, 95, '230500', 'area_code', 3, '230524', '饶河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1112, 96, '230600', 'area_code', 3, '230601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1113, 96, '230600', 'area_code', 3, '230602', '萨尔图区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1114, 96, '230600', 'area_code', 3, '230603', '龙凤区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1115, 96, '230600', 'area_code', 3, '230604', '让胡路区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1116, 96, '230600', 'area_code', 3, '230605', '红岗区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1117, 96, '230600', 'area_code', 3, '230606', '大同区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1118, 96, '230600', 'area_code', 3, '230621', '肇州县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1119, 96, '230600', 'area_code', 3, '230622', '肇源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1120, 96, '230600', 'area_code', 3, '230623', '林甸县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1121, 96, '230600', 'area_code', 3, '230624', '杜尔伯特蒙古族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1122, 96, '230600', 'area_code', 3, '230671', '大庆高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1123, 97, '230700', 'area_code', 3, '230701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1124, 97, '230700', 'area_code', 3, '230717', '伊美区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1125, 97, '230700', 'area_code', 3, '230718', '乌翠区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1126, 97, '230700', 'area_code', 3, '230719', '友好区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1127, 97, '230700', 'area_code', 3, '230722', '嘉荫县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1128, 97, '230700', 'area_code', 3, '230723', '汤旺县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1129, 97, '230700', 'area_code', 3, '230724', '丰林县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1130, 97, '230700', 'area_code', 3, '230725', '大箐山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1131, 97, '230700', 'area_code', 3, '230726', '南岔县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1132, 97, '230700', 'area_code', 3, '230751', '金林区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1133, 97, '230700', 'area_code', 3, '230781', '铁力市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1134, 98, '230800', 'area_code', 3, '230801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1135, 98, '230800', 'area_code', 3, '230803', '向阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1136, 98, '230800', 'area_code', 3, '230804', '前进区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1137, 98, '230800', 'area_code', 3, '230805', '东风区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1138, 98, '230800', 'area_code', 3, '230811', '郊区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1139, 98, '230800', 'area_code', 3, '230822', '桦南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1140, 98, '230800', 'area_code', 3, '230826', '桦川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1141, 98, '230800', 'area_code', 3, '230828', '汤原县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1142, 98, '230800', 'area_code', 3, '230881', '同江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1143, 98, '230800', 'area_code', 3, '230882', '富锦市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1144, 98, '230800', 'area_code', 3, '230883', '抚远市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1145, 99, '230900', 'area_code', 3, '230901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1146, 99, '230900', 'area_code', 3, '230902', '新兴区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1147, 99, '230900', 'area_code', 3, '230903', '桃山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1148, 99, '230900', 'area_code', 3, '230904', '茄子河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1149, 99, '230900', 'area_code', 3, '230921', '勃利县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1150, 100, '231000', 'area_code', 3, '231001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1151, 100, '231000', 'area_code', 3, '231002', '东安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1152, 100, '231000', 'area_code', 3, '231003', '阳明区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1153, 100, '231000', 'area_code', 3, '231004', '爱民区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1154, 100, '231000', 'area_code', 3, '231005', '西安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1155, 100, '231000', 'area_code', 3, '231025', '林口县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1156, 100, '231000', 'area_code', 3, '231071', '牡丹江经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1157, 100, '231000', 'area_code', 3, '231081', '绥芬河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1158, 100, '231000', 'area_code', 3, '231083', '海林市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1159, 100, '231000', 'area_code', 3, '231084', '宁安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1160, 100, '231000', 'area_code', 3, '231085', '穆棱市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1161, 100, '231000', 'area_code', 3, '231086', '东宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1162, 101, '231100', 'area_code', 3, '231101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1163, 101, '231100', 'area_code', 3, '231102', '爱辉区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1164, 101, '231100', 'area_code', 3, '231123', '逊克县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1165, 101, '231100', 'area_code', 3, '231124', '孙吴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1166, 101, '231100', 'area_code', 3, '231181', '北安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1167, 101, '231100', 'area_code', 3, '231182', '五大连池市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1168, 101, '231100', 'area_code', 3, '231183', '嫩江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1169, 102, '231200', 'area_code', 3, '231201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1170, 102, '231200', 'area_code', 3, '231202', '北林区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1171, 102, '231200', 'area_code', 3, '231221', '望奎县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1172, 102, '231200', 'area_code', 3, '231222', '兰西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1173, 102, '231200', 'area_code', 3, '231223', '青冈县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1174, 102, '231200', 'area_code', 3, '231224', '庆安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1175, 102, '231200', 'area_code', 3, '231225', '明水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1176, 102, '231200', 'area_code', 3, '231226', '绥棱县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1177, 102, '231200', 'area_code', 3, '231281', '安达市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1178, 102, '231200', 'area_code', 3, '231282', '肇东市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1179, 102, '231200', 'area_code', 3, '231283', '海伦市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1180, 103, '232700', 'area_code', 3, '232701', '漠河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1181, 103, '232700', 'area_code', 3, '232721', '呼玛县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1182, 103, '232700', 'area_code', 3, '232722', '塔河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1183, 103, '232700', 'area_code', 3, '232761', '加格达奇区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1184, 103, '232700', 'area_code', 3, '232762', '松岭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1185, 103, '232700', 'area_code', 3, '232763', '新林区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1186, 103, '232700', 'area_code', 3, '232764', '呼中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1187, 104, '310100', 'area_code', 3, '310101', '黄浦区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1188, 104, '310100', 'area_code', 3, '310104', '徐汇区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1189, 104, '310100', 'area_code', 3, '310105', '长宁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1190, 104, '310100', 'area_code', 3, '310106', '静安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1191, 104, '310100', 'area_code', 3, '310107', '普陀区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1192, 104, '310100', 'area_code', 3, '310109', '虹口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1193, 104, '310100', 'area_code', 3, '310110', '杨浦区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1194, 104, '310100', 'area_code', 3, '310112', '闵行区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1195, 104, '310100', 'area_code', 3, '310113', '宝山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1196, 104, '310100', 'area_code', 3, '310114', '嘉定区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1197, 104, '310100', 'area_code', 3, '310115', '浦东新区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1198, 104, '310100', 'area_code', 3, '310116', '金山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1199, 104, '310100', 'area_code', 3, '310117', '松江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1200, 104, '310100', 'area_code', 3, '310118', '青浦区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1201, 104, '310100', 'area_code', 3, '310120', '奉贤区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1202, 104, '310100', 'area_code', 3, '310151', '崇明区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1203, 105, '320100', 'area_code', 3, '320101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1204, 105, '320100', 'area_code', 3, '320102', '玄武区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1205, 105, '320100', 'area_code', 3, '320104', '秦淮区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1206, 105, '320100', 'area_code', 3, '320105', '建邺区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1207, 105, '320100', 'area_code', 3, '320106', '鼓楼区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1208, 105, '320100', 'area_code', 3, '320111', '浦口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1209, 105, '320100', 'area_code', 3, '320113', '栖霞区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1210, 105, '320100', 'area_code', 3, '320114', '雨花台区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1211, 105, '320100', 'area_code', 3, '320115', '江宁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1212, 105, '320100', 'area_code', 3, '320116', '六合区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1213, 105, '320100', 'area_code', 3, '320117', '溧水区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1214, 105, '320100', 'area_code', 3, '320118', '高淳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1215, 106, '320200', 'area_code', 3, '320201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1216, 106, '320200', 'area_code', 3, '320205', '锡山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1217, 106, '320200', 'area_code', 3, '320206', '惠山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1218, 106, '320200', 'area_code', 3, '320211', '滨湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1219, 106, '320200', 'area_code', 3, '320213', '梁溪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1220, 106, '320200', 'area_code', 3, '320214', '新吴区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1221, 106, '320200', 'area_code', 3, '320281', '江阴市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1222, 106, '320200', 'area_code', 3, '320282', '宜兴市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1223, 107, '320300', 'area_code', 3, '320301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1224, 107, '320300', 'area_code', 3, '320302', '鼓楼区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1225, 107, '320300', 'area_code', 3, '320303', '云龙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1226, 107, '320300', 'area_code', 3, '320305', '贾汪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1227, 107, '320300', 'area_code', 3, '320311', '泉山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1228, 107, '320300', 'area_code', 3, '320312', '铜山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1229, 107, '320300', 'area_code', 3, '320321', '丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1230, 107, '320300', 'area_code', 3, '320322', '沛县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1231, 107, '320300', 'area_code', 3, '320324', '睢宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1232, 107, '320300', 'area_code', 3, '320371', '徐州经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1233, 107, '320300', 'area_code', 3, '320381', '新沂市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1234, 107, '320300', 'area_code', 3, '320382', '邳州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1235, 108, '320400', 'area_code', 3, '320401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1236, 108, '320400', 'area_code', 3, '320402', '天宁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1237, 108, '320400', 'area_code', 3, '320404', '钟楼区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1238, 108, '320400', 'area_code', 3, '320411', '新北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1239, 108, '320400', 'area_code', 3, '320412', '武进区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1240, 108, '320400', 'area_code', 3, '320413', '金坛区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1241, 108, '320400', 'area_code', 3, '320481', '溧阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1242, 109, '320500', 'area_code', 3, '320501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1243, 109, '320500', 'area_code', 3, '320505', '虎丘区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1244, 109, '320500', 'area_code', 3, '320506', '吴中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1245, 109, '320500', 'area_code', 3, '320507', '相城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1246, 109, '320500', 'area_code', 3, '320508', '姑苏区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1247, 109, '320500', 'area_code', 3, '320509', '吴江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1248, 109, '320500', 'area_code', 3, '320571', '苏州工业园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1249, 109, '320500', 'area_code', 3, '320581', '常熟市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1250, 109, '320500', 'area_code', 3, '320582', '张家港市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1251, 109, '320500', 'area_code', 3, '320583', '昆山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1252, 109, '320500', 'area_code', 3, '320585', '太仓市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1253, 110, '320600', 'area_code', 3, '320601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1254, 110, '320600', 'area_code', 3, '320602', '崇川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1255, 110, '320600', 'area_code', 3, '320611', '港闸区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1256, 110, '320600', 'area_code', 3, '320612', '通州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1257, 110, '320600', 'area_code', 3, '320623', '如东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1258, 110, '320600', 'area_code', 3, '320671', '南通经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1259, 110, '320600', 'area_code', 3, '320681', '启东市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1260, 110, '320600', 'area_code', 3, '320682', '如皋市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1261, 110, '320600', 'area_code', 3, '320684', '海门市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1262, 110, '320600', 'area_code', 3, '320685', '海安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1263, 111, '320700', 'area_code', 3, '320701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1264, 111, '320700', 'area_code', 3, '320703', '连云区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1265, 111, '320700', 'area_code', 3, '320706', '海州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1266, 111, '320700', 'area_code', 3, '320707', '赣榆区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1267, 111, '320700', 'area_code', 3, '320722', '东海县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1268, 111, '320700', 'area_code', 3, '320723', '灌云县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1269, 111, '320700', 'area_code', 3, '320724', '灌南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1270, 111, '320700', 'area_code', 3, '320771', '连云港经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1271, 111, '320700', 'area_code', 3, '320772', '连云港高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1272, 112, '320800', 'area_code', 3, '320801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1273, 112, '320800', 'area_code', 3, '320803', '淮安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1274, 112, '320800', 'area_code', 3, '320804', '淮阴区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1275, 112, '320800', 'area_code', 3, '320812', '清江浦区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1276, 112, '320800', 'area_code', 3, '320813', '洪泽区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1277, 112, '320800', 'area_code', 3, '320826', '涟水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1278, 112, '320800', 'area_code', 3, '320830', '盱眙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1279, 112, '320800', 'area_code', 3, '320831', '金湖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1280, 112, '320800', 'area_code', 3, '320871', '淮安经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1281, 113, '320900', 'area_code', 3, '320901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1282, 113, '320900', 'area_code', 3, '320902', '亭湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1283, 113, '320900', 'area_code', 3, '320903', '盐都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1284, 113, '320900', 'area_code', 3, '320904', '大丰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1285, 113, '320900', 'area_code', 3, '320921', '响水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1286, 113, '320900', 'area_code', 3, '320922', '滨海县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1287, 113, '320900', 'area_code', 3, '320923', '阜宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1288, 113, '320900', 'area_code', 3, '320924', '射阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1289, 113, '320900', 'area_code', 3, '320925', '建湖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1290, 113, '320900', 'area_code', 3, '320971', '盐城经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1291, 113, '320900', 'area_code', 3, '320981', '东台市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1292, 114, '321000', 'area_code', 3, '321001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1293, 114, '321000', 'area_code', 3, '321002', '广陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1294, 114, '321000', 'area_code', 3, '321003', '邗江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1295, 114, '321000', 'area_code', 3, '321012', '江都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1296, 114, '321000', 'area_code', 3, '321023', '宝应县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1297, 114, '321000', 'area_code', 3, '321071', '扬州经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1298, 114, '321000', 'area_code', 3, '321081', '仪征市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1299, 114, '321000', 'area_code', 3, '321084', '高邮市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1300, 115, '321100', 'area_code', 3, '321101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1301, 115, '321100', 'area_code', 3, '321102', '京口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1302, 115, '321100', 'area_code', 3, '321111', '润州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1303, 115, '321100', 'area_code', 3, '321112', '丹徒区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1304, 115, '321100', 'area_code', 3, '321171', '镇江新区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1305, 115, '321100', 'area_code', 3, '321181', '丹阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1306, 115, '321100', 'area_code', 3, '321182', '扬中市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1307, 115, '321100', 'area_code', 3, '321183', '句容市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1308, 116, '321200', 'area_code', 3, '321201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1309, 116, '321200', 'area_code', 3, '321202', '海陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1310, 116, '321200', 'area_code', 3, '321203', '高港区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1311, 116, '321200', 'area_code', 3, '321204', '姜堰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1312, 116, '321200', 'area_code', 3, '321271', '泰州医药高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL,
        NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1313, 116, '321200', 'area_code', 3, '321281', '兴化市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1314, 116, '321200', 'area_code', 3, '321282', '靖江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1315, 116, '321200', 'area_code', 3, '321283', '泰兴市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1316, 117, '321300', 'area_code', 3, '321301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1317, 117, '321300', 'area_code', 3, '321302', '宿城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1318, 117, '321300', 'area_code', 3, '321311', '宿豫区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1319, 117, '321300', 'area_code', 3, '321322', '沭阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1320, 117, '321300', 'area_code', 3, '321323', '泗阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1321, 117, '321300', 'area_code', 3, '321324', '泗洪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1322, 117, '321300', 'area_code', 3, '321371', '宿迁经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1323, 118, '330100', 'area_code', 3, '330101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1324, 118, '330100', 'area_code', 3, '330102', '上城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1325, 118, '330100', 'area_code', 3, '330103', '下城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1326, 118, '330100', 'area_code', 3, '330104', '江干区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1327, 118, '330100', 'area_code', 3, '330105', '拱墅区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1328, 118, '330100', 'area_code', 3, '330106', '西湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1329, 118, '330100', 'area_code', 3, '330108', '滨江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1330, 118, '330100', 'area_code', 3, '330109', '萧山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1331, 118, '330100', 'area_code', 3, '330110', '余杭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1332, 118, '330100', 'area_code', 3, '330111', '富阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1333, 118, '330100', 'area_code', 3, '330112', '临安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1334, 118, '330100', 'area_code', 3, '330122', '桐庐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1335, 118, '330100', 'area_code', 3, '330127', '淳安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1336, 118, '330100', 'area_code', 3, '330182', '建德市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1337, 119, '330200', 'area_code', 3, '330201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1338, 119, '330200', 'area_code', 3, '330203', '海曙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1339, 119, '330200', 'area_code', 3, '330205', '江北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1340, 119, '330200', 'area_code', 3, '330206', '北仑区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1341, 119, '330200', 'area_code', 3, '330211', '镇海区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1342, 119, '330200', 'area_code', 3, '330212', '鄞州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1343, 119, '330200', 'area_code', 3, '330213', '奉化区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1344, 119, '330200', 'area_code', 3, '330225', '象山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1345, 119, '330200', 'area_code', 3, '330226', '宁海县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1346, 119, '330200', 'area_code', 3, '330281', '余姚市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1347, 119, '330200', 'area_code', 3, '330282', '慈溪市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1348, 120, '330300', 'area_code', 3, '330301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1349, 120, '330300', 'area_code', 3, '330302', '鹿城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1350, 120, '330300', 'area_code', 3, '330303', '龙湾区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1351, 120, '330300', 'area_code', 3, '330304', '瓯海区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1352, 120, '330300', 'area_code', 3, '330305', '洞头区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1353, 120, '330300', 'area_code', 3, '330324', '永嘉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1354, 120, '330300', 'area_code', 3, '330326', '平阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1355, 120, '330300', 'area_code', 3, '330327', '苍南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1356, 120, '330300', 'area_code', 3, '330328', '文成县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1357, 120, '330300', 'area_code', 3, '330329', '泰顺县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1358, 120, '330300', 'area_code', 3, '330371', '温州经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1359, 120, '330300', 'area_code', 3, '330381', '瑞安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1360, 120, '330300', 'area_code', 3, '330382', '乐清市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1361, 120, '330300', 'area_code', 3, '330383', '龙港市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1362, 121, '330400', 'area_code', 3, '330401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1363, 121, '330400', 'area_code', 3, '330402', '南湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1364, 121, '330400', 'area_code', 3, '330411', '秀洲区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1365, 121, '330400', 'area_code', 3, '330421', '嘉善县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1366, 121, '330400', 'area_code', 3, '330424', '海盐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1367, 121, '330400', 'area_code', 3, '330481', '海宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1368, 121, '330400', 'area_code', 3, '330482', '平湖市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1369, 121, '330400', 'area_code', 3, '330483', '桐乡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1370, 122, '330500', 'area_code', 3, '330501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1371, 122, '330500', 'area_code', 3, '330502', '吴兴区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1372, 122, '330500', 'area_code', 3, '330503', '南浔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1373, 122, '330500', 'area_code', 3, '330521', '德清县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1374, 122, '330500', 'area_code', 3, '330522', '长兴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1375, 122, '330500', 'area_code', 3, '330523', '安吉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1376, 123, '330600', 'area_code', 3, '330601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1377, 123, '330600', 'area_code', 3, '330602', '越城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1378, 123, '330600', 'area_code', 3, '330603', '柯桥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1379, 123, '330600', 'area_code', 3, '330604', '上虞区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1380, 123, '330600', 'area_code', 3, '330624', '新昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1381, 123, '330600', 'area_code', 3, '330681', '诸暨市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1382, 123, '330600', 'area_code', 3, '330683', '嵊州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1383, 124, '330700', 'area_code', 3, '330701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1384, 124, '330700', 'area_code', 3, '330702', '婺城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1385, 124, '330700', 'area_code', 3, '330703', '金东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1386, 124, '330700', 'area_code', 3, '330723', '武义县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1387, 124, '330700', 'area_code', 3, '330726', '浦江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1388, 124, '330700', 'area_code', 3, '330727', '磐安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1389, 124, '330700', 'area_code', 3, '330781', '兰溪市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1390, 124, '330700', 'area_code', 3, '330782', '义乌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1391, 124, '330700', 'area_code', 3, '330783', '东阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1392, 124, '330700', 'area_code', 3, '330784', '永康市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1393, 125, '330800', 'area_code', 3, '330801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1394, 125, '330800', 'area_code', 3, '330802', '柯城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1395, 125, '330800', 'area_code', 3, '330803', '衢江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1396, 125, '330800', 'area_code', 3, '330822', '常山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1397, 125, '330800', 'area_code', 3, '330824', '开化县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1398, 125, '330800', 'area_code', 3, '330825', '龙游县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1399, 125, '330800', 'area_code', 3, '330881', '江山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1400, 126, '330900', 'area_code', 3, '330901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1401, 126, '330900', 'area_code', 3, '330902', '定海区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1402, 126, '330900', 'area_code', 3, '330903', '普陀区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1403, 126, '330900', 'area_code', 3, '330921', '岱山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1404, 126, '330900', 'area_code', 3, '330922', '嵊泗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1405, 127, '331000', 'area_code', 3, '331001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1406, 127, '331000', 'area_code', 3, '331002', '椒江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1407, 127, '331000', 'area_code', 3, '331003', '黄岩区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1408, 127, '331000', 'area_code', 3, '331004', '路桥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1409, 127, '331000', 'area_code', 3, '331022', '三门县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1410, 127, '331000', 'area_code', 3, '331023', '天台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1411, 127, '331000', 'area_code', 3, '331024', '仙居县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1412, 127, '331000', 'area_code', 3, '331081', '温岭市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1413, 127, '331000', 'area_code', 3, '331082', '临海市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1414, 127, '331000', 'area_code', 3, '331083', '玉环市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1415, 128, '331100', 'area_code', 3, '331101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1416, 128, '331100', 'area_code', 3, '331102', '莲都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1417, 128, '331100', 'area_code', 3, '331121', '青田县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1418, 128, '331100', 'area_code', 3, '331122', '缙云县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1419, 128, '331100', 'area_code', 3, '331123', '遂昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1420, 128, '331100', 'area_code', 3, '331124', '松阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1421, 128, '331100', 'area_code', 3, '331125', '云和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1422, 128, '331100', 'area_code', 3, '331126', '庆元县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1423, 128, '331100', 'area_code', 3, '331127', '景宁畲族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1424, 128, '331100', 'area_code', 3, '331181', '龙泉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1425, 129, '340100', 'area_code', 3, '340101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1426, 129, '340100', 'area_code', 3, '340102', '瑶海区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1427, 129, '340100', 'area_code', 3, '340103', '庐阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1428, 129, '340100', 'area_code', 3, '340104', '蜀山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1429, 129, '340100', 'area_code', 3, '340111', '包河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1430, 129, '340100', 'area_code', 3, '340121', '长丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1431, 129, '340100', 'area_code', 3, '340122', '肥东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1432, 129, '340100', 'area_code', 3, '340123', '肥西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1433, 129, '340100', 'area_code', 3, '340124', '庐江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1434, 129, '340100', 'area_code', 3, '340171', '合肥高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1435, 129, '340100', 'area_code', 3, '340172', '合肥经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1436, 129, '340100', 'area_code', 3, '340173', '合肥新站高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL,
        NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1437, 129, '340100', 'area_code', 3, '340181', '巢湖市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1438, 130, '340200', 'area_code', 3, '340201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1439, 130, '340200', 'area_code', 3, '340202', '镜湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1440, 130, '340200', 'area_code', 3, '340203', '弋江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1441, 130, '340200', 'area_code', 3, '340207', '鸠江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1442, 130, '340200', 'area_code', 3, '340208', '三山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1443, 130, '340200', 'area_code', 3, '340221', '芜湖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1444, 130, '340200', 'area_code', 3, '340222', '繁昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1445, 130, '340200', 'area_code', 3, '340223', '南陵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1446, 130, '340200', 'area_code', 3, '340271', '芜湖经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1447, 130, '340200', 'area_code', 3, '340272', '安徽芜湖长江大桥经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL,
        NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1448, 130, '340200', 'area_code', 3, '340281', '无为市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1449, 131, '340300', 'area_code', 3, '340301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1450, 131, '340300', 'area_code', 3, '340302', '龙子湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1451, 131, '340300', 'area_code', 3, '340303', '蚌山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1452, 131, '340300', 'area_code', 3, '340304', '禹会区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1453, 131, '340300', 'area_code', 3, '340311', '淮上区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1454, 131, '340300', 'area_code', 3, '340321', '怀远县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1455, 131, '340300', 'area_code', 3, '340322', '五河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1456, 131, '340300', 'area_code', 3, '340323', '固镇县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1457, 131, '340300', 'area_code', 3, '340371', '蚌埠市高新技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1458, 131, '340300', 'area_code', 3, '340372', '蚌埠市经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1459, 132, '340400', 'area_code', 3, '340401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1460, 132, '340400', 'area_code', 3, '340402', '大通区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1461, 132, '340400', 'area_code', 3, '340403', '田家庵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1462, 132, '340400', 'area_code', 3, '340404', '谢家集区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1463, 132, '340400', 'area_code', 3, '340405', '八公山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1464, 132, '340400', 'area_code', 3, '340406', '潘集区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1465, 132, '340400', 'area_code', 3, '340421', '凤台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1466, 132, '340400', 'area_code', 3, '340422', '寿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1467, 133, '340500', 'area_code', 3, '340501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1468, 133, '340500', 'area_code', 3, '340503', '花山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1469, 133, '340500', 'area_code', 3, '340504', '雨山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1470, 133, '340500', 'area_code', 3, '340506', '博望区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1471, 133, '340500', 'area_code', 3, '340521', '当涂县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1472, 133, '340500', 'area_code', 3, '340522', '含山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1473, 133, '340500', 'area_code', 3, '340523', '和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1474, 134, '340600', 'area_code', 3, '340601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1475, 134, '340600', 'area_code', 3, '340602', '杜集区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1476, 134, '340600', 'area_code', 3, '340603', '相山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1477, 134, '340600', 'area_code', 3, '340604', '烈山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1478, 134, '340600', 'area_code', 3, '340621', '濉溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1479, 135, '340700', 'area_code', 3, '340701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1480, 135, '340700', 'area_code', 3, '340705', '铜官区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1481, 135, '340700', 'area_code', 3, '340706', '义安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1482, 135, '340700', 'area_code', 3, '340711', '郊区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1483, 135, '340700', 'area_code', 3, '340722', '枞阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1484, 136, '340800', 'area_code', 3, '340801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1485, 136, '340800', 'area_code', 3, '340802', '迎江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1486, 136, '340800', 'area_code', 3, '340803', '大观区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1487, 136, '340800', 'area_code', 3, '340811', '宜秀区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1488, 136, '340800', 'area_code', 3, '340822', '怀宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1489, 136, '340800', 'area_code', 3, '340825', '太湖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1490, 136, '340800', 'area_code', 3, '340826', '宿松县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1491, 136, '340800', 'area_code', 3, '340827', '望江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1492, 136, '340800', 'area_code', 3, '340828', '岳西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1493, 136, '340800', 'area_code', 3, '340871', '安徽安庆经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1494, 136, '340800', 'area_code', 3, '340881', '桐城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1495, 136, '340800', 'area_code', 3, '340882', '潜山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1496, 137, '341000', 'area_code', 3, '341001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1497, 137, '341000', 'area_code', 3, '341002', '屯溪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1498, 137, '341000', 'area_code', 3, '341003', '黄山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1499, 137, '341000', 'area_code', 3, '341004', '徽州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1500, 137, '341000', 'area_code', 3, '341021', '歙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1501, 137, '341000', 'area_code', 3, '341022', '休宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1502, 137, '341000', 'area_code', 3, '341023', '黟县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1503, 137, '341000', 'area_code', 3, '341024', '祁门县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1504, 138, '341100', 'area_code', 3, '341101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1505, 138, '341100', 'area_code', 3, '341102', '琅琊区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1506, 138, '341100', 'area_code', 3, '341103', '南谯区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1507, 138, '341100', 'area_code', 3, '341122', '来安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1508, 138, '341100', 'area_code', 3, '341124', '全椒县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1509, 138, '341100', 'area_code', 3, '341125', '定远县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1510, 138, '341100', 'area_code', 3, '341126', '凤阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1511, 138, '341100', 'area_code', 3, '341171', '苏滁现代产业园', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1512, 138, '341100', 'area_code', 3, '341172', '滁州经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1513, 138, '341100', 'area_code', 3, '341181', '天长市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1514, 138, '341100', 'area_code', 3, '341182', '明光市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1515, 139, '341200', 'area_code', 3, '341201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1516, 139, '341200', 'area_code', 3, '341202', '颍州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1517, 139, '341200', 'area_code', 3, '341203', '颍东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1518, 139, '341200', 'area_code', 3, '341204', '颍泉区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1519, 139, '341200', 'area_code', 3, '341221', '临泉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1520, 139, '341200', 'area_code', 3, '341222', '太和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1521, 139, '341200', 'area_code', 3, '341225', '阜南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1522, 139, '341200', 'area_code', 3, '341226', '颍上县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1523, 139, '341200', 'area_code', 3, '341271', '阜阳合肥现代产业园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1524, 139, '341200', 'area_code', 3, '341272', '阜阳经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1525, 139, '341200', 'area_code', 3, '341282', '界首市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1526, 140, '341300', 'area_code', 3, '341301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1527, 140, '341300', 'area_code', 3, '341302', '埇桥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1528, 140, '341300', 'area_code', 3, '341321', '砀山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1529, 140, '341300', 'area_code', 3, '341322', '萧县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1530, 140, '341300', 'area_code', 3, '341323', '灵璧县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1531, 140, '341300', 'area_code', 3, '341324', '泗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1532, 140, '341300', 'area_code', 3, '341371', '宿州马鞍山现代产业园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1533, 140, '341300', 'area_code', 3, '341372', '宿州经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1534, 141, '341500', 'area_code', 3, '341501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1535, 141, '341500', 'area_code', 3, '341502', '金安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1536, 141, '341500', 'area_code', 3, '341503', '裕安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1537, 141, '341500', 'area_code', 3, '341504', '叶集区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1538, 141, '341500', 'area_code', 3, '341522', '霍邱县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1539, 141, '341500', 'area_code', 3, '341523', '舒城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1540, 141, '341500', 'area_code', 3, '341524', '金寨县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1541, 141, '341500', 'area_code', 3, '341525', '霍山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1542, 142, '341600', 'area_code', 3, '341601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1543, 142, '341600', 'area_code', 3, '341602', '谯城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1544, 142, '341600', 'area_code', 3, '341621', '涡阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1545, 142, '341600', 'area_code', 3, '341622', '蒙城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1546, 142, '341600', 'area_code', 3, '341623', '利辛县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1547, 143, '341700', 'area_code', 3, '341701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1548, 143, '341700', 'area_code', 3, '341702', '贵池区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1549, 143, '341700', 'area_code', 3, '341721', '东至县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1550, 143, '341700', 'area_code', 3, '341722', '石台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1551, 143, '341700', 'area_code', 3, '341723', '青阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1552, 144, '341800', 'area_code', 3, '341801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1553, 144, '341800', 'area_code', 3, '341802', '宣州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1554, 144, '341800', 'area_code', 3, '341821', '郎溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1555, 144, '341800', 'area_code', 3, '341823', '泾县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1556, 144, '341800', 'area_code', 3, '341824', '绩溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1557, 144, '341800', 'area_code', 3, '341825', '旌德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1558, 144, '341800', 'area_code', 3, '341871', '宣城市经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1559, 144, '341800', 'area_code', 3, '341881', '宁国市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1560, 144, '341800', 'area_code', 3, '341882', '广德市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1561, 145, '350100', 'area_code', 3, '350101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1562, 145, '350100', 'area_code', 3, '350102', '鼓楼区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1563, 145, '350100', 'area_code', 3, '350103', '台江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1564, 145, '350100', 'area_code', 3, '350104', '仓山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1565, 145, '350100', 'area_code', 3, '350105', '马尾区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1566, 145, '350100', 'area_code', 3, '350111', '晋安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1567, 145, '350100', 'area_code', 3, '350112', '长乐区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1568, 145, '350100', 'area_code', 3, '350121', '闽侯县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1569, 145, '350100', 'area_code', 3, '350122', '连江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1570, 145, '350100', 'area_code', 3, '350123', '罗源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1571, 145, '350100', 'area_code', 3, '350124', '闽清县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1572, 145, '350100', 'area_code', 3, '350125', '永泰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1573, 145, '350100', 'area_code', 3, '350128', '平潭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1574, 145, '350100', 'area_code', 3, '350181', '福清市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1575, 146, '350200', 'area_code', 3, '350201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1576, 146, '350200', 'area_code', 3, '350203', '思明区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1577, 146, '350200', 'area_code', 3, '350205', '海沧区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1578, 146, '350200', 'area_code', 3, '350206', '湖里区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1579, 146, '350200', 'area_code', 3, '350211', '集美区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1580, 146, '350200', 'area_code', 3, '350212', '同安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1581, 146, '350200', 'area_code', 3, '350213', '翔安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1582, 147, '350300', 'area_code', 3, '350301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1583, 147, '350300', 'area_code', 3, '350302', '城厢区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1584, 147, '350300', 'area_code', 3, '350303', '涵江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1585, 147, '350300', 'area_code', 3, '350304', '荔城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1586, 147, '350300', 'area_code', 3, '350305', '秀屿区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1587, 147, '350300', 'area_code', 3, '350322', '仙游县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1588, 148, '350400', 'area_code', 3, '350401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1589, 148, '350400', 'area_code', 3, '350402', '梅列区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1590, 148, '350400', 'area_code', 3, '350403', '三元区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1591, 148, '350400', 'area_code', 3, '350421', '明溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1592, 148, '350400', 'area_code', 3, '350423', '清流县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1593, 148, '350400', 'area_code', 3, '350424', '宁化县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1594, 148, '350400', 'area_code', 3, '350425', '大田县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1595, 148, '350400', 'area_code', 3, '350426', '尤溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1596, 148, '350400', 'area_code', 3, '350427', '沙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1597, 148, '350400', 'area_code', 3, '350428', '将乐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1598, 148, '350400', 'area_code', 3, '350429', '泰宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1599, 148, '350400', 'area_code', 3, '350430', '建宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1600, 148, '350400', 'area_code', 3, '350481', '永安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1601, 149, '350500', 'area_code', 3, '350501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1602, 149, '350500', 'area_code', 3, '350502', '鲤城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1603, 149, '350500', 'area_code', 3, '350503', '丰泽区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1604, 149, '350500', 'area_code', 3, '350504', '洛江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1605, 149, '350500', 'area_code', 3, '350505', '泉港区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1606, 149, '350500', 'area_code', 3, '350521', '惠安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1607, 149, '350500', 'area_code', 3, '350524', '安溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1608, 149, '350500', 'area_code', 3, '350525', '永春县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1609, 149, '350500', 'area_code', 3, '350526', '德化县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1610, 149, '350500', 'area_code', 3, '350527', '金门县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1611, 149, '350500', 'area_code', 3, '350581', '石狮市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1612, 149, '350500', 'area_code', 3, '350582', '晋江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1613, 149, '350500', 'area_code', 3, '350583', '南安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1614, 150, '350600', 'area_code', 3, '350601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1615, 150, '350600', 'area_code', 3, '350602', '芗城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1616, 150, '350600', 'area_code', 3, '350603', '龙文区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1617, 150, '350600', 'area_code', 3, '350622', '云霄县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1618, 150, '350600', 'area_code', 3, '350623', '漳浦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1619, 150, '350600', 'area_code', 3, '350624', '诏安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1620, 150, '350600', 'area_code', 3, '350625', '长泰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1621, 150, '350600', 'area_code', 3, '350626', '东山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1622, 150, '350600', 'area_code', 3, '350627', '南靖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1623, 150, '350600', 'area_code', 3, '350628', '平和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1624, 150, '350600', 'area_code', 3, '350629', '华安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1625, 150, '350600', 'area_code', 3, '350681', '龙海市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1626, 151, '350700', 'area_code', 3, '350701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1627, 151, '350700', 'area_code', 3, '350702', '延平区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1628, 151, '350700', 'area_code', 3, '350703', '建阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1629, 151, '350700', 'area_code', 3, '350721', '顺昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1630, 151, '350700', 'area_code', 3, '350722', '浦城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1631, 151, '350700', 'area_code', 3, '350723', '光泽县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1632, 151, '350700', 'area_code', 3, '350724', '松溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1633, 151, '350700', 'area_code', 3, '350725', '政和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1634, 151, '350700', 'area_code', 3, '350781', '邵武市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1635, 151, '350700', 'area_code', 3, '350782', '武夷山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1636, 151, '350700', 'area_code', 3, '350783', '建瓯市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1637, 152, '350800', 'area_code', 3, '350801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1638, 152, '350800', 'area_code', 3, '350802', '新罗区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1639, 152, '350800', 'area_code', 3, '350803', '永定区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1640, 152, '350800', 'area_code', 3, '350821', '长汀县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1641, 152, '350800', 'area_code', 3, '350823', '上杭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1642, 152, '350800', 'area_code', 3, '350824', '武平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1643, 152, '350800', 'area_code', 3, '350825', '连城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1644, 152, '350800', 'area_code', 3, '350881', '漳平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1645, 153, '350900', 'area_code', 3, '350901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1646, 153, '350900', 'area_code', 3, '350902', '蕉城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1647, 153, '350900', 'area_code', 3, '350921', '霞浦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1648, 153, '350900', 'area_code', 3, '350922', '古田县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1649, 153, '350900', 'area_code', 3, '350923', '屏南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1650, 153, '350900', 'area_code', 3, '350924', '寿宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1651, 153, '350900', 'area_code', 3, '350925', '周宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1652, 153, '350900', 'area_code', 3, '350926', '柘荣县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1653, 153, '350900', 'area_code', 3, '350981', '福安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1654, 153, '350900', 'area_code', 3, '350982', '福鼎市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1655, 154, '360100', 'area_code', 3, '360101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1656, 154, '360100', 'area_code', 3, '360102', '东湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1657, 154, '360100', 'area_code', 3, '360103', '西湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1658, 154, '360100', 'area_code', 3, '360104', '青云谱区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1659, 154, '360100', 'area_code', 3, '360111', '青山湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1660, 154, '360100', 'area_code', 3, '360112', '新建区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1661, 154, '360100', 'area_code', 3, '360113', '红谷滩区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1662, 154, '360100', 'area_code', 3, '360121', '南昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1663, 154, '360100', 'area_code', 3, '360123', '安义县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1664, 154, '360100', 'area_code', 3, '360124', '进贤县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1665, 155, '360200', 'area_code', 3, '360201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1666, 155, '360200', 'area_code', 3, '360202', '昌江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1667, 155, '360200', 'area_code', 3, '360203', '珠山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1668, 155, '360200', 'area_code', 3, '360222', '浮梁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1669, 155, '360200', 'area_code', 3, '360281', '乐平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1670, 156, '360300', 'area_code', 3, '360301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1671, 156, '360300', 'area_code', 3, '360302', '安源区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1672, 156, '360300', 'area_code', 3, '360313', '湘东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1673, 156, '360300', 'area_code', 3, '360321', '莲花县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1674, 156, '360300', 'area_code', 3, '360322', '上栗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1675, 156, '360300', 'area_code', 3, '360323', '芦溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1676, 157, '360400', 'area_code', 3, '360401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1677, 157, '360400', 'area_code', 3, '360402', '濂溪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1678, 157, '360400', 'area_code', 3, '360403', '浔阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1679, 157, '360400', 'area_code', 3, '360404', '柴桑区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1680, 157, '360400', 'area_code', 3, '360423', '武宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1681, 157, '360400', 'area_code', 3, '360424', '修水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1682, 157, '360400', 'area_code', 3, '360425', '永修县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1683, 157, '360400', 'area_code', 3, '360426', '德安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1684, 157, '360400', 'area_code', 3, '360428', '都昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1685, 157, '360400', 'area_code', 3, '360429', '湖口县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1686, 157, '360400', 'area_code', 3, '360430', '彭泽县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1687, 157, '360400', 'area_code', 3, '360481', '瑞昌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1688, 157, '360400', 'area_code', 3, '360482', '共青城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1689, 157, '360400', 'area_code', 3, '360483', '庐山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1690, 158, '360500', 'area_code', 3, '360501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1691, 158, '360500', 'area_code', 3, '360502', '渝水区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1692, 158, '360500', 'area_code', 3, '360521', '分宜县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1693, 159, '360600', 'area_code', 3, '360601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1694, 159, '360600', 'area_code', 3, '360602', '月湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1695, 159, '360600', 'area_code', 3, '360603', '余江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1696, 159, '360600', 'area_code', 3, '360681', '贵溪市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1697, 160, '360700', 'area_code', 3, '360701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1698, 160, '360700', 'area_code', 3, '360702', '章贡区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1699, 160, '360700', 'area_code', 3, '360703', '南康区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1700, 160, '360700', 'area_code', 3, '360704', '赣县区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1701, 160, '360700', 'area_code', 3, '360722', '信丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1702, 160, '360700', 'area_code', 3, '360723', '大余县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1703, 160, '360700', 'area_code', 3, '360724', '上犹县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1704, 160, '360700', 'area_code', 3, '360725', '崇义县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1705, 160, '360700', 'area_code', 3, '360726', '安远县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1706, 160, '360700', 'area_code', 3, '360728', '定南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1707, 160, '360700', 'area_code', 3, '360729', '全南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1708, 160, '360700', 'area_code', 3, '360730', '宁都县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1709, 160, '360700', 'area_code', 3, '360731', '于都县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1710, 160, '360700', 'area_code', 3, '360732', '兴国县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1711, 160, '360700', 'area_code', 3, '360733', '会昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1712, 160, '360700', 'area_code', 3, '360734', '寻乌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1713, 160, '360700', 'area_code', 3, '360735', '石城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1714, 160, '360700', 'area_code', 3, '360781', '瑞金市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1715, 160, '360700', 'area_code', 3, '360783', '龙南市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1716, 161, '360800', 'area_code', 3, '360801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1717, 161, '360800', 'area_code', 3, '360802', '吉州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1718, 161, '360800', 'area_code', 3, '360803', '青原区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1719, 161, '360800', 'area_code', 3, '360821', '吉安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1720, 161, '360800', 'area_code', 3, '360822', '吉水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1721, 161, '360800', 'area_code', 3, '360823', '峡江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1722, 161, '360800', 'area_code', 3, '360824', '新干县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1723, 161, '360800', 'area_code', 3, '360825', '永丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1724, 161, '360800', 'area_code', 3, '360826', '泰和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1725, 161, '360800', 'area_code', 3, '360827', '遂川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1726, 161, '360800', 'area_code', 3, '360828', '万安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1727, 161, '360800', 'area_code', 3, '360829', '安福县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1728, 161, '360800', 'area_code', 3, '360830', '永新县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1729, 161, '360800', 'area_code', 3, '360881', '井冈山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1730, 162, '360900', 'area_code', 3, '360901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1731, 162, '360900', 'area_code', 3, '360902', '袁州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1732, 162, '360900', 'area_code', 3, '360921', '奉新县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1733, 162, '360900', 'area_code', 3, '360922', '万载县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1734, 162, '360900', 'area_code', 3, '360923', '上高县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1735, 162, '360900', 'area_code', 3, '360924', '宜丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1736, 162, '360900', 'area_code', 3, '360925', '靖安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1737, 162, '360900', 'area_code', 3, '360926', '铜鼓县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1738, 162, '360900', 'area_code', 3, '360981', '丰城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1739, 162, '360900', 'area_code', 3, '360982', '樟树市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1740, 162, '360900', 'area_code', 3, '360983', '高安市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1741, 163, '361000', 'area_code', 3, '361001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1742, 163, '361000', 'area_code', 3, '361002', '临川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1743, 163, '361000', 'area_code', 3, '361003', '东乡区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1744, 163, '361000', 'area_code', 3, '361021', '南城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1745, 163, '361000', 'area_code', 3, '361022', '黎川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1746, 163, '361000', 'area_code', 3, '361023', '南丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1747, 163, '361000', 'area_code', 3, '361024', '崇仁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1748, 163, '361000', 'area_code', 3, '361025', '乐安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1749, 163, '361000', 'area_code', 3, '361026', '宜黄县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1750, 163, '361000', 'area_code', 3, '361027', '金溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1751, 163, '361000', 'area_code', 3, '361028', '资溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1752, 163, '361000', 'area_code', 3, '361030', '广昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1753, 164, '361100', 'area_code', 3, '361101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1754, 164, '361100', 'area_code', 3, '361102', '信州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1755, 164, '361100', 'area_code', 3, '361103', '广丰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1756, 164, '361100', 'area_code', 3, '361104', '广信区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1757, 164, '361100', 'area_code', 3, '361123', '玉山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1758, 164, '361100', 'area_code', 3, '361124', '铅山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1759, 164, '361100', 'area_code', 3, '361125', '横峰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1760, 164, '361100', 'area_code', 3, '361126', '弋阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1761, 164, '361100', 'area_code', 3, '361127', '余干县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1762, 164, '361100', 'area_code', 3, '361128', '鄱阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1763, 164, '361100', 'area_code', 3, '361129', '万年县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1764, 164, '361100', 'area_code', 3, '361130', '婺源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1765, 164, '361100', 'area_code', 3, '361181', '德兴市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1766, 165, '370100', 'area_code', 3, '370101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1767, 165, '370100', 'area_code', 3, '370102', '历下区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1768, 165, '370100', 'area_code', 3, '370103', '市中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1769, 165, '370100', 'area_code', 3, '370104', '槐荫区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1770, 165, '370100', 'area_code', 3, '370105', '天桥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1771, 165, '370100', 'area_code', 3, '370112', '历城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1772, 165, '370100', 'area_code', 3, '370113', '长清区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1773, 165, '370100', 'area_code', 3, '370114', '章丘区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1774, 165, '370100', 'area_code', 3, '370115', '济阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1775, 165, '370100', 'area_code', 3, '370116', '莱芜区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1776, 165, '370100', 'area_code', 3, '370117', '钢城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1777, 165, '370100', 'area_code', 3, '370124', '平阴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1778, 165, '370100', 'area_code', 3, '370126', '商河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1779, 165, '370100', 'area_code', 3, '370171', '济南高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1780, 166, '370200', 'area_code', 3, '370201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1781, 166, '370200', 'area_code', 3, '370202', '市南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1782, 166, '370200', 'area_code', 3, '370203', '市北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1783, 166, '370200', 'area_code', 3, '370211', '黄岛区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1784, 166, '370200', 'area_code', 3, '370212', '崂山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1785, 166, '370200', 'area_code', 3, '370213', '李沧区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1786, 166, '370200', 'area_code', 3, '370214', '城阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1787, 166, '370200', 'area_code', 3, '370215', '即墨区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1788, 166, '370200', 'area_code', 3, '370271', '青岛高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1789, 166, '370200', 'area_code', 3, '370281', '胶州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1790, 166, '370200', 'area_code', 3, '370283', '平度市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1791, 166, '370200', 'area_code', 3, '370285', '莱西市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1792, 167, '370300', 'area_code', 3, '370301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1793, 167, '370300', 'area_code', 3, '370302', '淄川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1794, 167, '370300', 'area_code', 3, '370303', '张店区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1795, 167, '370300', 'area_code', 3, '370304', '博山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1796, 167, '370300', 'area_code', 3, '370305', '临淄区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1797, 167, '370300', 'area_code', 3, '370306', '周村区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1798, 167, '370300', 'area_code', 3, '370321', '桓台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1799, 167, '370300', 'area_code', 3, '370322', '高青县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1800, 167, '370300', 'area_code', 3, '370323', '沂源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1801, 168, '370400', 'area_code', 3, '370401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1802, 168, '370400', 'area_code', 3, '370402', '市中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1803, 168, '370400', 'area_code', 3, '370403', '薛城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1804, 168, '370400', 'area_code', 3, '370404', '峄城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1805, 168, '370400', 'area_code', 3, '370405', '台儿庄区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1806, 168, '370400', 'area_code', 3, '370406', '山亭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1807, 168, '370400', 'area_code', 3, '370481', '滕州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1808, 169, '370500', 'area_code', 3, '370501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1809, 169, '370500', 'area_code', 3, '370502', '东营区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1810, 169, '370500', 'area_code', 3, '370503', '河口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1811, 169, '370500', 'area_code', 3, '370505', '垦利区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1812, 169, '370500', 'area_code', 3, '370522', '利津县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1813, 169, '370500', 'area_code', 3, '370523', '广饶县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1814, 169, '370500', 'area_code', 3, '370571', '东营经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1815, 169, '370500', 'area_code', 3, '370572', '东营港经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1816, 170, '370600', 'area_code', 3, '370601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1817, 170, '370600', 'area_code', 3, '370602', '芝罘区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1818, 170, '370600', 'area_code', 3, '370611', '福山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1819, 170, '370600', 'area_code', 3, '370612', '牟平区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1820, 170, '370600', 'area_code', 3, '370613', '莱山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1821, 170, '370600', 'area_code', 3, '370614', '蓬莱区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1822, 170, '370600', 'area_code', 3, '370671', '烟台高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1823, 170, '370600', 'area_code', 3, '370672', '烟台经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1824, 170, '370600', 'area_code', 3, '370681', '龙口市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1825, 170, '370600', 'area_code', 3, '370682', '莱阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1826, 170, '370600', 'area_code', 3, '370683', '莱州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1827, 170, '370600', 'area_code', 3, '370685', '招远市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1828, 170, '370600', 'area_code', 3, '370686', '栖霞市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1829, 170, '370600', 'area_code', 3, '370687', '海阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1830, 171, '370700', 'area_code', 3, '370701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1831, 171, '370700', 'area_code', 3, '370702', '潍城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1832, 171, '370700', 'area_code', 3, '370703', '寒亭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1833, 171, '370700', 'area_code', 3, '370704', '坊子区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1834, 171, '370700', 'area_code', 3, '370705', '奎文区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1835, 171, '370700', 'area_code', 3, '370724', '临朐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1836, 171, '370700', 'area_code', 3, '370725', '昌乐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1837, 171, '370700', 'area_code', 3, '370772', '潍坊滨海经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1838, 171, '370700', 'area_code', 3, '370781', '青州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1839, 171, '370700', 'area_code', 3, '370782', '诸城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1840, 171, '370700', 'area_code', 3, '370783', '寿光市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1841, 171, '370700', 'area_code', 3, '370784', '安丘市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1842, 171, '370700', 'area_code', 3, '370785', '高密市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1843, 171, '370700', 'area_code', 3, '370786', '昌邑市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1844, 172, '370800', 'area_code', 3, '370801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1845, 172, '370800', 'area_code', 3, '370811', '任城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1846, 172, '370800', 'area_code', 3, '370812', '兖州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1847, 172, '370800', 'area_code', 3, '370826', '微山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1848, 172, '370800', 'area_code', 3, '370827', '鱼台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1849, 172, '370800', 'area_code', 3, '370828', '金乡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1850, 172, '370800', 'area_code', 3, '370829', '嘉祥县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1851, 172, '370800', 'area_code', 3, '370830', '汶上县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1852, 172, '370800', 'area_code', 3, '370831', '泗水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1853, 172, '370800', 'area_code', 3, '370832', '梁山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1854, 172, '370800', 'area_code', 3, '370871', '济宁高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1855, 172, '370800', 'area_code', 3, '370881', '曲阜市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1856, 172, '370800', 'area_code', 3, '370883', '邹城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1857, 173, '370900', 'area_code', 3, '370901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1858, 173, '370900', 'area_code', 3, '370902', '泰山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1859, 173, '370900', 'area_code', 3, '370911', '岱岳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1860, 173, '370900', 'area_code', 3, '370921', '宁阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1861, 173, '370900', 'area_code', 3, '370923', '东平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1862, 173, '370900', 'area_code', 3, '370982', '新泰市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1863, 173, '370900', 'area_code', 3, '370983', '肥城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1864, 174, '371000', 'area_code', 3, '371001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1865, 174, '371000', 'area_code', 3, '371002', '环翠区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1866, 174, '371000', 'area_code', 3, '371003', '文登区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1867, 174, '371000', 'area_code', 3, '371071', '威海火炬高技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1868, 174, '371000', 'area_code', 3, '371072', '威海经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1869, 174, '371000', 'area_code', 3, '371073', '威海临港经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1870, 174, '371000', 'area_code', 3, '371082', '荣成市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1871, 174, '371000', 'area_code', 3, '371083', '乳山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1872, 175, '371100', 'area_code', 3, '371101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1873, 175, '371100', 'area_code', 3, '371102', '东港区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1874, 175, '371100', 'area_code', 3, '371103', '岚山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1875, 175, '371100', 'area_code', 3, '371121', '五莲县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1876, 175, '371100', 'area_code', 3, '371122', '莒县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1877, 175, '371100', 'area_code', 3, '371171', '日照经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1878, 176, '371300', 'area_code', 3, '371301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1879, 176, '371300', 'area_code', 3, '371302', '兰山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1880, 176, '371300', 'area_code', 3, '371311', '罗庄区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1881, 176, '371300', 'area_code', 3, '371312', '河东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1882, 176, '371300', 'area_code', 3, '371321', '沂南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1883, 176, '371300', 'area_code', 3, '371322', '郯城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1884, 176, '371300', 'area_code', 3, '371323', '沂水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1885, 176, '371300', 'area_code', 3, '371324', '兰陵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1886, 176, '371300', 'area_code', 3, '371325', '费县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1887, 176, '371300', 'area_code', 3, '371326', '平邑县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1888, 176, '371300', 'area_code', 3, '371327', '莒南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1889, 176, '371300', 'area_code', 3, '371328', '蒙阴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1890, 176, '371300', 'area_code', 3, '371329', '临沭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1891, 176, '371300', 'area_code', 3, '371371', '临沂高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1892, 177, '371400', 'area_code', 3, '371401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1893, 177, '371400', 'area_code', 3, '371402', '德城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1894, 177, '371400', 'area_code', 3, '371403', '陵城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1895, 177, '371400', 'area_code', 3, '371422', '宁津县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1896, 177, '371400', 'area_code', 3, '371423', '庆云县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1897, 177, '371400', 'area_code', 3, '371424', '临邑县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1898, 177, '371400', 'area_code', 3, '371425', '齐河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1899, 177, '371400', 'area_code', 3, '371426', '平原县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1900, 177, '371400', 'area_code', 3, '371427', '夏津县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1901, 177, '371400', 'area_code', 3, '371428', '武城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1902, 177, '371400', 'area_code', 3, '371471', '德州经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1903, 177, '371400', 'area_code', 3, '371472', '德州运河经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1904, 177, '371400', 'area_code', 3, '371481', '乐陵市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1905, 177, '371400', 'area_code', 3, '371482', '禹城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1906, 178, '371500', 'area_code', 3, '371501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1907, 178, '371500', 'area_code', 3, '371502', '东昌府区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1908, 178, '371500', 'area_code', 3, '371503', '茌平区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1909, 178, '371500', 'area_code', 3, '371521', '阳谷县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1910, 178, '371500', 'area_code', 3, '371522', '莘县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1911, 178, '371500', 'area_code', 3, '371524', '东阿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1912, 178, '371500', 'area_code', 3, '371525', '冠县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1913, 178, '371500', 'area_code', 3, '371526', '高唐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1914, 178, '371500', 'area_code', 3, '371581', '临清市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1915, 179, '371600', 'area_code', 3, '371601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1916, 179, '371600', 'area_code', 3, '371602', '滨城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1917, 179, '371600', 'area_code', 3, '371603', '沾化区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1918, 179, '371600', 'area_code', 3, '371621', '惠民县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1919, 179, '371600', 'area_code', 3, '371622', '阳信县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1920, 179, '371600', 'area_code', 3, '371623', '无棣县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1921, 179, '371600', 'area_code', 3, '371625', '博兴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1922, 179, '371600', 'area_code', 3, '371681', '邹平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1923, 180, '371700', 'area_code', 3, '371701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1924, 180, '371700', 'area_code', 3, '371702', '牡丹区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1925, 180, '371700', 'area_code', 3, '371703', '定陶区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1926, 180, '371700', 'area_code', 3, '371721', '曹县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1927, 180, '371700', 'area_code', 3, '371722', '单县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1928, 180, '371700', 'area_code', 3, '371723', '成武县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1929, 180, '371700', 'area_code', 3, '371724', '巨野县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1930, 180, '371700', 'area_code', 3, '371725', '郓城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1931, 180, '371700', 'area_code', 3, '371726', '鄄城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1932, 180, '371700', 'area_code', 3, '371728', '东明县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1933, 180, '371700', 'area_code', 3, '371771', '菏泽经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1934, 180, '371700', 'area_code', 3, '371772', '菏泽高新技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1935, 181, '410100', 'area_code', 3, '410101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1936, 181, '410100', 'area_code', 3, '410102', '中原区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1937, 181, '410100', 'area_code', 3, '410103', '二七区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1938, 181, '410100', 'area_code', 3, '410104', '管城回族区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1939, 181, '410100', 'area_code', 3, '410105', '金水区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1940, 181, '410100', 'area_code', 3, '410106', '上街区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1941, 181, '410100', 'area_code', 3, '410108', '惠济区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1942, 181, '410100', 'area_code', 3, '410122', '中牟县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1943, 181, '410100', 'area_code', 3, '410171', '郑州经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1944, 181, '410100', 'area_code', 3, '410172', '郑州高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1945, 181, '410100', 'area_code', 3, '410173', '郑州航空港经济综合实验区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1946, 181, '410100', 'area_code', 3, '410181', '巩义市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1947, 181, '410100', 'area_code', 3, '410182', '荥阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1948, 181, '410100', 'area_code', 3, '410183', '新密市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1949, 181, '410100', 'area_code', 3, '410184', '新郑市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1950, 181, '410100', 'area_code', 3, '410185', '登封市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1951, 182, '410200', 'area_code', 3, '410201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1952, 182, '410200', 'area_code', 3, '410202', '龙亭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1953, 182, '410200', 'area_code', 3, '410203', '顺河回族区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1954, 182, '410200', 'area_code', 3, '410204', '鼓楼区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1955, 182, '410200', 'area_code', 3, '410205', '禹王台区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1956, 182, '410200', 'area_code', 3, '410212', '祥符区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1957, 182, '410200', 'area_code', 3, '410221', '杞县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1958, 182, '410200', 'area_code', 3, '410222', '通许县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1959, 182, '410200', 'area_code', 3, '410223', '尉氏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1960, 182, '410200', 'area_code', 3, '410225', '兰考县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1961, 183, '410300', 'area_code', 3, '410301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1962, 183, '410300', 'area_code', 3, '410302', '老城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1963, 183, '410300', 'area_code', 3, '410303', '西工区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1964, 183, '410300', 'area_code', 3, '410304', '瀍河回族区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1965, 183, '410300', 'area_code', 3, '410305', '涧西区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1966, 183, '410300', 'area_code', 3, '410306', '吉利区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1967, 183, '410300', 'area_code', 3, '410311', '洛龙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1968, 183, '410300', 'area_code', 3, '410322', '孟津县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1969, 183, '410300', 'area_code', 3, '410323', '新安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1970, 183, '410300', 'area_code', 3, '410324', '栾川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1971, 183, '410300', 'area_code', 3, '410325', '嵩县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1972, 183, '410300', 'area_code', 3, '410326', '汝阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1973, 183, '410300', 'area_code', 3, '410327', '宜阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1974, 183, '410300', 'area_code', 3, '410328', '洛宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1975, 183, '410300', 'area_code', 3, '410329', '伊川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1976, 183, '410300', 'area_code', 3, '410371', '洛阳高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1977, 183, '410300', 'area_code', 3, '410381', '偃师市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1978, 184, '410400', 'area_code', 3, '410401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1979, 184, '410400', 'area_code', 3, '410402', '新华区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1980, 184, '410400', 'area_code', 3, '410403', '卫东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1981, 184, '410400', 'area_code', 3, '410404', '石龙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1982, 184, '410400', 'area_code', 3, '410411', '湛河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1983, 184, '410400', 'area_code', 3, '410421', '宝丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1984, 184, '410400', 'area_code', 3, '410422', '叶县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1985, 184, '410400', 'area_code', 3, '410423', '鲁山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1986, 184, '410400', 'area_code', 3, '410425', '郏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1987, 184, '410400', 'area_code', 3, '410471', '平顶山高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1988, 184, '410400', 'area_code', 3, '410472', '平顶山市城乡一体化示范区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (1989, 184, '410400', 'area_code', 3, '410481', '舞钢市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1990, 184, '410400', 'area_code', 3, '410482', '汝州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1991, 185, '410500', 'area_code', 3, '410501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1992, 185, '410500', 'area_code', 3, '410502', '文峰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1993, 185, '410500', 'area_code', 3, '410503', '北关区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1994, 185, '410500', 'area_code', 3, '410505', '殷都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1995, 185, '410500', 'area_code', 3, '410506', '龙安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1996, 185, '410500', 'area_code', 3, '410522', '安阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1997, 185, '410500', 'area_code', 3, '410523', '汤阴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1998, 185, '410500', 'area_code', 3, '410526', '滑县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (1999, 185, '410500', 'area_code', 3, '410527', '内黄县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2000, 185, '410500', 'area_code', 3, '410571', '安阳高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2001, 185, '410500', 'area_code', 3, '410581', '林州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2002, 186, '410600', 'area_code', 3, '410601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2003, 186, '410600', 'area_code', 3, '410602', '鹤山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2004, 186, '410600', 'area_code', 3, '410603', '山城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2005, 186, '410600', 'area_code', 3, '410611', '淇滨区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2006, 186, '410600', 'area_code', 3, '410621', '浚县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2007, 186, '410600', 'area_code', 3, '410622', '淇县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2008, 186, '410600', 'area_code', 3, '410671', '鹤壁经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2009, 187, '410700', 'area_code', 3, '410701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2010, 187, '410700', 'area_code', 3, '410702', '红旗区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2011, 187, '410700', 'area_code', 3, '410703', '卫滨区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2012, 187, '410700', 'area_code', 3, '410704', '凤泉区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2013, 187, '410700', 'area_code', 3, '410711', '牧野区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2014, 187, '410700', 'area_code', 3, '410721', '新乡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2015, 187, '410700', 'area_code', 3, '410724', '获嘉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2016, 187, '410700', 'area_code', 3, '410725', '原阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2017, 187, '410700', 'area_code', 3, '410726', '延津县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2018, 187, '410700', 'area_code', 3, '410727', '封丘县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2019, 187, '410700', 'area_code', 3, '410771', '新乡高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2020, 187, '410700', 'area_code', 3, '410772', '新乡经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2021, 187, '410700', 'area_code', 3, '410773', '新乡市平原城乡一体化示范区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL,
        NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2022, 187, '410700', 'area_code', 3, '410781', '卫辉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2023, 187, '410700', 'area_code', 3, '410782', '辉县市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2024, 187, '410700', 'area_code', 3, '410783', '长垣市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2025, 188, '410800', 'area_code', 3, '410801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2026, 188, '410800', 'area_code', 3, '410802', '解放区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2027, 188, '410800', 'area_code', 3, '410803', '中站区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2028, 188, '410800', 'area_code', 3, '410804', '马村区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2029, 188, '410800', 'area_code', 3, '410811', '山阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2030, 188, '410800', 'area_code', 3, '410821', '修武县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2031, 188, '410800', 'area_code', 3, '410822', '博爱县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2032, 188, '410800', 'area_code', 3, '410823', '武陟县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2033, 188, '410800', 'area_code', 3, '410825', '温县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2034, 188, '410800', 'area_code', 3, '410871', '焦作城乡一体化示范区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2035, 188, '410800', 'area_code', 3, '410882', '沁阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2036, 188, '410800', 'area_code', 3, '410883', '孟州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2037, 189, '410900', 'area_code', 3, '410901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2038, 189, '410900', 'area_code', 3, '410902', '华龙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2039, 189, '410900', 'area_code', 3, '410922', '清丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2040, 189, '410900', 'area_code', 3, '410923', '南乐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2041, 189, '410900', 'area_code', 3, '410926', '范县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2042, 189, '410900', 'area_code', 3, '410927', '台前县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2043, 189, '410900', 'area_code', 3, '410928', '濮阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2044, 189, '410900', 'area_code', 3, '410971', '河南濮阳工业园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2045, 189, '410900', 'area_code', 3, '410972', '濮阳经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2046, 190, '411000', 'area_code', 3, '411001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2047, 190, '411000', 'area_code', 3, '411002', '魏都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2048, 190, '411000', 'area_code', 3, '411003', '建安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2049, 190, '411000', 'area_code', 3, '411024', '鄢陵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2050, 190, '411000', 'area_code', 3, '411025', '襄城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2051, 190, '411000', 'area_code', 3, '411071', '许昌经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2052, 190, '411000', 'area_code', 3, '411081', '禹州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2053, 190, '411000', 'area_code', 3, '411082', '长葛市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2054, 191, '411100', 'area_code', 3, '411101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2055, 191, '411100', 'area_code', 3, '411102', '源汇区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2056, 191, '411100', 'area_code', 3, '411103', '郾城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2057, 191, '411100', 'area_code', 3, '411104', '召陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2058, 191, '411100', 'area_code', 3, '411121', '舞阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2059, 191, '411100', 'area_code', 3, '411122', '临颍县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2060, 191, '411100', 'area_code', 3, '411171', '漯河经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2061, 192, '411200', 'area_code', 3, '411201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2062, 192, '411200', 'area_code', 3, '411202', '湖滨区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2063, 192, '411200', 'area_code', 3, '411203', '陕州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2064, 192, '411200', 'area_code', 3, '411221', '渑池县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2065, 192, '411200', 'area_code', 3, '411224', '卢氏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2066, 192, '411200', 'area_code', 3, '411271', '河南三门峡经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2067, 192, '411200', 'area_code', 3, '411281', '义马市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2068, 192, '411200', 'area_code', 3, '411282', '灵宝市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2069, 193, '411300', 'area_code', 3, '411301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2070, 193, '411300', 'area_code', 3, '411302', '宛城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2071, 193, '411300', 'area_code', 3, '411303', '卧龙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2072, 193, '411300', 'area_code', 3, '411321', '南召县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2073, 193, '411300', 'area_code', 3, '411322', '方城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2074, 193, '411300', 'area_code', 3, '411323', '西峡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2075, 193, '411300', 'area_code', 3, '411324', '镇平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2076, 193, '411300', 'area_code', 3, '411325', '内乡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2077, 193, '411300', 'area_code', 3, '411326', '淅川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2078, 193, '411300', 'area_code', 3, '411327', '社旗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2079, 193, '411300', 'area_code', 3, '411328', '唐河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2080, 193, '411300', 'area_code', 3, '411329', '新野县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2081, 193, '411300', 'area_code', 3, '411330', '桐柏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2082, 193, '411300', 'area_code', 3, '411371', '南阳高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2083, 193, '411300', 'area_code', 3, '411372', '南阳市城乡一体化示范区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2084, 193, '411300', 'area_code', 3, '411381', '邓州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2085, 194, '411400', 'area_code', 3, '411401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2086, 194, '411400', 'area_code', 3, '411402', '梁园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2087, 194, '411400', 'area_code', 3, '411403', '睢阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2088, 194, '411400', 'area_code', 3, '411421', '民权县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2089, 194, '411400', 'area_code', 3, '411422', '睢县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2090, 194, '411400', 'area_code', 3, '411423', '宁陵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2091, 194, '411400', 'area_code', 3, '411424', '柘城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2092, 194, '411400', 'area_code', 3, '411425', '虞城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2093, 194, '411400', 'area_code', 3, '411426', '夏邑县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2094, 194, '411400', 'area_code', 3, '411471', '豫东综合物流产业聚集区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2095, 194, '411400', 'area_code', 3, '411472', '河南商丘经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2096, 194, '411400', 'area_code', 3, '411481', '永城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2097, 195, '411500', 'area_code', 3, '411501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2098, 195, '411500', 'area_code', 3, '411502', '浉河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2099, 195, '411500', 'area_code', 3, '411503', '平桥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2100, 195, '411500', 'area_code', 3, '411521', '罗山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2101, 195, '411500', 'area_code', 3, '411522', '光山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2102, 195, '411500', 'area_code', 3, '411523', '新县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2103, 195, '411500', 'area_code', 3, '411524', '商城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2104, 195, '411500', 'area_code', 3, '411525', '固始县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2105, 195, '411500', 'area_code', 3, '411526', '潢川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2106, 195, '411500', 'area_code', 3, '411527', '淮滨县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2107, 195, '411500', 'area_code', 3, '411528', '息县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2108, 195, '411500', 'area_code', 3, '411571', '信阳高新技术产业开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2109, 196, '411600', 'area_code', 3, '411601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2110, 196, '411600', 'area_code', 3, '411602', '川汇区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2111, 196, '411600', 'area_code', 3, '411603', '淮阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2112, 196, '411600', 'area_code', 3, '411621', '扶沟县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2113, 196, '411600', 'area_code', 3, '411622', '西华县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2114, 196, '411600', 'area_code', 3, '411623', '商水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2115, 196, '411600', 'area_code', 3, '411624', '沈丘县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2116, 196, '411600', 'area_code', 3, '411625', '郸城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2117, 196, '411600', 'area_code', 3, '411627', '太康县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2118, 196, '411600', 'area_code', 3, '411628', '鹿邑县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2119, 196, '411600', 'area_code', 3, '411671', '河南周口经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2120, 196, '411600', 'area_code', 3, '411681', '项城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2121, 197, '411700', 'area_code', 3, '411701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2122, 197, '411700', 'area_code', 3, '411702', '驿城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2123, 197, '411700', 'area_code', 3, '411721', '西平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2124, 197, '411700', 'area_code', 3, '411722', '上蔡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2125, 197, '411700', 'area_code', 3, '411723', '平舆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2126, 197, '411700', 'area_code', 3, '411724', '正阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2127, 197, '411700', 'area_code', 3, '411725', '确山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2128, 197, '411700', 'area_code', 3, '411726', '泌阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2129, 197, '411700', 'area_code', 3, '411727', '汝南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2130, 197, '411700', 'area_code', 3, '411728', '遂平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2131, 197, '411700', 'area_code', 3, '411729', '新蔡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2132, 197, '411700', 'area_code', 3, '411771', '河南驻马店经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2133, 198, '419000', 'area_code', 3, '419001', '济源市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2134, 199, '420100', 'area_code', 3, '420101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2135, 199, '420100', 'area_code', 3, '420102', '江岸区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2136, 199, '420100', 'area_code', 3, '420103', '江汉区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2137, 199, '420100', 'area_code', 3, '420104', '硚口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2138, 199, '420100', 'area_code', 3, '420105', '汉阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2139, 199, '420100', 'area_code', 3, '420106', '武昌区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2140, 199, '420100', 'area_code', 3, '420107', '青山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2141, 199, '420100', 'area_code', 3, '420111', '洪山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2142, 199, '420100', 'area_code', 3, '420112', '东西湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2143, 199, '420100', 'area_code', 3, '420113', '汉南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2144, 199, '420100', 'area_code', 3, '420114', '蔡甸区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2145, 199, '420100', 'area_code', 3, '420115', '江夏区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2146, 199, '420100', 'area_code', 3, '420116', '黄陂区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2147, 199, '420100', 'area_code', 3, '420117', '新洲区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2148, 200, '420200', 'area_code', 3, '420201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2149, 200, '420200', 'area_code', 3, '420202', '黄石港区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2150, 200, '420200', 'area_code', 3, '420203', '西塞山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2151, 200, '420200', 'area_code', 3, '420204', '下陆区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2152, 200, '420200', 'area_code', 3, '420205', '铁山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2153, 200, '420200', 'area_code', 3, '420222', '阳新县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2154, 200, '420200', 'area_code', 3, '420281', '大冶市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2155, 201, '420300', 'area_code', 3, '420301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2156, 201, '420300', 'area_code', 3, '420302', '茅箭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2157, 201, '420300', 'area_code', 3, '420303', '张湾区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2158, 201, '420300', 'area_code', 3, '420304', '郧阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2159, 201, '420300', 'area_code', 3, '420322', '郧西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2160, 201, '420300', 'area_code', 3, '420323', '竹山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2161, 201, '420300', 'area_code', 3, '420324', '竹溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2162, 201, '420300', 'area_code', 3, '420325', '房县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2163, 201, '420300', 'area_code', 3, '420381', '丹江口市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2164, 202, '420500', 'area_code', 3, '420501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2165, 202, '420500', 'area_code', 3, '420502', '西陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2166, 202, '420500', 'area_code', 3, '420503', '伍家岗区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2167, 202, '420500', 'area_code', 3, '420504', '点军区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2168, 202, '420500', 'area_code', 3, '420505', '猇亭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2169, 202, '420500', 'area_code', 3, '420506', '夷陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2170, 202, '420500', 'area_code', 3, '420525', '远安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2171, 202, '420500', 'area_code', 3, '420526', '兴山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2172, 202, '420500', 'area_code', 3, '420527', '秭归县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2173, 202, '420500', 'area_code', 3, '420528', '长阳土家族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2174, 202, '420500', 'area_code', 3, '420529', '五峰土家族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2175, 202, '420500', 'area_code', 3, '420581', '宜都市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2176, 202, '420500', 'area_code', 3, '420582', '当阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2177, 202, '420500', 'area_code', 3, '420583', '枝江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2178, 203, '420600', 'area_code', 3, '420601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2179, 203, '420600', 'area_code', 3, '420602', '襄城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2180, 203, '420600', 'area_code', 3, '420606', '樊城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2181, 203, '420600', 'area_code', 3, '420607', '襄州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2182, 203, '420600', 'area_code', 3, '420624', '南漳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2183, 203, '420600', 'area_code', 3, '420625', '谷城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2184, 203, '420600', 'area_code', 3, '420626', '保康县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2185, 203, '420600', 'area_code', 3, '420682', '老河口市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2186, 203, '420600', 'area_code', 3, '420683', '枣阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2187, 203, '420600', 'area_code', 3, '420684', '宜城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2188, 204, '420700', 'area_code', 3, '420701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2189, 204, '420700', 'area_code', 3, '420702', '梁子湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2190, 204, '420700', 'area_code', 3, '420703', '华容区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2191, 204, '420700', 'area_code', 3, '420704', '鄂城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2192, 205, '420800', 'area_code', 3, '420801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2193, 205, '420800', 'area_code', 3, '420802', '东宝区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2194, 205, '420800', 'area_code', 3, '420804', '掇刀区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2195, 205, '420800', 'area_code', 3, '420822', '沙洋县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2196, 205, '420800', 'area_code', 3, '420881', '钟祥市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2197, 205, '420800', 'area_code', 3, '420882', '京山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2198, 206, '420900', 'area_code', 3, '420901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2199, 206, '420900', 'area_code', 3, '420902', '孝南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2200, 206, '420900', 'area_code', 3, '420921', '孝昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2201, 206, '420900', 'area_code', 3, '420922', '大悟县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2202, 206, '420900', 'area_code', 3, '420923', '云梦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2203, 206, '420900', 'area_code', 3, '420981', '应城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2204, 206, '420900', 'area_code', 3, '420982', '安陆市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2205, 206, '420900', 'area_code', 3, '420984', '汉川市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2206, 207, '421000', 'area_code', 3, '421001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2207, 207, '421000', 'area_code', 3, '421002', '沙市区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2208, 207, '421000', 'area_code', 3, '421003', '荆州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2209, 207, '421000', 'area_code', 3, '421022', '公安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2210, 207, '421000', 'area_code', 3, '421023', '监利县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2211, 207, '421000', 'area_code', 3, '421024', '江陵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2212, 207, '421000', 'area_code', 3, '421071', '荆州经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2213, 207, '421000', 'area_code', 3, '421081', '石首市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2214, 207, '421000', 'area_code', 3, '421083', '洪湖市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2215, 207, '421000', 'area_code', 3, '421087', '松滋市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2216, 208, '421100', 'area_code', 3, '421101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2217, 208, '421100', 'area_code', 3, '421102', '黄州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2218, 208, '421100', 'area_code', 3, '421121', '团风县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2219, 208, '421100', 'area_code', 3, '421122', '红安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2220, 208, '421100', 'area_code', 3, '421123', '罗田县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2221, 208, '421100', 'area_code', 3, '421124', '英山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2222, 208, '421100', 'area_code', 3, '421125', '浠水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2223, 208, '421100', 'area_code', 3, '421126', '蕲春县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2224, 208, '421100', 'area_code', 3, '421127', '黄梅县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2225, 208, '421100', 'area_code', 3, '421171', '龙感湖管理区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2226, 208, '421100', 'area_code', 3, '421181', '麻城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2227, 208, '421100', 'area_code', 3, '421182', '武穴市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2228, 209, '421200', 'area_code', 3, '421201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2229, 209, '421200', 'area_code', 3, '421202', '咸安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2230, 209, '421200', 'area_code', 3, '421221', '嘉鱼县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2231, 209, '421200', 'area_code', 3, '421222', '通城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2232, 209, '421200', 'area_code', 3, '421223', '崇阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2233, 209, '421200', 'area_code', 3, '421224', '通山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2234, 209, '421200', 'area_code', 3, '421281', '赤壁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2235, 210, '421300', 'area_code', 3, '421301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2236, 210, '421300', 'area_code', 3, '421303', '曾都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2237, 210, '421300', 'area_code', 3, '421321', '随县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2238, 210, '421300', 'area_code', 3, '421381', '广水市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2239, 211, '422800', 'area_code', 3, '422801', '恩施市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2240, 211, '422800', 'area_code', 3, '422802', '利川市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2241, 211, '422800', 'area_code', 3, '422822', '建始县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2242, 211, '422800', 'area_code', 3, '422823', '巴东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2243, 211, '422800', 'area_code', 3, '422825', '宣恩县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2244, 211, '422800', 'area_code', 3, '422826', '咸丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2245, 211, '422800', 'area_code', 3, '422827', '来凤县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2246, 211, '422800', 'area_code', 3, '422828', '鹤峰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2247, 212, '429000', 'area_code', 3, '429004', '仙桃市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2248, 212, '429000', 'area_code', 3, '429005', '潜江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2249, 212, '429000', 'area_code', 3, '429006', '天门市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2250, 212, '429000', 'area_code', 3, '429021', '神农架林区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2251, 213, '430100', 'area_code', 3, '430101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2252, 213, '430100', 'area_code', 3, '430102', '芙蓉区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2253, 213, '430100', 'area_code', 3, '430103', '天心区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2254, 213, '430100', 'area_code', 3, '430104', '岳麓区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2255, 213, '430100', 'area_code', 3, '430105', '开福区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2256, 213, '430100', 'area_code', 3, '430111', '雨花区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2257, 213, '430100', 'area_code', 3, '430112', '望城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2258, 213, '430100', 'area_code', 3, '430121', '长沙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2259, 213, '430100', 'area_code', 3, '430181', '浏阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2260, 213, '430100', 'area_code', 3, '430182', '宁乡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2261, 214, '430200', 'area_code', 3, '430201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2262, 214, '430200', 'area_code', 3, '430202', '荷塘区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2263, 214, '430200', 'area_code', 3, '430203', '芦淞区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2264, 214, '430200', 'area_code', 3, '430204', '石峰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2265, 214, '430200', 'area_code', 3, '430211', '天元区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2266, 214, '430200', 'area_code', 3, '430212', '渌口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2267, 214, '430200', 'area_code', 3, '430223', '攸县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2268, 214, '430200', 'area_code', 3, '430224', '茶陵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2269, 214, '430200', 'area_code', 3, '430225', '炎陵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2270, 214, '430200', 'area_code', 3, '430271', '云龙示范区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2271, 214, '430200', 'area_code', 3, '430281', '醴陵市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2272, 215, '430300', 'area_code', 3, '430301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2273, 215, '430300', 'area_code', 3, '430302', '雨湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2274, 215, '430300', 'area_code', 3, '430304', '岳塘区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2275, 215, '430300', 'area_code', 3, '430321', '湘潭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2276, 215, '430300', 'area_code', 3, '430371', '湖南湘潭高新技术产业园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2277, 215, '430300', 'area_code', 3, '430372', '湘潭昭山示范区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2278, 215, '430300', 'area_code', 3, '430373', '湘潭九华示范区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2279, 215, '430300', 'area_code', 3, '430381', '湘乡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2280, 215, '430300', 'area_code', 3, '430382', '韶山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2281, 216, '430400', 'area_code', 3, '430401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2282, 216, '430400', 'area_code', 3, '430405', '珠晖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2283, 216, '430400', 'area_code', 3, '430406', '雁峰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2284, 216, '430400', 'area_code', 3, '430407', '石鼓区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2285, 216, '430400', 'area_code', 3, '430408', '蒸湘区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2286, 216, '430400', 'area_code', 3, '430412', '南岳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2287, 216, '430400', 'area_code', 3, '430421', '衡阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2288, 216, '430400', 'area_code', 3, '430422', '衡南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2289, 216, '430400', 'area_code', 3, '430423', '衡山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2290, 216, '430400', 'area_code', 3, '430424', '衡东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2291, 216, '430400', 'area_code', 3, '430426', '祁东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2292, 216, '430400', 'area_code', 3, '430471', '衡阳综合保税区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2293, 216, '430400', 'area_code', 3, '430472', '湖南衡阳高新技术产业园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2294, 216, '430400', 'area_code', 3, '430473', '湖南衡阳松木经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2295, 216, '430400', 'area_code', 3, '430481', '耒阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2296, 216, '430400', 'area_code', 3, '430482', '常宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2297, 217, '430500', 'area_code', 3, '430501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2298, 217, '430500', 'area_code', 3, '430502', '双清区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2299, 217, '430500', 'area_code', 3, '430503', '大祥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2300, 217, '430500', 'area_code', 3, '430511', '北塔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2301, 217, '430500', 'area_code', 3, '430522', '新邵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2302, 217, '430500', 'area_code', 3, '430523', '邵阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2303, 217, '430500', 'area_code', 3, '430524', '隆回县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2304, 217, '430500', 'area_code', 3, '430525', '洞口县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2305, 217, '430500', 'area_code', 3, '430527', '绥宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2306, 217, '430500', 'area_code', 3, '430528', '新宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2307, 217, '430500', 'area_code', 3, '430529', '城步苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2308, 217, '430500', 'area_code', 3, '430581', '武冈市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2309, 217, '430500', 'area_code', 3, '430582', '邵东市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2310, 218, '430600', 'area_code', 3, '430601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2311, 218, '430600', 'area_code', 3, '430602', '岳阳楼区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2312, 218, '430600', 'area_code', 3, '430603', '云溪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2313, 218, '430600', 'area_code', 3, '430611', '君山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2314, 218, '430600', 'area_code', 3, '430621', '岳阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2315, 218, '430600', 'area_code', 3, '430623', '华容县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2316, 218, '430600', 'area_code', 3, '430624', '湘阴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2317, 218, '430600', 'area_code', 3, '430626', '平江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2318, 218, '430600', 'area_code', 3, '430671', '岳阳市屈原管理区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2319, 218, '430600', 'area_code', 3, '430681', '汨罗市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2320, 218, '430600', 'area_code', 3, '430682', '临湘市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2321, 219, '430700', 'area_code', 3, '430701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2322, 219, '430700', 'area_code', 3, '430702', '武陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2323, 219, '430700', 'area_code', 3, '430703', '鼎城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2324, 219, '430700', 'area_code', 3, '430721', '安乡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2325, 219, '430700', 'area_code', 3, '430722', '汉寿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2326, 219, '430700', 'area_code', 3, '430723', '澧县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2327, 219, '430700', 'area_code', 3, '430724', '临澧县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2328, 219, '430700', 'area_code', 3, '430725', '桃源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2329, 219, '430700', 'area_code', 3, '430726', '石门县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2330, 219, '430700', 'area_code', 3, '430771', '常德市西洞庭管理区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2331, 219, '430700', 'area_code', 3, '430781', '津市市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2332, 220, '430800', 'area_code', 3, '430801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2333, 220, '430800', 'area_code', 3, '430802', '永定区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2334, 220, '430800', 'area_code', 3, '430811', '武陵源区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2335, 220, '430800', 'area_code', 3, '430821', '慈利县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2336, 220, '430800', 'area_code', 3, '430822', '桑植县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2337, 221, '430900', 'area_code', 3, '430901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2338, 221, '430900', 'area_code', 3, '430902', '资阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2339, 221, '430900', 'area_code', 3, '430903', '赫山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2340, 221, '430900', 'area_code', 3, '430921', '南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2341, 221, '430900', 'area_code', 3, '430922', '桃江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2342, 221, '430900', 'area_code', 3, '430923', '安化县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2343, 221, '430900', 'area_code', 3, '430971', '益阳市大通湖管理区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2344, 221, '430900', 'area_code', 3, '430972', '湖南益阳高新技术产业园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2345, 221, '430900', 'area_code', 3, '430981', '沅江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2346, 222, '431000', 'area_code', 3, '431001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2347, 222, '431000', 'area_code', 3, '431002', '北湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2348, 222, '431000', 'area_code', 3, '431003', '苏仙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2349, 222, '431000', 'area_code', 3, '431021', '桂阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2350, 222, '431000', 'area_code', 3, '431022', '宜章县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2351, 222, '431000', 'area_code', 3, '431023', '永兴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2352, 222, '431000', 'area_code', 3, '431024', '嘉禾县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2353, 222, '431000', 'area_code', 3, '431025', '临武县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2354, 222, '431000', 'area_code', 3, '431026', '汝城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2355, 222, '431000', 'area_code', 3, '431027', '桂东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2356, 222, '431000', 'area_code', 3, '431028', '安仁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2357, 222, '431000', 'area_code', 3, '431081', '资兴市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2358, 223, '431100', 'area_code', 3, '431101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2359, 223, '431100', 'area_code', 3, '431102', '零陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2360, 223, '431100', 'area_code', 3, '431103', '冷水滩区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2361, 223, '431100', 'area_code', 3, '431121', '祁阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2362, 223, '431100', 'area_code', 3, '431122', '东安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2363, 223, '431100', 'area_code', 3, '431123', '双牌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2364, 223, '431100', 'area_code', 3, '431124', '道县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2365, 223, '431100', 'area_code', 3, '431125', '江永县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2366, 223, '431100', 'area_code', 3, '431126', '宁远县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2367, 223, '431100', 'area_code', 3, '431127', '蓝山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2368, 223, '431100', 'area_code', 3, '431128', '新田县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2369, 223, '431100', 'area_code', 3, '431129', '江华瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2370, 223, '431100', 'area_code', 3, '431171', '永州经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2371, 223, '431100', 'area_code', 3, '431172', '永州市金洞管理区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2372, 223, '431100', 'area_code', 3, '431173', '永州市回龙圩管理区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2373, 224, '431200', 'area_code', 3, '431201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2374, 224, '431200', 'area_code', 3, '431202', '鹤城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2375, 224, '431200', 'area_code', 3, '431221', '中方县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2376, 224, '431200', 'area_code', 3, '431222', '沅陵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2377, 224, '431200', 'area_code', 3, '431223', '辰溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2378, 224, '431200', 'area_code', 3, '431224', '溆浦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2379, 224, '431200', 'area_code', 3, '431225', '会同县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2380, 224, '431200', 'area_code', 3, '431226', '麻阳苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2381, 224, '431200', 'area_code', 3, '431227', '新晃侗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2382, 224, '431200', 'area_code', 3, '431228', '芷江侗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2383, 224, '431200', 'area_code', 3, '431229', '靖州苗族侗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2384, 224, '431200', 'area_code', 3, '431230', '通道侗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2385, 224, '431200', 'area_code', 3, '431271', '怀化市洪江管理区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2386, 224, '431200', 'area_code', 3, '431281', '洪江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2387, 225, '431300', 'area_code', 3, '431301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2388, 225, '431300', 'area_code', 3, '431302', '娄星区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2389, 225, '431300', 'area_code', 3, '431321', '双峰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2390, 225, '431300', 'area_code', 3, '431322', '新化县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2391, 225, '431300', 'area_code', 3, '431381', '冷水江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2392, 225, '431300', 'area_code', 3, '431382', '涟源市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2393, 226, '433100', 'area_code', 3, '433101', '吉首市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2394, 226, '433100', 'area_code', 3, '433122', '泸溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2395, 226, '433100', 'area_code', 3, '433123', '凤凰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2396, 226, '433100', 'area_code', 3, '433124', '花垣县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2397, 226, '433100', 'area_code', 3, '433125', '保靖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2398, 226, '433100', 'area_code', 3, '433126', '古丈县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2399, 226, '433100', 'area_code', 3, '433127', '永顺县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2400, 226, '433100', 'area_code', 3, '433130', '龙山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2401, 227, '440100', 'area_code', 3, '440101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2402, 227, '440100', 'area_code', 3, '440103', '荔湾区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2403, 227, '440100', 'area_code', 3, '440104', '越秀区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2404, 227, '440100', 'area_code', 3, '440105', '海珠区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2405, 227, '440100', 'area_code', 3, '440106', '天河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2406, 227, '440100', 'area_code', 3, '440111', '白云区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2407, 227, '440100', 'area_code', 3, '440112', '黄埔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2408, 227, '440100', 'area_code', 3, '440113', '番禺区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2409, 227, '440100', 'area_code', 3, '440114', '花都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2410, 227, '440100', 'area_code', 3, '440115', '南沙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2411, 227, '440100', 'area_code', 3, '440117', '从化区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2412, 227, '440100', 'area_code', 3, '440118', '增城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2413, 228, '440200', 'area_code', 3, '440201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2414, 228, '440200', 'area_code', 3, '440203', '武江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2415, 228, '440200', 'area_code', 3, '440204', '浈江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2416, 228, '440200', 'area_code', 3, '440205', '曲江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2417, 228, '440200', 'area_code', 3, '440222', '始兴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2418, 228, '440200', 'area_code', 3, '440224', '仁化县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2419, 228, '440200', 'area_code', 3, '440229', '翁源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2420, 228, '440200', 'area_code', 3, '440232', '乳源瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2421, 228, '440200', 'area_code', 3, '440233', '新丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2422, 228, '440200', 'area_code', 3, '440281', '乐昌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2423, 228, '440200', 'area_code', 3, '440282', '南雄市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2424, 229, '440300', 'area_code', 3, '440301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2425, 229, '440300', 'area_code', 3, '440303', '罗湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2426, 229, '440300', 'area_code', 3, '440304', '福田区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2427, 229, '440300', 'area_code', 3, '440305', '南山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2428, 229, '440300', 'area_code', 3, '440306', '宝安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2429, 229, '440300', 'area_code', 3, '440307', '龙岗区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2430, 229, '440300', 'area_code', 3, '440308', '盐田区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2431, 229, '440300', 'area_code', 3, '440309', '龙华区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2432, 229, '440300', 'area_code', 3, '440310', '坪山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2433, 229, '440300', 'area_code', 3, '440311', '光明区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2434, 230, '440400', 'area_code', 3, '440401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2435, 230, '440400', 'area_code', 3, '440402', '香洲区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2436, 230, '440400', 'area_code', 3, '440403', '斗门区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2437, 230, '440400', 'area_code', 3, '440404', '金湾区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2438, 231, '440500', 'area_code', 3, '440501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2439, 231, '440500', 'area_code', 3, '440507', '龙湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2440, 231, '440500', 'area_code', 3, '440511', '金平区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2441, 231, '440500', 'area_code', 3, '440512', '濠江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2442, 231, '440500', 'area_code', 3, '440513', '潮阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2443, 231, '440500', 'area_code', 3, '440514', '潮南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2444, 231, '440500', 'area_code', 3, '440515', '澄海区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2445, 231, '440500', 'area_code', 3, '440523', '南澳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2446, 232, '440600', 'area_code', 3, '440601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2447, 232, '440600', 'area_code', 3, '440604', '禅城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2448, 232, '440600', 'area_code', 3, '440605', '南海区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2449, 232, '440600', 'area_code', 3, '440606', '顺德区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2450, 232, '440600', 'area_code', 3, '440607', '三水区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2451, 232, '440600', 'area_code', 3, '440608', '高明区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2452, 233, '440700', 'area_code', 3, '440701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2453, 233, '440700', 'area_code', 3, '440703', '蓬江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2454, 233, '440700', 'area_code', 3, '440704', '江海区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2455, 233, '440700', 'area_code', 3, '440705', '新会区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2456, 233, '440700', 'area_code', 3, '440781', '台山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2457, 233, '440700', 'area_code', 3, '440783', '开平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2458, 233, '440700', 'area_code', 3, '440784', '鹤山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2459, 233, '440700', 'area_code', 3, '440785', '恩平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2460, 234, '440800', 'area_code', 3, '440801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2461, 234, '440800', 'area_code', 3, '440802', '赤坎区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2462, 234, '440800', 'area_code', 3, '440803', '霞山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2463, 234, '440800', 'area_code', 3, '440804', '坡头区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2464, 234, '440800', 'area_code', 3, '440811', '麻章区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2465, 234, '440800', 'area_code', 3, '440823', '遂溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2466, 234, '440800', 'area_code', 3, '440825', '徐闻县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2467, 234, '440800', 'area_code', 3, '440881', '廉江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2468, 234, '440800', 'area_code', 3, '440882', '雷州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2469, 234, '440800', 'area_code', 3, '440883', '吴川市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2470, 235, '440900', 'area_code', 3, '440901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2471, 235, '440900', 'area_code', 3, '440902', '茂南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2472, 235, '440900', 'area_code', 3, '440904', '电白区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2473, 235, '440900', 'area_code', 3, '440981', '高州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2474, 235, '440900', 'area_code', 3, '440982', '化州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2475, 235, '440900', 'area_code', 3, '440983', '信宜市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2476, 236, '441200', 'area_code', 3, '441201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2477, 236, '441200', 'area_code', 3, '441202', '端州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2478, 236, '441200', 'area_code', 3, '441203', '鼎湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2479, 236, '441200', 'area_code', 3, '441204', '高要区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2480, 236, '441200', 'area_code', 3, '441223', '广宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2481, 236, '441200', 'area_code', 3, '441224', '怀集县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2482, 236, '441200', 'area_code', 3, '441225', '封开县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2483, 236, '441200', 'area_code', 3, '441226', '德庆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2484, 236, '441200', 'area_code', 3, '441284', '四会市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2485, 237, '441300', 'area_code', 3, '441301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2486, 237, '441300', 'area_code', 3, '441302', '惠城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2487, 237, '441300', 'area_code', 3, '441303', '惠阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2488, 237, '441300', 'area_code', 3, '441322', '博罗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2489, 237, '441300', 'area_code', 3, '441323', '惠东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2490, 237, '441300', 'area_code', 3, '441324', '龙门县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2491, 238, '441400', 'area_code', 3, '441401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2492, 238, '441400', 'area_code', 3, '441402', '梅江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2493, 238, '441400', 'area_code', 3, '441403', '梅县区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2494, 238, '441400', 'area_code', 3, '441422', '大埔县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2495, 238, '441400', 'area_code', 3, '441423', '丰顺县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2496, 238, '441400', 'area_code', 3, '441424', '五华县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2497, 238, '441400', 'area_code', 3, '441426', '平远县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2498, 238, '441400', 'area_code', 3, '441427', '蕉岭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2499, 238, '441400', 'area_code', 3, '441481', '兴宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2500, 239, '441500', 'area_code', 3, '441501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2501, 239, '441500', 'area_code', 3, '441502', '城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2502, 239, '441500', 'area_code', 3, '441521', '海丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2503, 239, '441500', 'area_code', 3, '441523', '陆河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2504, 239, '441500', 'area_code', 3, '441581', '陆丰市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2505, 240, '441600', 'area_code', 3, '441601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2506, 240, '441600', 'area_code', 3, '441602', '源城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2507, 240, '441600', 'area_code', 3, '441621', '紫金县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2508, 240, '441600', 'area_code', 3, '441622', '龙川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2509, 240, '441600', 'area_code', 3, '441623', '连平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2510, 240, '441600', 'area_code', 3, '441624', '和平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2511, 240, '441600', 'area_code', 3, '441625', '东源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2512, 241, '441700', 'area_code', 3, '441701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2513, 241, '441700', 'area_code', 3, '441702', '江城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2514, 241, '441700', 'area_code', 3, '441704', '阳东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2515, 241, '441700', 'area_code', 3, '441721', '阳西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2516, 241, '441700', 'area_code', 3, '441781', '阳春市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2517, 242, '441800', 'area_code', 3, '441801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2518, 242, '441800', 'area_code', 3, '441802', '清城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2519, 242, '441800', 'area_code', 3, '441803', '清新区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2520, 242, '441800', 'area_code', 3, '441821', '佛冈县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2521, 242, '441800', 'area_code', 3, '441823', '阳山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2522, 242, '441800', 'area_code', 3, '441825', '连山壮族瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2523, 242, '441800', 'area_code', 3, '441826', '连南瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2524, 242, '441800', 'area_code', 3, '441881', '英德市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2525, 242, '441800', 'area_code', 3, '441882', '连州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2526, 245, '445100', 'area_code', 3, '445101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2527, 245, '445100', 'area_code', 3, '445102', '湘桥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2528, 245, '445100', 'area_code', 3, '445103', '潮安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2529, 245, '445100', 'area_code', 3, '445122', '饶平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2530, 246, '445200', 'area_code', 3, '445201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2531, 246, '445200', 'area_code', 3, '445202', '榕城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2532, 246, '445200', 'area_code', 3, '445203', '揭东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2533, 246, '445200', 'area_code', 3, '445222', '揭西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2534, 246, '445200', 'area_code', 3, '445224', '惠来县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2535, 246, '445200', 'area_code', 3, '445281', '普宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2536, 247, '445300', 'area_code', 3, '445301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2537, 247, '445300', 'area_code', 3, '445302', '云城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2538, 247, '445300', 'area_code', 3, '445303', '云安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2539, 247, '445300', 'area_code', 3, '445321', '新兴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2540, 247, '445300', 'area_code', 3, '445322', '郁南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2541, 247, '445300', 'area_code', 3, '445381', '罗定市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2542, 248, '450100', 'area_code', 3, '450101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2543, 248, '450100', 'area_code', 3, '450102', '兴宁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2544, 248, '450100', 'area_code', 3, '450103', '青秀区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2545, 248, '450100', 'area_code', 3, '450105', '江南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2546, 248, '450100', 'area_code', 3, '450107', '西乡塘区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2547, 248, '450100', 'area_code', 3, '450108', '良庆区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2548, 248, '450100', 'area_code', 3, '450109', '邕宁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2549, 248, '450100', 'area_code', 3, '450110', '武鸣区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2550, 248, '450100', 'area_code', 3, '450123', '隆安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2551, 248, '450100', 'area_code', 3, '450124', '马山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2552, 248, '450100', 'area_code', 3, '450125', '上林县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2553, 248, '450100', 'area_code', 3, '450126', '宾阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2554, 248, '450100', 'area_code', 3, '450127', '横县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2555, 249, '450200', 'area_code', 3, '450201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2556, 249, '450200', 'area_code', 3, '450202', '城中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2557, 249, '450200', 'area_code', 3, '450203', '鱼峰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2558, 249, '450200', 'area_code', 3, '450204', '柳南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2559, 249, '450200', 'area_code', 3, '450205', '柳北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2560, 249, '450200', 'area_code', 3, '450206', '柳江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2561, 249, '450200', 'area_code', 3, '450222', '柳城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2562, 249, '450200', 'area_code', 3, '450223', '鹿寨县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2563, 249, '450200', 'area_code', 3, '450224', '融安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2564, 249, '450200', 'area_code', 3, '450225', '融水苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2565, 249, '450200', 'area_code', 3, '450226', '三江侗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2566, 250, '450300', 'area_code', 3, '450301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2567, 250, '450300', 'area_code', 3, '450302', '秀峰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2568, 250, '450300', 'area_code', 3, '450303', '叠彩区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2569, 250, '450300', 'area_code', 3, '450304', '象山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2570, 250, '450300', 'area_code', 3, '450305', '七星区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2571, 250, '450300', 'area_code', 3, '450311', '雁山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2572, 250, '450300', 'area_code', 3, '450312', '临桂区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2573, 250, '450300', 'area_code', 3, '450321', '阳朔县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2574, 250, '450300', 'area_code', 3, '450323', '灵川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2575, 250, '450300', 'area_code', 3, '450324', '全州县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2576, 250, '450300', 'area_code', 3, '450325', '兴安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2577, 250, '450300', 'area_code', 3, '450326', '永福县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2578, 250, '450300', 'area_code', 3, '450327', '灌阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2579, 250, '450300', 'area_code', 3, '450328', '龙胜各族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2580, 250, '450300', 'area_code', 3, '450329', '资源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2581, 250, '450300', 'area_code', 3, '450330', '平乐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2582, 250, '450300', 'area_code', 3, '450332', '恭城瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2583, 250, '450300', 'area_code', 3, '450381', '荔浦市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2584, 251, '450400', 'area_code', 3, '450401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2585, 251, '450400', 'area_code', 3, '450403', '万秀区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2586, 251, '450400', 'area_code', 3, '450405', '长洲区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2587, 251, '450400', 'area_code', 3, '450406', '龙圩区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2588, 251, '450400', 'area_code', 3, '450421', '苍梧县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2589, 251, '450400', 'area_code', 3, '450422', '藤县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2590, 251, '450400', 'area_code', 3, '450423', '蒙山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2591, 251, '450400', 'area_code', 3, '450481', '岑溪市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2592, 252, '450500', 'area_code', 3, '450501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2593, 252, '450500', 'area_code', 3, '450502', '海城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2594, 252, '450500', 'area_code', 3, '450503', '银海区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2595, 252, '450500', 'area_code', 3, '450512', '铁山港区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2596, 252, '450500', 'area_code', 3, '450521', '合浦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2597, 253, '450600', 'area_code', 3, '450601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2598, 253, '450600', 'area_code', 3, '450602', '港口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2599, 253, '450600', 'area_code', 3, '450603', '防城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2600, 253, '450600', 'area_code', 3, '450621', '上思县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2601, 253, '450600', 'area_code', 3, '450681', '东兴市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2602, 254, '450700', 'area_code', 3, '450701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2603, 254, '450700', 'area_code', 3, '450702', '钦南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2604, 254, '450700', 'area_code', 3, '450703', '钦北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2605, 254, '450700', 'area_code', 3, '450721', '灵山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2606, 254, '450700', 'area_code', 3, '450722', '浦北县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2607, 255, '450800', 'area_code', 3, '450801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2608, 255, '450800', 'area_code', 3, '450802', '港北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2609, 255, '450800', 'area_code', 3, '450803', '港南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2610, 255, '450800', 'area_code', 3, '450804', '覃塘区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2611, 255, '450800', 'area_code', 3, '450821', '平南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2612, 255, '450800', 'area_code', 3, '450881', '桂平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2613, 256, '450900', 'area_code', 3, '450901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2614, 256, '450900', 'area_code', 3, '450902', '玉州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2615, 256, '450900', 'area_code', 3, '450903', '福绵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2616, 256, '450900', 'area_code', 3, '450921', '容县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2617, 256, '450900', 'area_code', 3, '450922', '陆川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2618, 256, '450900', 'area_code', 3, '450923', '博白县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2619, 256, '450900', 'area_code', 3, '450924', '兴业县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2620, 256, '450900', 'area_code', 3, '450981', '北流市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2621, 257, '451000', 'area_code', 3, '451001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2622, 257, '451000', 'area_code', 3, '451002', '右江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2623, 257, '451000', 'area_code', 3, '451003', '田阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2624, 257, '451000', 'area_code', 3, '451022', '田东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2625, 257, '451000', 'area_code', 3, '451024', '德保县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2626, 257, '451000', 'area_code', 3, '451026', '那坡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2627, 257, '451000', 'area_code', 3, '451027', '凌云县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2628, 257, '451000', 'area_code', 3, '451028', '乐业县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2629, 257, '451000', 'area_code', 3, '451029', '田林县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2630, 257, '451000', 'area_code', 3, '451030', '西林县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2631, 257, '451000', 'area_code', 3, '451031', '隆林各族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2632, 257, '451000', 'area_code', 3, '451081', '靖西市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2633, 257, '451000', 'area_code', 3, '451082', '平果市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2634, 258, '451100', 'area_code', 3, '451101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2635, 258, '451100', 'area_code', 3, '451102', '八步区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2636, 258, '451100', 'area_code', 3, '451103', '平桂区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2637, 258, '451100', 'area_code', 3, '451121', '昭平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2638, 258, '451100', 'area_code', 3, '451122', '钟山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2639, 258, '451100', 'area_code', 3, '451123', '富川瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2640, 259, '451200', 'area_code', 3, '451201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2641, 259, '451200', 'area_code', 3, '451202', '金城江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2642, 259, '451200', 'area_code', 3, '451203', '宜州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2643, 259, '451200', 'area_code', 3, '451221', '南丹县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2644, 259, '451200', 'area_code', 3, '451222', '天峨县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2645, 259, '451200', 'area_code', 3, '451223', '凤山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2646, 259, '451200', 'area_code', 3, '451224', '东兰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2647, 259, '451200', 'area_code', 3, '451225', '罗城仫佬族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2648, 259, '451200', 'area_code', 3, '451226', '环江毛南族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2649, 259, '451200', 'area_code', 3, '451227', '巴马瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2650, 259, '451200', 'area_code', 3, '451228', '都安瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2651, 259, '451200', 'area_code', 3, '451229', '大化瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2652, 260, '451300', 'area_code', 3, '451301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2653, 260, '451300', 'area_code', 3, '451302', '兴宾区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2654, 260, '451300', 'area_code', 3, '451321', '忻城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2655, 260, '451300', 'area_code', 3, '451322', '象州县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2656, 260, '451300', 'area_code', 3, '451323', '武宣县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2657, 260, '451300', 'area_code', 3, '451324', '金秀瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2658, 260, '451300', 'area_code', 3, '451381', '合山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2659, 261, '451400', 'area_code', 3, '451401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2660, 261, '451400', 'area_code', 3, '451402', '江州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2661, 261, '451400', 'area_code', 3, '451421', '扶绥县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2662, 261, '451400', 'area_code', 3, '451422', '宁明县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2663, 261, '451400', 'area_code', 3, '451423', '龙州县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2664, 261, '451400', 'area_code', 3, '451424', '大新县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2665, 261, '451400', 'area_code', 3, '451425', '天等县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2666, 261, '451400', 'area_code', 3, '451481', '凭祥市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2667, 262, '460100', 'area_code', 3, '460101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2668, 262, '460100', 'area_code', 3, '460105', '秀英区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2669, 262, '460100', 'area_code', 3, '460106', '龙华区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2670, 262, '460100', 'area_code', 3, '460107', '琼山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2671, 262, '460100', 'area_code', 3, '460108', '美兰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2672, 263, '460200', 'area_code', 3, '460201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2673, 263, '460200', 'area_code', 3, '460202', '海棠区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2674, 263, '460200', 'area_code', 3, '460203', '吉阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2675, 263, '460200', 'area_code', 3, '460204', '天涯区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2676, 263, '460200', 'area_code', 3, '460205', '崖州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2677, 264, '460300', 'area_code', 3, '460321', '西沙群岛', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2678, 264, '460300', 'area_code', 3, '460322', '南沙群岛', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2679, 264, '460300', 'area_code', 3, '460323', '中沙群岛的岛礁及其海域', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2680, 266, '469000', 'area_code', 3, '469001', '五指山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2681, 266, '469000', 'area_code', 3, '469002', '琼海市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2682, 266, '469000', 'area_code', 3, '469005', '文昌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2683, 266, '469000', 'area_code', 3, '469006', '万宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2684, 266, '469000', 'area_code', 3, '469007', '东方市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2685, 266, '469000', 'area_code', 3, '469021', '定安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2686, 266, '469000', 'area_code', 3, '469022', '屯昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2687, 266, '469000', 'area_code', 3, '469023', '澄迈县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2688, 266, '469000', 'area_code', 3, '469024', '临高县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2689, 266, '469000', 'area_code', 3, '469025', '白沙黎族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2690, 266, '469000', 'area_code', 3, '469026', '昌江黎族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2691, 266, '469000', 'area_code', 3, '469027', '乐东黎族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2692, 266, '469000', 'area_code', 3, '469028', '陵水黎族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2693, 266, '469000', 'area_code', 3, '469029', '保亭黎族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2694, 266, '469000', 'area_code', 3, '469030', '琼中黎族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2695, 267, '500100', 'area_code', 3, '500101', '万州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2696, 267, '500100', 'area_code', 3, '500102', '涪陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2697, 267, '500100', 'area_code', 3, '500103', '渝中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2698, 267, '500100', 'area_code', 3, '500104', '大渡口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2699, 267, '500100', 'area_code', 3, '500105', '江北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2700, 267, '500100', 'area_code', 3, '500106', '沙坪坝区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2701, 267, '500100', 'area_code', 3, '500107', '九龙坡区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2702, 267, '500100', 'area_code', 3, '500108', '南岸区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2703, 267, '500100', 'area_code', 3, '500109', '北碚区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2704, 267, '500100', 'area_code', 3, '500110', '綦江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2705, 267, '500100', 'area_code', 3, '500111', '大足区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2706, 267, '500100', 'area_code', 3, '500112', '渝北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2707, 267, '500100', 'area_code', 3, '500113', '巴南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2708, 267, '500100', 'area_code', 3, '500114', '黔江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2709, 267, '500100', 'area_code', 3, '500115', '长寿区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2710, 267, '500100', 'area_code', 3, '500116', '江津区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2711, 267, '500100', 'area_code', 3, '500117', '合川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2712, 267, '500100', 'area_code', 3, '500118', '永川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2713, 267, '500100', 'area_code', 3, '500119', '南川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2714, 267, '500100', 'area_code', 3, '500120', '璧山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2715, 267, '500100', 'area_code', 3, '500151', '铜梁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2716, 267, '500100', 'area_code', 3, '500152', '潼南区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2717, 267, '500100', 'area_code', 3, '500153', '荣昌区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2718, 267, '500100', 'area_code', 3, '500154', '开州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2719, 267, '500100', 'area_code', 3, '500155', '梁平区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2720, 267, '500100', 'area_code', 3, '500156', '武隆区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2721, 268, '500200', 'area_code', 3, '500229', '城口县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2722, 268, '500200', 'area_code', 3, '500230', '丰都县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2723, 268, '500200', 'area_code', 3, '500231', '垫江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2724, 268, '500200', 'area_code', 3, '500233', '忠县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2725, 268, '500200', 'area_code', 3, '500235', '云阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2726, 268, '500200', 'area_code', 3, '500236', '奉节县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2727, 268, '500200', 'area_code', 3, '500237', '巫山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2728, 268, '500200', 'area_code', 3, '500238', '巫溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2729, 268, '500200', 'area_code', 3, '500240', '石柱土家族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2730, 268, '500200', 'area_code', 3, '500241', '秀山土家族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2731, 268, '500200', 'area_code', 3, '500242', '酉阳土家族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2732, 268, '500200', 'area_code', 3, '500243', '彭水苗族土家族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2733, 269, '510100', 'area_code', 3, '510101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2734, 269, '510100', 'area_code', 3, '510104', '锦江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2735, 269, '510100', 'area_code', 3, '510105', '青羊区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2736, 269, '510100', 'area_code', 3, '510106', '金牛区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2737, 269, '510100', 'area_code', 3, '510107', '武侯区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2738, 269, '510100', 'area_code', 3, '510108', '成华区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2739, 269, '510100', 'area_code', 3, '510112', '龙泉驿区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2740, 269, '510100', 'area_code', 3, '510113', '青白江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2741, 269, '510100', 'area_code', 3, '510114', '新都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2742, 269, '510100', 'area_code', 3, '510115', '温江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2743, 269, '510100', 'area_code', 3, '510116', '双流区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2744, 269, '510100', 'area_code', 3, '510117', '郫都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2745, 269, '510100', 'area_code', 3, '510118', '新津区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2746, 269, '510100', 'area_code', 3, '510121', '金堂县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2747, 269, '510100', 'area_code', 3, '510129', '大邑县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2748, 269, '510100', 'area_code', 3, '510131', '蒲江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2749, 269, '510100', 'area_code', 3, '510181', '都江堰市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2750, 269, '510100', 'area_code', 3, '510182', '彭州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2751, 269, '510100', 'area_code', 3, '510183', '邛崃市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2752, 269, '510100', 'area_code', 3, '510184', '崇州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2753, 269, '510100', 'area_code', 3, '510185', '简阳市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2754, 270, '510300', 'area_code', 3, '510301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2755, 270, '510300', 'area_code', 3, '510302', '自流井区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2756, 270, '510300', 'area_code', 3, '510303', '贡井区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2757, 270, '510300', 'area_code', 3, '510304', '大安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2758, 270, '510300', 'area_code', 3, '510311', '沿滩区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2759, 270, '510300', 'area_code', 3, '510321', '荣县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2760, 270, '510300', 'area_code', 3, '510322', '富顺县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2761, 271, '510400', 'area_code', 3, '510401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2762, 271, '510400', 'area_code', 3, '510402', '东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2763, 271, '510400', 'area_code', 3, '510403', '西区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2764, 271, '510400', 'area_code', 3, '510411', '仁和区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2765, 271, '510400', 'area_code', 3, '510421', '米易县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2766, 271, '510400', 'area_code', 3, '510422', '盐边县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2767, 272, '510500', 'area_code', 3, '510501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2768, 272, '510500', 'area_code', 3, '510502', '江阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2769, 272, '510500', 'area_code', 3, '510503', '纳溪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2770, 272, '510500', 'area_code', 3, '510504', '龙马潭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2771, 272, '510500', 'area_code', 3, '510521', '泸县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2772, 272, '510500', 'area_code', 3, '510522', '合江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2773, 272, '510500', 'area_code', 3, '510524', '叙永县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2774, 272, '510500', 'area_code', 3, '510525', '古蔺县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2775, 273, '510600', 'area_code', 3, '510601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2776, 273, '510600', 'area_code', 3, '510603', '旌阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2777, 273, '510600', 'area_code', 3, '510604', '罗江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2778, 273, '510600', 'area_code', 3, '510623', '中江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2779, 273, '510600', 'area_code', 3, '510681', '广汉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2780, 273, '510600', 'area_code', 3, '510682', '什邡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2781, 273, '510600', 'area_code', 3, '510683', '绵竹市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2782, 274, '510700', 'area_code', 3, '510701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2783, 274, '510700', 'area_code', 3, '510703', '涪城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2784, 274, '510700', 'area_code', 3, '510704', '游仙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2785, 274, '510700', 'area_code', 3, '510705', '安州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2786, 274, '510700', 'area_code', 3, '510722', '三台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2787, 274, '510700', 'area_code', 3, '510723', '盐亭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2788, 274, '510700', 'area_code', 3, '510725', '梓潼县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2789, 274, '510700', 'area_code', 3, '510726', '北川羌族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2790, 274, '510700', 'area_code', 3, '510727', '平武县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2791, 274, '510700', 'area_code', 3, '510781', '江油市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2792, 275, '510800', 'area_code', 3, '510801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2793, 275, '510800', 'area_code', 3, '510802', '利州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2794, 275, '510800', 'area_code', 3, '510811', '昭化区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2795, 275, '510800', 'area_code', 3, '510812', '朝天区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2796, 275, '510800', 'area_code', 3, '510821', '旺苍县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2797, 275, '510800', 'area_code', 3, '510822', '青川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2798, 275, '510800', 'area_code', 3, '510823', '剑阁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2799, 275, '510800', 'area_code', 3, '510824', '苍溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2800, 276, '510900', 'area_code', 3, '510901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2801, 276, '510900', 'area_code', 3, '510903', '船山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2802, 276, '510900', 'area_code', 3, '510904', '安居区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2803, 276, '510900', 'area_code', 3, '510921', '蓬溪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2804, 276, '510900', 'area_code', 3, '510923', '大英县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2805, 276, '510900', 'area_code', 3, '510981', '射洪市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2806, 277, '511000', 'area_code', 3, '511001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2807, 277, '511000', 'area_code', 3, '511002', '市中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2808, 277, '511000', 'area_code', 3, '511011', '东兴区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2809, 277, '511000', 'area_code', 3, '511024', '威远县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2810, 277, '511000', 'area_code', 3, '511025', '资中县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2811, 277, '511000', 'area_code', 3, '511071', '内江经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2812, 277, '511000', 'area_code', 3, '511083', '隆昌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2813, 278, '511100', 'area_code', 3, '511101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2814, 278, '511100', 'area_code', 3, '511102', '市中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2815, 278, '511100', 'area_code', 3, '511111', '沙湾区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2816, 278, '511100', 'area_code', 3, '511112', '五通桥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2817, 278, '511100', 'area_code', 3, '511113', '金口河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2818, 278, '511100', 'area_code', 3, '511123', '犍为县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2819, 278, '511100', 'area_code', 3, '511124', '井研县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2820, 278, '511100', 'area_code', 3, '511126', '夹江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2821, 278, '511100', 'area_code', 3, '511129', '沐川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2822, 278, '511100', 'area_code', 3, '511132', '峨边彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2823, 278, '511100', 'area_code', 3, '511133', '马边彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2824, 278, '511100', 'area_code', 3, '511181', '峨眉山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2825, 279, '511300', 'area_code', 3, '511301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2826, 279, '511300', 'area_code', 3, '511302', '顺庆区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2827, 279, '511300', 'area_code', 3, '511303', '高坪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2828, 279, '511300', 'area_code', 3, '511304', '嘉陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2829, 279, '511300', 'area_code', 3, '511321', '南部县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2830, 279, '511300', 'area_code', 3, '511322', '营山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2831, 279, '511300', 'area_code', 3, '511323', '蓬安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2832, 279, '511300', 'area_code', 3, '511324', '仪陇县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2833, 279, '511300', 'area_code', 3, '511325', '西充县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2834, 279, '511300', 'area_code', 3, '511381', '阆中市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2835, 280, '511400', 'area_code', 3, '511401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2836, 280, '511400', 'area_code', 3, '511402', '东坡区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2837, 280, '511400', 'area_code', 3, '511403', '彭山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2838, 280, '511400', 'area_code', 3, '511421', '仁寿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2839, 280, '511400', 'area_code', 3, '511423', '洪雅县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2840, 280, '511400', 'area_code', 3, '511424', '丹棱县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2841, 280, '511400', 'area_code', 3, '511425', '青神县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2842, 281, '511500', 'area_code', 3, '511501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2843, 281, '511500', 'area_code', 3, '511502', '翠屏区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2844, 281, '511500', 'area_code', 3, '511503', '南溪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2845, 281, '511500', 'area_code', 3, '511504', '叙州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2846, 281, '511500', 'area_code', 3, '511523', '江安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2847, 281, '511500', 'area_code', 3, '511524', '长宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2848, 281, '511500', 'area_code', 3, '511525', '高县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2849, 281, '511500', 'area_code', 3, '511526', '珙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2850, 281, '511500', 'area_code', 3, '511527', '筠连县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2851, 281, '511500', 'area_code', 3, '511528', '兴文县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2852, 281, '511500', 'area_code', 3, '511529', '屏山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2853, 282, '511600', 'area_code', 3, '511601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2854, 282, '511600', 'area_code', 3, '511602', '广安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2855, 282, '511600', 'area_code', 3, '511603', '前锋区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2856, 282, '511600', 'area_code', 3, '511621', '岳池县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2857, 282, '511600', 'area_code', 3, '511622', '武胜县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2858, 282, '511600', 'area_code', 3, '511623', '邻水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2859, 282, '511600', 'area_code', 3, '511681', '华蓥市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2860, 283, '511700', 'area_code', 3, '511701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2861, 283, '511700', 'area_code', 3, '511702', '通川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2862, 283, '511700', 'area_code', 3, '511703', '达川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2863, 283, '511700', 'area_code', 3, '511722', '宣汉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2864, 283, '511700', 'area_code', 3, '511723', '开江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2865, 283, '511700', 'area_code', 3, '511724', '大竹县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2866, 283, '511700', 'area_code', 3, '511725', '渠县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2867, 283, '511700', 'area_code', 3, '511771', '达州经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2868, 283, '511700', 'area_code', 3, '511781', '万源市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2869, 284, '511800', 'area_code', 3, '511801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2870, 284, '511800', 'area_code', 3, '511802', '雨城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2871, 284, '511800', 'area_code', 3, '511803', '名山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2872, 284, '511800', 'area_code', 3, '511822', '荥经县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2873, 284, '511800', 'area_code', 3, '511823', '汉源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2874, 284, '511800', 'area_code', 3, '511824', '石棉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2875, 284, '511800', 'area_code', 3, '511825', '天全县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2876, 284, '511800', 'area_code', 3, '511826', '芦山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2877, 284, '511800', 'area_code', 3, '511827', '宝兴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2878, 285, '511900', 'area_code', 3, '511901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2879, 285, '511900', 'area_code', 3, '511902', '巴州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2880, 285, '511900', 'area_code', 3, '511903', '恩阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2881, 285, '511900', 'area_code', 3, '511921', '通江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2882, 285, '511900', 'area_code', 3, '511922', '南江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2883, 285, '511900', 'area_code', 3, '511923', '平昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2884, 285, '511900', 'area_code', 3, '511971', '巴中经济开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2885, 286, '512000', 'area_code', 3, '512001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2886, 286, '512000', 'area_code', 3, '512002', '雁江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2887, 286, '512000', 'area_code', 3, '512021', '安岳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2888, 286, '512000', 'area_code', 3, '512022', '乐至县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2889, 287, '513200', 'area_code', 3, '513201', '马尔康市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2890, 287, '513200', 'area_code', 3, '513221', '汶川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2891, 287, '513200', 'area_code', 3, '513222', '理县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2892, 287, '513200', 'area_code', 3, '513223', '茂县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2893, 287, '513200', 'area_code', 3, '513224', '松潘县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2894, 287, '513200', 'area_code', 3, '513225', '九寨沟县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2895, 287, '513200', 'area_code', 3, '513226', '金川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2896, 287, '513200', 'area_code', 3, '513227', '小金县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2897, 287, '513200', 'area_code', 3, '513228', '黑水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2898, 287, '513200', 'area_code', 3, '513230', '壤塘县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2899, 287, '513200', 'area_code', 3, '513231', '阿坝县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2900, 287, '513200', 'area_code', 3, '513232', '若尔盖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2901, 287, '513200', 'area_code', 3, '513233', '红原县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2902, 288, '513300', 'area_code', 3, '513301', '康定市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2903, 288, '513300', 'area_code', 3, '513322', '泸定县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2904, 288, '513300', 'area_code', 3, '513323', '丹巴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2905, 288, '513300', 'area_code', 3, '513324', '九龙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2906, 288, '513300', 'area_code', 3, '513325', '雅江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2907, 288, '513300', 'area_code', 3, '513326', '道孚县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2908, 288, '513300', 'area_code', 3, '513327', '炉霍县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2909, 288, '513300', 'area_code', 3, '513328', '甘孜县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2910, 288, '513300', 'area_code', 3, '513329', '新龙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2911, 288, '513300', 'area_code', 3, '513330', '德格县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2912, 288, '513300', 'area_code', 3, '513331', '白玉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2913, 288, '513300', 'area_code', 3, '513332', '石渠县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2914, 288, '513300', 'area_code', 3, '513333', '色达县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2915, 288, '513300', 'area_code', 3, '513334', '理塘县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2916, 288, '513300', 'area_code', 3, '513335', '巴塘县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2917, 288, '513300', 'area_code', 3, '513336', '乡城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2918, 288, '513300', 'area_code', 3, '513337', '稻城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2919, 288, '513300', 'area_code', 3, '513338', '得荣县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2920, 289, '513400', 'area_code', 3, '513401', '西昌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2921, 289, '513400', 'area_code', 3, '513422', '木里藏族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2922, 289, '513400', 'area_code', 3, '513423', '盐源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2923, 289, '513400', 'area_code', 3, '513424', '德昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2924, 289, '513400', 'area_code', 3, '513425', '会理县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2925, 289, '513400', 'area_code', 3, '513426', '会东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2926, 289, '513400', 'area_code', 3, '513427', '宁南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2927, 289, '513400', 'area_code', 3, '513428', '普格县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2928, 289, '513400', 'area_code', 3, '513429', '布拖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2929, 289, '513400', 'area_code', 3, '513430', '金阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2930, 289, '513400', 'area_code', 3, '513431', '昭觉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2931, 289, '513400', 'area_code', 3, '513432', '喜德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2932, 289, '513400', 'area_code', 3, '513433', '冕宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2933, 289, '513400', 'area_code', 3, '513434', '越西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2934, 289, '513400', 'area_code', 3, '513435', '甘洛县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2935, 289, '513400', 'area_code', 3, '513436', '美姑县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2936, 289, '513400', 'area_code', 3, '513437', '雷波县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2937, 290, '520100', 'area_code', 3, '520101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2938, 290, '520100', 'area_code', 3, '520102', '南明区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2939, 290, '520100', 'area_code', 3, '520103', '云岩区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2940, 290, '520100', 'area_code', 3, '520111', '花溪区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2941, 290, '520100', 'area_code', 3, '520112', '乌当区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2942, 290, '520100', 'area_code', 3, '520113', '白云区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2943, 290, '520100', 'area_code', 3, '520115', '观山湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2944, 290, '520100', 'area_code', 3, '520121', '开阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2945, 290, '520100', 'area_code', 3, '520122', '息烽县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2946, 290, '520100', 'area_code', 3, '520123', '修文县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2947, 290, '520100', 'area_code', 3, '520181', '清镇市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2948, 291, '520200', 'area_code', 3, '520201', '钟山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2949, 291, '520200', 'area_code', 3, '520203', '六枝特区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2950, 291, '520200', 'area_code', 3, '520221', '水城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2951, 291, '520200', 'area_code', 3, '520281', '盘州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2952, 292, '520300', 'area_code', 3, '520301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2953, 292, '520300', 'area_code', 3, '520302', '红花岗区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2954, 292, '520300', 'area_code', 3, '520303', '汇川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2955, 292, '520300', 'area_code', 3, '520304', '播州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2956, 292, '520300', 'area_code', 3, '520322', '桐梓县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2957, 292, '520300', 'area_code', 3, '520323', '绥阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2958, 292, '520300', 'area_code', 3, '520324', '正安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2959, 292, '520300', 'area_code', 3, '520325', '道真仡佬族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2960, 292, '520300', 'area_code', 3, '520326', '务川仡佬族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2961, 292, '520300', 'area_code', 3, '520327', '凤冈县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2962, 292, '520300', 'area_code', 3, '520328', '湄潭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2963, 292, '520300', 'area_code', 3, '520329', '余庆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2964, 292, '520300', 'area_code', 3, '520330', '习水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2965, 292, '520300', 'area_code', 3, '520381', '赤水市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2966, 292, '520300', 'area_code', 3, '520382', '仁怀市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2967, 293, '520400', 'area_code', 3, '520401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2968, 293, '520400', 'area_code', 3, '520402', '西秀区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2969, 293, '520400', 'area_code', 3, '520403', '平坝区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2970, 293, '520400', 'area_code', 3, '520422', '普定县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2971, 293, '520400', 'area_code', 3, '520423', '镇宁布依族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2972, 293, '520400', 'area_code', 3, '520424', '关岭布依族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2973, 293, '520400', 'area_code', 3, '520425', '紫云苗族布依族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2974, 294, '520500', 'area_code', 3, '520501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2975, 294, '520500', 'area_code', 3, '520502', '七星关区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2976, 294, '520500', 'area_code', 3, '520521', '大方县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2977, 294, '520500', 'area_code', 3, '520522', '黔西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2978, 294, '520500', 'area_code', 3, '520523', '金沙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2979, 294, '520500', 'area_code', 3, '520524', '织金县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2980, 294, '520500', 'area_code', 3, '520525', '纳雍县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2981, 294, '520500', 'area_code', 3, '520526', '威宁彝族回族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2982, 294, '520500', 'area_code', 3, '520527', '赫章县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2983, 295, '520600', 'area_code', 3, '520601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2984, 295, '520600', 'area_code', 3, '520602', '碧江区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2985, 295, '520600', 'area_code', 3, '520603', '万山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2986, 295, '520600', 'area_code', 3, '520621', '江口县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2987, 295, '520600', 'area_code', 3, '520622', '玉屏侗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2988, 295, '520600', 'area_code', 3, '520623', '石阡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2989, 295, '520600', 'area_code', 3, '520624', '思南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2990, 295, '520600', 'area_code', 3, '520625', '印江土家族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2991, 295, '520600', 'area_code', 3, '520626', '德江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2992, 295, '520600', 'area_code', 3, '520627', '沿河土家族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2993, 295, '520600', 'area_code', 3, '520628', '松桃苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (2994, 296, '522300', 'area_code', 3, '522301', '兴义市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2995, 296, '522300', 'area_code', 3, '522302', '兴仁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2996, 296, '522300', 'area_code', 3, '522323', '普安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2997, 296, '522300', 'area_code', 3, '522324', '晴隆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2998, 296, '522300', 'area_code', 3, '522325', '贞丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (2999, 296, '522300', 'area_code', 3, '522326', '望谟县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3000, 296, '522300', 'area_code', 3, '522327', '册亨县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3001, 296, '522300', 'area_code', 3, '522328', '安龙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3002, 297, '522600', 'area_code', 3, '522601', '凯里市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3003, 297, '522600', 'area_code', 3, '522622', '黄平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3004, 297, '522600', 'area_code', 3, '522623', '施秉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3005, 297, '522600', 'area_code', 3, '522624', '三穗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3006, 297, '522600', 'area_code', 3, '522625', '镇远县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3007, 297, '522600', 'area_code', 3, '522626', '岑巩县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3008, 297, '522600', 'area_code', 3, '522627', '天柱县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3009, 297, '522600', 'area_code', 3, '522628', '锦屏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3010, 297, '522600', 'area_code', 3, '522629', '剑河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3011, 297, '522600', 'area_code', 3, '522630', '台江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3012, 297, '522600', 'area_code', 3, '522631', '黎平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3013, 297, '522600', 'area_code', 3, '522632', '榕江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3014, 297, '522600', 'area_code', 3, '522633', '从江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3015, 297, '522600', 'area_code', 3, '522634', '雷山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3016, 297, '522600', 'area_code', 3, '522635', '麻江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3017, 297, '522600', 'area_code', 3, '522636', '丹寨县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3018, 298, '522700', 'area_code', 3, '522701', '都匀市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3019, 298, '522700', 'area_code', 3, '522702', '福泉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3020, 298, '522700', 'area_code', 3, '522722', '荔波县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3021, 298, '522700', 'area_code', 3, '522723', '贵定县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3022, 298, '522700', 'area_code', 3, '522725', '瓮安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3023, 298, '522700', 'area_code', 3, '522726', '独山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3024, 298, '522700', 'area_code', 3, '522727', '平塘县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3025, 298, '522700', 'area_code', 3, '522728', '罗甸县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3026, 298, '522700', 'area_code', 3, '522729', '长顺县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3027, 298, '522700', 'area_code', 3, '522730', '龙里县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3028, 298, '522700', 'area_code', 3, '522731', '惠水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3029, 298, '522700', 'area_code', 3, '522732', '三都水族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3030, 299, '530100', 'area_code', 3, '530101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3031, 299, '530100', 'area_code', 3, '530102', '五华区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3032, 299, '530100', 'area_code', 3, '530103', '盘龙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3033, 299, '530100', 'area_code', 3, '530111', '官渡区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3034, 299, '530100', 'area_code', 3, '530112', '西山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3035, 299, '530100', 'area_code', 3, '530113', '东川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3036, 299, '530100', 'area_code', 3, '530114', '呈贡区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3037, 299, '530100', 'area_code', 3, '530115', '晋宁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3038, 299, '530100', 'area_code', 3, '530124', '富民县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3039, 299, '530100', 'area_code', 3, '530125', '宜良县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3040, 299, '530100', 'area_code', 3, '530126', '石林彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3041, 299, '530100', 'area_code', 3, '530127', '嵩明县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3042, 299, '530100', 'area_code', 3, '530128', '禄劝彝族苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3043, 299, '530100', 'area_code', 3, '530129', '寻甸回族彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3044, 299, '530100', 'area_code', 3, '530181', '安宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3045, 300, '530300', 'area_code', 3, '530301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3046, 300, '530300', 'area_code', 3, '530302', '麒麟区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3047, 300, '530300', 'area_code', 3, '530303', '沾益区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3048, 300, '530300', 'area_code', 3, '530304', '马龙区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3049, 300, '530300', 'area_code', 3, '530322', '陆良县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3050, 300, '530300', 'area_code', 3, '530323', '师宗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3051, 300, '530300', 'area_code', 3, '530324', '罗平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3052, 300, '530300', 'area_code', 3, '530325', '富源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3053, 300, '530300', 'area_code', 3, '530326', '会泽县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3054, 300, '530300', 'area_code', 3, '530381', '宣威市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3055, 301, '530400', 'area_code', 3, '530401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3056, 301, '530400', 'area_code', 3, '530402', '红塔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3057, 301, '530400', 'area_code', 3, '530403', '江川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3058, 301, '530400', 'area_code', 3, '530423', '通海县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3059, 301, '530400', 'area_code', 3, '530424', '华宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3060, 301, '530400', 'area_code', 3, '530425', '易门县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3061, 301, '530400', 'area_code', 3, '530426', '峨山彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3062, 301, '530400', 'area_code', 3, '530427', '新平彝族傣族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3063, 301, '530400', 'area_code', 3, '530428', '元江哈尼族彝族傣族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3064, 301, '530400', 'area_code', 3, '530481', '澄江市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3065, 302, '530500', 'area_code', 3, '530501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3066, 302, '530500', 'area_code', 3, '530502', '隆阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3067, 302, '530500', 'area_code', 3, '530521', '施甸县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3068, 302, '530500', 'area_code', 3, '530523', '龙陵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3069, 302, '530500', 'area_code', 3, '530524', '昌宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3070, 302, '530500', 'area_code', 3, '530581', '腾冲市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3071, 303, '530600', 'area_code', 3, '530601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3072, 303, '530600', 'area_code', 3, '530602', '昭阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3073, 303, '530600', 'area_code', 3, '530621', '鲁甸县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3074, 303, '530600', 'area_code', 3, '530622', '巧家县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3075, 303, '530600', 'area_code', 3, '530623', '盐津县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3076, 303, '530600', 'area_code', 3, '530624', '大关县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3077, 303, '530600', 'area_code', 3, '530625', '永善县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3078, 303, '530600', 'area_code', 3, '530626', '绥江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3079, 303, '530600', 'area_code', 3, '530627', '镇雄县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3080, 303, '530600', 'area_code', 3, '530628', '彝良县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3081, 303, '530600', 'area_code', 3, '530629', '威信县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3082, 303, '530600', 'area_code', 3, '530681', '水富市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3083, 304, '530700', 'area_code', 3, '530701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3084, 304, '530700', 'area_code', 3, '530702', '古城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3085, 304, '530700', 'area_code', 3, '530721', '玉龙纳西族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3086, 304, '530700', 'area_code', 3, '530722', '永胜县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3087, 304, '530700', 'area_code', 3, '530723', '华坪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3088, 304, '530700', 'area_code', 3, '530724', '宁蒗彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3089, 305, '530800', 'area_code', 3, '530801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3090, 305, '530800', 'area_code', 3, '530802', '思茅区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3091, 305, '530800', 'area_code', 3, '530821', '宁洱哈尼族彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3092, 305, '530800', 'area_code', 3, '530822', '墨江哈尼族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3093, 305, '530800', 'area_code', 3, '530823', '景东彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3094, 305, '530800', 'area_code', 3, '530824', '景谷傣族彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3095, 305, '530800', 'area_code', 3, '530825', '镇沅彝族哈尼族拉祜族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL,
        NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3096, 305, '530800', 'area_code', 3, '530826', '江城哈尼族彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3097, 305, '530800', 'area_code', 3, '530827', '孟连傣族拉祜族佤族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3098, 305, '530800', 'area_code', 3, '530828', '澜沧拉祜族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3099, 305, '530800', 'area_code', 3, '530829', '西盟佤族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3100, 306, '530900', 'area_code', 3, '530901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3101, 306, '530900', 'area_code', 3, '530902', '临翔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3102, 306, '530900', 'area_code', 3, '530921', '凤庆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3103, 306, '530900', 'area_code', 3, '530922', '云县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3104, 306, '530900', 'area_code', 3, '530923', '永德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3105, 306, '530900', 'area_code', 3, '530924', '镇康县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3106, 306, '530900', 'area_code', 3, '530925', '双江拉祜族佤族布朗族傣族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL,
        NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3107, 306, '530900', 'area_code', 3, '530926', '耿马傣族佤族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3108, 306, '530900', 'area_code', 3, '530927', '沧源佤族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3109, 307, '532300', 'area_code', 3, '532301', '楚雄市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3110, 307, '532300', 'area_code', 3, '532322', '双柏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3111, 307, '532300', 'area_code', 3, '532323', '牟定县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3112, 307, '532300', 'area_code', 3, '532324', '南华县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3113, 307, '532300', 'area_code', 3, '532325', '姚安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3114, 307, '532300', 'area_code', 3, '532326', '大姚县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3115, 307, '532300', 'area_code', 3, '532327', '永仁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3116, 307, '532300', 'area_code', 3, '532328', '元谋县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3117, 307, '532300', 'area_code', 3, '532329', '武定县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3118, 307, '532300', 'area_code', 3, '532331', '禄丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3119, 308, '532500', 'area_code', 3, '532501', '个旧市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3120, 308, '532500', 'area_code', 3, '532502', '开远市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3121, 308, '532500', 'area_code', 3, '532503', '蒙自市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3122, 308, '532500', 'area_code', 3, '532504', '弥勒市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3123, 308, '532500', 'area_code', 3, '532523', '屏边苗族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3124, 308, '532500', 'area_code', 3, '532524', '建水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3125, 308, '532500', 'area_code', 3, '532525', '石屏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3126, 308, '532500', 'area_code', 3, '532527', '泸西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3127, 308, '532500', 'area_code', 3, '532528', '元阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3128, 308, '532500', 'area_code', 3, '532529', '红河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3129, 308, '532500', 'area_code', 3, '532530', '金平苗族瑶族傣族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3130, 308, '532500', 'area_code', 3, '532531', '绿春县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3131, 308, '532500', 'area_code', 3, '532532', '河口瑶族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3132, 309, '532600', 'area_code', 3, '532601', '文山市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3133, 309, '532600', 'area_code', 3, '532622', '砚山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3134, 309, '532600', 'area_code', 3, '532623', '西畴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3135, 309, '532600', 'area_code', 3, '532624', '麻栗坡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3136, 309, '532600', 'area_code', 3, '532625', '马关县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3137, 309, '532600', 'area_code', 3, '532626', '丘北县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3138, 309, '532600', 'area_code', 3, '532627', '广南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3139, 309, '532600', 'area_code', 3, '532628', '富宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3140, 310, '532800', 'area_code', 3, '532801', '景洪市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3141, 310, '532800', 'area_code', 3, '532822', '勐海县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3142, 310, '532800', 'area_code', 3, '532823', '勐腊县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3143, 311, '532900', 'area_code', 3, '532901', '大理市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3144, 311, '532900', 'area_code', 3, '532922', '漾濞彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3145, 311, '532900', 'area_code', 3, '532923', '祥云县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3146, 311, '532900', 'area_code', 3, '532924', '宾川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3147, 311, '532900', 'area_code', 3, '532925', '弥渡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3148, 311, '532900', 'area_code', 3, '532926', '南涧彝族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3149, 311, '532900', 'area_code', 3, '532927', '巍山彝族回族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3150, 311, '532900', 'area_code', 3, '532928', '永平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3151, 311, '532900', 'area_code', 3, '532929', '云龙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3152, 311, '532900', 'area_code', 3, '532930', '洱源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3153, 311, '532900', 'area_code', 3, '532931', '剑川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3154, 311, '532900', 'area_code', 3, '532932', '鹤庆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3155, 312, '533100', 'area_code', 3, '533102', '瑞丽市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3156, 312, '533100', 'area_code', 3, '533103', '芒市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3157, 312, '533100', 'area_code', 3, '533122', '梁河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3158, 312, '533100', 'area_code', 3, '533123', '盈江县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3159, 312, '533100', 'area_code', 3, '533124', '陇川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3160, 313, '533300', 'area_code', 3, '533301', '泸水市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3161, 313, '533300', 'area_code', 3, '533323', '福贡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3162, 313, '533300', 'area_code', 3, '533324', '贡山独龙族怒族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3163, 313, '533300', 'area_code', 3, '533325', '兰坪白族普米族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3164, 314, '533400', 'area_code', 3, '533401', '香格里拉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3165, 314, '533400', 'area_code', 3, '533422', '德钦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3166, 314, '533400', 'area_code', 3, '533423', '维西傈僳族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3167, 315, '540100', 'area_code', 3, '540101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3168, 315, '540100', 'area_code', 3, '540102', '城关区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3169, 315, '540100', 'area_code', 3, '540103', '堆龙德庆区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3170, 315, '540100', 'area_code', 3, '540104', '达孜区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3171, 315, '540100', 'area_code', 3, '540121', '林周县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3172, 315, '540100', 'area_code', 3, '540122', '当雄县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3173, 315, '540100', 'area_code', 3, '540123', '尼木县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3174, 315, '540100', 'area_code', 3, '540124', '曲水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3175, 315, '540100', 'area_code', 3, '540127', '墨竹工卡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3176, 315, '540100', 'area_code', 3, '540171', '格尔木藏青工业园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3177, 315, '540100', 'area_code', 3, '540172', '拉萨经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3178, 315, '540100', 'area_code', 3, '540173', '西藏文化旅游创意园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3179, 315, '540100', 'area_code', 3, '540174', '达孜工业园区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3180, 316, '540200', 'area_code', 3, '540202', '桑珠孜区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3181, 316, '540200', 'area_code', 3, '540221', '南木林县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3182, 316, '540200', 'area_code', 3, '540222', '江孜县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3183, 316, '540200', 'area_code', 3, '540223', '定日县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3184, 316, '540200', 'area_code', 3, '540224', '萨迦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3185, 316, '540200', 'area_code', 3, '540225', '拉孜县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3186, 316, '540200', 'area_code', 3, '540226', '昂仁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3187, 316, '540200', 'area_code', 3, '540227', '谢通门县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3188, 316, '540200', 'area_code', 3, '540228', '白朗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3189, 316, '540200', 'area_code', 3, '540229', '仁布县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3190, 316, '540200', 'area_code', 3, '540230', '康马县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3191, 316, '540200', 'area_code', 3, '540231', '定结县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3192, 316, '540200', 'area_code', 3, '540232', '仲巴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3193, 316, '540200', 'area_code', 3, '540233', '亚东县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3194, 316, '540200', 'area_code', 3, '540234', '吉隆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3195, 316, '540200', 'area_code', 3, '540235', '聂拉木县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3196, 316, '540200', 'area_code', 3, '540236', '萨嘎县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3197, 316, '540200', 'area_code', 3, '540237', '岗巴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3198, 317, '540300', 'area_code', 3, '540302', '卡若区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3199, 317, '540300', 'area_code', 3, '540321', '江达县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3200, 317, '540300', 'area_code', 3, '540322', '贡觉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3201, 317, '540300', 'area_code', 3, '540323', '类乌齐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3202, 317, '540300', 'area_code', 3, '540324', '丁青县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3203, 317, '540300', 'area_code', 3, '540325', '察雅县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3204, 317, '540300', 'area_code', 3, '540326', '八宿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3205, 317, '540300', 'area_code', 3, '540327', '左贡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3206, 317, '540300', 'area_code', 3, '540328', '芒康县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3207, 317, '540300', 'area_code', 3, '540329', '洛隆县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3208, 317, '540300', 'area_code', 3, '540330', '边坝县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3209, 318, '540400', 'area_code', 3, '540402', '巴宜区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3210, 318, '540400', 'area_code', 3, '540421', '工布江达县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3211, 318, '540400', 'area_code', 3, '540422', '米林县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3212, 318, '540400', 'area_code', 3, '540423', '墨脱县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3213, 318, '540400', 'area_code', 3, '540424', '波密县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3214, 318, '540400', 'area_code', 3, '540425', '察隅县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3215, 318, '540400', 'area_code', 3, '540426', '朗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3216, 319, '540500', 'area_code', 3, '540501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3217, 319, '540500', 'area_code', 3, '540502', '乃东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3218, 319, '540500', 'area_code', 3, '540521', '扎囊县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3219, 319, '540500', 'area_code', 3, '540522', '贡嘎县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3220, 319, '540500', 'area_code', 3, '540523', '桑日县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3221, 319, '540500', 'area_code', 3, '540524', '琼结县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3222, 319, '540500', 'area_code', 3, '540525', '曲松县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3223, 319, '540500', 'area_code', 3, '540526', '措美县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3224, 319, '540500', 'area_code', 3, '540527', '洛扎县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3225, 319, '540500', 'area_code', 3, '540528', '加查县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3226, 319, '540500', 'area_code', 3, '540529', '隆子县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3227, 319, '540500', 'area_code', 3, '540530', '错那县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3228, 319, '540500', 'area_code', 3, '540531', '浪卡子县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3229, 320, '540600', 'area_code', 3, '540602', '色尼区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3230, 320, '540600', 'area_code', 3, '540621', '嘉黎县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3231, 320, '540600', 'area_code', 3, '540622', '比如县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3232, 320, '540600', 'area_code', 3, '540623', '聂荣县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3233, 320, '540600', 'area_code', 3, '540624', '安多县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3234, 320, '540600', 'area_code', 3, '540625', '申扎县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3235, 320, '540600', 'area_code', 3, '540626', '索县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3236, 320, '540600', 'area_code', 3, '540627', '班戈县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3237, 320, '540600', 'area_code', 3, '540628', '巴青县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3238, 320, '540600', 'area_code', 3, '540629', '尼玛县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3239, 320, '540600', 'area_code', 3, '540630', '双湖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3240, 321, '542500', 'area_code', 3, '542521', '普兰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3241, 321, '542500', 'area_code', 3, '542522', '札达县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3242, 321, '542500', 'area_code', 3, '542523', '噶尔县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3243, 321, '542500', 'area_code', 3, '542524', '日土县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3244, 321, '542500', 'area_code', 3, '542525', '革吉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3245, 321, '542500', 'area_code', 3, '542526', '改则县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3246, 321, '542500', 'area_code', 3, '542527', '措勤县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3247, 322, '610100', 'area_code', 3, '610101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3248, 322, '610100', 'area_code', 3, '610102', '新城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3249, 322, '610100', 'area_code', 3, '610103', '碑林区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3250, 322, '610100', 'area_code', 3, '610104', '莲湖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3251, 322, '610100', 'area_code', 3, '610111', '灞桥区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3252, 322, '610100', 'area_code', 3, '610112', '未央区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3253, 322, '610100', 'area_code', 3, '610113', '雁塔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3254, 322, '610100', 'area_code', 3, '610114', '阎良区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3255, 322, '610100', 'area_code', 3, '610115', '临潼区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3256, 322, '610100', 'area_code', 3, '610116', '长安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3257, 322, '610100', 'area_code', 3, '610117', '高陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3258, 322, '610100', 'area_code', 3, '610118', '鄠邑区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3259, 322, '610100', 'area_code', 3, '610122', '蓝田县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3260, 322, '610100', 'area_code', 3, '610124', '周至县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3261, 323, '610200', 'area_code', 3, '610201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3262, 323, '610200', 'area_code', 3, '610202', '王益区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3263, 323, '610200', 'area_code', 3, '610203', '印台区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3264, 323, '610200', 'area_code', 3, '610204', '耀州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3265, 323, '610200', 'area_code', 3, '610222', '宜君县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3266, 324, '610300', 'area_code', 3, '610301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3267, 324, '610300', 'area_code', 3, '610302', '渭滨区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3268, 324, '610300', 'area_code', 3, '610303', '金台区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3269, 324, '610300', 'area_code', 3, '610304', '陈仓区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3270, 324, '610300', 'area_code', 3, '610322', '凤翔县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3271, 324, '610300', 'area_code', 3, '610323', '岐山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3272, 324, '610300', 'area_code', 3, '610324', '扶风县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3273, 324, '610300', 'area_code', 3, '610326', '眉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3274, 324, '610300', 'area_code', 3, '610327', '陇县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3275, 324, '610300', 'area_code', 3, '610328', '千阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3276, 324, '610300', 'area_code', 3, '610329', '麟游县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3277, 324, '610300', 'area_code', 3, '610330', '凤县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3278, 324, '610300', 'area_code', 3, '610331', '太白县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3279, 325, '610400', 'area_code', 3, '610401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3280, 325, '610400', 'area_code', 3, '610402', '秦都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3281, 325, '610400', 'area_code', 3, '610403', '杨陵区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3282, 325, '610400', 'area_code', 3, '610404', '渭城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3283, 325, '610400', 'area_code', 3, '610422', '三原县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3284, 325, '610400', 'area_code', 3, '610423', '泾阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3285, 325, '610400', 'area_code', 3, '610424', '乾县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3286, 325, '610400', 'area_code', 3, '610425', '礼泉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3287, 325, '610400', 'area_code', 3, '610426', '永寿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3288, 325, '610400', 'area_code', 3, '610428', '长武县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3289, 325, '610400', 'area_code', 3, '610429', '旬邑县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3290, 325, '610400', 'area_code', 3, '610430', '淳化县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3291, 325, '610400', 'area_code', 3, '610431', '武功县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3292, 325, '610400', 'area_code', 3, '610481', '兴平市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3293, 325, '610400', 'area_code', 3, '610482', '彬州市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3294, 326, '610500', 'area_code', 3, '610501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3295, 326, '610500', 'area_code', 3, '610502', '临渭区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3296, 326, '610500', 'area_code', 3, '610503', '华州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3297, 326, '610500', 'area_code', 3, '610522', '潼关县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3298, 326, '610500', 'area_code', 3, '610523', '大荔县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3299, 326, '610500', 'area_code', 3, '610524', '合阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3300, 326, '610500', 'area_code', 3, '610525', '澄城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3301, 326, '610500', 'area_code', 3, '610526', '蒲城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3302, 326, '610500', 'area_code', 3, '610527', '白水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3303, 326, '610500', 'area_code', 3, '610528', '富平县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3304, 326, '610500', 'area_code', 3, '610581', '韩城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3305, 326, '610500', 'area_code', 3, '610582', '华阴市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3306, 327, '610600', 'area_code', 3, '610601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3307, 327, '610600', 'area_code', 3, '610602', '宝塔区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3308, 327, '610600', 'area_code', 3, '610603', '安塞区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3309, 327, '610600', 'area_code', 3, '610621', '延长县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3310, 327, '610600', 'area_code', 3, '610622', '延川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3311, 327, '610600', 'area_code', 3, '610625', '志丹县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3312, 327, '610600', 'area_code', 3, '610626', '吴起县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3313, 327, '610600', 'area_code', 3, '610627', '甘泉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3314, 327, '610600', 'area_code', 3, '610628', '富县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3315, 327, '610600', 'area_code', 3, '610629', '洛川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3316, 327, '610600', 'area_code', 3, '610630', '宜川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3317, 327, '610600', 'area_code', 3, '610631', '黄龙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3318, 327, '610600', 'area_code', 3, '610632', '黄陵县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3319, 327, '610600', 'area_code', 3, '610681', '子长市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3320, 328, '610700', 'area_code', 3, '610701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3321, 328, '610700', 'area_code', 3, '610702', '汉台区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3322, 328, '610700', 'area_code', 3, '610703', '南郑区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3323, 328, '610700', 'area_code', 3, '610722', '城固县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3324, 328, '610700', 'area_code', 3, '610723', '洋县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3325, 328, '610700', 'area_code', 3, '610724', '西乡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3326, 328, '610700', 'area_code', 3, '610725', '勉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3327, 328, '610700', 'area_code', 3, '610726', '宁强县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3328, 328, '610700', 'area_code', 3, '610727', '略阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3329, 328, '610700', 'area_code', 3, '610728', '镇巴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3330, 328, '610700', 'area_code', 3, '610729', '留坝县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3331, 328, '610700', 'area_code', 3, '610730', '佛坪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3332, 329, '610800', 'area_code', 3, '610801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3333, 329, '610800', 'area_code', 3, '610802', '榆阳区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3334, 329, '610800', 'area_code', 3, '610803', '横山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3335, 329, '610800', 'area_code', 3, '610822', '府谷县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3336, 329, '610800', 'area_code', 3, '610824', '靖边县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3337, 329, '610800', 'area_code', 3, '610825', '定边县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3338, 329, '610800', 'area_code', 3, '610826', '绥德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3339, 329, '610800', 'area_code', 3, '610827', '米脂县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3340, 329, '610800', 'area_code', 3, '610828', '佳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3341, 329, '610800', 'area_code', 3, '610829', '吴堡县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3342, 329, '610800', 'area_code', 3, '610830', '清涧县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3343, 329, '610800', 'area_code', 3, '610831', '子洲县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3344, 329, '610800', 'area_code', 3, '610881', '神木市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3345, 330, '610900', 'area_code', 3, '610901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3346, 330, '610900', 'area_code', 3, '610902', '汉滨区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3347, 330, '610900', 'area_code', 3, '610921', '汉阴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3348, 330, '610900', 'area_code', 3, '610922', '石泉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3349, 330, '610900', 'area_code', 3, '610923', '宁陕县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3350, 330, '610900', 'area_code', 3, '610924', '紫阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3351, 330, '610900', 'area_code', 3, '610925', '岚皋县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3352, 330, '610900', 'area_code', 3, '610926', '平利县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3353, 330, '610900', 'area_code', 3, '610927', '镇坪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3354, 330, '610900', 'area_code', 3, '610928', '旬阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3355, 330, '610900', 'area_code', 3, '610929', '白河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3356, 331, '611000', 'area_code', 3, '611001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3357, 331, '611000', 'area_code', 3, '611002', '商州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3358, 331, '611000', 'area_code', 3, '611021', '洛南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3359, 331, '611000', 'area_code', 3, '611022', '丹凤县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3360, 331, '611000', 'area_code', 3, '611023', '商南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3361, 331, '611000', 'area_code', 3, '611024', '山阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3362, 331, '611000', 'area_code', 3, '611025', '镇安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3363, 331, '611000', 'area_code', 3, '611026', '柞水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3364, 332, '620100', 'area_code', 3, '620101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3365, 332, '620100', 'area_code', 3, '620102', '城关区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3366, 332, '620100', 'area_code', 3, '620103', '七里河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3367, 332, '620100', 'area_code', 3, '620104', '西固区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3368, 332, '620100', 'area_code', 3, '620105', '安宁区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3369, 332, '620100', 'area_code', 3, '620111', '红古区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3370, 332, '620100', 'area_code', 3, '620121', '永登县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3371, 332, '620100', 'area_code', 3, '620122', '皋兰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3372, 332, '620100', 'area_code', 3, '620123', '榆中县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3373, 332, '620100', 'area_code', 3, '620171', '兰州新区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3374, 333, '620200', 'area_code', 3, '620201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3375, 334, '620300', 'area_code', 3, '620301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3376, 334, '620300', 'area_code', 3, '620302', '金川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3377, 334, '620300', 'area_code', 3, '620321', '永昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3378, 335, '620400', 'area_code', 3, '620401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3379, 335, '620400', 'area_code', 3, '620402', '白银区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3380, 335, '620400', 'area_code', 3, '620403', '平川区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3381, 335, '620400', 'area_code', 3, '620421', '靖远县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3382, 335, '620400', 'area_code', 3, '620422', '会宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3383, 335, '620400', 'area_code', 3, '620423', '景泰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3384, 336, '620500', 'area_code', 3, '620501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3385, 336, '620500', 'area_code', 3, '620502', '秦州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3386, 336, '620500', 'area_code', 3, '620503', '麦积区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3387, 336, '620500', 'area_code', 3, '620521', '清水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3388, 336, '620500', 'area_code', 3, '620522', '秦安县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3389, 336, '620500', 'area_code', 3, '620523', '甘谷县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3390, 336, '620500', 'area_code', 3, '620524', '武山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3391, 336, '620500', 'area_code', 3, '620525', '张家川回族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3392, 337, '620600', 'area_code', 3, '620601', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3393, 337, '620600', 'area_code', 3, '620602', '凉州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3394, 337, '620600', 'area_code', 3, '620621', '民勤县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3395, 337, '620600', 'area_code', 3, '620622', '古浪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3396, 337, '620600', 'area_code', 3, '620623', '天祝藏族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3397, 338, '620700', 'area_code', 3, '620701', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3398, 338, '620700', 'area_code', 3, '620702', '甘州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3399, 338, '620700', 'area_code', 3, '620721', '肃南裕固族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3400, 338, '620700', 'area_code', 3, '620722', '民乐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3401, 338, '620700', 'area_code', 3, '620723', '临泽县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3402, 338, '620700', 'area_code', 3, '620724', '高台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3403, 338, '620700', 'area_code', 3, '620725', '山丹县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3404, 339, '620800', 'area_code', 3, '620801', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3405, 339, '620800', 'area_code', 3, '620802', '崆峒区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3406, 339, '620800', 'area_code', 3, '620821', '泾川县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3407, 339, '620800', 'area_code', 3, '620822', '灵台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3408, 339, '620800', 'area_code', 3, '620823', '崇信县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3409, 339, '620800', 'area_code', 3, '620825', '庄浪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3410, 339, '620800', 'area_code', 3, '620826', '静宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3411, 339, '620800', 'area_code', 3, '620881', '华亭市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3412, 340, '620900', 'area_code', 3, '620901', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3413, 340, '620900', 'area_code', 3, '620902', '肃州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3414, 340, '620900', 'area_code', 3, '620921', '金塔县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3415, 340, '620900', 'area_code', 3, '620922', '瓜州县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3416, 340, '620900', 'area_code', 3, '620923', '肃北蒙古族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3417, 340, '620900', 'area_code', 3, '620924', '阿克塞哈萨克族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3418, 340, '620900', 'area_code', 3, '620981', '玉门市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3419, 340, '620900', 'area_code', 3, '620982', '敦煌市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3420, 341, '621000', 'area_code', 3, '621001', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3421, 341, '621000', 'area_code', 3, '621002', '西峰区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3422, 341, '621000', 'area_code', 3, '621021', '庆城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3423, 341, '621000', 'area_code', 3, '621022', '环县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3424, 341, '621000', 'area_code', 3, '621023', '华池县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3425, 341, '621000', 'area_code', 3, '621024', '合水县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3426, 341, '621000', 'area_code', 3, '621025', '正宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3427, 341, '621000', 'area_code', 3, '621026', '宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3428, 341, '621000', 'area_code', 3, '621027', '镇原县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3429, 342, '621100', 'area_code', 3, '621101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3430, 342, '621100', 'area_code', 3, '621102', '安定区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3431, 342, '621100', 'area_code', 3, '621121', '通渭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3432, 342, '621100', 'area_code', 3, '621122', '陇西县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3433, 342, '621100', 'area_code', 3, '621123', '渭源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3434, 342, '621100', 'area_code', 3, '621124', '临洮县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3435, 342, '621100', 'area_code', 3, '621125', '漳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3436, 342, '621100', 'area_code', 3, '621126', '岷县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3437, 343, '621200', 'area_code', 3, '621201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3438, 343, '621200', 'area_code', 3, '621202', '武都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3439, 343, '621200', 'area_code', 3, '621221', '成县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3440, 343, '621200', 'area_code', 3, '621222', '文县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3441, 343, '621200', 'area_code', 3, '621223', '宕昌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3442, 343, '621200', 'area_code', 3, '621224', '康县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3443, 343, '621200', 'area_code', 3, '621225', '西和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3444, 343, '621200', 'area_code', 3, '621226', '礼县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3445, 343, '621200', 'area_code', 3, '621227', '徽县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3446, 343, '621200', 'area_code', 3, '621228', '两当县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3447, 344, '622900', 'area_code', 3, '622901', '临夏市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3448, 344, '622900', 'area_code', 3, '622921', '临夏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3449, 344, '622900', 'area_code', 3, '622922', '康乐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3450, 344, '622900', 'area_code', 3, '622923', '永靖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3451, 344, '622900', 'area_code', 3, '622924', '广河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3452, 344, '622900', 'area_code', 3, '622925', '和政县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3453, 344, '622900', 'area_code', 3, '622926', '东乡族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3454, 344, '622900', 'area_code', 3, '622927', '积石山保安族东乡族撒拉族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL,
        NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3455, 345, '623000', 'area_code', 3, '623001', '合作市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3456, 345, '623000', 'area_code', 3, '623021', '临潭县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3457, 345, '623000', 'area_code', 3, '623022', '卓尼县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3458, 345, '623000', 'area_code', 3, '623023', '舟曲县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3459, 345, '623000', 'area_code', 3, '623024', '迭部县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3460, 345, '623000', 'area_code', 3, '623025', '玛曲县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3461, 345, '623000', 'area_code', 3, '623026', '碌曲县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3462, 345, '623000', 'area_code', 3, '623027', '夏河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3463, 346, '630100', 'area_code', 3, '630101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3464, 346, '630100', 'area_code', 3, '630102', '城东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3465, 346, '630100', 'area_code', 3, '630103', '城中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3466, 346, '630100', 'area_code', 3, '630104', '城西区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3467, 346, '630100', 'area_code', 3, '630105', '城北区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3468, 346, '630100', 'area_code', 3, '630106', '湟中区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3469, 346, '630100', 'area_code', 3, '630121', '大通回族土族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3470, 346, '630100', 'area_code', 3, '630123', '湟源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3471, 347, '630200', 'area_code', 3, '630202', '乐都区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3472, 347, '630200', 'area_code', 3, '630203', '平安区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3473, 347, '630200', 'area_code', 3, '630222', '民和回族土族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3474, 347, '630200', 'area_code', 3, '630223', '互助土族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3475, 347, '630200', 'area_code', 3, '630224', '化隆回族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3476, 347, '630200', 'area_code', 3, '630225', '循化撒拉族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3477, 348, '632200', 'area_code', 3, '632221', '门源回族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3478, 348, '632200', 'area_code', 3, '632222', '祁连县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3479, 348, '632200', 'area_code', 3, '632223', '海晏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3480, 348, '632200', 'area_code', 3, '632224', '刚察县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3481, 349, '632300', 'area_code', 3, '632321', '同仁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3482, 349, '632300', 'area_code', 3, '632322', '尖扎县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3483, 349, '632300', 'area_code', 3, '632323', '泽库县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3484, 349, '632300', 'area_code', 3, '632324', '河南蒙古族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3485, 350, '632500', 'area_code', 3, '632521', '共和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3486, 350, '632500', 'area_code', 3, '632522', '同德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3487, 350, '632500', 'area_code', 3, '632523', '贵德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3488, 350, '632500', 'area_code', 3, '632524', '兴海县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3489, 350, '632500', 'area_code', 3, '632525', '贵南县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3490, 351, '632600', 'area_code', 3, '632621', '玛沁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3491, 351, '632600', 'area_code', 3, '632622', '班玛县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3492, 351, '632600', 'area_code', 3, '632623', '甘德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3493, 351, '632600', 'area_code', 3, '632624', '达日县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3494, 351, '632600', 'area_code', 3, '632625', '久治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3495, 351, '632600', 'area_code', 3, '632626', '玛多县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3496, 352, '632700', 'area_code', 3, '632701', '玉树市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3497, 352, '632700', 'area_code', 3, '632722', '杂多县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3498, 352, '632700', 'area_code', 3, '632723', '称多县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3499, 352, '632700', 'area_code', 3, '632724', '治多县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3500, 352, '632700', 'area_code', 3, '632725', '囊谦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3501, 352, '632700', 'area_code', 3, '632726', '曲麻莱县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3502, 353, '632800', 'area_code', 3, '632801', '格尔木市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3503, 353, '632800', 'area_code', 3, '632802', '德令哈市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3504, 353, '632800', 'area_code', 3, '632803', '茫崖市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3505, 353, '632800', 'area_code', 3, '632821', '乌兰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3506, 353, '632800', 'area_code', 3, '632822', '都兰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3507, 353, '632800', 'area_code', 3, '632823', '天峻县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3508, 353, '632800', 'area_code', 3, '632857', '大柴旦行政委员会', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3509, 354, '640100', 'area_code', 3, '640101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3510, 354, '640100', 'area_code', 3, '640104', '兴庆区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3511, 354, '640100', 'area_code', 3, '640105', '西夏区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3512, 354, '640100', 'area_code', 3, '640106', '金凤区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3513, 354, '640100', 'area_code', 3, '640121', '永宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3514, 354, '640100', 'area_code', 3, '640122', '贺兰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3515, 354, '640100', 'area_code', 3, '640181', '灵武市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3516, 355, '640200', 'area_code', 3, '640201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3517, 355, '640200', 'area_code', 3, '640202', '大武口区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3518, 355, '640200', 'area_code', 3, '640205', '惠农区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3519, 355, '640200', 'area_code', 3, '640221', '平罗县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3520, 356, '640300', 'area_code', 3, '640301', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3521, 356, '640300', 'area_code', 3, '640302', '利通区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3522, 356, '640300', 'area_code', 3, '640303', '红寺堡区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3523, 356, '640300', 'area_code', 3, '640323', '盐池县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3524, 356, '640300', 'area_code', 3, '640324', '同心县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3525, 356, '640300', 'area_code', 3, '640381', '青铜峡市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3526, 357, '640400', 'area_code', 3, '640401', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3527, 357, '640400', 'area_code', 3, '640402', '原州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3528, 357, '640400', 'area_code', 3, '640422', '西吉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3529, 357, '640400', 'area_code', 3, '640423', '隆德县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3530, 357, '640400', 'area_code', 3, '640424', '泾源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3531, 357, '640400', 'area_code', 3, '640425', '彭阳县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3532, 358, '640500', 'area_code', 3, '640501', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3533, 358, '640500', 'area_code', 3, '640502', '沙坡头区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3534, 358, '640500', 'area_code', 3, '640521', '中宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3535, 358, '640500', 'area_code', 3, '640522', '海原县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3536, 359, '650100', 'area_code', 3, '650101', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3537, 359, '650100', 'area_code', 3, '650102', '天山区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3538, 359, '650100', 'area_code', 3, '650103', '沙依巴克区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3539, 359, '650100', 'area_code', 3, '650104', '新市区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3540, 359, '650100', 'area_code', 3, '650105', '水磨沟区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3541, 359, '650100', 'area_code', 3, '650106', '头屯河区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3542, 359, '650100', 'area_code', 3, '650107', '达坂城区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3543, 359, '650100', 'area_code', 3, '650109', '米东区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3544, 359, '650100', 'area_code', 3, '650121', '乌鲁木齐县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3545, 360, '650200', 'area_code', 3, '650201', '市辖区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3546, 360, '650200', 'area_code', 3, '650202', '独山子区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3547, 360, '650200', 'area_code', 3, '650203', '克拉玛依区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3548, 360, '650200', 'area_code', 3, '650204', '白碱滩区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3549, 360, '650200', 'area_code', 3, '650205', '乌尔禾区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3550, 361, '650400', 'area_code', 3, '650402', '高昌区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3551, 361, '650400', 'area_code', 3, '650421', '鄯善县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3552, 361, '650400', 'area_code', 3, '650422', '托克逊县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3553, 362, '650500', 'area_code', 3, '650502', '伊州区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3554, 362, '650500', 'area_code', 3, '650521', '巴里坤哈萨克自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3555, 362, '650500', 'area_code', 3, '650522', '伊吾县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3556, 363, '652300', 'area_code', 3, '652301', '昌吉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3557, 363, '652300', 'area_code', 3, '652302', '阜康市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3558, 363, '652300', 'area_code', 3, '652323', '呼图壁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3559, 363, '652300', 'area_code', 3, '652324', '玛纳斯县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3560, 363, '652300', 'area_code', 3, '652325', '奇台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3561, 363, '652300', 'area_code', 3, '652327', '吉木萨尔县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3562, 363, '652300', 'area_code', 3, '652328', '木垒哈萨克自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3563, 364, '652700', 'area_code', 3, '652701', '博乐市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3564, 364, '652700', 'area_code', 3, '652702', '阿拉山口市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3565, 364, '652700', 'area_code', 3, '652722', '精河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3566, 364, '652700', 'area_code', 3, '652723', '温泉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3567, 365, '652800', 'area_code', 3, '652801', '库尔勒市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3568, 365, '652800', 'area_code', 3, '652822', '轮台县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3569, 365, '652800', 'area_code', 3, '652823', '尉犁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3570, 365, '652800', 'area_code', 3, '652824', '若羌县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3571, 365, '652800', 'area_code', 3, '652825', '且末县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3572, 365, '652800', 'area_code', 3, '652826', '焉耆回族自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3573, 365, '652800', 'area_code', 3, '652827', '和静县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3574, 365, '652800', 'area_code', 3, '652828', '和硕县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3575, 365, '652800', 'area_code', 3, '652829', '博湖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3576, 365, '652800', 'area_code', 3, '652871', '库尔勒经济技术开发区', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3577, 366, '652900', 'area_code', 3, '652901', '阿克苏市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3578, 366, '652900', 'area_code', 3, '652902', '库车市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3579, 366, '652900', 'area_code', 3, '652922', '温宿县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3580, 366, '652900', 'area_code', 3, '652924', '沙雅县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3581, 366, '652900', 'area_code', 3, '652925', '新和县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3582, 366, '652900', 'area_code', 3, '652926', '拜城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3583, 366, '652900', 'area_code', 3, '652927', '乌什县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3584, 366, '652900', 'area_code', 3, '652928', '阿瓦提县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3585, 366, '652900', 'area_code', 3, '652929', '柯坪县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3586, 367, '653000', 'area_code', 3, '653001', '阿图什市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3587, 367, '653000', 'area_code', 3, '653022', '阿克陶县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3588, 367, '653000', 'area_code', 3, '653023', '阿合奇县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3589, 367, '653000', 'area_code', 3, '653024', '乌恰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3590, 368, '653100', 'area_code', 3, '653101', '喀什市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3591, 368, '653100', 'area_code', 3, '653121', '疏附县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3592, 368, '653100', 'area_code', 3, '653122', '疏勒县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3593, 368, '653100', 'area_code', 3, '653123', '英吉沙县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3594, 368, '653100', 'area_code', 3, '653124', '泽普县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3595, 368, '653100', 'area_code', 3, '653125', '莎车县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3596, 368, '653100', 'area_code', 3, '653126', '叶城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3597, 368, '653100', 'area_code', 3, '653127', '麦盖提县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3598, 368, '653100', 'area_code', 3, '653128', '岳普湖县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3599, 368, '653100', 'area_code', 3, '653129', '伽师县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3600, 368, '653100', 'area_code', 3, '653130', '巴楚县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3601, 368, '653100', 'area_code', 3, '653131', '塔什库尔干塔吉克自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3602, 369, '653200', 'area_code', 3, '653201', '和田市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3603, 369, '653200', 'area_code', 3, '653221', '和田县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3604, 369, '653200', 'area_code', 3, '653222', '墨玉县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3605, 369, '653200', 'area_code', 3, '653223', '皮山县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3606, 369, '653200', 'area_code', 3, '653224', '洛浦县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3607, 369, '653200', 'area_code', 3, '653225', '策勒县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3608, 369, '653200', 'area_code', 3, '653226', '于田县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3609, 369, '653200', 'area_code', 3, '653227', '民丰县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3610, 370, '654000', 'area_code', 3, '654002', '伊宁市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3611, 370, '654000', 'area_code', 3, '654003', '奎屯市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3612, 370, '654000', 'area_code', 3, '654004', '霍尔果斯市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3613, 370, '654000', 'area_code', 3, '654021', '伊宁县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3614, 370, '654000', 'area_code', 3, '654022', '察布查尔锡伯自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3615, 370, '654000', 'area_code', 3, '654023', '霍城县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3616, 370, '654000', 'area_code', 3, '654024', '巩留县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3617, 370, '654000', 'area_code', 3, '654025', '新源县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3618, 370, '654000', 'area_code', 3, '654026', '昭苏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3619, 370, '654000', 'area_code', 3, '654027', '特克斯县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3620, 370, '654000', 'area_code', 3, '654028', '尼勒克县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3621, 371, '654200', 'area_code', 3, '654201', '塔城市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3622, 371, '654200', 'area_code', 3, '654202', '乌苏市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3623, 371, '654200', 'area_code', 3, '654221', '额敏县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3624, 371, '654200', 'area_code', 3, '654223', '沙湾县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3625, 371, '654200', 'area_code', 3, '654224', '托里县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3626, 371, '654200', 'area_code', 3, '654225', '裕民县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3627, 371, '654200', 'area_code', 3, '654226', '和布克赛尔蒙古自治县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL,
        NULL);
INSERT INTO `dict_table_level`
VALUES (3628, 372, '654300', 'area_code', 3, '654301', '阿勒泰市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3629, 372, '654300', 'area_code', 3, '654321', '布尔津县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3630, 372, '654300', 'area_code', 3, '654322', '富蕴县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3631, 372, '654300', 'area_code', 3, '654323', '福海县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3632, 372, '654300', 'area_code', 3, '654324', '哈巴河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3633, 372, '654300', 'area_code', 3, '654325', '青河县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3634, 372, '654300', 'area_code', 3, '654326', '吉木乃县', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3635, 373, '659000', 'area_code', 3, '659001', '石河子市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3636, 373, '659000', 'area_code', 3, '659002', '阿拉尔市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3637, 373, '659000', 'area_code', 3, '659003', '图木舒克市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3638, 373, '659000', 'area_code', 3, '659004', '五家渠市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3639, 373, '659000', 'area_code', 3, '659005', '北屯市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3640, 373, '659000', 'area_code', 3, '659006', '铁门关市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3641, 373, '659000', 'area_code', 3, '659007', '双河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3642, 373, '659000', 'area_code', 3, '659008', '可克达拉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3643, 373, '659000', 'area_code', 3, '659009', '昆玉市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);
INSERT INTO `dict_table_level`
VALUES (3644, 373, '659000', 'area_code', 3, '659010', '胡杨河市', NULL, 1, NULL, '2022-05-16 11:20:00', NULL, NULL, NULL);

-- ----------------------------
-- Records of dict_table_name
-- ----------------------------
INSERT INTO `dict_table_name`
VALUES (1, 'user_status', '用户状态', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (2, 'user_gender', '用户性别', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (4, 'dict_type', '字典类型', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (8, 'yes_no', '是否字典表', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (9, 'menu_type', '菜单类型', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (10, 'user_is_tab', '是否开启tab', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (14, 'approval_level', '立项级别', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (15, 'public_async_status_dict', 'public_async_status_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (16, 'public_attendance_direction_dict', 'public_attendance_direction_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (17, 'public_bank_code_dict', 'public_bank_code_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (18, 'project_category', '项目分类', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (19, 'public_certificate_status_dict', 'public_certificate_status_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (20, 'public_collection_type_dict', 'public_collection_type_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (21, 'public_construction_license_status_dict', 'public_construction_license_status_dict', NULL, '0', NULL, 1,
        NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (22, 'public_contract_period_type_dict', 'public_contract_period_type_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (23, 'company_role', '参建类型', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (24, 'public_culture_level_dict', 'public_culture_level_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (25, 'currency_type', '币种', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (26, 'public_data_sources_dict', 'public_data_sources_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (27, 'public_device_binding_dict', 'public_device_binding_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (28, 'public_device_status_dict', 'public_device_status_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (29, 'public_device_type_dict', 'public_device_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (30, 'public_direction_dict', 'public_direction_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (31, 'public_docking_status_dict', 'public_docking_status_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (32, 'public_docking_progress_dict', 'public_docking_progress_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (33, 'public_entry_exit_type_dict', 'public_entry_exit_type_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (34, 'public_file_status_dict', 'public_file_status_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (35, 'public_file_type_dict', 'public_file_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (36, 'function_num', '工程用途', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (37, 'public_gender_dict', 'public_gender_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL,
        NULL);
INSERT INTO `dict_table_name`
VALUES (38, 'id_card_type', '证件类型', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (39, 'public_identify_dict', 'public_identify_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL,
        NULL);
INSERT INTO `dict_table_name`
VALUES (40, 'public_job_certificate_dict', 'public_job_certificate_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (41, 'public_license_plate_color_dict', 'public_license_plate_color_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (42, 'public_license_plate_type_dict', 'public_license_plate_type_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (43, 'public_manage_type_dict', 'public_manage_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (44, 'public_marital_status_dict', 'public_marital_status_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (45, 'public_personnel_certificate_dict', 'public_personnel_certificate_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (46, 'public_politics_type_dict', 'public_politics_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (47, 'public_practice_dict', 'public_practice_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL,
        NULL);
INSERT INTO `dict_table_name`
VALUES (48, 'public_practice_type_dict', 'public_practice_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (49, 'project_size', '建设规模', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (50, 'project_status', '项目状态', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (51, 'public_professional_skill_level_dict', 'public_professional_skill_level_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (52, 'property_num', '建设性质', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (53, 'public_security_certificate_dict', 'public_security_certificate_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (54, 'public_skill_type_dict', 'public_skill_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (55, 'public_staff_status_dict', 'public_staff_status_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (56, 'public_title_level_dict', 'public_title_level_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (57, 'public_training_type_dict', 'public_training_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (58, 'public_unit_dict', 'public_unit_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (59, 'public_work_type_dict', 'public_work_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (60, 'public_worker_role_dict', 'public_worker_role_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (61, 'public_yes_no_dict', 'public_yes_no_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL,
        NULL);
INSERT INTO `dict_table_name`
VALUES (62, 'public_tower_crane_type_dict', 'public_tower_crane_type_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (63, 'public_switch_type_dict', 'public_switch_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (64, 'public_noise_dust_collection_type_dict', 'public_noise_dust_collection_type_dict', NULL, '0', NULL, 1,
        NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (65, 'public_trading_status_dict', 'public_trading_status_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (66, 'public_nation_dict', 'public_nation_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL,
        NULL);
INSERT INTO `dict_table_name`
VALUES (67, 'public_special_account_status_dict', 'public_special_account_status_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (68, 'public_distribution_channel_dict', 'public_distribution_channel_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (69, 'public_investment_nature_dict', 'public_investment_nature_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (70, 'functional_unit', '职能单位', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (71, 'public_device_distribution_state', 'public_device_distribution_state', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (72, 'public_video_platform_type', 'public_video_platform_type', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (73, 'public_institutions_status_dict', 'public_institutions_status_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (74, 'public_work_early_warning_status_dict', 'public_work_early_warning_status_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (75, 'public_work_alarm_status_dict', 'public_work_alarm_status_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (76, 'public_area_early_warning_status_dict', 'public_area_early_warning_status_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (77, 'public_area_alarm_status_dict', 'public_area_alarm_status_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (78, 'public_group_tower_early_warning_status_dict', 'public_group_tower_early_warning_status_dict', NULL, '0',
        NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (79, 'public_group_tower_alarm_status_dict', 'public_group_tower_alarm_status_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (80, 'public_real_time_status_dict', 'public_real_time_status_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (81, 'public_level_dict', 'public_level_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL,
        NULL);
INSERT INTO `dict_table_name`
VALUES (82, 'public_clause_point_type_dict', 'public_clause_point_type_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (83, 'public_faith_user_dict', 'public_faith_user_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL,
        NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (84, 'public_effect_status_dict', 'public_effect_status_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (85, 'public_calculate_type_dict', 'public_calculate_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (86, 'public_scoring_type_dict', 'public_scoring_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (87, 'public_clause_category_dict', 'public_clause_category_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (88, 'public_level_division_dict', 'public_level_division_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (89, 'public_business_type_dict', 'public_business_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (90, 'public_supervision_type_dict', 'public_supervision_type_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (91, 'child_project_status', '工程状态', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (92, 'child_project_type', '工程类型', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (93, 'structure_type', '结构类型', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (94, 'foundation_type', '地基类型', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (95, 'basic_type', '基础类型', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (96, 'public_device_online_status_dict', 'public_device_online_status_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (97, 'public_car_type_dict', 'public_car_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL,
        NULL);
INSERT INTO `dict_table_name`
VALUES (98, 'public_project_type_hainan_dict', 'public_project_type_hainan_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (99, 'public_region_hainan_dict', 'public_region_hainan_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (100, 'public_investors_nature_hainan_dict', 'public_investors_nature_hainan_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (101, 'public_plan_construct_progress_0_hainan_dict', 'public_plan_construct_progress_0_hainan_dict', NULL, '0',
        NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (102, 'public_plan_construct_progress_1_hainan_dict', 'public_plan_construct_progress_1_hainan_dict', NULL, '0',
        NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (103, 'public_file_type_hainan_dict', 'public_file_type_hainan_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (104, 'public_team_data_source_from_dict', 'public_team_data_source_from_dict', NULL, '0', NULL, 1, NULL,
        '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (105, 'public_message_type_dict', 'public_message_type_dict', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29',
        NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (106, 'public_warn_video_inspect_process_result_dict', 'public_warn_video_inspect_process_result_dict', NULL,
        '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (107, 'public_warn_video_inspect_issue_level_dict', 'public_warn_video_inspect_issue_level_dict', NULL, '0',
        NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (109, 'company_type', '企业登记注册类型', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (110, 'area_code', '行政区划', NULL, '1', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);
INSERT INTO `dict_table_name`
VALUES (111, 'enable_disable', '开启或关闭', NULL, '0', NULL, 1, NULL, '2022-05-16 11:20:29', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
