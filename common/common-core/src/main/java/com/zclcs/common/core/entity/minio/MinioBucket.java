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
 * minio桶 Entity
 *
 * @author zclcs
 * @date 2021-10-21 16:45:35.202
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("minio_bucket")
@ApiModel(value = "MinioBucket对象", description = "minio桶")
public class MinioBucket extends BaseEntity {

    /**
     * 桶id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 桶名称
     */
    @TableField("bucket_name")
    private String bucketName;

    /**
     * 桶权限
     */
    @TableField("bucket_policy")
    private String bucketPolicy;

}