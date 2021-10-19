package com.zclcs.common.core.entity.minio.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 桶 Vo
 *
 * @author zclcs
 * @date 2021-10-18 10:37:09.922
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "MinioBucketVo对象", description = "桶")
public class MinioBucketVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "桶id")
    private Long id;

    @ApiModelProperty(value = "桶名称")
    private String bucketName;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "修改时间")
    private Date modifyTime;


}