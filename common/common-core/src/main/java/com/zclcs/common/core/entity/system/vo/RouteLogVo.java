package com.zclcs.common.core.entity.system.vo;

import com.zclcs.common.core.annotation.IsRightDate;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * 网关转发日志表 Vo
 *
 * @author zclcs
 * @date 2021-12-29 17:21:05.034
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "RouteLogVo对象", description = "网关转发日志表")
public class RouteLogVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "网关转发日志id")
    private Long routeId;

    @ApiModelProperty(value = "请求ip")
    private String routeIp;

    @ApiModelProperty(value = "请求uri")
    private String requestUri;

    @ApiModelProperty(value = "目标uri")
    private String targetUri;

    @ApiModelProperty(value = "请求方法")
    private String requestMethod;

    @ApiModelProperty(value = "目标服务")
    private String targetServer;

    @ApiModelProperty(value = "ip对应地址")
    private String location;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "创建时间起")
    @IsRightDate
    private String createTimeFrom;

    @ApiModelProperty(value = "创建时间起终")
    @IsRightDate
    private String createTimeTo;

    @ApiModelProperty(value = "修改时间")
    private Date modifyTime;


}