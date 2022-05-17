/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_192.168.30.10
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : 192.168.33.10:3306
 Source Schema         : dev_test

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 16/05/2022 18:17:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for test_child_project
-- ----------------------------
CREATE TABLE `test_child_project`
(
    `child_project_id`     bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '工程id',
    `child_project_name`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '工程名称',
    `project_id`           bigint(20)                                                    NOT NULL COMMENT '项目id',
    `location`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '建设地址',
    `child_project_size`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '工程建设规模',
    `price`                varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '合同价格（单位：分）',
    `contract_start_date`  date                                                          NULL DEFAULT NULL COMMENT '合同工期起始时间',
    `contract_end_date`    date                                                          NULL DEFAULT NULL COMMENT '合同工期终止时间',
    `construction_permit`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '施工许可证号',
    `permit_grant_org`     varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '施工许可证发证机关',
    `permit_grant_date`    date                                                          NULL DEFAULT NULL COMMENT '施工许可证发证日期',
    `permit_status`        varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '施工许可证状态',
    `permit_attachment`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '施工许可证扫描件',
    `permit_remark`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '施工许可证备注',
    `child_project_status` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '工程状态 @@child_project_status',
    `child_project_type`   varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '工程类型 @@child_project_type',
    `structure_type`       varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '结构类型 @@structure_type',
    `foundation_type`      varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '地基类型 @@foundation_type',
    `base_type`            varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '基础类型 @@basic_type',
    `prj_start_date`       date                                                          NULL DEFAULT NULL COMMENT '计划开工日期',
    `prj_complete_date`    date                                                          NULL DEFAULT NULL COMMENT '计划竣工日期',
    `prj_length`           varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '长度',
    `prj_span`             varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '跨度',
    `over_ground_floor`    varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '结构地上层数',
    `under_ground_floor`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '结构底下层数',
    `useful_life`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '设计使用年限',
    `seismic_precaution`   varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '抗震设防烈度',
    `prj_area`             varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '面积',
    `version`              bigint(20)                                                    NULL DEFAULT 1 COMMENT '版本',
    `tenant_id`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '租户id',
    `create_at`            datetime                                                      NOT NULL COMMENT '创建时间',
    `update_at`            datetime                                                      NULL DEFAULT NULL COMMENT '编辑时间',
    `create_by`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `update_by`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`child_project_id`) USING BTREE,
    INDEX `ix_test_child_project_project_id` (`project_id`) USING BTREE COMMENT '工程表项目编号索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '工程信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for test_company
