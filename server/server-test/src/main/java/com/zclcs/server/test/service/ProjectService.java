package com.zclcs.server.test.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.test.Project;
import com.zclcs.common.core.entity.test.ao.ProjectAo;
import com.zclcs.common.core.entity.test.vo.ProjectVo;

import java.util.List;

/**
 * 项目 Service接口
 *
 * @author zclcs
 * @date 2022-01-13 11:18:52.469
 */
public interface ProjectService extends IService<Project> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param projectVo  projectVo
     * @return BasePage<ProjectVo>
     */
    BasePage<ProjectVo> findProjectPage(BasePageAo basePageAo, ProjectVo projectVo);

    /**
     * 查询（所有）
     *
     * @param projectVo projectVo
     * @return List<ProjectVo>
     */
    List<ProjectVo> findProjectList(ProjectVo projectVo);

    /**
     * 查询（单个）
     *
     * @param projectVo ProjectVo
     * @return ProjectVo
     */
    ProjectVo findProject(ProjectVo projectVo);

    /**
     * 统计
     *
     * @param projectVo projectVo
     * @return ProjectVo
     */
    Integer countProject(ProjectVo projectVo);

    /**
     * 新增
     *
     * @param projectAo projectAo
     * @return Project
     */
    Project createProject(ProjectAo projectAo);

    /**
     * 修改
     *
     * @param projectAo projectAo
     * @return Project
     */
    Project updateProject(ProjectAo projectAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteProject(List<Long> ids);

}
