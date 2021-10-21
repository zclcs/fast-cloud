SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for minio_bucket
-- ----------------------------
DROP TABLE IF EXISTS `minio_bucket`;
CREATE TABLE `minio_bucket`
(
    `id`            bigint(20)                                                   NOT NULL AUTO_INCREMENT COMMENT '桶id',
    `bucket_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '桶名称',
    `bucket_policy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'write-only' COMMENT '桶权限',
    `create_time`   datetime                                                     NULL     DEFAULT NULL COMMENT '创建时间',
    `modify_time`   datetime                                                     NULL     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = 'minio桶'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for minio_file
-- ----------------------------
DROP TABLE IF EXISTS `minio_file`;
CREATE TABLE `minio_file`
(
    `id`                 varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NOT NULL COMMENT '文件id',
    `bucket_id`          bigint(20)                                                     NOT NULL COMMENT '桶id',
    `file_name`          varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '文件名称',
    `original_file_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '原文件名称',
    `file_path`          varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件路径',
    `create_time`        datetime                                                       NULL DEFAULT NULL COMMENT '创建时间',
    `modify_time`        datetime                                                       NULL DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `ix_minio_file_bucket_id` (`bucket_id`) USING BTREE COMMENT '文件表桶id索引'
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = 'minio文件'
  ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
