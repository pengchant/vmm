package com.javaweb.service.impl;
 

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.javaweb.dao.DaoFactory;
import com.javaweb.entity.Account;
import com.javaweb.entity.Permission;
import com.javaweb.entity.Sector;
import com.javaweb.entity.Userinfo;
import com.javaweb.entity.Userrights;
import com.javaweb.service.ISystemManageService;
import com.javaweb.utils.BeanUtil;
import com.javaweb.utils.PagedResult;
import com.javaweb.utils.StringUtils;
import com.javaweb.views.UserView;

/**
 * 系统基础数据服务的service
 * @author cp
 *
 */
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

	/**
	 * 修改用户操作
	 */
	@Transactional
	@Override
	public boolean modifyUser(UserView userView,int[] privileges, String type) { 
		boolean flag = false;
		logger.info("获取到的userview.userinfoid:"+userView.getUserinfoid());
		try {
			if("c".equals(type)){// 创建
				// 1.添加用户信息
				Userinfo userinfo = new Userinfo();   
				userinfo.setUsername(userView.getUsername());
				userinfo.setJobnumber(userView.getJobnumber());
				userinfo.setConcatinfo(userView.getConcatinfo());
				userinfo.setAddress(userView.getAddress());
				userinfo.setEntrytime(StringUtils.getDateFromStr(userView.getEntrytime()));
				userinfo.setUserflag("1");
				userinfo.setSectorid(StringUtils.getIntegerValue(userView.getSectorid(), -1));			
				daoFactory.getUserinfoMapper().insertSelective(userinfo);
				// 2.添加账户信息
				Account account = new Account(); 
				account.setPasswords("000000");// 初始密码六个0
				account.setAccountnumber(userView.getAccountnumber());
				account.setAccountflag("1");
				logger.info("====================================>用户信息表的编号:"+userinfo.getId());
				account.setUserinfoid(userinfo.getId());				
				daoFactory.getAccontMapper().insertSelective(account);
				// 3.添加权限
				if(privileges!=null){
					for(int i = 0;i<privileges.length;i++){
						// 新建用户权限实体
						Userrights userrights = new Userrights();
						userrights.setAccountid(account.getId());
						userrights.setPermissionid(privileges[i]);
						daoFactory.getUserrightsMapper().insertSelective(userrights);
					}
				}
				flag = true;
			}else if("u".equals(type)){// 修改
				// 用户信息
				Userinfo userinfo = new Userinfo();   
				userinfo.setId(StringUtils.getIntegerValue(userView.getUserinfoid(), -1));
				userinfo.setUsername(userView.getUsername());
				userinfo.setJobnumber(userView.getJobnumber());
				userinfo.setConcatinfo(userView.getConcatinfo());
				userinfo.setAddress(userView.getAddress());
				userinfo.setEntrytime(StringUtils.getDateFromStr(userView.getEntrytime()));
				userinfo.setUserflag(userView.getUserflag());
				userinfo.setSectorid(StringUtils.getIntegerValue(userView.getSectorid(), -1));		
				flag = daoFactory.getUserinfoMapper().updateByPrimaryKey(userinfo)>0;
				
				logger.info("===================================>修改用户信息:"+flag);
				
				// 账号信息
				Account account = new Account();   
				account.setId(Integer.parseInt(userView.getAccountid()));
				account.setAccountnumber(userView.getAccountnumber()); 
				account.setUserinfoid(userinfo.getId());
				flag = daoFactory.getAccontMapper().updateByPrimaryKeySelective(account)>0;
				
				
				logger.info("===================================>修改账户信息:"+flag);
				
				// 更新权限信息
				flag = daoFactory.getUserinfoMapper().delUserRights(account.getId( )+"")>0;
				
				logger.info("===================================>删除所有权限信息:"+flag);
				
				// 添加权限信息
				if(privileges!=null){
					for(int i = 0;i<privileges.length;i++){
						Userrights userrights = new Userrights();
						userrights.setAccountid(account.getId());
						userrights.setPermissionid(privileges[i]);
						flag = daoFactory.getUserrightsMapper().insertSelective(userrights)>0;
						logger.info("===================================>修改账户信息:"+flag);
					}
				}
				flag = true;
			}else if("d".equals(type)){// 删除
				// 跟新用户标记
				daoFactory.getUserinfoMapper().modifyUser(userView.getUserinfoid(),userView.getUserflag());
				logger.info("============================>删除用户成功!,userinfoid={}",userView.getUserinfoid());
				flag = true;
			}
		} catch (Exception e) {
			logger.error("====>用户信息操作有误!");
			flag = false;
		}
		return flag;
	}

	
	/**
	 * 查询所有合法的权限
	 */
	@Override
	public List<Permission> queryAllPermission() {		
		return daoFactory.getPermissionMapper().selectAllPermissions();
	}

	
	/**
	 * 查询所有的部门
	 */
	@Override
	public List<Sector> queryAllSectors() {		
		return daoFactory.getSectorMapper().selectAllSector();
	}

	
	/**
	 * 查询所有的用户的权限
	 */
	@Override
	public List<Permission> queryAllUserPer(String accountnumber) {		
		return daoFactory.getPermissionMapper().getAllUserPermission(accountnumber);
	}

	/**
	 * 修改密码
	 */
	@Override
	public boolean modifyPass(String password,String accountnumber) {
		boolean flag = false;
		try {
			Account account = daoFactory.getAccontMapper().selectByAccountNum(accountnumber);
			account.setPasswords(password);
			flag = daoFactory.getAccontMapper().updateByPrimaryKeySelective(account) > 0;
		} catch (Exception e) {
			logger.info("成功修改密码!");
		}
		return flag;
	}
 
}
