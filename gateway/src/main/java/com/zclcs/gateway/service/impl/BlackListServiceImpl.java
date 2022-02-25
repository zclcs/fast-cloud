package com.zclcs.gateway.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.system.BlackList;
import com.zclcs.gateway.mapper.BlackListMapper;
import com.zclcs.gateway.service.BlackListService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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

}
