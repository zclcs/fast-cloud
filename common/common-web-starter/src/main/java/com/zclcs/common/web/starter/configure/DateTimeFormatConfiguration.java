package com.zclcs.common.web.starter.configure;

import cn.hutool.core.date.DatePattern;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalTimeSerializer;
import com.zclcs.common.web.starter.properties.MyWebProperties;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.datetime.standard.DateTimeFormatterRegistrar;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 * @author zclcs
 */
@Configuration
@EnableConfigurationProperties(MyWebProperties.class)
@ConditionalOnProperty(value = "my.enableDateConverter", havingValue = "true", matchIfMissing = true)
public class DateTimeFormatConfiguration implements WebMvcConfigurer {

    @Override
    public void addFormatters(@Nullable FormatterRegistry registry) {
        if (registry != null) {
            DateTimeFormatterRegistrar registrar = new DateTimeFormatterRegistrar();
            registrar.setDateFormatter(DateTimeFormatter.ofPattern(DatePattern.NORM_DATE_PATTERN));
            registrar.setTimeFormatter(DateTimeFormatter.ofPattern(DatePattern.NORM_TIME_PATTERN));
            registrar.setDateTimeFormatter(DateTimeFormatter.ofPattern(DatePattern.NORM_DATETIME_PATTERN));
            registrar.registerFormatters(registry);
        }
    }

//    /**
//     * string转 localDate
//     */
//    @Bean
//    public Converter<String, LocalDate> localDateConverter() {
//        return source -> {
//            if (StrUtil.isBlank(source)) {
//                return null;
//            }
//            try {
//                return LocalDate.parse(source);
//            } catch (Exception e) {
//                return LocalDate.parse(source, DateTimeFormatter.ofPattern(DatePattern.NORM_DATE_PATTERN));
//            }
//        };
//    }
//
//    /**
//     * string转 localTime
//     */
//    @Bean
//    public Converter<String, LocalTime> localTimeConverter() {
//        return source -> {
//            if (StrUtil.isBlank(source)) {
//                return null;
//            }
//            try {
//                return LocalTime.parse(source);
//            } catch (Exception e) {
//                return LocalTime.parse(source, DateTimeFormatter.ofPattern(DatePattern.NORM_TIME_PATTERN));
//            }
//        };
//    }
//
//    /**
//     * string转 localDateTime
//     */
//    @Bean
//    public Converter<String, LocalDateTime> localDateTimeConverter() {
//        return source -> {
//            if (StrUtil.isBlank(source)) {
//                return null;
//            }
//            // 先尝试ISO格式: 2019-07-15T16:00:00
//            try {
//                return LocalDateTime.parse(source);
//            } catch (Exception e) {
//                return LocalDateTime.parse(source, DateTimeFormatter.ofPattern(DatePattern.NORM_DATETIME_PATTERN));
//            }
//        };
//    }

    /**
     * 统一配置
     */
    @Bean
    public Jackson2ObjectMapperBuilderCustomizer jsonCustomizer() {
        JavaTimeModule module = new JavaTimeModule();
        module.addDeserializer(LocalDate.class, new LocalDateDeserializer(DateTimeFormatter.ofPattern(DatePattern.NORM_DATE_PATTERN)));
        module.addDeserializer(LocalTime.class, new LocalTimeDeserializer(DateTimeFormatter.ofPattern(DatePattern.NORM_TIME_PATTERN)));
        module.addDeserializer(LocalDateTime.class, new LocalDateTimeDeserializer(DateTimeFormatter.ofPattern(DatePattern.NORM_DATETIME_PATTERN)));
        return builder -> {
            builder.simpleDateFormat(DatePattern.NORM_DATETIME_PATTERN);
            builder.serializers(new LocalDateSerializer(DateTimeFormatter.ofPattern(DatePattern.NORM_DATE_PATTERN)));
            builder.serializers(new LocalTimeSerializer(DateTimeFormatter.ofPattern(DatePattern.NORM_TIME_PATTERN)));
            builder.serializers(new LocalDateTimeSerializer(DateTimeFormatter.ofPattern(DatePattern.NORM_DATETIME_PATTERN)));
            builder.modules(module);
        };
    }
}
