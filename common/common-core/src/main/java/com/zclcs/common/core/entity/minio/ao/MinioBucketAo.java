package com.zclcs.common.core.entity.minio.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * minio桶 Ao
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
@ApiModel(value = "MinioBucketAo对象", description = "minio桶")
public class MinioBucketAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "桶id")
    private Long id;

    @Size(max = 50, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "桶名称", required = true)
    private String bucketName;

    @Size(max = 50, message = "{noMoreThan}")
    @ApiModelProperty(value = "桶权限", required = true)
    private String bucketPolicy;


}