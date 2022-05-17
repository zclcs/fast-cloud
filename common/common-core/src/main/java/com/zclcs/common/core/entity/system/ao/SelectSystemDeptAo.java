package com.zclcs.common.core.entity.system.ao;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDate;

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
@ApiModel(value = "SelectSystemDeptAo", description = "部门表")
public class SelectSystemDeptAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "上级部门id")
    private Long parentId;

    @ApiModelProperty(value = "部门名称")
    private String deptName;

    @ApiModelProperty(value = "排序")
    private Double orderNum;

    @ApiModelProperty(value = "创建时间-开始")
    private LocalDate createTimeFrom;

    @ApiModelProperty(value = "创建时间-结束")
    private LocalDate createTimeTo;


}
