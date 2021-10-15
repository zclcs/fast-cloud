package com.zclcs.server.test.mapper;

import com.zclcs.common.core.entity.test.TestClass;
import com.zclcs.common.core.entity.test.vo.TestClassVo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 班级 Mapper
 *
 * @author zclcs
 * @date 2021-10-15 09:48:59.045
 */
public interface TestClassMapper extends BaseMapper<TestClass> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<TestClassVo> findPageVo(BasePage<TestClassVo> basePage, @Param(Constants.WRAPPER) Wrapper<TestClassVo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<TestClassVo> findListVo(@Param(Constants.WRAPPER) Wrapper<TestClassVo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    TestClassVo findOneVo(@Param(Constants.WRAPPER) Wrapper<TestClassVo> ew);

}