-- ----------------------------
CREATE TABLE `test_company`
(
    `company_id`               bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '企业id',
    `company_code`             varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '统一社会信用代码或组织机构代码',
    `company_attachment`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '营业执照扫描件',
    `company_name`             varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '企业名称',
    `company_type`             char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT NULL COMMENT '企业登记注册类型 @@company_type',
    `license_num`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '工商营业执照注册号',
    `area_code`                varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注册地区编码 array @@area_code',
    `address`                  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业营业地址',
    `zip_code`                 varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '邮政编码',
    `legal_man`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '法定代表人姓名',
    `legal_man_phone`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '法定代表人电话',
    `legal_man_duty`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '法定代表人职务',
    `legal_man_pro_title`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '法定代表人职称',
    `legal_man_id_card_type`   char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT NULL COMMENT '法定代表人证件类型 @@id_card_type',
    `legal_man_id_card_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '法定代表人证件号码',
    `reg_capital`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '注册资本（单位：分）',
    `fact_reg_capital`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '实收资本（单位：分）',
    `capital_currency_type`    char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NULL DEFAULT NULL COMMENT '资本币种 @@currency_type',
    `register_date`            date                                                          NULL DEFAULT NULL COMMENT '注册日期',
    `establish_date`           date                                                          NULL DEFAULT NULL COMMENT '成立日期',
    `office_phone`             varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '办公电话',
    `fax_number`               varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '传真号码',
    `link_man`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '联系人姓名',
    `link_duty`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系人职务',
    `link_phone`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '联系人电话',
    `email`                    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业邮箱',
    `web_site`                 varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业网址',
    `remark`                   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '企业备注',
    `version`                  bigint(20)                                                    NULL DEFAULT 1 COMMENT '版本',
    `tenant_id`                varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '租户id',
    `create_at`                datetime                                                      NOT NULL COMMENT '创建时间',
    `update_at`                datetime                                                      NULL DEFAULT NULL COMMENT '编辑时间',
    `create_by`                varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `update_by`                varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '企业信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for test_project
-- ----------------------------
CREATE TABLE `test_project`
(
    `project_id`             bigint(20)                                                     NOT NULL AUTO_INCREMENT COMMENT '项目id',
    `project_code`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '项目编号',
    `project_name`           varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '项目名称',
    `description`            varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '项目简介',
    `category`               char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NOT NULL COMMENT '项目分类 @@project_category',
    `build_plan_num`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '建设用地规划许可证编号',
    `child_project_plan_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '建设工程规划许可证编号',
    `area_code`              varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '项目所在地 array @@area_code',
    `is_lead_by_city`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NULL DEFAULT NULL COMMENT '是否市直管 @@yes_no',
    `invest`                 varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '总投资（单位：分）',
    `building_area`          varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '总面积（单位：平方分米）',
    `building_length`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '总长度（单位：厘米）',
    `start_date`             date                                                           NULL DEFAULT NULL COMMENT '实际开工日期',
    `complete_date`          date                                                           NULL DEFAULT NULL COMMENT '实际竣工日期',
    `planned_start_date`     date                                                           NULL DEFAULT NULL COMMENT '计划开工日期',
    `planned_complete_date`  date                                                           NULL DEFAULT NULL COMMENT '计划竣工日期',
    `link_man`               varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '联系人姓名',
    `link_phone`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '联系人电话',
    `project_status`         char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NOT NULL COMMENT '项目状态 @@project_status',
    `lng`                    decimal(18, 15)                                                NULL DEFAULT NULL COMMENT '经度',
    `lat`                    decimal(18, 15)                                                NULL DEFAULT NULL COMMENT '纬度',
    `address`                varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '项目地址',
    `approval_num`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '立项文号',
    `approval_level_num`     char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NULL DEFAULT NULL COMMENT '立项级别 @@approval_level',
    `project_size`           char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NULL DEFAULT NULL COMMENT '建设规模 @@project_size',
    `property_num`           char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NULL DEFAULT NULL COMMENT '建设性质 @@property_num',
    `function_num`           char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NULL DEFAULT NULL COMMENT '工程用途 @@function_num',
    `functional_unit`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NULL DEFAULT NULL COMMENT '职能单位 @@functional_unit',
    `major_project`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci       NULL DEFAULT NULL COMMENT '是否重点项目 @@yes_no',
    `last_attend_time`       datetime                                                       NULL DEFAULT NULL COMMENT '最后一次考勤时间',
    `version`                bigint(20)                                                     NULL DEFAULT 1 COMMENT '版本',
    `tenant_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci   NULL DEFAULT NULL COMMENT '租户id',
    `create_at`              datetime                                                       NOT NULL COMMENT '创建时间',
    `update_at`              datetime                                                       NULL DEFAULT NULL COMMENT '编辑时间',
    `create_by`              varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '创建人',
    `update_by`              varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`project_id`) USING BTREE,
    INDEX `ix_test_project_project_status` (`project_status`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '项目信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for test_project_company
-- ----------------------------
CREATE TABLE `test_project_company`
(
    `project_company_id`     bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '参建单位id',
    `project_id`             bigint(20)                                                    NOT NULL COMMENT '项目id',
    `company_id`             bigint(20)                                                    NOT NULL COMMENT '企业id',
    `company_role`           char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NOT NULL COMMENT '参建类型 @@company_role',
    `manager_name`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '项目经理姓名',
    `manager_id_card_type`   char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci      NULL DEFAULT NULL COMMENT '项目经理证件类型 @@id_card_type',
    `manager_id_card_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '项目经理证件号码',
    `manager_phone`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '项目经理联系电话',
    `version`                bigint(20)                                                    NULL DEFAULT 1 COMMENT '版本',
    `tenant_id`              varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL DEFAULT NULL COMMENT '租户id',
    `create_at`              datetime                                                      NOT NULL COMMENT '创建时间',
    `update_at`              datetime                                                      NULL DEFAULT NULL COMMENT '编辑时间',
    `create_by`              varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
    `update_by`              varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编辑人',
    PRIMARY KEY (`project_company_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '项目参建单位信息数据表'
  ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
