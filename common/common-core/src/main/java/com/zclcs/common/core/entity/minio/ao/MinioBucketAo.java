package com.zclcs.common.core.entity.minio.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * 桶 Ao
 *
 * @author zclcs
 * @date 2021-10-18 10:37:09.922
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "MinioBucketAo对象", description = "桶")
@Builder
public class MinioBucketAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "桶id")
    private Long id;

    @Size(max = 50, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "桶名称", required = true)
    private String bucketName;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "修改时间")
    private Date modifyTime;


}