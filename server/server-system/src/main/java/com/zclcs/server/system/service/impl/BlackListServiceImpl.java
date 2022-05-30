package com.zclcs.server.system.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.entity.system.BlackList;
import com.zclcs.common.core.entity.system.ao.BlackListAo;
import com.zclcs.common.core.entity.system.vo.BlackListVo;
import com.zclcs.common.core.utils.BaseAddressUtil;
import com.zclcs.common.core.utils.BaseQueryWrapperUtil;
import com.zclcs.server.system.mapper.BlackListMapper;
import com.zclcs.server.system.service.BlackListService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 黑名单表 Service实现
 *
 * @author zclcs
 * @date 2021-12-29 17:20:03.111
 */
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class BlackListServiceImpl extends ServiceImpl<BlackListMapper, BlackList> implements BlackListService {

    @Override
    public BasePage<BlackListVo> findBlackListPage(BasePageAo basePageAo, BlackListVo blackListVo) {
        BasePage<BlackListVo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<BlackListVo> queryWrapper = getQueryWrapper(blackListVo);
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<BlackListVo> findBlackListList(BlackListVo blackListVo) {
        QueryWrapper<BlackListVo> queryWrapper = getQueryWrapper(blackListVo);
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public BlackListVo findBlackList(BlackListVo blackListVo) {
        QueryWrapper<BlackListVo> queryWrapper = getQueryWrapper(blackListVo);
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public Integer countBlackList(BlackListVo blackListVo) {
        QueryWrapper<BlackListVo> queryWrapper = getQueryWrapper(blackListVo);
        return this.baseMapper.countVo(queryWrapper);
    }

    private QueryWrapper<BlackListVo> getQueryWrapper(BlackListVo blackListVo) {
        QueryWrapper<BlackListVo> queryWrapper = new QueryWrapper<>();
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "sbl.black_ip", blackListVo.getBlackIp());
        BaseQueryWrapperUtil.likeNotBlank(queryWrapper, "sbl.request_uri", blackListVo.getRequestUri());
        BaseQueryWrapperUtil.eqNotBlank(queryWrapper, "sbl.request_method", blackListVo.getRequestMethod());
        BaseQueryWrapperUtil.eqNotBlank(queryWrapper, "sbl.black_status", blackListVo.getBlackStatus());
        BaseQueryWrapperUtil.eqNotBlank(queryWrapper, "sbl.black_id", blackListVo.getBlackIp());
        BaseQueryWrapperUtil.inNotEmpty(queryWrapper, "sbl.black_id", blackListVo.getBlackIds());
        return queryWrapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createBlackList(BlackListAo blackListAo) {
        BlackList blackList = new BlackList();
        BeanUtil.copyProperties(blackListAo, blackList);
        setBlackList(blackList);
        this.save(blackList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateBlackList(BlackListAo blackListAo) {
        BlackList blackList = new BlackList();
        BeanUtil.copyProperties(blackListAo, blackList);
        setBlackList(blackList);
        this.updateById(blackList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteBlackList(List<Long> ids) {
        this.removeByIds(ids);
    }

    private void setBlackList(BlackList blackList) {
        if (StrUtil.isNotBlank(blackList.getBlackIp())) {
            blackList.setLocation(BaseAddressUtil.getCityInfo(blackList.getBlackIp()));
        } else {
            blackList.setLocation(null);
        }
        if (StrUtil.isNotBlank(blackList.getLimitFrom()) && StrUtil.isNotBlank(blackList.getLimitTo())) {
            blackList.setLimitFrom(DateUtil.parse(blackList.getLimitFrom()).toString(DatePattern.NORM_TIME_PATTERN));
            blackList.setLimitTo(DateUtil.parse(blackList.getLimitTo()).toString(DatePattern.NORM_TIME_PATTERN));
        }
    }
}
