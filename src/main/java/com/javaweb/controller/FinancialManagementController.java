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
 * 财务管理控制器
 * @author PengChan
 *
 */
@Controller
@RequestMapping("/financial")
@Scope("prototype")
public class FinancialManagementController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(FinancialManagementController.class);
	
	@Autowired
	private ServiceFactory serviceFactory;
	
	/**
	 * 查询所有的订单
	 * @param starttime		开始时间
	 * @param endtime		结束时间
	 * @param page			页号
	 * @param rows			页面数据大小
	 * @return
	 */
	@RequestMapping("/getOrders")
	@ResponseBody
	public String getOrders(String starttime,String endtime,Integer page,Integer rows){		
		return responseSuccess(serviceFactory.getFinanicalManagement().queryallSettled(starttime, endtime, page, rows));
	}
	
	/**
	 * 查询所有的维修单
	 * @param starttime
	 * @param endtime
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/getPartProc")
	@ResponseBody
	public String getPartProc(String starttime,String endtime,Integer page,Integer rows){
		return responseSuccess(serviceFactory.getFinanicalManagement().queryAllPartProc(starttime, endtime, page, rows));
	}
	
}
