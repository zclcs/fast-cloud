package com.zclcs.common.core.entity.system.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;

/**
 * <p>
 * 用户操作日志表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemLogAo", description = "用户操作日志表")
public class SystemLogAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "日志id")
    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    private Long id;

    @ApiModelProperty(value = "类名")
    private String className;

    @ApiModelProperty(value = "方法名")
    private String methodName;

    @ApiModelProperty(value = "操作用户")
    private String username;

    @ApiModelProperty(value = "操作内容")
    private String operation;

    @ApiModelProperty(value = "耗时")
    private BigDecimal time;

    @ApiModelProperty(value = "操作方法")
    private String method;

    @ApiModelProperty(value = "方法参数")
    private String params;

    @ApiModelProperty(value = "操作者ip")
    private String ip;

    @ApiModelProperty(value = "方法开始时间")
    private Long start;

    @ApiModelProperty(value = "操作地点")
    private String location;

    @ApiModelProperty(value = "创建时间-开始")
    private LocalDate createTimeFrom;

    @ApiModelProperty(value = "创建时间-结束")
    private LocalDate createTimeTo;
}
