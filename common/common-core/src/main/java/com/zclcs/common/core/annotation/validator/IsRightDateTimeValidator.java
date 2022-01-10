package com.zclcs.common.core.annotation.validator;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.util.StrUtil;
import com.zclcs.common.core.annotation.IsRightDateTime;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @author zclcs
 */
public class IsRightDateTimeValidator implements ConstraintValidator<IsRightDateTime, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (StrUtil.isNotBlank(value)) {
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(DatePattern.NORM_DATETIME_PATTERN);
            try {
                LocalDateTime.parse(value, dateTimeFormatter);
                return true;
            } catch (Exception e) {
                return false;
            }
        } else {
            return true;
        }
    }
}
