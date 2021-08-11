package com.zclcs.auth.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统用户社交账户关联表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="SystemUserConnection对象", description="系统用户社交账户关联表")
public class SystemUserConnection extends Model<SystemUserConnection> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "febs系统用户名")
    private String userName;

    @ApiModelProperty(value = "第三方平台名称")
    private String providerName;

    @ApiModelProperty(value = "第三方平台账户id")
    private String providerUserId;

    @ApiModelProperty(value = "第三方平台用户名")
    private String providerUserName;

    @ApiModelProperty(value = "第三方平台昵称")
    private String nickName;

    @ApiModelProperty(value = "第三方平台头像")
    private String imageUrl;

    @ApiModelProperty(value = "地址")
    private String location;

    @ApiModelProperty(value = "备注")
    private String remark;


    @Override
    protected Serializable pkVal() {
        return this.userName;
    }

}
