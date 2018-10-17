package cn.doublepoint.commonutil.annotation;

import java.lang.annotation.*;

@Target({ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequestForm {
	
	String name() default "";
}