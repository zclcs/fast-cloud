package com.zclcs.common.core.entity.system.ao;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * <p>
 * 系统用户社交账户关联表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemUserConnectionAo", description = "系统用户社交账户关联表")
public class SystemUserConnectionAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "系统用户名")
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String userName;

    @ApiModelProperty(value = "第三方平台名称")
    @NotBlank(message = "{required}")
    @Size(max = 20, message = "{noMoreThan}")
    private String providerName;

    @ApiModelProperty(value = "第三方平台账户id")
    @NotBlank(message = "{required}")
    @Size(max = 50, message = "{noMoreThan}")
    private String providerUserId;

    @ApiModelProperty(value = "第三方平台用户名")
    @Size(max = 50, message = "{noMoreThan}")
    private String providerUserName;

    @ApiModelProperty(value = "第三方平台昵称")
    @Size(max = 50, message = "{noMoreThan}")
    private String nickName;

    @ApiModelProperty(value = "第三方平台头像")
    @Size(max = 512, message = "{noMoreThan}")
    private String imageUrl;

    @ApiModelProperty(value = "地址")
    @Size(max = 255, message = "{noMoreThan}")
    private String location;

    @ApiModelProperty(value = "备注")
    @Size(max = 255, message = "{noMoreThan}")
    private String remark;

}
