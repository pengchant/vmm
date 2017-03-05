package com.javaweb.service;

import java.util.List;

import com.javaweb.utils.PagedResult;
import com.javaweb.views.CustomerView;

/**
 * 基础数据管理的服务
 * @author PengChan
 *
 */
public interface IBaseDataManageService {
	
	/**
	 * 分页查询用户的信息
	 * @param key
	 * @param sort
	 * @param order
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PagedResult<CustomerView> queryPagedCustomerView(
			String key,
			String sort,
			String order,
			Integer pageNo,
			Integer pageSize);
	
	/**
	 * 查询所有用户的信息
	 * @return
	 */
	List<CustomerView> queryAllCustomer();
	
	/**
	 * 更新用户的信息
	 * @param customerView
	 * @return
	 */
	boolean modifyCustomer(CustomerView customerView);
}
