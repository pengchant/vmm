package com.javaweb.utils;

import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * 把错误类型输出
 * @author cp
 *
 */
public class MyErrorPrinter {
	
	/**
	 * 输出错误的的具体字符串
	 * @param e		异常对象
	 * @return		返回错误的具体位置和错误类型
	 */
	public static String getErrorStack(Exception e){
		try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            return "\r\n" + sw.toString() + "\r\n";
        } catch (Exception e2) {
            return "bad getErrorInfoFromException";
        }
	}
}
