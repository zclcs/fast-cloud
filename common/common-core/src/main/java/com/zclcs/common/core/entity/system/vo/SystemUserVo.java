package com.zclcs.common.core.entity.system.vo;

import com.houkunlin.system.dict.starter.json.DictText;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

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
@ApiModel(value = "SystemUserVo", description = "用户表")
public class SystemUserVo {

    /**
     * 用户状态：有效
     */
    public static final String STATUS_VALID = "1";

    /**
     * 用户状态：锁定
     */
    public static final String STATUS_LOCK = "0";

    /**
     * 默认头像
     */
    public static final String DEFAULT_AVATAR = "default.jpg";

    /**
     * 默认密码
     */
    public static final String DEFAULT_PASSWORD = "1234qwer";

    /**
     * 性别男
     */
    public static final String SEX_MALE = "0";

    /**
     * 性别女
     */
    public static final String SEX_FEMALE = "1";

    /**
     * 性别保密
     */
    public static final String SEX_UNKNOWN = "2";

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户id")
    private Long userId;

    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "邮箱")
    private String email;

    @ApiModelProperty(value = "联系电话")
    private String mobile;

    @ApiModelProperty(value = "状态 0锁定 1有效")
    @DictText("user_status")
    private String status;

    @ApiModelProperty(value = "最近访问时间")
    private LocalDateTime lastLoginTime;

    @ApiModelProperty(value = "性别 0男 1女 2保密")
    @DictText("user_gender")
    private String gender;

    @ApiModelProperty(value = "是否开启tab，0关闭 1开启")
    @DictText("user_is_tab")
    private String isTab;

    @ApiModelProperty(value = "主题")
    private String theme;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "描述")
    private String description;

    @ApiModelProperty(value = "部门id")
    private Long deptId;

    @ApiModelProperty(value = "部门名称")
    private String deptName;

    @ApiModelProperty(value = "数据权限集合字符串")
    private String deptIdString;

    @ApiModelProperty(value = "用户角色编号集合字符串")
    private String roleIdString;

    @ApiModelProperty(value = "用户角色名称集合字符串")
    private String roleNameString;

    @ApiModelProperty(value = "角色编号集合")
    private List<Long> roleIds;

    @ApiModelProperty(value = "数据权限集合")
    private List<Long> deptIds;

    @ApiModelProperty(value = "用户角色名称集合")
    private List<String> roleNames;

    @ApiModelProperty(value = "是否需要刷新用户信息")
    private Boolean needUpdateUserDetail;
}
