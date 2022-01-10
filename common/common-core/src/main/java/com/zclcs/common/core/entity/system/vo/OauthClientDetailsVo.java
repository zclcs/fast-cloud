package com.zclcs.common.core.entity.system.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 客户端配置表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "OauthClientDetailsVo", description = "客户端配置表")
public class OauthClientDetailsVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "客户端ID")
    private String clientId;

    @ApiModelProperty(value = "资源编号")
    private String resourceIds;

    @ApiModelProperty(value = "客户端密钥")
    private String clientSecret;

    @ApiModelProperty(value = "客户端权限")
    private String scope;

    @ApiModelProperty(value = "鉴权类型")
    private String authorizedGrantTypes;

    @ApiModelProperty(value = "跳转地址")
    private String webServerRedirectUri;

    @ApiModelProperty(value = "拥有的系统权限")
    private String authorities;

    @ApiModelProperty(value = "系统菜单")
    private List<Long> menuIds;

    @ApiModelProperty(value = "token过期时间")
    private Integer accessTokenValidity;

    @ApiModelProperty(value = "token刷新时间")
    private Integer refreshTokenValidity;

    @ApiModelProperty(value = "额外信息")
    private String additionalInformation;

    @ApiModelProperty(value = "是否自动批准")
    private Integer autoapprove;

    @ApiModelProperty(value = "组织密码")
    private String originSecret;

}
