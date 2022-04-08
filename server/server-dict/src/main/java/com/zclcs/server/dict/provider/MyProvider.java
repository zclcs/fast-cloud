package com.zclcs.server.dict.provider;

import com.houkunlin.system.dict.starter.bean.DictTypeVo;
import com.houkunlin.system.dict.starter.provider.DictProvider;
import com.zclcs.common.core.constant.DictConstant;
import com.zclcs.common.core.entity.dict.DictTable;
import com.zclcs.common.core.entity.dict.DictTableLevel;
import com.zclcs.common.core.entity.dict.DictTableName;
import com.zclcs.server.dict.service.DictTableLevelService;
import com.zclcs.server.dict.service.DictTableNameService;
import com.zclcs.server.dict.service.DictTableService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author zclcs
 */
@Component
@RequiredArgsConstructor
public class MyProvider implements DictProvider {

    private final DictTableService dictTableService;
    private final DictTableLevelService dictTableLevelService;
    private final DictTableNameService dictTableNameService;

    @Override
    public boolean isStoreDictType() {
        return true;
    }

    @Override
    public Iterator<DictTypeVo> dictTypeIterator() {
        // 从其他地方（其他服务、数据库、本地文件）加载完整的数据字典信息（字典类型+字典值列表）
        // 从这里返回的数据字典信息将会被存入缓存中，以便下次直接调用，当有数据变动时可以发起 RefreshDictEvent 事件通知更新字典信息
        List<DictTableName> dictTableNames = dictTableNameService.lambdaQuery().list();
        List<DictTable> dictTables = dictTableService.lambdaQuery().list();
        List<DictTableLevel> dictTableLevels = dictTableLevelService.lambdaQuery().list();
        List<DictTypeVo> dictTypeVos = new ArrayList<>();
        for (DictTableName dictTableName : dictTableNames) {
            DictTypeVo.DictTypeBuilder dictTypeBuilder = DictTypeVo.newBuilder(dictTableName.getDictName(), dictTableName.getDictTitle());
            if (DictConstant.DICT_TYPE_0.equals(dictTableName.getType())) {
                dictTables.stream().filter(dictTable -> dictTable.getDictName().equals(dictTableName.getDictName()))
                        .forEach(dictTable -> dictTypeBuilder.add(dictTable.getCode(), dictTable.getTitle()));
            } else {
                dictTableLevels.stream().filter(dictTableLevel -> dictTableLevel.getDictName().equals(dictTableName.getDictName()))
                        .forEach(dictTableLevel -> dictTypeBuilder.add(dictTableLevel.getCode(), dictTableLevel.getTitle()));
            }
            dictTypeVos.add(dictTypeBuilder.build());
        }
        return dictTypeVos.iterator();
    }
}

