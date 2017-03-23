package com.javaweb.service;
 
import java.util.List;

import com.javaweb.entity.Permission;
import com.javaweb.entity.Sector;
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
	 * @param userinfo		用户的信息
	 * @param type			用户的类型
	 * @return				返回用户的信息
	 */
	boolean modifyUser(UserView userView,int[] privileges,String type);
	
	/**
	 * 查询系统中所有的权限（有效权限）
	 * @return
	 */
	List<Permission> queryAllPermission();
	
	
	/**
	 * 查询所有的部门
	 * @return
	 */
	List<Sector> queryAllSectors();
	
	
	/**
	 * 查询所有用户的权限
	 * @param accountnumber
	 * @return
	 */
	List<Permission> queryAllUserPer(String accountnumber);
	
	
	/**
	 * 修改密码
	 * @param password
	 * @return
	 */
	boolean modifyPass(String password,String accountnumber);
}


