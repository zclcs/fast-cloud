package com.zclcs.common.core.entity.test.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * 班级 Ao
 *
 * @author zclcs
 * @date 2022-01-10 14:54:16.690
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "TestClassAo对象", description = "班级")
public class TestClassAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "主键")
    private Long id;

    @Size(max = 255, message = "{noMoreThan}")
    @ApiModelProperty(value = "名称")
    private String name;

    @Size(max = 40, message = "{noMoreThan}")
    @ApiModelProperty(value = "类型 @@yes_no")
    private String type;


}