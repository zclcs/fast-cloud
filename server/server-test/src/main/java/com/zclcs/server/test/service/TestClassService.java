package com.zclcs.server.test.service;

import com.zclcs.common.core.entity.test.TestClass;
import com.zclcs.common.core.entity.test.ao.TestClassAo;
import com.zclcs.common.core.entity.test.vo.TestClassVo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;

import java.util.List;

/**
 * 班级 Service接口
 *
 * @author zclcs
 * @date 2021-10-15 09:48:59.045
 */
public interface TestClassService extends IService<TestClass> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param testClassVo testClassVo
     * @return BasePage<TestClassVo>
     */
    BasePage<TestClassVo> findTestClassPage(BasePageAo basePageAo, TestClassVo testClassVo);

    /**
     * 查询（所有）
     *
     * @param testClassVo testClassVo
     * @return List<TestClassVo>
     */
    List<TestClassVo> findTestClassList(TestClassVo testClassVo);

    /**
     * 查询（单个）
     *
     * @param testClassVo testClassVo
     * @return TestClassVo
     */
    TestClassVo findTestClass(TestClassVo testClassVo);

    /**
     * 新增
     *
     * @param testClassAo testClassAo
     */
    void createTestClass(TestClassAo testClassAo);

    /**
     * 修改
     *
     * @param testClassAo testClassAo
     */
    void updateTestClass(TestClassAo testClassAo);

    /**
     * 删除
     *
     * @param ids ids
     */
    void deleteTestClass(List<Long> ids);

}
