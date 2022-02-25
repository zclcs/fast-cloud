package com.zclcs.server.test.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.test.Project;
import com.zclcs.common.core.entity.test.ao.ProjectAo;
import com.zclcs.common.core.entity.test.vo.ProjectVo;
import com.zclcs.server.test.mapper.ProjectMapper;
import com.zclcs.server.test.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 项目 Service实现
 *
 * @author zclcs
 * @date 2022-01-13 11:18:52.469
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper, Project> implements ProjectService {

    @Override
    public BasePage<ProjectVo> findProjectPage(BasePageAo basePageAo, ProjectVo projectVo) {
        BasePage<ProjectVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<ProjectVo> queryWrapper = getQueryWrapper(projectVo);
        // TODO 设置分页查询条件
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<ProjectVo> findProjectList(ProjectVo projectVo) {
        QueryWrapper<ProjectVo> queryWrapper = getQueryWrapper(projectVo);
        // TODO 设置集合查询条件
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public ProjectVo findProject(ProjectVo projectVo) {
        QueryWrapper<ProjectVo> queryWrapper = getQueryWrapper(projectVo);
        // TODO 设置单个查询条件
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public Integer countProject(ProjectVo projectVo) {
    QueryWrapper<ProjectVo> queryWrapper = getQueryWrapper(projectVo);
        // TODO 设置统计查询条件
        return this.baseMapper.countVo(queryWrapper);
    }

    private QueryWrapper<ProjectVo> getQueryWrapper(ProjectVo projectVo) {
        QueryWrapper<ProjectVo> queryWrapper = new QueryWrapper<>();
        // TODO 设置公共查询条件
        return queryWrapper;
   }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Project createProject(ProjectAo projectAo) {
        Project project = new Project();
        BeanUtil.copyProperties(projectAo, project);
        this.save(project);
        return project;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Project updateProject(ProjectAo projectAo) {
        Project project = new Project();
        BeanUtil.copyProperties(projectAo, project);
        this.updateById(project);
        return project;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteProject(List<Long> ids) {
        this.removeByIds(ids);
    }
}
