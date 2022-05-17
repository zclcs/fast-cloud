package com.zclcs.common.core.entity.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 限流拦截日志表 Entity
 *
 * @author zclcs
 * @date 2021-12-29 17:21:34.946
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("system_rate_limit_log")
@ApiModel(value = "RateLimitLog对象", description = "限流拦截日志表")
public class RateLimitLog extends BaseEntity {

    /**
     * 限流日志id
     */
    @TableId(value = "rate_limit_log_id", type = IdType.AUTO)
    private Long rateLimitLogId;

    /**
     * 被拦截请求IP
     */
    @TableField("rate_limit_log_ip")
    private String rateLimitLogIp;

    /**
     * 被拦截请求URI
     */
    @TableField("request_uri")
    private String requestUri;

    /**
     * 被拦截请求方法
     */
    @TableField("request_method")
    private String requestMethod;

    /**
     * IP对应地址
     */
    @TableField("location")
    private String location;


}