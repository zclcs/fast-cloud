package com.zclcs.server.test.mapper;

import com.zclcs.common.core.entity.test.Company;
import com.zclcs.common.core.entity.test.vo.CompanyVo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 企业 Mapper
 *
 * @author zclcs
 * @date 2022-01-13 11:16:59.185
 */
public interface CompanyMapper extends BaseMapper<Company> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<CompanyVo> findPageVo(BasePage<CompanyVo> basePage, @Param(Constants.WRAPPER) Wrapper<CompanyVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<CompanyVo> findListVo(@Param(Constants.WRAPPER) Wrapper<CompanyVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    CompanyVo findOneVo(@Param(Constants.WRAPPER) Wrapper<CompanyVo> ew);

    /**
     * 统计
     *
     * @param ew 查询条件
     * @return 对象
     */
    Integer countVo(@Param(Constants.WRAPPER) Wrapper<CompanyVo> ew);

}