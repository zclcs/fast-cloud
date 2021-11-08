package com.zclcs.common.core.entity.dict.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * 字典名表 Ao
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
@ApiModel(value = "DictTableNameAo对象", description = "字典名表")
public class DictTableNameAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "字典名表主键")
    private Long id;

    @Size(max = 255, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "字典名", required = true)
    private String dictName;

    @Size(max = 255, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "字典名中文", required = true)
    private String dictTitle;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    @Size(max = 40, message = "{noMoreThan}")
    @ApiModelProperty(value = "字典类型 0 普通 1层级-默认为0")
    private String type;

    @Size(max = 255, message = "{noMoreThan}")
    @ApiModelProperty(value = "备注")
    private String remark;


}