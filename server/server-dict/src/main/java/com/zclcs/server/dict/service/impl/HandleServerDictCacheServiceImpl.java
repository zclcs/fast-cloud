package com.zclcs.server.dict.service.impl;

import cn.hutool.json.JSONUtil;
import com.houkunlin.system.dict.starter.bean.DictValueVo;
import com.rabbitmq.client.Channel;
import com.zclcs.common.core.constant.MyConstant;
import com.zclcs.common.core.entity.CanalBinLogInfo;
import com.zclcs.common.core.entity.dict.DictTable;
import com.zclcs.common.core.entity.dict.DictTableLevel;
import com.zclcs.common.core.service.HandleCacheService;
import com.zclcs.server.dict.provider.DictProvider;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zclcs
 */
@Service(value = "handleServerDictCacheService")
@RequiredArgsConstructor
@Slf4j
public class HandleServerDictCacheServiceImpl implements HandleCacheService {

    private static final String DICT_TABLE = "dict_table";
    private static final String DICT_TABLE_LEVEL = "dict_table_level";
    private final DictProvider dictProvider;

    @Override
    public void handleCache(CanalBinLogInfo canalBinLogInfo, long deliveryTag, Channel channel) throws Exception {
        // ddl语句直接break
        if (!canalBinLogInfo.getIsDdl()) {
            switch (canalBinLogInfo.getTable()) {
                case DICT_TABLE:
                    List<DictTable> dictTables = JSONUtil.toList(canalBinLogInfo.getData(), DictTable.class);
                    for (DictTable dictTable : dictTables) {
                        switch (canalBinLogInfo.getType()) {
                            case MyConstant.INSERT:
                            case MyConstant.UPDATE:
                                refreshDictCache(dictTable.getDictName(), dictTable.getCode(), dictTable.getTitle());
                                break;
                            case MyConstant.DELETE:
                                deleteDictCache(dictTable.getDictName(), dictTable.getCode());
                                break;
                            default:
                                break;
                        }
                    }
                    break;
                case DICT_TABLE_LEVEL:
                    List<DictTableLevel> dictTableLevels = JSONUtil.toList(canalBinLogInfo.getData(), DictTableLevel.class);
                    for (DictTableLevel dictTableLevel : dictTableLevels) {
                        switch (canalBinLogInfo.getType()) {
                            case MyConstant.INSERT:
                            case MyConstant.UPDATE:
                                refreshDictCache(dictTableLevel.getDictName(), dictTableLevel.getCode(), dictTableLevel.getTitle());
                                break;
                            case MyConstant.DELETE:
                                deleteDictCache(dictTableLevel.getDictName(), dictTableLevel.getCode());
                                break;
                            default:
                                break;
                        }
                    }
                    break;
                default:
                    break;
            }
        }
        channel.basicAck(deliveryTag, false);
    }

    private void refreshDictCache(String dictName, String code, String title) {
        dictProvider.refreshDictCache(DictValueVo.builder()
                .dictType(dictName)
                .value(code)
                .title(title)
                .build());
    }

    private void deleteDictCache(String dictName, String code) {
        dictProvider.refreshDictCache(DictValueVo.builder()
                .dictType(dictName)
                .value(code)
                .title(null)
                .build());
    }

}
