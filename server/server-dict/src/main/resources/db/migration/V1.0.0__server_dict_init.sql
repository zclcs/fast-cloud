SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dict_table
-- ----------------------------
CREATE TABLE `dict_table`
(
    `id`        bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '字典表名id',
    `dict_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表名',
    `code`      char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL COMMENT '字典code',
    `title`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典中文',
    `remark`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1313
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '字典'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dict_table_level
-- ----------------------------
CREATE TABLE `dict_table_level`
(
    `id`          bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '字典表名id',
    `parent_id`   bigint(20)                                                    NOT NULL DEFAULT 0 COMMENT '父项id-默认为0',
    `parent_code` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL DEFAULT '0' COMMENT '父级code-默认为0',
    `dict_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '表名',
    `level`       smallint(2)                                                   NOT NULL DEFAULT 1 COMMENT '层级',
    `code`        char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL COMMENT '字典code',
    `title`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典中文',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `ix_dict_table_parent_id` (`parent_id`) USING BTREE COMMENT '层级字典父项索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 3645
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '层级字典'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for dict_table_name
-- ----------------------------
CREATE TABLE `dict_table_name`
(
    `id`         bigint(20)                                                    NOT NULL AUTO_INCREMENT COMMENT '字典名表主键',
    `dict_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典名',
    `dict_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '字典名中文',
    `sort`       smallint(4)                                                   NULL     DEFAULT NULL COMMENT '排序',
    `type`       char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci     NOT NULL DEFAULT '0' COMMENT '字典类型 0 普通 1层级-默认为0',
    `remark`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 112
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '字典名表'
  ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
