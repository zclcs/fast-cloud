package com.zclcs.common.core.entity.system.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

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
@ApiModel(value = "SystemDeptVo", description = "部门表")
public class SystemDeptVo implements Serializable {

    /**
     * 顶级部门编号
     */
    public static final Long TOP_DEPT_ID = 0L;

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "部门id")
    @TableId(value = "dept_id", type = IdType.AUTO)
    private Long deptId;

    @ApiModelProperty(value = "上级部门id")
    private Long parentId;

    @ApiModelProperty(value = "部门名称")
    private String deptName;

    @ApiModelProperty(value = "排序")
    private Double orderNum;


}
