package com.javaweb.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtils {

	/**
	 * 获取字符的位置
	 * @param string
	 * @return
	 */
	public static int getCharacterPosition(String string) {
		// 这里是获取"/"符号的位置
		Matcher slashMatcher = Pattern.compile("/").matcher(string);
		int mIdx = 0;
		while (slashMatcher.find()) {
			mIdx++;
			// 当"/"符号第四次出现的位置
			if (mIdx == 4) {
				break;
			}
		}
		return slashMatcher.start();
	}

	/**
	 * 将String 转化为int 类型 如果转化失败默认值为def
	 * @param value		带转化的value
	 * @param def		默认值def(ault)
	 * @return			返回string转化为int的结果
	 */
	public static int getIntegerValue(String value, int def) {
		int result = def;
		if (!org.apache.commons.lang.StringUtils.isBlank(value)) {
			try {
				result = Integer.valueOf(value);				
			} catch (Exception e) {
				e.printStackTrace();
				result = def;
			}
		}
		return result;
	}
	
	/**
	 * 将String 转化为double 类型 如果转化失败默认值为def
	 * @param value		带转化的value
	 * @param def		默认值def(ault)
	 * @return			返回string转化为int的结果
	 */
	public static double getDoubleValue(String value, double def) {
		double result = def;
		if (!org.apache.commons.lang.StringUtils.isBlank(value)) {
			try {
				result = Double.valueOf(value);				
			} catch (Exception e) {
				e.printStackTrace();
				result = def;
			}
		}
		return result;
	}
}
