package com.javaweb.service;
 

import com.javaweb.entity.Account;
import com.javaweb.views.LoginBean;

/**
 * 用户的验证接口
 * @author cp
 *
 */
public interface IUserValidateService {
	
	/**
	 * 用户消息是否合法
	 * @param account
	 * @return
	 */
	LoginBean userislawable(Account account);
	 
	/**
	 * 查询用户所有的权限
	 * @param account
	 * @return
	 */
	com.javaweb.views.AccrodingPanel queryUserPrivleges(Account account);
}
