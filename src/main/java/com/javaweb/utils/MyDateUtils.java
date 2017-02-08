package com.javaweb.utils;

import java.text.SimpleDateFormat;
 
import com.sun.star.bridge.oleautomation.Date;

/**
 * 时间日期处理工具类
 * @author cp
 *
 */
public class MyDateUtils {
	
	/**
	 * 获取当前的日期字符串
	 * @param formatter		日期格式化
	 * @return				返回格式化之后的时间字符串
	 */
	public static String getCurrentTimeByFormatter(String formatter){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formatter);
		return simpleDateFormat.format(new Date());
	}
}
