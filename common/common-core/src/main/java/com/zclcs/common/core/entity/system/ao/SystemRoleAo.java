package com.zclcs.common.core.entity.system.ao;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemRole对象", description = "角色表")
public class SystemRoleAo {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "角色名称")
    @NotBlank(message = "{required}")
    @Size(max = 10, message = "{noMoreThan}")
    private String roleName;

    @ApiModelProperty(value = "角色描述")
    @Size(max = 50, message = "{noMoreThan}")
    private String remark;

    @ApiModelProperty(value = "菜单编号")
    private List<Long> menuIds;


}
