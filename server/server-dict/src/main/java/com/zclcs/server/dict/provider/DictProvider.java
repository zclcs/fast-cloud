package com.zclcs.server.dict.provider;

import com.houkunlin.system.dict.starter.bean.DictTypeVo;
import com.houkunlin.system.dict.starter.bean.DictValueVo;
import com.houkunlin.system.dict.starter.notice.RefreshDictEvent;
import com.houkunlin.system.dict.starter.notice.RefreshDictTypeEvent;
import com.houkunlin.system.dict.starter.notice.RefreshDictValueEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author zclcs
 */
@Component
@RequiredArgsConstructor
@Slf4j
public class DictProvider {

    private final ApplicationEventPublisher publisher;

    /**
     * 刷新字典项
     *
     * @param dictValueVo 字典项
     */
    public void refreshDictCache(DictValueVo dictValueVo) {
        publisher.publishEvent(new RefreshDictValueEvent(dictValueVo));
    }

    /**
     * 刷新所有字典项（title传null视为删除）
     *
     * @param dictValueVos 所有字典项
     */
    public void refreshDictListCache(List<DictValueVo> dictValueVos) {
        publisher.publishEvent(new RefreshDictValueEvent(dictValueVos));
    }

    /**
     * 刷新单个字典
     */
    public void refreshDictTypeCache(DictTypeVo dictTypeVo) {
        publisher.publishEvent(new RefreshDictTypeEvent(dictTypeVo));
    }

    /**
     * 刷新所有字典
     */
    public void refreshAllDictTypeCache() {
        publisher.publishEvent(new RefreshDictEvent(""));
    }
}
