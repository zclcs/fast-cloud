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
 * 用户表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemUser对象", description = "用户表")
public class SystemUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    @TableId(value = "user_id", type = IdType.AUTO)
    private Long userId;

    /**
     * 用户名
     */
    @TableField("username")
    private String username;

    /**
     * 密码
     */
    @TableField("password")
    private String password;

    /**
     * 部门id
     */
    @TableField("dept_id")
    private Long deptId;

    /**
     * 邮箱
     */
    @TableField("email")
    private String email;

    /**
     * 联系电话
     */
    @TableField("mobile")
    private String mobile;

    /**
     * 状态 0锁定 1有效
     */
    @TableField("status")
    private String status;

    /**
     * 最近访问时间
     */
    @TableField("lastLoginTime")
    private LocalDateTime lastLoginTime;

    /**
     * 性别 0男 1女 2保密
     */
    @TableField("gender")
    private String gender;

    /**
     * 是否开启tab，0关闭 1开启
     */
    @TableField("is_tab")
    private String isTab;

    /**
     * 主题
     */
    @TableField("theme")
    private String theme;

    /**
     * 头像
     */
    @TableField("avatar")
    private String avatar;

    /**
     * 描述
     */
    @TableField("description")
    private String description;

}
