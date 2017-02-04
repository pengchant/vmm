package com.javaweb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.javaweb.entity.Customer;
import com.javaweb.entity.Vehicle;
import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;
import com.javaweb.views.CustomerVehicle;

/**
 * 汽车修理模块控制器
 * @author cp
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/vehicle")
public class VehicleMaintenceController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(VehicleMaintenceController.class);
	
	@Autowired
	private ServiceFactory serviceFactory;
	
	/**
	 * 根据关键字查询用户和车辆的信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getUserVehBykey")
	@ResponseBody
	public String queryCustomAndVehByKey(HttpServletRequest request,Model model){	
		String qString= request.getParameter("q")!=null?request.getParameter("q").toString():"";
		List<CustomerVehicle> customerVehicles = serviceFactory.getVehicleMaintence().queryUserVehiByKeyWorld(qString);
		logger.info("查询到所有的用户信息为:-->"+JSON.toJSONString(customerVehicles));
		return JSON.toJSONString(customerVehicles);
	}
	
	/**
	 * 根据关键字查询用户的信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getCustomerBykey")
	@ResponseBody
	public String queryCustomerByKey(HttpServletRequest request,Model model){
		String qString =request.getParameter("q")!=null?request.getParameter("q").toString():"";
		List<Customer> customers = serviceFactory.getVehicleMaintence().queryCustomerByKey(qString);
		return JSON.toJSONString(customers);
	}
	
	/**
	 * 添加用户
	 * @param request
	 * @return
	 */
	@RequestMapping("/addUser")
	@ResponseBody
	public String addUserInfo(HttpServletRequest request,Customer customer){
		logger.info("用户："+JSON.toJSONString(customer));
//		if(customer!=null&&vehicle!=null&&serviceFactory.getVehicleMaintence().addUserVehicleInfo(customer, vehicle)){
//			return responseSuccess(null, "添加用户"+customer.getNumbering()+"信息成功!");
//		}else{
//			return responseFail("添加用户"+customer.getNumbering()+"信息失败!");
//		} 
		return responseFail("添加用户"+customer.getNumbering()+"信息失败!");
	}
	
 
}

