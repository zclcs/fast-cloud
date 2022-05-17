package com.zclcs.common.core.entity.minio.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 文件 Vo
 *
 * @author zclcs
 * @date 2021-10-18 10:37:21.262
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "MinioFileVo对象", description = "文件")
public class MinioFileVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "文件id")
    private String id;

    @ApiModelProperty(value = "桶id")
    private Long bucketId;

    @ApiModelProperty(value = "桶名称")
    private String bucketName;

    @ApiModelProperty(value = "文件名称")
    private String fileName;

    @ApiModelProperty(value = "原文件名称")
    private String originalFileName;

    @ApiModelProperty(value = "文件路径")
    private String filePath;


}