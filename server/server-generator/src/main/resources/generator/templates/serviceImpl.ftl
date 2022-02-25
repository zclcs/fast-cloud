package ${basePackage}.${serviceImplPackage};

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zclcs.common.core.base.BasePage;
import com.zclcs.common.core.base.BasePageAo;
import ${basePackage}.${entityPackage}.${className};
import ${basePackage}.${aoPackage}.${className}Ao;
import ${basePackage}.${voPackage}.${className}Vo;
import ${basePackage}.${mapperPackage}.${className}Mapper;
import ${basePackage}.${servicePackage}.${className}Service;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import java.util.List;

/**
 * ${tableComment} Service实现
 *
 * @author ${author}
 * @date ${date}
 */
@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
public class ${className}ServiceImpl extends ServiceImpl<${className}Mapper, ${className}> implements ${className}Service {

    @Override
    public BasePage<${className}Vo> find${className}Page(BasePageAo basePageAo, ${className}Vo ${className?uncap_first}Vo) {
        BasePage<${className}Vo> basePage = new BasePage<>(basePageAo.getPageNum(), basePageAo.getPageSize());
        QueryWrapper<${className}Vo> queryWrapper = getQueryWrapper(${className?uncap_first}Vo);
        // TODO 设置分页查询条件
        return this.baseMapper.findPageVo(basePage, queryWrapper);
    }

    @Override
    public List<${className}Vo> find${className}List(${className}Vo ${className?uncap_first}Vo) {
        QueryWrapper<${className}Vo> queryWrapper = getQueryWrapper(${className?uncap_first}Vo);
        // TODO 设置集合查询条件
        return this.baseMapper.findListVo(queryWrapper);
    }

    @Override
    public ${className}Vo find${className}(${className}Vo ${className?uncap_first}Vo) {
        QueryWrapper<${className}Vo> queryWrapper = getQueryWrapper(${className?uncap_first}Vo);
        // TODO 设置单个查询条件
        return this.baseMapper.findOneVo(queryWrapper);
    }

    @Override
    public Integer count${className}(${className}Vo ${className?uncap_first}Vo) {
    QueryWrapper<${className}Vo> queryWrapper = getQueryWrapper(${className?uncap_first}Vo);
        // TODO 设置统计查询条件
        return this.baseMapper.countVo(queryWrapper);
    }

    private QueryWrapper<${className}Vo> getQueryWrapper(${className}Vo ${className?uncap_first}Vo) {
        QueryWrapper<${className}Vo> queryWrapper = new QueryWrapper<>();
        // TODO 设置公共查询条件
        return queryWrapper;
   }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ${className} create${className}(${className}Ao ${className?uncap_first}Ao) {
        ${className} ${className?uncap_first} = new ${className}();
        BeanUtil.copyProperties(${className?uncap_first}Ao, ${className?uncap_first});
        this.save(${className?uncap_first});
        return ${className?uncap_first};
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ${className} update${className}(${className}Ao ${className?uncap_first}Ao) {
        ${className} ${className?uncap_first} = new ${className}();
        BeanUtil.copyProperties(${className?uncap_first}Ao, ${className?uncap_first});
        this.updateById(${className?uncap_first});
        return ${className?uncap_first};
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete${className}(List<Long> ids) {
        this.removeByIds(ids);
    }
}
