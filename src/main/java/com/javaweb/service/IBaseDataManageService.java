package com.javaweb.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.hsmf.datatypes.StoragePropertiesChunk;

import com.javaweb.entity.Mainitem;
import com.javaweb.entity.Part;
import com.javaweb.entity.Partcategory;
import com.javaweb.entity.Partstorage;
import com.javaweb.entity.Permission;
import com.javaweb.entity.Projcategory;
import com.javaweb.entity.Supplier;
import com.javaweb.entity.Warehouse;
import com.javaweb.utils.PagedResult;
import com.javaweb.views.CustomerView;
import com.javaweb.views.MainItemView;

/**
 * 基础数据管理的服务
 * 
 * @author PengChan
 *
 */
public interface IBaseDataManageService {

	/**
	 * 分页查询用户的信息
	 * 
	 * @param key
	 * @param sort
	 * @param order
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PagedResult<CustomerView> queryPagedCustomerView(String key, String sort, String order, Integer pageNo,
			Integer pageSize);

	/**
	 * 查询所有用户的信息
	 * 
	 * @return
	 */
	List<CustomerView> queryAllCustomer();

	/**
	 * 更新用户的信息
	 * 
	 * @param customerView
	 * @return
	 */
	boolean modifyCustomer(CustomerView customerView);

	/**
	 * 查询所有的权限
	 * 
	 * @return
	 */
	List<Permission> queryPermission();

	/**
	 * 修改权限的状态
	 * 
	 * @param permission
	 * @return
	 */
	boolean modifyPermission(Permission permission);

	/**
	 * 查询所有的维修项目的大类
	 * 
	 * @return
	 */
	List<Projcategory> queryAllProjCategory();

	/**
	 * 查询所有的维修项目
	 * 
	 * @return
	 */
	List<MainItemView> queryAllMainItem();

	/**
	 * 更改维修项目的大类信息
	 * 
	 * @param projcategory
	 *            维修项目的类别
	 * @param type
	 *            操作的类别(U:更新，D:删除,C:添加)
	 * @return
	 */
	boolean modifyPartCategory(Projcategory projcategory, String type);

	/**
	 * 更改维修项目的信息
	 * 
	 * @param mainItem
	 *            维修项目的信息
	 * @param type
	 *            操作的类别(U:更新，D:删除,C:添加)
	 * @return
	 */
	boolean modifyMainitem(Mainitem mainItem, String type);

	/**
	 * 查询所有的供应商
	 * @param key		关键字
	 * @param sort		排序字段
	 * @param order		顺序
	 * @param flag		标记
	 * @param pageNo	页号
	 * @param pageSize	页面大小
	 * @return
	 */
	PagedResult<Supplier> queryAllSupplier(
			String key, 
			String sort, 
			String order, 
			String flag,
			Integer pageNo,
			Integer pageSize);
	
	/**
	 * 修改供应商的信息
	 * @param supplier	供应商
	 * @param type		类型
	 * @return
	 */
	boolean modifySupplier(Supplier supplier,String type);
	
	/**
	 * 查询所有供应商
	 * @return
	 */
	List<Supplier> queryAllSupplier();
	
	
	/**
	 * 分页查询所有的零件的类别
	 * @param pageNo		页号
	 * @param pageSize		页面大小
	 * @return
	 */
	PagedResult<Partcategory> queryPagedPartCategory(Integer pageNo,Integer pageSize,String status);
	
	/**
	 * 添加C,修改U,删除D零件类别
	 * @param partcategory
	 * @return
	 */
	boolean modifyPartCategory(Partcategory partcategory,String type);
	
	/**
	 * 分页查询仓库的信息
	 * @param pageNo		页号
	 * @param pageSize		页面大小
	 * @return
	 */
	PagedResult<Warehouse> queryPagedWarehouse(Integer pageNo,Integer pageSize,String status);
	
	/**
	 * 修改仓库的信息
	 * @param warehouse
	 * @param type
	 * @return
	 */
	boolean modifyWarehouse(Warehouse warehouse,String type);
	
	/**
	 * 查询所有零件的类别
	 * @return
	 */
	List<Partcategory> queryAllPartCategory();
	 
	/**
	 * 查询所有的仓库
	 * @return
	 */
	List<Warehouse> queryAllWareHouse();
	
	/**
	 * 添加零件存储
	 * @param part
	 * @param partstorage
	 * @return
	 */
	boolean addPartStorage(Part part,Partstorage partstorage);
	
	/**
	 * 删除零件
	 * @param partid
	 * @return
	 */
	boolean delPart(String partid);
	
}
