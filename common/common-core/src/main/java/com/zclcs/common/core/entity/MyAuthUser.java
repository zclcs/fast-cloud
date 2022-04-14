package com.zclcs.common.core.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * @author zclcs
 */
@Data
@SuppressWarnings("all")
@EqualsAndHashCode(callSuper = true)
public class MyAuthUser extends User {

    private static final long serialVersionUID = -6411066541689297219L;

    private Long userId;

    private String avatar;

    private String email;

    private String mobile;

    private String sex;

    private Long deptId;

    private String deptName;

    private Date lastLoginTime;

    private String description;

    private String status;

    @ApiModelProperty(value = "数据权限集合")
    private String deptIdString;

    @ApiModelProperty(value = "用户角色编号集合")
    private String roleIdString;

    @ApiModelProperty(value = "用户角色名称集合字符串")
    private String roleNameString;

    @ApiModelProperty(value = "角色编号集合")
    private List<Long> roleIds;

    @ApiModelProperty(value = "数据权限集合")
    private List<Long> deptIds;

    @ApiModelProperty(value = "用户角色名称集合")
    private List<String> roleNames;

    public MyAuthUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    public MyAuthUser(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
    }
}
