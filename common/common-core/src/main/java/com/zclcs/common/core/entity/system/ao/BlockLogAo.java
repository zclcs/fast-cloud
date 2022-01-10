package com.zclcs.common.core.entity.system.ao;

import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * 黑名单拦截日志表 Ao
 *
 * @author zclcs
 * @date 2021-12-29 17:21:44.593
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "BlockLogAo对象", description = "黑名单拦截日志表")
public class BlockLogAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "拦截日志id")
    private Long blockId;

    @Size(max = 200, message = "{noMoreThan}")
    @ApiModelProperty(value = "拦截ip")
    private String blockIp;

    @Size(max = 500, message = "{noMoreThan}")
    @ApiModelProperty(value = "被拦截请求URI")
    private String requestUri;

    @Size(max = 200, message = "{noMoreThan}")
    @ApiModelProperty(value = "被拦截请求方法")
    private String requestMethod;

    @Size(max = 200, message = "{noMoreThan}")
    @ApiModelProperty(value = "IP对应地址")
    private String location;


}