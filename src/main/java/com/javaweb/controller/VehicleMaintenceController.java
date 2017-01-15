package com.javaweb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;

/**
 * 汽车修理模块控制器
 * @author cp
 *
 */
@Controller
@RequestMapping("/vehicle")
@Scope("prototype")
public class VehicleMaintenceController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(VehicleMaintenceController.class);
	
	@Autowired
	private ServiceFactory serviceFactory;
	
	@RequestMapping("/{keyworld}/t")
	@ResponseBody
	public String queryCustomAndVehByKey(Model model,@PathVariable("keyworld")String keyworld){
		
		return null;
	}
	
	
	
	
}

