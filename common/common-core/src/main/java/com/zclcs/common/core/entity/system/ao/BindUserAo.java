package com.zclcs.common.core.entity.system.ao;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * @author zclcs
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "BindUserAo", description = "客户端配置表")
public class BindUserAo implements Serializable {

    private static final long serialVersionUID = -3890998115990166651L;

    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "绑定用户名")
    private String bindUsername;

    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "绑定用户密码")
    private String bindPassword;
}
