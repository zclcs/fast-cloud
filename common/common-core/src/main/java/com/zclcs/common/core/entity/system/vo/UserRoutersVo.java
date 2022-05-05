package com.zclcs.common.core.entity.system.vo;

import com.zclcs.common.core.entity.system.router.VueRouter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * @author zclcs
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "UserRoutersVo", description = "用户表")
public class UserRoutersVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户路由")
    private List<VueRouter<SystemMenuVo>> routes;

    @ApiModelProperty(value = "用户权限")
    private List<String> permissions;

}
