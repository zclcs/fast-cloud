package com.zclcs.common.core.entity;

import com.zclcs.common.core.entity.system.vo.SystemDeptVo;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * @author MrBird
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class DeptTree extends Tree<SystemDeptVo> implements Serializable {

    private static final long serialVersionUID = 1L;

    private Double orderNum;
    private Date createTime;
}
