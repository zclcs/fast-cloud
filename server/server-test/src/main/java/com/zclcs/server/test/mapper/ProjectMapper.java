package com.zclcs.server.test.mapper;

import com.zclcs.common.core.entity.test.Project;
import com.zclcs.common.core.entity.test.vo.ProjectVo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 项目 Mapper
 *
 * @author zclcs
 * @date 2022-01-13 11:18:52.469
 */
public interface ProjectMapper extends BaseMapper<Project> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<ProjectVo> findPageVo(BasePage<ProjectVo> basePage, @Param(Constants.WRAPPER) Wrapper<ProjectVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<ProjectVo> findListVo(@Param(Constants.WRAPPER) Wrapper<ProjectVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    ProjectVo findOneVo(@Param(Constants.WRAPPER) Wrapper<ProjectVo> ew);

    /**
     * 统计
     *
     * @param ew 查询条件
     * @return 对象
     */
    Integer countVo(@Param(Constants.WRAPPER) Wrapper<ProjectVo> ew);

}