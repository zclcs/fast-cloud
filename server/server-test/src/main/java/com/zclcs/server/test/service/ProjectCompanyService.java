package com.zclcs.server.test.service;

import com.zclcs.common.core.entity.test.ProjectCompany;
import com.zclcs.common.core.entity.test.ao.ProjectCompanyAo;
import com.zclcs.common.core.entity.test.vo.ProjectCompanyVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;

import java.util.List;

/**
 * 参建单位 Service接口
 *
 * @author zclcs
 * @date 2022-01-13 11:19:10.776
 */
public interface ProjectCompanyService extends IService<ProjectCompany> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param projectCompanyVo projectCompanyVo
     * @return BasePage<ProjectCompanyVo>
     */
    BasePage<ProjectCompanyVo> findProjectCompanyPage(BasePageAo basePageAo, ProjectCompanyVo projectCompanyVo);

    /**
     * 查询（所有）
     *
     * @param projectCompanyVo projectCompanyVo
     * @return List<ProjectCompanyVo>
     */
    List<ProjectCompanyVo> findProjectCompanyList(ProjectCompanyVo projectCompanyVo);

    /**
     * 查询（单个）
     *
     * @param projectCompanyVo projectCompanyVo
     * @return ProjectCompanyVo
     */
    ProjectCompanyVo findProjectCompany(ProjectCompanyVo projectCompanyVo);

    /**
     * 统计
     *
     * @param projectCompanyVo projectCompanyVo
     * @return ProjectCompanyVo
     */
    Integer countProjectCompany(ProjectCompanyVo projectCompanyVo);

    /**
     * 新增
     *
     * @param projectCompanyAo projectCompanyAo
     * @return ProjectCompany
     */
     ProjectCompany createProjectCompany(ProjectCompanyAo projectCompanyAo);

    /**
     * 修改
     *
     * @param projectCompanyAo projectCompanyAo
     * @return ProjectCompany
     */
     ProjectCompany updateProjectCompany(ProjectCompanyAo projectCompanyAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteProjectCompany(List<Long> ids);

}
