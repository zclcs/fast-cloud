package com.zclcs.common.core.entity;


import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class MenuTree extends Tree<SystemMenuVo> {

    private String path;
    private String component;
    private String perms;
    private String icon;
    private String type;
    private Double orderNum;
}
