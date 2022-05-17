package com.zclcs.common.core.entity.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

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
@ApiModel(value = "SystemLog对象", description = "用户操作日志表")
public class SystemLog extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 日志id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 操作用户
     */
    @TableField("username")
    private String username;

    /**
     * 操作内容
     */
    @TableField("operation")
    private String operation;

    /**
     * 耗时
     */
    @TableField("time")
    private BigDecimal time;

    /**
     * 操作方法
     */
    @TableField("method")
    private String method;

    /**
     * 方法参数
     */
    @TableField("params")
    private String params;

    /**
     * 操作者ip
     */
    @TableField("ip")
    private String ip;

    /**
     * 操作地点
     */
    @TableField("location")
    private String location;

}
