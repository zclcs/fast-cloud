package com.zclcs.gateway.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.BlackList;
import com.zclcs.common.core.entity.system.vo.BlackListVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 黑名单表 Mapper
 *
 * @author zclcs
 * @date 2021-12-29 17:20:03.111
 */
public interface BlackListMapper extends BaseMapper<BlackList> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<BlackListVo> findPageVo(BasePage<BlackListVo> basePage, @Param(Constants.WRAPPER) Wrapper<BlackListVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<BlackListVo> findListVo(@Param(Constants.WRAPPER) Wrapper<BlackListVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    BlackListVo findOneVo(@Param(Constants.WRAPPER) Wrapper<BlackListVo> ew);

    /**
     * 统计
     *
     * @param ew 查询条件
     * @return 对象
     */
    Integer countVo(@Param(Constants.WRAPPER) Wrapper<BlackListVo> ew);

}