package com.zclcs.common.core.entity.system.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

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
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemRoleVo", description = "角色表")
public class SystemRoleVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "角色id")
    @TableId(value = "role_id", type = IdType.AUTO)
    private Long roleId;

    @ApiModelProperty(value = "角色名称")
    private String roleName;

    @ApiModelProperty(value = "角色描述")
    private String remark;

    @ApiModelProperty(value = "角色菜单集合")
    private List<SystemRoleMenuVo> systemRoleMenuVos;

    @ApiModelProperty(value = "角色菜单编号集合字符串")
    private String menuIdsString;

    @ApiModelProperty(value = "角色菜单编号集合")
    private List<Long> menuIds;

    @ApiModelProperty(value = "角色用户账号集合")
    private List<String> usernames;

}
