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

import java.util.List;

/**
 * 班级 Service实现
 *
 * @author zclcs
 * @date 2021-10-15 09:48:59.045
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class TestClassServiceImpl extends ServiceImpl<TestClassMapper, TestClass> implements TestClassService {

    @Override
    public BasePage<TestClassVo> findTestClassPage(BasePageAo basePageAo, TestClassVo testClassVo) {
        BasePage<TestClassVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<TestClassVo> queryWrapper = new QueryWrapper<>();
        // TODO 设置查询条件
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<TestClassVo> findTestClassList(TestClassVo testClassVo) {
        QueryWrapper<TestClassVo> queryWrapper = new QueryWrapper<>();
        // TODO 设置查询条件
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public TestClassVo findTestClass(TestClassVo testClassVo) {
        QueryWrapper<TestClassVo> queryWrapper = new QueryWrapper<>();
        // TODO 设置查询条件
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createTestClass(TestClassAo testClassAo) {
        TestClass testClass = new TestClass();
        BeanUtil.copyProperties(testClassAo, testClass);
        this.save(testClass);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateTestClass(TestClassAo testClassAo) {
        TestClass testClass = new TestClass();
        BeanUtil.copyProperties(testClassAo, testClass);
        this.updateById(testClass);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteTestClass(List<Long> ids) {
        this.removeByIds(ids);
    }
}
