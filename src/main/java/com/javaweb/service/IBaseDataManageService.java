package com.javaweb.service;

import java.util.List;

import com.javaweb.entity.Mainitem;
import com.javaweb.entity.Partcategory;
import com.javaweb.entity.Permission;
import com.javaweb.entity.Projcategory;
import com.javaweb.utils.PagedResult;
import com.javaweb.views.CustomerView;
import com.javaweb.views.MainItemView;

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
	
	/**
	 * 查询所有的权限
	 * @return
	 */
	List<Permission> queryPermission();
	
	/**
	 * 修改权限的状态
	 * @param permission
	 * @return
	 */
	boolean modifyPermission(Permission permission);
	
	/**
	 * 查询所有的维修项目的大类
	 * @return
	 */
	List<Projcategory> queryAllProjCategory();
	
	/**
	 * 查询所有的维修项目
	 * @return
	 */
	List<MainItemView> queryAllMainItem();
	
	/**
	 * 更改维修项目的大类信息
	 * @param projcategory		维修项目的类别
	 * @param type				操作的类别(U:更新，D:删除,C:添加)
	 * @return
	 */
	boolean modifyPartCategory(Projcategory projcategory,String type);
	
	
	/**
	 * 更改维修项目的信息
	 * @param mainItem			维修项目的信息
	 * @param type				操作的类别(U:更新，D:删除,C:添加)
	 * @return
	 */
	boolean modifyMainitem(Mainitem mainItem,String type); 
}
