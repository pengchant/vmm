package com.javaweb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.javaweb.dao.DaoFactory;
import com.javaweb.service.IVehicleMaintence;
import com.javaweb.views.CustomerVehicle;

/**
 * 汽车维系的服务
 * @author cp
 *
 */
@Service
public class VehicleMaintence implements IVehicleMaintence {

	private static final Logger logger = LoggerFactory.getLogger(VehicleMaintence.class);
	
	@Resource
	private DaoFactory daoFactory;
	
	/**
	 * 关键字查询用户的信息和汽车的信息
	 */
	public List<CustomerVehicle> queryUserVehiByKeyWorld(String keyworld) {
		logger.info("-->进入根据关键字查询用户的车型和自己的相关信息");
		List<CustomerVehicle> customerVehicles = null;
		try {
			customerVehicles = daoFactory.getVehicleMapper().selectVehicleByKey(keyworld);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		return customerVehicles; 
	}

}
