package com.zclcs.common.security.starter.annotation;

import com.zclcs.common.security.starter.configure.MyCloudResourceServerConfigure;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * @author zclcs
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Import(MyCloudResourceServerConfigure.class)
public @interface EnableMyCloudResourceServer {
}
