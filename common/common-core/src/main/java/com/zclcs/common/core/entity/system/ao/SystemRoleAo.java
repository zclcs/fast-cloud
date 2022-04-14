package com.zclcs.common.core.entity.system.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
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
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemRole对象", description = "角色表")
public class SystemRoleAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "角色id")
    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    private Long roleId;

    @ApiModelProperty(value = "角色名称", required = true)
    @NotBlank(message = "{required}")
    @Size(max = 10, message = "{noMoreThan}")
    private String roleName;

    @ApiModelProperty(value = "角色描述")
    @Size(max = 50, message = "{noMoreThan}")
    private String remark;

    @ApiModelProperty(value = "菜单编号")
    @NotNull(message = "{required}")
    private List<Long> menuIds;


}
