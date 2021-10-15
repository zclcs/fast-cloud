package com.zclcs.common.core.entity.test.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * 班级 Ao
 *
 * @author zclcs
 * @date 2021-10-15 09:28:31.675
 */
@Data
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


}