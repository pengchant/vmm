package com.javaweb.service;

import java.util.List;

import com.javaweb.entity.Customer;
import com.javaweb.entity.Vehicle;
import com.javaweb.views.CustomerVehicle;
 

/**
 * 汽车维修服务
 * @author cp
 *
 */
public interface IVehicleMaintence {

	/**
	 * 通过关键字查询用户和车辆的信息
	 * @param keyworld
	 * @return
	 */
	List<CustomerVehicle> queryUserVehiByKeyWorld(String keyworld);
	
	/**
	 * 通过关键字查询用户的信息
	 * @param keyworld
	 * @return
	 */
	List<Customer> queryCustomerByKey(String keyworld);
	
	/**
	 * 添加用户的信息和汽车的信息
	 * @param customer
	 * @param vehicle
	 * @return
	 */
	boolean addUserVehicleInfo(Customer customer,Vehicle vehicle);
}
