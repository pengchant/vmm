package com.javaweb.service.impl;
 

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.javaweb.dao.DaoFactory;
import com.javaweb.service.ISystemManageService;
import com.javaweb.utils.BeanUtil;
import com.javaweb.utils.PagedResult;
import com.javaweb.views.UserView;

@Service
public class SystemManageService implements ISystemManageService {

	private static final Logger logger = LoggerFactory.getLogger(SystemManageService.class);
	
	@Resource
	private DaoFactory daoFactory;
	
	/**
	 * 查询所有的用户
	 */
	@Override
	public PagedResult<UserView> queryAllUser(Integer pageNo, Integer pageSize, String status,String key) {
		pageNo = pageNo==null?0:pageNo;
		pageSize = pageSize==null?10:pageSize;
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(daoFactory.getUserinfoMapper().selectAllUsers(status,key));
	}

}
