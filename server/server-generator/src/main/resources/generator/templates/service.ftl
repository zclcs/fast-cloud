package ${basePackage}.${servicePackage};

import ${basePackage}.${entityPackage}.${className};
import ${basePackage}.${aoPackage}.${className}Ao;
import ${basePackage}.${voPackage}.${className}Vo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;

import java.util.List;

/**
 * ${tableComment} Service接口
 *
 * @author ${author}
 * @date ${date}
 */
public interface ${className}Service extends IService<${className}> {

    /**
     * 查询（分页）
     *
     * @param basePageAo basePageAo
     * @param ${className?uncap_first}Vo ${className?uncap_first}Vo
     * @return BasePage<${className}Vo>
     */
    BasePage<${className}Vo> find${className}Page(BasePageAo basePageAo, ${className}Vo ${className?uncap_first}Vo);

    /**
     * 查询（所有）
     *
     * @param ${className?uncap_first}Vo ${className?uncap_first}Vo
     * @return List<${className}Vo>
     */
    List<${className}Vo> find${className}List(${className}Vo ${className?uncap_first}Vo);

    /**
     * 查询（单个）
     *
     * @param ${className?uncap_first}Vo ${className?uncap_first}Vo
     * @return ${className}Vo
     */
    ${className}Vo find${className}(${className}Vo ${className?uncap_first}Vo);

    /**
     * 统计
     *
     * @param ${className?uncap_first}Vo ${className?uncap_first}Vo
     * @return ${className}Vo
     */
    Integer count${className}(${className}Vo ${className?uncap_first}Vo);

    /**
     * 新增
     *
     * @param ${className?uncap_first}Ao ${className?uncap_first}Ao
     * @return ${className}
     */
     ${className} create${className}(${className}Ao ${className?uncap_first}Ao);

    /**
     * 修改
     *
     * @param ${className?uncap_first}Ao ${className?uncap_first}Ao
     * @return ${className}
     */
     ${className} update${className}(${className}Ao ${className?uncap_first}Ao);

    /**
     * 删除
     *
     * @param ids ids
     */
    void delete${className}(List<Long> ids);

}
