package com.zclcs.common.core.entity.system;

import com.baomidou.mybatisplus.annotation.*;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 限流规则表 Entity
 *
 * @author zclcs
 * @date 2021-12-29 17:21:19.726
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("system_rate_limit_rule")
@ApiModel(value = "RateLimitRule对象", description = "限流规则表")
public class RateLimitRule extends BaseEntity {

    /**
     * 限流规则id
     */
    @TableId(value = "rate_limit_rule_id", type = IdType.AUTO)
    private Long rateLimitRuleId;

    /**
     * 请求uri（不支持通配符）
     */
    @TableField("request_uri")
    private String requestUri;

    /**
     * 请求方法，如果为ALL则表示对所有方法生效
     */
    @TableField("request_method")
    private String requestMethod;

    /**
     * 限制时间起
     */
    @TableField(value = "limit_from", updateStrategy = FieldStrategy.IGNORED)
    private String limitFrom;

    /**
     * 限制时间止
     */
    @TableField(value = "limit_to", updateStrategy = FieldStrategy.IGNORED)
    private String limitTo;

    /**
     * 限制次数
     */
    @TableField("rate_limit_count")
    private Integer rateLimitCount;

    /**
     * 时间周期（单位秒）
     */
    @TableField("interval_sec")
    private String intervalSec;

    /**
     * 规则状态 默认 1 @@enable_disable
     */
    @TableField("rule_status")
    private String ruleStatus;


}