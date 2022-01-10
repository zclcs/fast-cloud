package com.zclcs.common.core.entity.system.ao;

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
 * 限流规则表 Ao
 *
 * @author zclcs
 * @date 2021-12-29 17:21:19.726
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "RateLimitRuleAo对象", description = "限流规则表")
public class RateLimitRuleAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "限流规则id")
    private Long rateLimitRuleId;

    @Size(max = 200, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "请求uri（不支持通配符）", required = true)
    private String requestUri;

    @Size(max = 10, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "请求方法，如果为ALL则表示对所有方法生效", required = true)
    private String requestMethod;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "限制时间起")
    private String limitFrom;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "限制时间止")
    private String limitTo;

    @NotNull(message = "{required}")
    @ApiModelProperty(value = "限制次数", required = true)
    private Integer rateLimitCount;

    @Size(max = 20, message = "{noMoreThan}")
    @NotBlank(message = "{required}")
    @ApiModelProperty(value = "时间周期（单位秒）", required = true)
    private String intervalSec;

    @Size(max = 40, message = "{noMoreThan}")
    @ApiModelProperty(value = "规则状态 默认 1 @@enable_disable")
    private String ruleStatus;


}