package com.zclcs.server.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.entity.system.SystemExport;
import com.zclcs.common.core.entity.system.vo.SystemExportVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * excel导入导出测试 Mapper 接口
 * </p>
 *
 * @author zclcs
 * @since 2021-08-16
 */
public interface SystemExportMapper extends BaseMapper<SystemExport> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<SystemExportVo> findPageVo(BasePage<SystemExportVo> basePage, @Param(Constants.WRAPPER) Wrapper<SystemExportVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    List<SystemExportVo> findListVo(@Param(Constants.WRAPPER) Wrapper<SystemExportVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 分页对象
     */
    SystemExportVo findOneVo(@Param(Constants.WRAPPER) Wrapper<SystemExportVo> ew);

}
