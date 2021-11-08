package com.zclcs.common.core.entity.dict.vo;

import com.houkunlin.system.dict.starter.json.DictText;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 字典名表 Vo
 *
 * @author zclcs
 * @date 2021-11-02 15:26:20.789
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "DictTableNameVo对象", description = "字典名表")
public class DictTableNameVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "字典名表主键")
    private Long id;

    @ApiModelProperty(value = "字典名")
    private String dictName;

    @ApiModelProperty(value = "字典名中文")
    private String dictTitle;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    @ApiModelProperty(value = "字典类型 0 普通 1层级-默认为0")
    @DictText("dict_type")
    private String type;

    @ApiModelProperty(value = "备注")
    private String remark;


}