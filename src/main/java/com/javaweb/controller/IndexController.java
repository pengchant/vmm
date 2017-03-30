package com.javaweb.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaweb.entity.Account;
import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.views.LoginBean;
 

@Controller
@Scope("prototype")
@RequestMapping("index")
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Resource
	private ServiceFactory serviceFactory;
	
	@RequestMapping("/main.shtml")
	public String index(HttpServletRequest request){
		LoginBean loginBean = (LoginBean) request.getSession().getAttribute("user");
		request.setAttribute("loginbean", loginBean);
		// 下面是返回用户的权限：
		Account account = new Account();
		account.setAccountnumber(loginBean.getAccountnumber());
		request.setAttribute("allprivilege", serviceFactory.getUserValidateService().queryUserPrivleges(account));
		return "main";
	}
	
	@RequestMapping("/dis")
	public void dispatcher(HttpServletRequest request,HttpServletResponse response,@RequestParam("url") String url){		
		try {
			logger.info("dispatcher:"+url);
			request.getRequestDispatcher("/WEB-INF/views"+url).forward(request, response);
		} catch (ServletException e) {			 
			e.printStackTrace();
		} catch (IOException e) {			 
			e.printStackTrace();
		}		 
	} 
}
