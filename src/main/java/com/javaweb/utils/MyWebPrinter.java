package com.javaweb.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 用户向页面输出数据
 * 
 * @author cp
 *
 */
public class MyWebPrinter {

	private static final Logger logger = LoggerFactory.getLogger(MyWebPrinter.class);

	/**
	 * 向页面输出内容
	 * 
	 * @param response
	 * @param object
	 */
	public static void print(HttpServletResponse response, String object) {
		// 设置返回内容的格式
		response.setContentType("text/html;charset=utf-8");
		// 获取printwriter对象
		try {
			PrintWriter out = response.getWriter();
			out.print(object);
			out.flush();
			out.close();
			out = null;
			logger.info("输出成功:" + object);
		} catch (IOException e) {
			logger.error("输出失败!");
		}
	}

	public static void printJSON(HttpServletResponse response, String object) {
		// 设置返回内容的格式
		response.setContentType("application/json;charset=utf-8");
		// 获取printwriter对象
		try {
			PrintWriter out = response.getWriter();
			out.print(object);
			out.flush();
			out.close();
			out = null;
			logger.info("输出成功:" + object);
		} catch (IOException e) {
			logger.error("输出失败!");
		}
	}
}
