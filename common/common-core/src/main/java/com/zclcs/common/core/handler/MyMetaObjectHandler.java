package com.zclcs.common.core.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.zclcs.common.core.utils.BaseUsersUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 填充器
 *
 * @author zhouchenglong
 */
@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        this.strictInsertFill(metaObject, "createAt", LocalDateTime.class, LocalDateTime.now());
        Object createBy = metaObject.getValue("createBy");
        if (createBy == null) {
            this.strictInsertFill(metaObject, "createBy", String.class, BaseUsersUtil.getCurrentUsername());
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.strictUpdateFill(metaObject, "updateAt", LocalDateTime.class, LocalDateTime.now());
        Object updateBy = metaObject.getValue("updateBy");
        if (updateBy == null) {
            this.strictInsertFill(metaObject, "updateBy", String.class, BaseUsersUtil.getCurrentUsername());
        }
    }
}
