package com.javaweb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaweb.dao.DaoFactory;
import com.javaweb.entity.Account;
import com.javaweb.entity.Userinfo;
import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;
import com.javaweb.utils.StringUtils;
import com.javaweb.views.UserView;

/**
 * 系统管理
 * 
 * @author PengChan
 *
 */
@Controller
@RequestMapping("/base")
@Scope("prototype")
public class SystemManageController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(SystemManageController.class);

	@Autowired
	private ServiceFactory serviceFactory;

	/**
	 * 查询所有的用户
	 * 
	 * @param status
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/queryUser")
	@ResponseBody
	public String queryUser(String status, Integer page, Integer rows, String key) {
		return responseSuccess(serviceFactory.getSystemManageService().queryAllUser(page, rows, status, key));
	}

	/**
	 * 用户信息管理
	 *  operation:c:创建,u:更新,d:删除 
	 * @return
	 */
	@RequestMapping("/{operation}/modiUser")
	@ResponseBody
	public String modiUser(UserView userView, String allprivileges, @PathVariable("operation") String operation) {
		boolean flag = false;
		if(org.apache.commons.lang.StringUtils.isNotBlank(operation)&&org.apache.commons.lang.StringUtils.isNotBlank(allprivileges)){
			try {
				String[] privileges = allprivileges.split(",");
				int[] myprivileges = new int[privileges.length];
				for(int i = 0;i<myprivileges.length;i++){
					myprivileges[i] = StringUtils.getIntegerValue(privileges[i], -1);
				}
				flag = serviceFactory.getSystemManageService().modifyUser(userView, myprivileges, operation);
			} catch (Exception e) {
				logger.error("用户信息管理异常!");
			}
		}
		return responseSuccess(flag);
	}
	
	
	/**
	 * 查询所有的权限 
	 * @return
	 */
	@RequestMapping("/queryAllPrivilege")
	@ResponseBody
	public String queryAllPrivilege() { 
		return responseArraySuccess(serviceFactory.getSystemManageService().queryAllPermission());
	}
	 

}
