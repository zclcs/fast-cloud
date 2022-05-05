package com.zclcs.common.core.entity.system.router;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Vue路由 Meta
 *
 * @author zclcs
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class RouterMeta implements Serializable {

    private static final long serialVersionUID = 5499925008927195914L;

    private String title;
    private String icon;
    private Boolean hideMenu;
    private Boolean ignoreKeepAlive;
    private Boolean hideBreadcrumb;
    private Boolean hideChildrenInMenu;
    private String currentActiveMenu;

}
