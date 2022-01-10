package com.zclcs.common.core.entity.system.ao;

import com.zclcs.common.core.validate.strategy.AddStrategy;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
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
@ApiModel(value = "OauthClientDetailsAo", description = "客户端配置表")
public class OauthClientDetailsAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "客户端ID")
    @NotBlank(message = "{required}", groups = UpdateStrategy.class)
    @Size(max = 255, message = "{noMoreThan}")
    private String clientId;

    @ApiModelProperty(value = "资源编号")
    @Size(max = 255, message = "{noMoreThan}")
    private String resourceIds;

    @ApiModelProperty(value = "客户端密钥")
    @NotBlank(message = "{required}", groups = AddStrategy.class)
    @Size(max = 255, message = "{noMoreThan}")
    private String clientSecret;

    @ApiModelProperty(value = "客户端权限")
    @NotBlank(message = "{required}")
    @Size(max = 255, message = "{noMoreThan}")
    private String scope;

    @ApiModelProperty(value = "鉴权类型")
    @NotBlank(message = "{required}")
    @Size(max = 255, message = "{noMoreThan}")
    private String authorizedGrantTypes;

    @ApiModelProperty(value = "跳转地址")
    @Size(max = 255, message = "{noMoreThan}")
    private String webServerRedirectUri;

    @ApiModelProperty(value = "拥有的系统权限")
    @Size(max = 1000, message = "{noMoreThan}")
    private String authorities;

    @ApiModelProperty(value = "系统菜单")
    private List<Long> menuIds;

    @ApiModelProperty(value = "token过期时间")
    @NotNull(message = "{required}")
    private Integer accessTokenValidity;

    @ApiModelProperty(value = "token刷新时间")
    private Integer refreshTokenValidity;

    @ApiModelProperty(value = "额外信息")
    private String additionalInformation;

    @ApiModelProperty(value = "是否自动批准")
    private Integer autoApprove;

    @ApiModelProperty(value = "组织密码")
    private String originSecret;

}
