package com.zclcs.server.generator.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.entity.generator.GeneratorConfig;
import com.zclcs.common.core.entity.generator.ao.GeneratorConfigAo;
import com.zclcs.common.core.entity.generator.vo.GeneratorConfigVo;
import com.zclcs.server.generator.mapper.GeneratorConfigMapper;
import com.zclcs.server.generator.service.GeneratorConfigService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author zclcs
 */
@Service
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class GeneratorConfigServiceImpl extends ServiceImpl<GeneratorConfigMapper, GeneratorConfig> implements GeneratorConfigService {

    @Override
    public GeneratorConfigVo findGeneratorConfig() {
        List<GeneratorConfigVo> generatorConfigs = this.baseMapper.findListVo(new QueryWrapper<>());
        return CollectionUtils.isNotEmpty(generatorConfigs) ? generatorConfigs.get(0) : null;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateGeneratorConfig(GeneratorConfigAo generatorConfigAo) {
        GeneratorConfig generatorConfig = new GeneratorConfig();
        BeanUtil.copyProperties(generatorConfigAo, generatorConfig);
        this.saveOrUpdate(generatorConfig);
    }
}
