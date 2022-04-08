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
 * 字典 Ao
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
@ApiModel(value = "DictTableAo对象", description = "字典")
public class DictTableAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "字典表名id")
    private Long id;

    @Size(max = 255, message = "{noMoreThan}")
    @NotNull(message = "{required}")
    @ApiModelProperty(value = "表名", required = true)
    private String dictName;

    @Size(max = 40, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "字典code", required = true)
    private String code;

    @Size(max = 255, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "字典中文", required = true)
    private String title;

    @Size(max = 255, message = "{noMoreThan}")
    @ApiModelProperty(value = "备注")
    private String remark;


}