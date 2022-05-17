package com.zclcs.common.core.entity.system.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

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
public class SystemUserAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户编号")
    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    private Long userId;

    @ApiModelProperty(value = "用户名", required = true)
    @NotBlank(message = "{required}")
    @Size(min = 4, max = 10, message = "{range}")
    private String username;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "部门id")
    private Long deptId;

    @ApiModelProperty(value = "邮箱")
    @Size(max = 50, message = "{noMoreThan}")
    @Email(message = "{email}")
    private String email;

    @ApiModelProperty(value = "联系电话")
    private String mobile;

    @ApiModelProperty(value = "状态 0锁定 1有效", required = true)
    @NotBlank(message = "{required}")
    private String status;

    @ApiModelProperty(value = "最近访问时间")
    private LocalDateTime lastLoginTime;

    @ApiModelProperty(value = "性别 0男 1女 2保密")
    private String gender;

    @ApiModelProperty(value = "是否开启tab，0关闭 1开启")
    private String isTab;

    @ApiModelProperty(value = "主题")
    private String theme;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "描述")
    private String description;

    @ApiModelProperty(value = "角色编号集合")
    private List<Long> roleIds;

    @ApiModelProperty(value = "数据权限集合")
    private List<Long> deptIds;


}
