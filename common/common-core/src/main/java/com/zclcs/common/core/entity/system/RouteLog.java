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
 * 网关转发日志表 Entity
 *
 * @author zclcs
 * @date 2021-12-29 17:21:05.034
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("system_route_log")
@ApiModel(value = "RouteLog对象", description = "网关转发日志表")
public class RouteLog extends BaseEntity {

    /**
     * 网关转发日志id
     */
    @TableId(value = "route_id", type = IdType.AUTO)
    private Long routeId;

    /**
     * 请求ip
     */
    @TableField("route_ip")
    private String routeIp;

    /**
     * 请求uri
     */
    @TableField("request_uri")
    private String requestUri;

    /**
     * 目标uri
     */
    @TableField("target_uri")
    private String targetUri;

    /**
     * 请求方法
     */
    @TableField("request_method")
    private String requestMethod;

    /**
     * 目标服务
     */
    @TableField("target_server")
    private String targetServer;

    /**
     * ip对应地址
     */
    @TableField("location")
    private String location;


}