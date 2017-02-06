package com.javaweb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.javaweb.dao.DaoFactory;
import com.javaweb.entity.Customer;
import com.javaweb.entity.Vehicle;
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
	@Override
	public List<CustomerVehicle> queryUserVehiByKeyWorld(String keyworld) {		 
		List<CustomerVehicle> customerVehicles = null;
		try {
			customerVehicles = daoFactory.getVehicleMapper().selectVehicleByKey(keyworld);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		return customerVehicles; 
	}

	/**
	 * 关键字模糊查询用户的信息
	 */
	@Override
	public List<Customer> queryCustomerByKey(String keyworld) {
		List<Customer> customers = null;
		try {
			customers = daoFactory.getCustomerMapper().selectCustomerByKey(keyworld);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		return customers;
	}

	/**
	 * 添加用户和车辆的信息
	 */
	@Override
	public boolean addUserVehicleInfo(Customer customer, Vehicle vehicle) {
		boolean flag = false;
		if(vehicle!=null&&customer!=null){
			try {
				// 先判断是否是新用户	
				// 如果是老用户
				if (customer.getId() != null
						&& daoFactory.getCustomerMapper().selectByPrimaryKey(customer.getId()) != null) {
					// 添加汽车信息
					vehicle.setCustomerid(customer.getId());
				} else {// 如果是新用户
					daoFactory.getCustomerMapper().insert(customer);
					vehicle.setCustomerid(customer.getId());
				}
				daoFactory.getVehicleMapper().insert(vehicle);
				flag = true;
			} catch (Exception e) {
				logger.error(e.toString());
				flag = false;
			}
		}else{
			flag = false;
		} 
		return flag;
	}
	
	

}
