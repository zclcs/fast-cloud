package com.zclcs.server.minio.controller;

import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import com.zclcs.common.core.entity.minio.vo.MinioFileVo;
import com.zclcs.common.core.exception.MyMinioException;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.server.minio.service.MinioFileService;
import com.zclcs.server.minio.utils.MinioUtil;
import io.minio.StatObjectResponse;
import io.minio.errors.MinioException;
import io.swagger.annotations.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 文件 Controller
 *
 * @author zclcs
 * @date 2021-10-18 10:37:21.262
 */
@Slf4j
@Validated
@RestController
@RequestMapping("file")
@RequiredArgsConstructor
@Api(tags = "文件")
public class MinioFileController {

    private final MinioFileService minioFileService;

    private final MinioUtil minioUtil;

    @GetMapping
    @ApiOperation(value = "文件查询（分页）")
    @PreAuthorize("hasAuthority('file:view')")
    public BaseRsp<BasePage<MinioFileVo>> findMinioFilePage(@Valid BasePageAo basePageAo, MinioFileVo minioFileVo) {
        BasePage<MinioFileVo> page = this.minioFileService.findMinioFilePage(basePageAo, minioFileVo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "文件查询（集合）")
    @PreAuthorize("hasAuthority('file:view')")
    public BaseRsp<List<MinioFileVo>> findMinioFileList(MinioFileVo minioFileVo) {
        List<MinioFileVo> list = this.minioFileService.findMinioFileList(minioFileVo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "文件查询（单个）")
    @PreAuthorize("hasAuthority('file:view')")
    public BaseRsp<MinioFileVo> findMinioFile(MinioFileVo minioFileVo) {
        MinioFileVo minioFile = this.minioFileService.findMinioFile(minioFileVo);
        return BaseRspUtil.data(minioFile);
    }

    @PostMapping
    //@PreAuthorize("hasAuthority('file:add')")
    @ApiOperation(value = "新增文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "file", value = "文件", required = true, dataType = "__File"),
            @ApiImplicitParam(name = "bucketName", value = "桶名称")
    })
    public void addMinioFile(@RequestParam(value = "file") MultipartFile file,
                             String bucketName) {
        this.minioFileService.createMinioFile(file, bucketName);
    }

    @DeleteMapping("/{fileIds}")
    @PreAuthorize("hasAuthority('file:delete')")
    @ApiOperation(value = "删除文件")
    public void deleteMinioFile(@ApiParam(value = "文件id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String fileIds) {
        List<String> ids = Arrays.stream(fileIds.split(StringConstant.COMMA)).collect(Collectors.toList());
        this.minioFileService.deleteMinioFile(ids);
    }

    @GetMapping("/preViewPicture/{fileId}")
    @ApiOperation(value = "浏览图片或下载文件", notes = "用于权限不是读/写的桶")
    //@PreAuthorize("hasAuthority('file:view')")
    public void preViewPicture(@ApiParam(value = "文件id", required = true) @NotBlank(message = "{required}") @PathVariable("fileId") String fileId, HttpServletResponse response) throws Exception {
        MinioFileVo minioFile = minioFileService.findMinioFile(MinioFileVo.builder().id(fileId).build());
        if (minioFile == null) {
            throw new MyMinioException("文件不存在");
        }
        StatObjectResponse statObjectResponse = minioUtil.statObject(minioFile.getBucketName(), minioFile.getFileName());
        response.setContentType(statObjectResponse.contentType());
        try (ServletOutputStream out = response.getOutputStream()) {
            InputStream stream = minioUtil.getObject(minioFile.getBucketName(), minioFile.getFileName());
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int n = 0;
            while (-1 != (n = stream.read(buffer))) {
                output.write(buffer, 0, n);
            }
            byte[] bytes = output.toByteArray();
            out.write(bytes);
            out.flush();
        }
    }

    @GetMapping("/download/{fileId}")
    @ApiOperation(value = "下载文件", notes = "用于权限不是读/写的桶")
    //@PreAuthorize("hasAuthority('file:download')")
    public ResponseEntity<byte[]> download(@ApiParam(value = "文件id", required = true) @NotBlank(message = "{required}") @PathVariable("fileId") String fileId) throws Exception {
        MinioFileVo minioFile = minioFileService.findMinioFile(MinioFileVo.builder().id(fileId).build());
        if (minioFile == null) {
            throw new MyMinioException("文件不存在");
        }
        ResponseEntity<byte[]> responseEntity = null;
        InputStream stream = null;
        ByteArrayOutputStream output = null;
        try {
            stream = minioUtil.getObject(minioFile.getBucketName(), minioFile.getFileName());
            if (stream == null) {
                log.error("文件不存在");
                throw new RuntimeException("文件不存在");
            }
            //用于转换byte
            output = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int n = 0;
            while (-1 != (n = stream.read(buffer))) {
                output.write(buffer, 0, n);
            }
            byte[] bytes = output.toByteArray();

            //设置header
            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.add("Accept-Ranges", "bytes");
            httpHeaders.add("Content-Length", bytes.length + "");
            httpHeaders.add("Content-disposition", "attachment; filename=" + minioFile.getFileName());
            httpHeaders.add("Content-Type", "text/plain;charset=utf-8");
            responseEntity = new ResponseEntity<>(bytes, httpHeaders, HttpStatus.CREATED);

        } catch (MinioException e) {
            log.error(e.getMessage(), e);
        } finally {
            if (stream != null) {
                stream.close();
            }
            if (output != null) {
                output.close();
            }
        }
        return responseEntity;
    }
}