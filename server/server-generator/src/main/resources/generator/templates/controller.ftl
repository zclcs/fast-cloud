package ${basePackage}.${controllerPackage};

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
import ${basePackage}.${entityPackage}.${className};
import ${basePackage}.${aoPackage}.${className}Ao;
import ${basePackage}.${voPackage}.${className}Vo;
import com.zclcs.common.core.utils.BaseRspUtil;
import com.zclcs.common.core.validate.strategy.UpdateStrategy;
import ${basePackage}.${servicePackage}.${className}Service;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * ${tableComment} Controller
 *
 * @author ${author}
 * @date ${date}
 */
@Slf4j
@RestController
@RequestMapping("${className?uncap_first}")
@RequiredArgsConstructor
@Api(tags = "${tableComment}")
public class ${className}Controller {

    private final ${className}Service ${className?uncap_first}Service;

    @GetMapping
    @ApiOperation(value = "${tableComment}查询（分页）")
    @PreAuthorize("hasAuthority('${className?uncap_first}:view')")
    public BaseRsp<BasePage<${className}Vo>> find${className}Page(@Validated BasePageAo basePageAo, @Validated ${className}Vo ${className?uncap_first}Vo) {
        BasePage<${className}Vo> page = this.${className?uncap_first}Service.find${className}Page(basePageAo, ${className?uncap_first}Vo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "${tableComment}查询（集合）")
    @PreAuthorize("hasAuthority('${className?uncap_first}:view')")
    public BaseRsp<List<${className}Vo>> find${className}List(@Validated ${className}Vo ${className?uncap_first}Vo) {
        List<${className}Vo> list = this.${className?uncap_first}Service.find${className}List(${className?uncap_first}Vo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "${tableComment}查询（单个）")
    @PreAuthorize("hasAuthority('${className?uncap_first}:view')")
    public BaseRsp<${className}Vo> find${className}(@Validated ${className}Vo ${className?uncap_first}Vo) {
        ${className}Vo ${className?uncap_first} = this.${className?uncap_first}Service.find${className}(${className?uncap_first}Vo);
        return BaseRspUtil.data(${className?uncap_first});
    }

    @PostMapping
    @PreAuthorize("hasAuthority('${className?uncap_first}:add')")
    @ControllerEndpoint(operation = "新增${tableComment}")
    @ApiOperation(value = "新增${tableComment}")
    public BaseRsp<${className}> add${className}(@RequestBody @Validated ${className}Ao ${className?uncap_first}Ao) {
        return BaseRspUtil.data(this.${className?uncap_first}Service.create${className}(${className?uncap_first}Ao));
    }

    @DeleteMapping("/{${className?uncap_first}Ids}")
    @PreAuthorize("hasAuthority('${className?uncap_first}:delete')")
    @ControllerEndpoint(operation = "删除${tableComment}")
    @ApiOperation(value = "删除${tableComment}")
    public BaseRsp<String> delete${className}(@ApiParam(value = "${tableComment}id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String ${className?uncap_first}Ids) {
        List<Long> ids = Arrays.stream(${className?uncap_first}Ids.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.${className?uncap_first}Service.delete${className}(ids);
        return BaseRspUtil.message("删除成功");
    }

    @PutMapping
    @PreAuthorize("hasAuthority('${className?uncap_first}:update')")
    @ControllerEndpoint(operation = "修改${tableComment}")
    @ApiOperation(value = "修改${tableComment}")
    public BaseRsp<${className}> update${className}(@RequestBody @Validated(UpdateStrategy.class) ${className}Ao ${className?uncap_first}Ao) {
        return BaseRspUtil.data(this.${className?uncap_first}Service.update${className}(${className?uncap_first}Ao));
    }
}