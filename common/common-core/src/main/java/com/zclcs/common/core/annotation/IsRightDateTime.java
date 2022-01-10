package com.zclcs.common.core.annotation;

import com.zclcs.common.core.annotation.validator.IsRightDateTimeValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * @author zclcs
 */
@Target({METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER})
@Retention(RUNTIME)
@Documented
@Constraint(validatedBy = {IsRightDateTimeValidator.class})// 标明由哪个类执行校验逻辑
public @interface IsRightDateTime {

    // 校验出错时默认返回的消息
    String message() default "时间格式不正确（yyyy-MM-dd HH:mm:ss）";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
