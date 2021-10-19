package com.zclcs.server.minio.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.minio.MinioFile;
import com.zclcs.common.core.entity.minio.vo.MinioFileVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 文件 Service接口
 *
 * @author zclcs
 * @date 2021-10-18 10:37:21.262
 */
public interface MinioFileService extends IService<MinioFile> {

    /**
     * 查询（分页）
     *
     * @param basePageAo  basePageAo
     * @param minioFileVo minioFileVo
     * @return BasePage<MinioFileVo>
     */
    BasePage<MinioFileVo> findMinioFilePage(BasePageAo basePageAo, MinioFileVo minioFileVo);

    /**
     * 查询（所有）
     *
     * @param minioFileVo minioFileVo
     * @return List<MinioFileVo>
     */
    List<MinioFileVo> findMinioFileList(MinioFileVo minioFileVo);

    /**
     * 查询（单个）
     *
     * @param minioFileVo minioFileVo
     * @return MinioFileVo
     */
    MinioFileVo findMinioFile(MinioFileVo minioFileVo);

    /**
     * 新增
     *
     * @param multipartFile file
     * @param bucketName    桶名称
     */
    void createMinioFile(MultipartFile multipartFile, String bucketName);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteMinioFile(List<String> ids);

}
