package com.zclcs.server.test.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.test.ProjectCompany;
import com.zclcs.common.core.entity.test.ao.ProjectCompanyAo;
import com.zclcs.common.core.entity.test.vo.ProjectCompanyVo;
import com.zclcs.server.test.mapper.ProjectCompanyMapper;
import com.zclcs.server.test.service.ProjectCompanyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import java.util.List;

/**
 * 参建单位 Service实现
 *
 * @author zclcs
 * @date 2022-01-13 11:19:10.776
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class ProjectCompanyServiceImpl extends ServiceImpl<ProjectCompanyMapper, ProjectCompany> implements ProjectCompanyService {

    @Override
    public BasePage<ProjectCompanyVo> findProjectCompanyPage(BasePageAo basePageAo, ProjectCompanyVo projectCompanyVo) {
        BasePage<ProjectCompanyVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<ProjectCompanyVo> queryWrapper = getQueryWrapper(projectCompanyVo);
        // TODO 设置分页查询条件
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<ProjectCompanyVo> findProjectCompanyList(ProjectCompanyVo projectCompanyVo) {
        QueryWrapper<ProjectCompanyVo> queryWrapper = getQueryWrapper(projectCompanyVo);
        // TODO 设置集合查询条件
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public ProjectCompanyVo findProjectCompany(ProjectCompanyVo projectCompanyVo) {
        QueryWrapper<ProjectCompanyVo> queryWrapper = getQueryWrapper(projectCompanyVo);
        // TODO 设置单个查询条件
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public Integer countProjectCompany(ProjectCompanyVo projectCompanyVo) {
    QueryWrapper<ProjectCompanyVo> queryWrapper = getQueryWrapper(projectCompanyVo);
        // TODO 设置统计查询条件
        return this.baseMapper.countVo(queryWrapper);
    }

    private QueryWrapper<ProjectCompanyVo> getQueryWrapper(ProjectCompanyVo projectCompanyVo) {
        QueryWrapper<ProjectCompanyVo> queryWrapper = new QueryWrapper<>();
        // TODO 设置公共查询条件
        return queryWrapper;
   }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ProjectCompany createProjectCompany(ProjectCompanyAo projectCompanyAo) {
        ProjectCompany projectCompany = new ProjectCompany();
        BeanUtil.copyProperties(projectCompanyAo, projectCompany);
        this.save(projectCompany);
        return projectCompany;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ProjectCompany updateProjectCompany(ProjectCompanyAo projectCompanyAo) {
        ProjectCompany projectCompany = new ProjectCompany();
        BeanUtil.copyProperties(projectCompanyAo, projectCompany);
        this.updateById(projectCompany);
        return projectCompany;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteProjectCompany(List<Long> ids) {
        this.removeByIds(ids);
    }
}
