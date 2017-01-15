  package com.javaweb.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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

	public IVehicleMaintence getVehicleMaintence() {
		return vehicleMaintence;
	}

	public IUserValidateService getUserValidateService() {
		return this.userValidateService;
	}
}
