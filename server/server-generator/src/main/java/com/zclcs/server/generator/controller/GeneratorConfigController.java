package com.zclcs.server.generator.controller;

import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.entity.generator.ao.GeneratorConfigAo;
import com.zclcs.common.core.entity.generator.vo.GeneratorConfigVo;
import com.zclcs.common.core.exception.MyException;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import com.zclcs.server.generator.service.GeneratorConfigService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author zclcs
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("config")
@Api(tags = "代码生成配置管理")
public class GeneratorConfigController {

    private final GeneratorConfigService generatorConfigService;

    @GetMapping
    @PreAuthorize("hasAuthority('gen:config')")
    @ApiOperation(value = "获取代码生成配置")
    public BaseRsp<GeneratorConfigVo> getGeneratorConfig() {
        return BaseRspUtil.data(generatorConfigService.findGeneratorConfig());
    }

    @PutMapping
    @PreAuthorize("hasAuthority('gen:config:update')")
    @ApiOperation(value = "修改代码生成配置")
    public void updateGeneratorConfig(@RequestBody @Validated(UpdateStrategy.class) GeneratorConfigAo generatorConfig) throws MyException {
        if (generatorConfig.getId() == null) {
            throw new MyException("配置id不能为空");
        }
        this.generatorConfigService.updateGeneratorConfig(generatorConfig);
    }
}
