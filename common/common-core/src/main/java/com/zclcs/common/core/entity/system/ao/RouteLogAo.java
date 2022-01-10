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
 * 网关转发日志表 Ao
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
@ApiModel(value = "RouteLogAo对象", description = "网关转发日志表")
public class RouteLogAo implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "{required}", groups = UpdateStrategy.class)
    @ApiModelProperty(value = "网关转发日志id")
    private Long routeId;

    @Size(max = 200, message = "{noMoreThan}")
    @ApiModelProperty(value = "请求ip")
    private String routeIp;

    @Size(max = 500, message = "{noMoreThan}")
    @ApiModelProperty(value = "请求uri")
    private String requestUri;

    @Size(max = 500, message = "{noMoreThan}")
    @ApiModelProperty(value = "目标uri")
    private String targetUri;

    @Size(max = 10, message = "{noMoreThan}")
    @ApiModelProperty(value = "请求方法")
    private String requestMethod;

    @Size(max = 20, message = "{noMoreThan}")
    @ApiModelProperty(value = "目标服务")
    private String targetServer;

    @Size(max = 255, message = "{noMoreThan}")
    @ApiModelProperty(value = "ip对应地址")
    private String location;


}