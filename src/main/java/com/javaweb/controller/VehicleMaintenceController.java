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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.javaweb.entity.Customer;
import com.javaweb.entity.Projcategory;
import com.javaweb.entity.Vehicle;
import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;
import com.javaweb.utils.MyErrorPrinter;
import com.javaweb.utils.StringUtils;
import com.javaweb.views.CustomerVehicle;
import com.javaweb.views.EasyUITreeNode;

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
				vehicle.setInspectiondate(
						new SimpleDateFormat("yyyy-MM-dd").parse(customerVehicle.getInspectiondate()));
				vehicle.setMilage(StringUtils.getDoubleValue(customerVehicle.getMilage(), 0));
				vehicle.setPlatenum(customerVehicle.getPlatenum());
				vehicle.setVehflag(customerVehicle.getVehflag());
				// 插入到数据库中
				boolean flag = serviceFactory.getVehicleMaintence().addUserVehicleInfo(customer, vehicle);
				logger.info("用户的编号-->"+customer.getId(),"汽车的编号-->"+vehicle.getId());
				
				// 将插入到数据库中的数据返回给前台
				customerVehicle.setCustomerid(String.valueOf(customer.getId()));
				customerVehicle.setVehicleid(String.valueOf(vehicle.getId()));
				
				logger.info("添加用户及其车辆信息是否成功?" + flag);
				// 返回插入的结果，如果成功，就返回插入成功之后的数据
				return flag ? responseSuccess(customerVehicle, "添加用户" + customerVehicle.getNumbering() + "信息成功")
						: responseFail("添加用户" + customerVehicle.getNumbering() + "信息失败");
			} catch (Exception e) {
				logger.error(MyErrorPrinter.getErrorStack(e));
			}
		}
		return responseFail("添加用户" + customerVehicle.getNumbering() + "异常!");
	}

	/**
	 * 分页查询用户和车辆的信息
	 * 
	 * @param request
	 * @param model
	 * @param key
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/getUserAndVehBykeyPg")
	@ResponseBody
	public String queryCusAndVehByKeyPaged(HttpServletRequest request, Model model,
			@RequestParam(value="keyWorld",defaultValue="") String key,
			@RequestParam(value="page",defaultValue="1") Integer page,
			@RequestParam(value="rows",defaultValue="10") Integer rows) { 
		return responseSuccess(serviceFactory.getVehicleMaintence().queryUserVehicelByPage(key, page, rows));
	}

	/**
	 * 查询所有的维修大类
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getAllMainCategory")
	@ResponseBody
	public String queryMainProjCat(HttpServletRequest request,Model model){
		List<Projcategory> projcategories = serviceFactory.getVehicleMaintence().queryProjCategory();		 
		return (projcategories==null)?responseFail("对不起暂时未曾查询到保修类别，请稍后重试"):responseArraySuccess(projcategories);
	}
	
	/**
	 * 查询所有的用户信息
	 * @return
	 */
	@RequestMapping("/getAllUserDept")
	@ResponseBody
	public String queryAllUser(){
		List<EasyUITreeNode> easyUITreeNodes = serviceFactory.getVehicleMaintence().queryUserSectorInEUI();
		if(easyUITreeNodes!=null){
			return JSON.toJSONString(easyUITreeNodes);
		}
		return responseFail("加载用户失败!");
	}
	
}
