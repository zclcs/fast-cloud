package com.zclcs.common.core.entity.dict.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * 字典 Vo
 *
 * @author zclcs
 * @date 2021-11-02 15:26:13.215
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "DictTableVo对象", description = "字典")
public class DictTableVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "字典表名id")
    private Long id;

    @ApiModelProperty(value = "字典表名id集合")
    private List<Long> ids;

    @ApiModelProperty(value = "字典名", required = true)
    private String dictName;

    @ApiModelProperty(value = "字典名集合", required = true)
    private List<String> dictNames;

    @ApiModelProperty(value = "字典名中文")
    private String dictTitle;

    @ApiModelProperty(value = "字典code")
    private String code;

    @ApiModelProperty(value = "字典中文")
    private String title;

    @ApiModelProperty(value = "备注")
    private String remark;


}