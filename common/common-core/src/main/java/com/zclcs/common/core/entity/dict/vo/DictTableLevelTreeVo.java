package com.zclcs.common.core.entity.dict.vo;

import com.zclcs.common.core.entity.Tree;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author zclcs
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "DictTableLevelTreeVo对象", description = "层级字典树结构")
public class DictTableLevelTreeVo extends Tree<DictTableLevelVo> implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "字典名", required = true)
    private String dictName;

    @ApiModelProperty(value = "是否有父级")
    private Boolean hasPar;

    @ApiModelProperty(value = "字典code")
    private String code;

    @ApiModelProperty(value = "字典中文")
    private String title;

    @ApiModelProperty(value = "备注")
    private String remark;

}
