package com.zclcs.auth.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.auth.entity.OauthClientDetails;
import com.zclcs.auth.entity.vo.OauthClientDetailsVo;
import com.zclcs.common.core.base.BasePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 客户端配置表 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-11
 */
public interface OauthClientDetailsMapper extends BaseMapper<OauthClientDetails> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<OauthClientDetailsVo> findPageVo(BasePage<OauthClientDetailsVo> basePage, @Param(Constants.WRAPPER) Wrapper<OauthClientDetailsVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<OauthClientDetailsVo> findListVo(@Param(Constants.WRAPPER) Wrapper<OauthClientDetailsVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    OauthClientDetailsVo findOneVo(@Param(Constants.WRAPPER) Wrapper<OauthClientDetailsVo> ew);

}
