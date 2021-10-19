package com.zclcs.server.minio.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.minio.MinioBucket;
import com.zclcs.common.core.entity.minio.MinioFile;
import com.zclcs.common.core.entity.minio.ao.MinioBucketAo;
import com.zclcs.common.core.entity.minio.vo.MinioBucketVo;
import com.zclcs.server.minio.mapper.MinioBucketMapper;
import com.zclcs.server.minio.mapper.MinioFileMapper;
import com.zclcs.server.minio.service.MinioBucketService;
import com.zclcs.server.minio.utils.MinioUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 桶 Service实现
 *
 * @author zclcs
 * @date 2021-10-18 10:37:09.922
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class MinioBucketServiceImpl extends ServiceImpl<MinioBucketMapper, MinioBucket> implements MinioBucketService {

    private final MinioUtil minioUtil;
    private final MinioFileMapper minioFileMapper;

    @Override
    public BasePage<MinioBucketVo> findMinioBucketPage(BasePageAo basePageAo, MinioBucketVo minioBucketVo) {
        BasePage<MinioBucketVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<MinioBucketVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(minioBucketVo.getBucketName()), "mb.bucket_name", minioBucketVo.getBucketName());
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<MinioBucketVo> findMinioBucketList(MinioBucketVo minioBucketVo) {
        QueryWrapper<MinioBucketVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(minioBucketVo.getBucketName()), "mb.bucket_name", minioBucketVo.getBucketName());
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public MinioBucketVo findMinioBucket(MinioBucketVo minioBucketVo) {
        QueryWrapper<MinioBucketVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StrUtil.isNotBlank(minioBucketVo.getBucketName()), "mb.bucket_name", minioBucketVo.getBucketName());
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Long createMinioBucket(MinioBucketAo minioBucketAo) throws Exception {
        int count = this.count(new QueryWrapper<MinioBucket>().lambda().eq(MinioBucket::getBucketName, minioBucketAo.getBucketName()));
        if (count == 0) {
            MinioBucket minioBucket = new MinioBucket();
            BeanUtil.copyProperties(minioBucketAo, minioBucket);
            minioUtil.createBucket(minioBucket.getBucketName());
            minioBucket.setCreateTime(DateUtil.date());
            this.save(minioBucket);
            return minioBucket.getId();
        } else {
            return this.getOne(new QueryWrapper<MinioBucket>().lambda().eq(MinioBucket::getBucketName, minioBucketAo.getBucketName())).getId();
        }
    }

    @Override
    public void deleteMinioBucket(List<Long> ids) throws Exception {
        List<MinioBucket> list = this.lambdaQuery().in(MinioBucket::getId, ids).list();
        for (MinioBucket minioBucket : list) {
            minioUtil.removeBucket(minioBucket.getBucketName());
            this.removeById(minioBucket.getId());
            minioFileMapper.delete(new QueryWrapper<MinioFile>().lambda().eq(MinioFile::getBucketId, minioBucket.getId()));
        }
    }
}
