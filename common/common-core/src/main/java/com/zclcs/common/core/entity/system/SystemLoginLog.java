package com.zclcs.common.core.entity.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * <p>
 * 登录日志表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemLoginLog对象", description = "登录日志表")
public class SystemLoginLog extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户名
     */
    @TableField("username")
    private String username;

    /**
     * 登录时间
     */
    @TableField("login_time")
    private LocalDateTime loginTime;

    /**
     * 登录地点
     */
    @TableField("location")
    private String location;

    /**
     * ip地址
     */
    @TableField("ip")
    private String ip;

    /**
     * 操作系统
     */
    @TableField("system")
    private String system;

    /**
     * 浏览器
     */
    @TableField("browser")
    private String browser;

}
