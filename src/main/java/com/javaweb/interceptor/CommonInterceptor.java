package com.javaweb.interceptor;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSON;
import com.javaweb.utils.StringUtils;
import com.javaweb.views.LoginBean;

/**
 * 系统的拦截器
 * @author cp
 *
 */
public class CommonInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonInterceptor.class);
	
	private static String[] ignoredURL = {};
	
	/**
	 * 读取配置文件
	 */
	static{		
		InputStream inputStream = CommonInterceptor.class.getResourceAsStream("/user-setting.properties");
		Properties properties = new Properties();
		try {
			properties.load(inputStream);
			String url = properties.getProperty("ignoredurl");
			if(url!=null){
				ignoredURL = url.split(",");
			}			 
			logger.info("配置忽略的url有-->"+url);
		} catch (IOException e) {	 
			logger.error(e.toString());
		}finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				logger.error(e.toString());
			}
		}
		 
	}
	
	/**
	 * 判断用户是否登录如果没有登录就跳转到登录的页面
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("进入url拦截方法......");
		boolean flag = false;
		String url = request.getRequestURL().toString(); 
		url = url.substring(StringUtils.getCharacterPosition(url)); 
		logger.info("获取到的url为:"+url);
		// 比较忽略的string数组
		for(String s:ignoredURL){
			logger.info("匹配的url-->"+s);
			if(url.equals(s)){
				flag = true;
				break;
			}
		}
		// 如果不是免拦截的请求
		if(!flag){
			// 查看是否已经登录
			LoginBean loginBean = (LoginBean) request.getSession().getAttribute("user");
			logger.info("查询用户的信息-->"+JSON.toJSONString(loginBean));
			if(loginBean!=null){
				flag = true;
			}
		}		
		logger.info("是否为有效用户-->"+flag);
		// 判断是否符合要求，如果不符合需要重定向到登录页面
		if(!flag){
			logger.info("hisURL:"+url);
			// 设置上一个访问的url
			request.setAttribute("hisURL", url);	 
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);			 
		}
		return flag;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
