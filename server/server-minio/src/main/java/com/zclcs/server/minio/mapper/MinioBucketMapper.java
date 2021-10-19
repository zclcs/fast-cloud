package com.zclcs.server.minio.mapper;

import com.zclcs.common.core.entity.minio.MinioBucket;
import com.zclcs.common.core.entity.minio.vo.MinioBucketVo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 桶 Mapper
 *
 * @author zclcs
 * @date 2021-10-18 10:37:09.922
 */
public interface MinioBucketMapper extends BaseMapper<MinioBucket> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<MinioBucketVo> findPageVo(BasePage<MinioBucketVo> basePage, @Param(Constants.WRAPPER) Wrapper<MinioBucketVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<MinioBucketVo> findListVo(@Param(Constants.WRAPPER) Wrapper<MinioBucketVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    MinioBucketVo findOneVo(@Param(Constants.WRAPPER) Wrapper<MinioBucketVo> ew);

}