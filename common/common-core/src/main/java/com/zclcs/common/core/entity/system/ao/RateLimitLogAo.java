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
 * 限流拦截日志表 Ao
 *
 * @author zclcs
 * @date 2021-12-29 17:21:34.946
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "RateLimitLogAo对象", description = "限流拦截日志表")
public class RateLimitLogAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "限流日志id")
    private Long rateLimitLogId;

    @Size(max = 200, message = "{noMoreThan}")
    @ApiModelProperty(value = "被拦截请求IP")
    private String rateLimitLogIp;

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