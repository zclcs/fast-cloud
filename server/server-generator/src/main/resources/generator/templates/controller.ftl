package ${basePackage}.${controllerPackage};

import com.zclcs.common.core.annotation.ControllerEndpoint;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import com.zclcs.common.core.base.BaseRsp;
import com.zclcs.common.core.constant.StringConstant;
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

import javax.validation.Valid;
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
@Validated
@RestController
@RequestMapping("${objectName?uncap_first}")
@RequiredArgsConstructor
@Api(tags = "${tableComment}")
public class ${className}Controller {

    private final ${className}Service ${className?uncap_first}Service;

    @GetMapping
    @ApiOperation(value = "${tableComment}查询（分页）")
    @PreAuthorize("hasAuthority('${objectName?uncap_first}:view')")
    public BaseRsp<BasePage<${className}Vo>> find${className}Page(@Valid BasePageAo basePageAo, ${className}Vo ${className?uncap_first}Vo) {
        BasePage<${className}Vo> page = this.${className?uncap_first}Service.find${className}Page(basePageAo, ${className?uncap_first}Vo);
        return BaseRspUtil.data(page);
    }

    @GetMapping("list")
    @ApiOperation(value = "${tableComment}查询（集合）")
    @PreAuthorize("hasAuthority('${objectName?uncap_first}:view')")
    public BaseRsp<List<${className}Vo>> find${className}List(${className}Vo ${className?uncap_first}Vo) {
        List<${className}Vo> list = this.${className?uncap_first}Service.find${className}List(${className?uncap_first}Vo);
        return BaseRspUtil.data(list);
    }

    @GetMapping("one")
    @ApiOperation(value = "${tableComment}查询（单个）")
    @PreAuthorize("hasAuthority('${objectName?uncap_first}:view')")
    public BaseRsp<${className}Vo> find${className}(${className}Vo ${className?uncap_first}Vo) {
        ${className}Vo ${className?uncap_first} = this.${className?uncap_first}Service.find${className}(${className?uncap_first}Vo);
        return BaseRspUtil.data(${className?uncap_first});
    }

    @PostMapping
    @PreAuthorize("hasAuthority('${objectName?uncap_first}:add')")
    @ControllerEndpoint(operation = "新增${tableComment}", exceptionMessage = "新增${tableComment}失败")
    @ApiOperation(value = "新增${tableComment}")
    public void add${className}(@RequestBody @Validated ${className}Ao ${className?uncap_first}Ao) {
        this.${className?uncap_first}Service.create${className}(${className?uncap_first}Ao);
    }

    @DeleteMapping("/{${objectName?uncap_first}Ids}")
    @PreAuthorize("hasAuthority('${objectName?uncap_first}:delete')")
    @ControllerEndpoint(operation = "删除${tableComment}", exceptionMessage = "删除${tableComment}失败")
    @ApiOperation(value = "删除${tableComment}")
    public void delete${className}(@ApiParam(value = "${tableComment}id集合(,分隔)", required = true) @NotBlank(message = "{required}") @PathVariable String ${objectName?uncap_first}Ids) {
        List<Long> ids = Arrays.stream(${objectName?uncap_first}Ids.split(StringConstant.COMMA)).map(Long::valueOf).collect(Collectors.toList());
        this.${className?uncap_first}Service.delete${className}(ids);
    }

    @PutMapping
    @PreAuthorize("hasAuthority('${objectName?uncap_first}:update')")
    @ControllerEndpoint(operation = "修改${tableComment}", exceptionMessage = "修改${tableComment}失败")
    @ApiOperation(value = "修改${tableComment}")
    public void update${className}(@RequestBody @Validated(UpdateStrategy.class) ${className}Ao ${className?uncap_first}Ao) {
        this.${className?uncap_first}Service.update${className}(${className?uncap_first}Ao);
    }
}