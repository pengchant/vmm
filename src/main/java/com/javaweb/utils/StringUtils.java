package com.javaweb.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.enterprise.inject.New;

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
	
	/**
	 * 获取随机字符串
	 * @param length
	 * @return
	 */
	public static String getCode(int length){
		if(length>0){
			String base = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";     
		    Random random = new Random();     
		    StringBuffer sb = new StringBuffer();     
		    for (int i = 0; i < length; i++) {     
		        int number = random.nextInt(base.length());     
		        sb.append(base.charAt(number));     
		    }     
		    return sb.toString(); 
		}
		return null;
	}
	
	/**
	 * 获取时间的字符串
	 * @return
	 */
	public static String getCurrentTimeStr(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		
		return format.format(new Date());
	}
	
	/**
	 * 获取格式化之后的时间xxx年xx月xx日(参数格式为xxxx-xx-xx)
	 * @param timeStr
	 * @return
	 */
	public static String getTimeStr(String timeStr){
		String[] array = timeStr.split("-");
		return array[0]+"年"+array[1]+"月"+array[2]+"日";
	}
	
	/**
	 * 获取时间字符串
	 * @param timestr
	 * @return
	 */
	public static Date getDateFromStr(String timestr){
		Date date = null;
		try {
			SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
			date = sFormat.parse(timestr);
		} catch (Exception e) { 
			date = new Date();
		}
		return date;
	}
}
