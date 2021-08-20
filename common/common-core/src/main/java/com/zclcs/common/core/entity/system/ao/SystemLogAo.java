package com.zclcs.common.core.entity.system.ao;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.Date;

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
@ApiModel(value = "SystemLogVo", description = "用户操作日志表")
public class SystemLogAo {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "日志id")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

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

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "操作地点")
    private String location;

    @ApiModelProperty(value = "创建时间-开始")
    private String createTimeFrom;

    @ApiModelProperty(value = "创建时间-结束")
    private String createTimeTo;
}