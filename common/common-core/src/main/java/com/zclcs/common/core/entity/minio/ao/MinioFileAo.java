package com.zclcs.common.core.entity.minio.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * 文件 Ao
 *
 * @author zclcs
 * @date 2021-10-18 10:37:21.262
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "MinioFileAo对象", description = "文件")
public class MinioFileAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @Size(max = 64, message = "{noMoreThan}")
    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "文件id")
    private String id;

    @NotNull(message = "{required}")
    @ApiModelProperty(value = "桶id", required = true)
    private Long bucketId;

    @Size(max = 500, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "文件名称", required = true)
    private String fileName;

    @Size(max = 500, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "原文件名称", required = true)
    private String originalFileName;

    @Size(max = 1000, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "文件路径", required = true)
    private String filePath;


}