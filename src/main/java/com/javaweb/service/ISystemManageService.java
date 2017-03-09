package com.javaweb.service;

import com.javaweb.utils.PagedResult;
import com.javaweb.views.UserView;

/**
 * 系统管理
 * 
 * @author PengChan
 *
 */
public interface ISystemManageService {

	/**
	 * 查询所有的用户
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param status
	 * @return
	 */
	PagedResult<UserView> queryAllUser(Integer pageNo, Integer pageSize, String status,String key);
}
