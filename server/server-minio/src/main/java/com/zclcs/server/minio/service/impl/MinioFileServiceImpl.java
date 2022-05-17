package com.zclcs.server.minio.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.minio.MinioFile;
import com.zclcs.common.core.entity.minio.ao.MinioBucketAo;
import com.zclcs.common.core.entity.minio.vo.FileUploadVo;
import com.zclcs.common.core.entity.minio.vo.MinioFileVo;
import com.zclcs.common.core.exception.MyMinioException;
import com.zclcs.server.minio.mapper.MinioFileMapper;
import com.zclcs.server.minio.service.MinioBucketService;
import com.zclcs.server.minio.service.MinioFileService;
import com.zclcs.server.minio.utils.MinioUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

/**
 * 文件 Service实现
 *
 * @author zclcs
 * @date 2021-10-18 10:37:21.262
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class MinioFileServiceImpl extends ServiceImpl<MinioFileMapper, MinioFile> implements MinioFileService {

    private final MinioUtil minioUtil;
    private final MinioBucketService minioBucketService;

    @Override
    public BasePage<MinioFileVo> findMinioFilePage(BasePageAo basePageAo, MinioFileVo minioFileVo) {
        BasePage<MinioFileVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<MinioFileVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(StrUtil.isNotBlank(minioFileVo.getId()), "mf.id", minioFileVo.getId());
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<MinioFileVo> findMinioFileList(MinioFileVo minioFileVo) {
        QueryWrapper<MinioFileVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(StrUtil.isNotBlank(minioFileVo.getId()), "mf.id", minioFileVo.getId());
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public MinioFileVo findMinioFile(MinioFileVo minioFileVo) {
        QueryWrapper<MinioFileVo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(StrUtil.isNotBlank(minioFileVo.getId()), "mf.id", minioFileVo.getId());
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createMinioFile(MultipartFile multipartFile, String bucketName) {
        String defaultBucket = Optional.ofNullable(bucketName).filter(StrUtil::isBlank).orElse("default");
        Long bucketId;
        FileUploadVo fileUploadVo;
        try {
            bucketId = minioBucketService.createMinioBucket(MinioBucketAo.builder().bucketName(defaultBucket).build());
            fileUploadVo = minioUtil.uploadFile(multipartFile, defaultBucket);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new MyMinioException("调用minio失败，" + e.getMessage());
        }
        MinioFile minioFile = new MinioFile();
        BeanUtil.copyProperties(fileUploadVo, minioFile);
        minioFile.setBucketId(bucketId);
        this.save(minioFile);
    }

    @Override
    public void deleteMinioFile(List<String> ids) {
        for (String id : ids) {
            MinioFileVo minioFile = this.findMinioFile(MinioFileVo.builder().id(id).build());
            try {
                minioUtil.removeObject(minioFile.getBucketName(), minioFile.getFileName());
            } catch (Exception e) {
                log.error(e.getMessage(), e);
                throw new MyMinioException("调用minio失败，" + e.getMessage());
            }
            this.removeById(id);
        }
    }
}
