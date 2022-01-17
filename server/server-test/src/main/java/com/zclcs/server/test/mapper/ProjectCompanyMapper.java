package com.zclcs.server.test.mapper;

import com.zclcs.common.core.entity.test.ProjectCompany;
import com.zclcs.common.core.entity.test.vo.ProjectCompanyVo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 参建单位 Mapper
 *
 * @author zclcs
 * @date 2022-01-13 11:19:10.776
 */
public interface ProjectCompanyMapper extends BaseMapper<ProjectCompany> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<ProjectCompanyVo> findPageVo(BasePage<ProjectCompanyVo> basePage, @Param(Constants.WRAPPER) Wrapper<ProjectCompanyVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<ProjectCompanyVo> findListVo(@Param(Constants.WRAPPER) Wrapper<ProjectCompanyVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    ProjectCompanyVo findOneVo(@Param(Constants.WRAPPER) Wrapper<ProjectCompanyVo> ew);

    /**
     * 统计
     *
     * @param ew 查询条件
     * @return 对象
     */
    Integer countVo(@Param(Constants.WRAPPER) Wrapper<ProjectCompanyVo> ew);

}