package com.zclcs.server.generator.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.entity.generator.GeneratorConfig;
import com.zclcs.common.core.entity.generator.ao.GeneratorConfigAo;
import com.zclcs.common.core.entity.generator.vo.GeneratorConfigVo;

/**
 * @author zclcs
 */
public interface GeneratorConfigService extends IService<GeneratorConfig> {

    /**
     * 查询
     *
     * @return GeneratorConfig
     */
    GeneratorConfigVo findGeneratorConfig();

    /**
     * 修改
     *
     * @param generatorConfig generatorConfig
     */
    void updateGeneratorConfig(GeneratorConfigAo generatorConfig);

}
