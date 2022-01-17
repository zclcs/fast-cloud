package com.zclcs.server.test.service;

import com.zclcs.common.core.entity.test.Company;
import com.zclcs.common.core.entity.test.ao.CompanyAo;
import com.zclcs.common.core.entity.test.vo.CompanyVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;

import java.util.List;

/**
 * 企业 Service接口
 *
 * @author zclcs
 * @date 2022-01-13 11:16:59.185
 */
public interface CompanyService extends IService<Company> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param companyVo companyVo
     * @return BasePage<CompanyVo>
     */
    BasePage<CompanyVo> findCompanyPage(BasePageAo basePageAo, CompanyVo companyVo);

    /**
     * 查询（所有）
     *
     * @param companyVo companyVo
     * @return List<CompanyVo>
     */
    List<CompanyVo> findCompanyList(CompanyVo companyVo);

    /**
     * 查询（单个）
     *
     * @param companyVo companyVo
     * @return CompanyVo
     */
    CompanyVo findCompany(CompanyVo companyVo);

    /**
     * 统计
     *
     * @param companyVo companyVo
     * @return CompanyVo
     */
    Integer countCompany(CompanyVo companyVo);

    /**
     * 新增
     *
     * @param companyAo companyAo
     * @return Company
     */
     Company createCompany(CompanyAo companyAo);

    /**
     * 修改
     *
     * @param companyAo companyAo
     * @return Company
     */
     Company updateCompany(CompanyAo companyAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteCompany(List<Long> ids);

}
