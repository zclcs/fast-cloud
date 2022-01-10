package com.zclcs.common.core.annotation.validator;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.util.StrUtil;
import com.zclcs.common.core.annotation.IsRightDate;
import lombok.extern.slf4j.Slf4j;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * @author zclcs
 */
@Slf4j
public class IsRightDateValidator implements ConstraintValidator<IsRightDate, String> {

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (StrUtil.isNotBlank(value)) {
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(DatePattern.NORM_DATE_PATTERN);
            try {
                LocalDate.parse(value, dateTimeFormatter);
                return true;
            } catch (Exception e) {
                return false;
            }
        } else {
            return true;
        }
    }
}
