package com.javaweb.service;

import com.javaweb.entity.Userinfo;
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
	
	/**
	 * 修改用户信息(添加，修改，删除)
	 * @param userinfo
	 * @param type
	 * @return
	 */
	boolean modifyUser(UserView userView,int[] privileges,String type);
}
