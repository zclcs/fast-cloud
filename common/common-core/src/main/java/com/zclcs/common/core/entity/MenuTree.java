package com.zclcs.common.core.entity;


import com.zclcs.common.core.entity.system.vo.SystemMenuVo;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * @author zclcs
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class MenuTree extends Tree<SystemMenuVo> implements Serializable {

    private static final long serialVersionUID = 1L;

    private String path;
    private String component;
    private String redirect;
    private String perms;
    private String icon;
    private String type;
    private String hideMenu;
    private String ignoreKeepAlive;
    private String hideBreadcrumb;
    private String hideChildrenInMenu;
    private String currentActiveMenu;
    private Double orderNum;
    private Date createTime;
}
