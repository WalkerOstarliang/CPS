package com.chinacreator.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 用户excel的导入使用
 * 
 * @filename Excel.java
 * @author mingchun.xiong
 * @date Jan 14, 2015
 *
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface Excel
{
	/**
	 * excel的中文表头字段，必须与excel的表头一样
	 * @return
	 * @date Jan 14, 2015 11:22:42 AM
	 */
	public String zwfields() default "";
	
	/**
	 * excel 中的表头对应对象中的字段
	 * @return
	 * @date Jan 14, 2015 11:23:14 AM
	 */
	public String ywfields() default "";
	
	/**
	 * 必填字段，多个使用","分隔
	 * @return
	 * @date Jan 14, 2015 11:23:55 AM
	 */
	public String requiredfields() default "";
}
