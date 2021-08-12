package com.zclcs.auth.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.auth.entity.OauthClientDetails;
import com.zclcs.auth.entity.ao.FindOauthClientDetailsPageAo;
import com.zclcs.auth.entity.ao.OauthClientDetailsAo;
import com.zclcs.auth.entity.vo.OauthClientDetailsVo;
import com.zclcs.common.core.base.BasePage;

import java.util.List;

/**
 * <p>
 * 客户端配置表 服务类
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
public interface OauthClientDetailsService extends IService<OauthClientDetails> {

    /**
     * 查询（分页）
     *
     * @param findOauthClientDetailsPageAo FindOauthClientDetailsPageAo
     * @return IPage<OauthClientDetails>
     */
    BasePage<OauthClientDetailsVo> findOauthClientDetailsPage(FindOauthClientDetailsPageAo findOauthClientDetailsPageAo);

    /**
     * 根据主键查询
     *
     * @param clientId clientId
     * @return OauthClientDetails
     */
    OauthClientDetailsVo findById(String clientId);

    /**
     * 新增
     *
     * @param oauthClientDetailsAo OauthClientDetailsAo
     */
    void createOauthClientDetails(OauthClientDetailsAo oauthClientDetailsAo);

    /**
     * 修改
     *
     * @param oauthClientDetailsAo OauthClientDetailsAo
     */
    void updateOauthClientDetails(OauthClientDetailsAo oauthClientDetailsAo);

    /**
     * 删除
     *
     * @param clientIds clientIds
     */
    void deleteOauthClientDetails(List<String> clientIds);

}
