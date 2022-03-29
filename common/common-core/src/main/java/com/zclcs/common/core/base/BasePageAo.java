package com.zclcs.common.core.base;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * 基础分页对象
 *
 * @author zclcs
 */
@Data
@ApiModel(value = "分页实体")
public class BasePageAo {

    /**
     * 页码
     */
    @NotNull(message = "请输入页码")
    @ApiModelProperty(value = "页码", required = true)
    private Integer pageNum;

    /**
     * 页数
     */
    @NotNull(message = "请输入页数")
    @ApiModelProperty(value = "页数", required = true)
    private Integer pageSize;

    /**
     * 排序字段
     */
    @ApiModelProperty(value = "排序字段")
    private String field;

    /**
     * 排序规则，asc升序，desc降序
     */
    @ApiModelProperty(value = "排序规则，asc升序，desc降序")
    private String order;
}
