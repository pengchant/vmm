package com.javaweb.service;

import java.util.List;

import com.javaweb.views.CustomerVehicle;
 

/**
 * 汽车维修服务
 * @author cp
 *
 */
public interface IVehicleMaintence {

	List<CustomerVehicle> queryUserVehiByKeyWorld(String keyworld);
}
