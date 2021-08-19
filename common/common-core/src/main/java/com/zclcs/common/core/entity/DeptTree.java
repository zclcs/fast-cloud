package com.zclcs.common.core.entity;

import com.zclcs.common.core.entity.system.vo.SystemDeptVo;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class DeptTree extends Tree<SystemDeptVo> {

    private Double orderNum;
}
