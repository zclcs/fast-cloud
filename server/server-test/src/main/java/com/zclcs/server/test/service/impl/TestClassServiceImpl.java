package com.zclcs.server.test.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.test.TestClass;
import com.zclcs.common.core.entity.test.ao.TestClassAo;
import com.zclcs.common.core.entity.test.vo.TestClassVo;
import com.zclcs.server.test.mapper.TestClassMapper;
import com.zclcs.server.test.service.TestClassService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 班级 Service实现
 *
 * @author zclcs
 * @date 2022-01-10 14:54:16.690
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class TestClassServiceImpl extends ServiceImpl<TestClassMapper, TestClass> implements TestClassService {

    @Override
    public BasePage<TestClassVo> findTestClassPage(BasePageAo basePageAo, TestClassVo testClassVo) {
        BasePage<TestClassVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<TestClassVo> queryWrapper = getQueryWrapper(testClassVo);
        // TODO 设置分页查询条件
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<TestClassVo> findTestClassList(TestClassVo testClassVo) {
        QueryWrapper<TestClassVo> queryWrapper = getQueryWrapper(testClassVo);
        // TODO 设置集合查询条件
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public TestClassVo findTestClass(TestClassVo testClassVo) {
        QueryWrapper<TestClassVo> queryWrapper = getQueryWrapper(testClassVo);
        // TODO 设置单个查询条件
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public Integer countTestClass(TestClassVo testClassVo) {
    QueryWrapper<TestClassVo> queryWrapper = getQueryWrapper(testClassVo);
        // TODO 设置统计查询条件
        return this.baseMapper.countVo(queryWrapper);
    }

    private QueryWrapper<TestClassVo> getQueryWrapper(TestClassVo testClassVo) {
        QueryWrapper<TestClassVo> queryWrapper = new QueryWrapper<>();
        // TODO 设置公共查询条件
        return queryWrapper;
   }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public TestClass createTestClass(TestClassAo testClassAo) {
        TestClass testClass = new TestClass();
        BeanUtil.copyProperties(testClassAo, testClass);
        this.save(testClass);
        return testClass;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public TestClass updateTestClass(TestClassAo testClassAo) {
        TestClass testClass = new TestClass();
        BeanUtil.copyProperties(testClassAo, testClass);
        this.updateById(testClass);
        return testClass;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteTestClass(List<Long> ids) {
        this.removeByIds(ids);
    }
}
