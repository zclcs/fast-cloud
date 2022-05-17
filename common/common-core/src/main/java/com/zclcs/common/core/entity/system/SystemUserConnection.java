package com.zclcs.common.core.entity.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.zclcs.common.core.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统用户社交账户关联表
 * </p>
 *
 * @author zclcs
 * @since 2021-08-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "SystemUserConnection对象", description = "系统用户社交账户关联表")
public class SystemUserConnection extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 系统用户名
     */
    @TableField("user_name")
    private String userName;

    /**
     * 第三方平台名称
     */
    @TableField("provider_name")
    private String providerName;

    /**
     * 第三方平台账户id
     */
    @TableField("provider_user_id")
    private String providerUserId;

    /**
     * 第三方平台用户名
     */
    @TableField("provider_user_name")
    private String providerUserName;

    /**
     * 第三方平台昵称
     */
    @TableField("nick_name")
    private String nickName;

    /**
     * 第三方平台头像
     */
    @TableField("image_url")
    private String imageUrl;

    /**
     * 地址
     */
    @TableField("location")
    private String location;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

}
