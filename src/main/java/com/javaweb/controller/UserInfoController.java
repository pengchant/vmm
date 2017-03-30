package com.javaweb.controller;
 
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.javaweb.entity.Account;
import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;
import com.javaweb.views.LoginBean;

/**
 * 用户信息控制器
 * @author cp
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/users")
public class UserInfoController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	@Autowired
	private ServiceFactory serviceFactory;
	
	/**
	 * 登录系统
	 * @param request	请求
	 * @param model		model
	 * @param account	账户信息
	 * @return
	 */
	@RequestMapping("/login") 
	@ResponseBody
	public String login(HttpServletRequest request,HttpServletResponse response,Model model,Account account){
		logger.info("用户尝试登录："+JSON.toJSONString(account));
		if(account==null){
			 return responseFail("提交的参数为空!");
		}else{
			if(StringUtils.isBlank(account.getAccountnumber())){
				return responseFail("用户的账号为空");
			}
			if(StringUtils.isBlank(account.getPasswords())){
				return responseFail("用户的密码为空");
			}
			LoginBean loginBean = null;
			loginBean = serviceFactory.getUserValidateService().userislawable(account);
			if(loginBean==null){
				return responseFail("用户名或者密码输入不正确");
			}else{// 如果成功
				// 把loginbean放到session中
				request.getSession().setAttribute("user", loginBean);
				// 放到cookie中
				String flag = request.getParameter("flag");
				// 如果需要记住账户就存储账号和密码
				if(flag!=null&&flag.equals("1")){
					Cookie cookie = new Cookie("cookie_user",loginBean.getAccountnumber()+"-"+loginBean.getPasswords());
					cookie.setMaxAge(60*60*24*3);// 保存
				    response.addCookie(cookie);
				    logger.info("存储用户的cookie:"+loginBean.getAccountnumber()+"-"+loginBean.getPasswords());
				}else{// 如果没有要求记住账户密码，就保存账户
					Cookie cookie = new Cookie("cookie_user", loginBean.getAccountnumber());
					cookie.setMaxAge(60*60*24*30);
					response.addCookie(cookie);
					logger.info("存储用户的cookie:"+loginBean.getAccountnumber());
				}
				// 跳转到主页			 
			    logger.info("用户："+loginBean.getAccountnumber()+"成功进入系统");	
			    return responseSuccess(loginBean, "登录成功");
			}
		} 
	}
	
	/**
	 * 退出系统登录
	 * @param request		请求
	 * @param model			模型
	 * @param accountnum	账户号
	 * @return
	 */
	@RequestMapping("/{accountnum}/logout.shtml")
	public String logout(HttpServletRequest request,HttpServletResponse response,Model model,@PathVariable("accountnum") String accountnum){
		logger.info("用户"+accountnum+",退出系统登录...");
		// 设置session为空
		request.getSession().setAttribute("user", null);
		// 页面跳转
	    return "login";
	}
}
