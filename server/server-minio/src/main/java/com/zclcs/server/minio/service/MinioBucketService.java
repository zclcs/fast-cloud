package com.zclcs.server.minio.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.minio.MinioBucket;
import com.zclcs.common.core.entity.minio.ao.MinioBucketAo;
import com.zclcs.common.core.entity.minio.vo.MinioBucketVo;

import java.util.List;

/**
 * 桶 Service接口
 *
 * @author zclcs
 * @date 2021-10-18 10:37:09.922
 */
public interface MinioBucketService extends IService<MinioBucket> {

    /**
     * 查询（分页）
     *
     * @param basePageAo    basePageAo
     * @param minioBucketVo minioBucketVo
     * @return BasePage<MinioBucketVo>
     */
    BasePage<MinioBucketVo> findMinioBucketPage(BasePageAo basePageAo, MinioBucketVo minioBucketVo);

    /**
     * 查询（所有）
     *
     * @param minioBucketVo minioBucketVo
     * @return List<MinioBucketVo>
     */
    List<MinioBucketVo> findMinioBucketList(MinioBucketVo minioBucketVo);

    /**
     * 查询（单个）
     *
     * @param minioBucketVo minioBucketVo
     * @return MinioBucketVo
     */
    MinioBucketVo findMinioBucket(MinioBucketVo minioBucketVo);

    /**
     * 新增
     *
     * @param minioBucketAo minioBucketAo、
     * @return 桶id
     */
    Long createMinioBucket(MinioBucketAo minioBucketAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteMinioBucket(List<Long> ids);

}
