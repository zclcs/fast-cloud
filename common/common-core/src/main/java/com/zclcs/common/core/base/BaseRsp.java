package com.zclcs.common.core.base;


import cn.hutool.core.date.DateUtil;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @author zclcs
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "BaseRsp对象", description = "消息响应格式")
public class BaseRsp<T> {

    @ApiModelProperty(value = "响应消息")
    private String msg;

    @ApiModelProperty(value = "响应体")
    private T data;

    @ApiModelProperty(value = "时间戳")
    private long time;

    public BaseRsp() {
        this.time = DateUtil.currentSeconds();
    }

    public BaseRsp(String msg) {
        this.msg = msg;
        this.time = DateUtil.currentSeconds();
    }

    public BaseRsp(String msg, T data) {
        this.msg = msg;
        this.data = data;
        this.time = DateUtil.currentSeconds();
    }
}
