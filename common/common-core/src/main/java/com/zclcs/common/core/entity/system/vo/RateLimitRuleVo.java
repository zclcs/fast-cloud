package com.zclcs.common.core.entity.system.vo;

import com.houkunlin.system.dict.starter.json.DictText;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 限流规则表 Vo
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
@ApiModel(value = "RateLimitRuleVo对象", description = "限流规则表")
public class RateLimitRuleVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "限流规则id")
    private Long rateLimitRuleId;

    @ApiModelProperty(value = "请求uri（不支持通配符）")
    private String requestUri;

    @ApiModelProperty(value = "请求方法，如果为ALL则表示对所有方法生效")
    private String requestMethod;

    @ApiModelProperty(value = "限制时间起")
    private String limitFrom;

    @ApiModelProperty(value = "限制时间止")
    private String limitTo;

    @ApiModelProperty(value = "限制次数")
    private Integer rateLimitCount;

    @ApiModelProperty(value = "时间周期（单位秒）")
    private String intervalSec;

    @ApiModelProperty(value = "规则状态 默认 1 @@yes_no")
    @DictText("enable_disable")
    private String ruleStatus;


}