package com.javaweb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;

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
	public String queryUser(String status, Integer page, Integer rows,String key) {
		return responseSuccess(serviceFactory.getSystemManageService().queryAllUser(page, rows, status,key));
	}
}
