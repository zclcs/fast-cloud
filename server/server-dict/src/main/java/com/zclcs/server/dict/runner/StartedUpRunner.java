package com.zclcs.server.dict.runner;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import com.zclcs.common.core.utils.BaseUtil;
import com.zclcs.server.dict.provider.DictProvider;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

/**
 * @author zclcs
 */
@Component
@RequiredArgsConstructor
@Slf4j
public class StartedUpRunner implements ApplicationRunner {

    private final ConfigurableApplicationContext context;
    private final Environment environment;
    private final DictProvider dictProvider;

    @Override
    public void run(ApplicationArguments args) {
        if (context.isActive()) {
            BaseUtil.printSystemUpBanner(environment);
            log.info("字典刷新事件启动：{}", DateUtil.date().toString(DatePattern.NORM_DATETIME_MS_PATTERN));
            dictProvider.refreshAllDictTypeCache();
            log.info("字典刷新事件启动完毕：{}", DateUtil.date().toString(DatePattern.NORM_DATETIME_MS_PATTERN));
        }
    }
}
