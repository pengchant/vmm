package com.javaweb.controller;

import java.text.SimpleDateFormat;
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
import com.javaweb.utils.MyErrorPrinter;
import com.javaweb.utils.StringUtils;
import com.javaweb.views.CustomerVehicle;

/**
 * 汽车修理模块控制器
 * 
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
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getUserVehBykey")
	@ResponseBody
	public String queryCustomAndVehByKey(HttpServletRequest request, Model model) {
		String qString = request.getParameter("q") != null ? request.getParameter("q").toString() : "";
		List<CustomerVehicle> customerVehicles = serviceFactory.getVehicleMaintence().queryUserVehiByKeyWorld(qString);
		logger.info("查询到所有的用户信息为:-->" + JSON.toJSONString(customerVehicles));
		return JSON.toJSONString(customerVehicles);
	}

	/**
	 * 根据关键字查询用户的信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getCustomerBykey")
	@ResponseBody
	public String queryCustomerByKey(HttpServletRequest request, Model model) {
		String qString = request.getParameter("q") != null ? request.getParameter("q").toString() : "";
		List<Customer> customers = serviceFactory.getVehicleMaintence().queryCustomerByKey(qString);
		return JSON.toJSONString(customers);
	}

	/**
	 * 添加用户
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addUser")
	@ResponseBody
	public String addUserInfo(HttpServletRequest request, CustomerVehicle customerVehicle) {
		logger.info("用户：" + JSON.toJSONString(customerVehicle));
		if (customerVehicle != null) {
			// 封装值
			try {
				Customer customer = new Customer();
				Vehicle vehicle = new Vehicle();
				// 用户的信息
				int customerid = org.apache.commons.lang.StringUtils.isBlank(customerVehicle.getCustomerid()) ? -1
						: Integer.valueOf(customerVehicle.getCustomerid());
				customer.setId(customerid);
				customer.setNumbering(customerVehicle.getNumbering());
				customer.setMailbox(customerVehicle.getMailbox());
				customer.setContactinfo(customerVehicle.getContactinfo());
				customer.setContactadd(customerVehicle.getContactadd());
				customer.setIdcard(customerVehicle.getIdcard());
				customer.setCustomerflag("1");// 默认为1
				// 车辆的信息
				vehicle.setCustomerid(customerid);
				vehicle.setVehname(customerVehicle.getVehname());
				vehicle.setCarmodel(customerVehicle.getCarmodel());
				vehicle.setInspectiondate(new SimpleDateFormat("yyyy-MM-dd").parse(customerVehicle.getInspectiondate()));
			} catch (Exception e) {
				logger.error(MyErrorPrinter.getErrorStack(e));
			}
		}
		return responseFail("添加用户" + customerVehicle.getNumbering() + "信息失败!");
	}

}
