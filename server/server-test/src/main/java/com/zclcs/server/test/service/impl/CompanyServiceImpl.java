package com.zclcs.server.test.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.constant.ValidConstant;
import com.zclcs.common.core.entity.test.Company;
import com.zclcs.common.core.entity.test.ao.CompanyAo;
import com.zclcs.common.core.entity.test.vo.CompanyVo;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.common.core.utils.BaseQueryWrapperUtil;
import com.zclcs.server.test.mapper.CompanyMapper;
import com.zclcs.server.test.service.CompanyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * 企业 Service实现
 *
 * @author zclcs
 * @date 2022-01-13 11:16:59.185
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
@Slf4j
public class CompanyServiceImpl extends ServiceImpl<CompanyMapper, Company> implements CompanyService {

    @Override
    public BasePage<CompanyVo> findCompanyPage(BasePageAo basePageAo, CompanyVo companyVo) {
        BasePage<CompanyVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<CompanyVo> queryWrapper = getQueryWrapper(companyVo);
        // TODO 设置分页查询条件
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<CompanyVo> findCompanyList(CompanyVo companyVo) {
        QueryWrapper<CompanyVo> queryWrapper = getQueryWrapper(companyVo);
        // TODO 设置集合查询条件
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public CompanyVo findCompany(CompanyVo companyVo) {
        QueryWrapper<CompanyVo> queryWrapper = getQueryWrapper(companyVo);
        // TODO 设置单个查询条件
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public Integer countCompany(CompanyVo companyVo) {
        QueryWrapper<CompanyVo> queryWrapper = getQueryWrapper(companyVo);
        // TODO 设置统计查询条件
        return this.baseMapper.countVo(queryWrapper);
    }

    private QueryWrapper<CompanyVo> getQueryWrapper(CompanyVo companyVo) {
        QueryWrapper<CompanyVo> queryWrapper = new QueryWrapper<>();
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "tc.company_code", companyVo.getCompanyCode());
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "tc.company_name", companyVo.getCompanyName());
        BaseQueryWrapperUtil.likeAreaCodeNotBlank(queryWrapper, "tc.area_code", companyVo.getAreaCode());
        BaseQueryWrapperUtil.eqNotNull(queryWrapper, "tc.company_id", companyVo.getCompanyId());
        return queryWrapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Company createCompany(CompanyAo companyAo) {
        Company company = new Company();
        BeanUtil.copyProperties(companyAo, company);
        validAdd(company);
        this.save(company);
        return company;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Company updateCompany(CompanyAo companyAo) {
        Company company = new Company();
        BeanUtil.copyProperties(companyAo, company);
        validUpdate(company);
        this.updateById(company);
        return company;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteCompany(List<Long> ids) {
        this.removeByIds(ids);
    }

    private void validAdd(Company company) {
        validCompanyName(company);
        validCompanyCode(company);
        validCompanyCodeLength(company);
    }

    private void validUpdate(Company company) {
        CompanyVo companyVo = this.findCompany(CompanyVo.builder().companyId(company.getCompanyId()).build());
        Optional.ofNullable(companyVo).orElseThrow(() -> new MyException("查询不到该企业"));
        if (!StrUtil.equals(companyVo.getCompanyName(), company.getCompanyName())) {
            validCompanyName(company);
        }
        if (!StrUtil.equals(companyVo.getCompanyCode(), company.getCompanyCode())) {
            validCompanyCode(company);
        }
        validCompanyCodeLength(company);
    }

    private void validCompanyName(Company company) {
        if (!this.lambdaQuery().eq(Company::getCompanyName, company.getCompanyName()).count().equals(ValidConstant.COUNT_0)) {
            throw new MyException("企业名称重复");
        }
    }

    private void validCompanyCode(Company company) {
        String companyCode = company.getCompanyCode();
        if (!this.lambdaQuery().eq(Company::getCompanyCode, companyCode).count().equals(ValidConstant.COUNT_0)) {
            throw new MyException("统一社会信用代码重复");
        }
    }

    private void validCompanyCodeLength(Company company) {
        Optional.of(company.getCompanyCode()).filter(s -> s.length() == ValidConstant.COMPANY_CODE_9 || s.length() == ValidConstant.COMPANY_CODE_18)
                .orElseThrow(() -> new MyException("统一社会信用代码必须为9位或者18位"));
    }
}
