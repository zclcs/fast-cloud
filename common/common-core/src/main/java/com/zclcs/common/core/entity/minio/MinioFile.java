package com.zclcs.common.core.entity.minio;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 文件 Entity
 *
 * @author zclcs
 * @date 2021-10-18 10:37:21.262
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("minio_file")
@ApiModel(value = "MinioFile对象", description = "文件")
public class MinioFile extends BaseEntity {

    /**
     * 文件id
     */
    @TableId(value = "id", type = IdType.ASSIGN_UUID)
    private String id;

    /**
     * 桶id
     */
    @TableField("bucket_id")
    private Long bucketId;

    /**
     * 文件名称
     */
    @TableField("file_name")
    private String fileName;

    /**
     * 原文件名称
     */
    @TableField("original_file_name")
    private String originalFileName;

    /**
     * 文件路径
     */
    @TableField("file_path")
    private String filePath;

}