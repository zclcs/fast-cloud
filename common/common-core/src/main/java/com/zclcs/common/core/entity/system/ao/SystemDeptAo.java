package com.zclcs.common.core.entity.system.ao;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * <p>
 * 部门表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemDeptAo", description = "部门表")
public class SystemDeptAo {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "上级部门id")
    private Long parentId;

    @NotBlank(message = "{required}")
    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "部门名称")
    private String deptName;

    @ApiModelProperty(value = "排序")
    private Double orderNum;

    @ApiModelProperty(value = "创建时间-开始")
    private String createTimeFrom;

    @ApiModelProperty(value = "创建时间-结束")
    private String createTimeTo;


}
