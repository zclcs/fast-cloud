package com.zclcs.common.core.entity.minio;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

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
public class MinioFile extends Model<MinioFile> {

    /**
     * 文件id
     */
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
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

    /**
     * 创建时间
     */
    @TableField("create_time")
    private Date createTime;

    /**
     * 修改时间
     */
    @TableField("modify_time")
    private Date modifyTime;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }
}