package com.javaweb.service;

import java.util.List;

import com.javaweb.entity.Customer;
import com.javaweb.entity.Vehicle;
import com.javaweb.utils.PagedResult;
import com.javaweb.views.CustomerVehicle;
 

/**
 * 汽车维修服务
 * @author cp
 *
 */
public interface IVehicleMaintence {

	/**
	 * 通过关键字查询用户和车辆的信息
	 * @param keyworld		关键字
	 * @return				返回所有的用户和车辆的信息
	 */
	List<CustomerVehicle> queryUserVehiByKeyWorld(String keyworld);
	
	/**
	 * 通过关键字查询用户的信息
	 * @param keyworld		关键字
	 * @return				用户的信息
	 */
	List<Customer> queryCustomerByKey(String keyworld);
	
	/**
	 * 添加用户的信息和汽车的信息
	 * @param customer		用户的实体类
	 * @param vehicle		交通工具的实体类
	 * @return				插入数据库的结果
	 */
	boolean addUserVehicleInfo(Customer customer,Vehicle vehicle);
	
	/**
	 * 分页查询用户和车辆的信息
	 * @param keyworld		关键字
	 * @param pageNo		页数
	 * @param pageSize		分页的大小
	 * @return				返回分页后的数据
	 */
	PagedResult<CustomerVehicle> queryUserVehicelByPage(String keyworld,Integer pageNo,Integer pageSize);
}
