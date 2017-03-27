package com.javaweb.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.javaweb.service.IBaseDataManageService;
import com.javaweb.service.IFinancialManagementService;
import com.javaweb.service.IInventoryManageService;
import com.javaweb.service.ISystemManageService;
import com.javaweb.service.IUserValidateService;
import com.javaweb.service.IVehicleMaintence;

/**
 * serviceFactory
 * 
 * @author cp
 *
 */
@Service
public class ServiceFactory {

	/**
	 * 用户身份认证和权限认证模块
	 */
	@Resource
	private IUserValidateService userValidateService;

	/**
	 * 汽车维修模块
	 */
	@Resource
	private IVehicleMaintence vehicleMaintence;

	/**
	 * 库存管理模块
	 */
	@Resource
	private IInventoryManageService inventoryManageService;

	/**
	 * 基础数据管理模块
	 */
	@Resource
	private IBaseDataManageService baseDataManageService;

	/**
	 * 财务管理模块
	 */
	@Resource
	private IFinancialManagementService finanicalManagement;

	/**
	 * 系统维护模块
	 */
	@Resource
	private ISystemManageService systemManageService;

	public ISystemManageService getSystemManageService() {
		return systemManageService;
	}

	public IBaseDataManageService getBaseDataManageService() {
		return baseDataManageService;
	}

	public IVehicleMaintence getVehicleMaintence() {
		return vehicleMaintence;
	}

	public IUserValidateService getUserValidateService() {
		return this.userValidateService;
	}

	public IInventoryManageService getInventoryManageService() {
		return inventoryManageService;
	}

	public IFinancialManagementService getFinanicalManagement() {
		return finanicalManagement;
	}

}
