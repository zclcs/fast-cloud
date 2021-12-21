package ${basePackage}.${mapperPackage};

import ${basePackage}.${entityPackage}.${className};
import ${basePackage}.${voPackage}.${className}Vo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.zclcs.common.core.base.BasePage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ${tableComment} Mapper
 *
 * @author ${author}
 * @date ${date}
 */
public interface ${className}Mapper extends BaseMapper<${className}> {

    /**
     * 分页
     *
     * @param basePage 分页对象
     * @param ew       查询条件
     * @return 分页对象
     */
    BasePage<${className}Vo> findPageVo(BasePage<${className}Vo> basePage, @Param(Constants.WRAPPER) Wrapper<${className}Vo> ew);

    /**
     * 查找集合
     *
     * @param ew 查询条件
     * @return 集合对象
     */
    List<${className}Vo> findListVo(@Param(Constants.WRAPPER) Wrapper<${className}Vo> ew);

    /**
     * 查找单个
     *
     * @param ew 查询条件
     * @return 对象
     */
    ${className}Vo findOneVo(@Param(Constants.WRAPPER) Wrapper<${className}Vo> ew);

    /**
     * 统计
     *
     * @param ew 查询条件
     * @return 对象
     */
    Integer countVo(@Param(Constants.WRAPPER) Wrapper<${className}Vo> ew);

}