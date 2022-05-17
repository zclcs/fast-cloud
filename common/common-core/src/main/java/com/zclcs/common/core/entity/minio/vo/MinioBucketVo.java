package com.zclcs.common.core.entity.minio.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * minio桶 Vo
 *
 * @author zclcs
 * @date 2021-10-21 16:45:35.202
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "MinioBucketVo对象", description = "minio桶")
public class MinioBucketVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "桶id")
    private Long id;

    @ApiModelProperty(value = "桶名称")
    private String bucketName;

    @ApiModelProperty(value = "桶权限")
    private String bucketPolicy;


}