package com.zclcs.common.core.entity.minio.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @author zclcs
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "FileUploadVo", description = "文件")
public class FileUploadVo {

    @ApiModelProperty(value = "文件名称")
    private String fileName;

    @ApiModelProperty(value = "原文件名称")
    private String originalFileName;

    @ApiModelProperty(value = "文件路径")
    private String filePath;

    @ApiModelProperty(value = "http 地址")
    private String urlHttp;

    @ApiModelProperty(value = "域名 地址")
    private String urlDomain;
}
