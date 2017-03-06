package com.javaweb.service.impl;
 
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.javaweb.dao.DaoFactory;
import com.javaweb.entity.Customer;
import com.javaweb.entity.Mainitem;
import com.javaweb.entity.Partcategory;
import com.javaweb.entity.Permission;
import com.javaweb.entity.Projcategory;
import com.javaweb.entity.Vehicle;
import com.javaweb.service.IBaseDataManageService;
import com.javaweb.utils.BeanUtil;
import com.javaweb.utils.PagedResult;
import com.javaweb.utils.StringUtils;
import com.javaweb.views.CustomerView;
import com.javaweb.views.MainItemView;

/**
 * 基础数据的服务
 * @author PengChan
 *
 */
@Service
public class BaseDataManageService implements IBaseDataManageService {

	private static final Logger logger = LoggerFactory.getLogger(BaseDataManageService.class);
	
	@Resource
	private DaoFactory daoFactory;
	
	/**
	 * 分页查询用户的信息
	 */
	@Override
	public PagedResult<CustomerView> queryPagedCustomerView(String key, String sort, String order, Integer pageNo,
			Integer pageSize) { 
		pageNo = pageNo==null?0:pageNo;
		pageSize = pageSize==null?10:pageSize;		
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(daoFactory.getCustomerMapper().selectCustomer(key, sort, order));
	}

	/**
	 * 查询用户的信息
	 */
	@Override
	public List<CustomerView> queryAllCustomer() {		
		return daoFactory.getCustomerMapper().selectCustomer(null, null, null);
	}

	/**
	 * 修改用户信息
	 */
	@Transactional
	@Override
	public boolean modifyCustomer(CustomerView customerView) {
	    boolean flag = true;
	    int i =0;
	    try {
	    	 Customer customer = daoFactory.getCustomerMapper().selectByPrimaryKey(StringUtils.getIntegerValue(customerView.getCustomerid(), -1));
	 	    if(customer!=null){
	 	    	customer.setContactadd(customerView.getContactadd());
	 	    	customer.setContactinfo(customerView.getContactinfo());
	 	    	customer.setNumbering(customerView.getCustomername());
	 	    	// 更新用户的信息
	 	    	daoFactory.getCustomerMapper().updateByPrimaryKeySelective(customer); 
	 	    	++i;
	 	    }
	 	    Vehicle vehicle = daoFactory.getVehicleMapper().selectByPrimaryKey(StringUtils.getIntegerValue(customerView.getVehicleid(), -1));
	 	    if(vehicle!=null){
	 	    	vehicle.setPlatenum(customerView.getPlatenum());
	 	    	vehicle.setInspectiondate(new SimpleDateFormat("yyyy-MM-dd").parse(customerView.getInspectiondate()));
	 	    	vehicle.setMilage(StringUtils.getDoubleValue(customerView.getMilage(), -1d));
	 	    	vehicle.setVehflag(customerView.getVehflag());
	 	    	// 更新车辆信息
	 	    	daoFactory.getVehicleMapper().updateByPrimaryKeySelective(vehicle);
	 	    	++i;
	 	    } 
		} catch (Exception e) {
			logger.info("修改用户信息失败!");
		}
		return (i==2);
	}

	/**
	 * 查询权限
	 */
	@Override
	public List<Permission> queryPermission() { 
		return daoFactory.getPermissionMapper().selectAllPermission();
	}

	/**
	 * 修改权限的状态
	 */
	@Override
	public boolean modifyPermission(Permission permission) {
		boolean flag = false;
		if(permission!=null){
			Permission perm = daoFactory.getPermissionMapper().selectByPrimaryKey(permission.getId());
			perm.setPerflag(permission.getPerflag());
			flag = daoFactory.getPermissionMapper().updateByPrimaryKeySelective(perm)>0;
		} 
		return flag;
	}

	
	 
	/**
	 * 查询所有的维修项目
	 */
	@Override
	public List<MainItemView> queryAllMainItem() { 
		return daoFactory.getMainitemMapper().selectallMainitem();
	}

	 
	@Override
	public boolean modifyMainitem(Mainitem mainitem, String type) { 
		boolean flag = false;
		if(mainitem!=null){
			try{
				if("C".equals(type)){// 添加信息					
				   flag = daoFactory.getMainitemMapper().insertSelective(mainitem)>0;
				}else if("U".equals(type)){
					flag = daoFactory.getMainitemMapper().updateByPrimaryKeySelective(mainitem)>0;
				}else if("D".equals(type)){
					Mainitem mt = daoFactory.getMainitemMapper().selectByPrimaryKey(mainitem.getId());
					if(mt!=null){
						mt.setMainflag(mainitem.getMainflag());
						flag = daoFactory.getMainitemMapper().updateByPrimaryKeySelective(mt)>0;
					}
				}
			}catch (Exception e) {
				logger.error("修改维修项目类别的信息失败!");
			}
		} 
		return flag;
	}

	/**
	 * 查询所有维修的类别
	 */
	@Override
	public List<Projcategory> queryAllProjCategory() { 
		return daoFactory.getProjcategoryMapper().selectAllCategory();
	}

	/**
	 * 修改维修项目大类
	 */
	@Override
	public boolean modifyPartCategory(Projcategory projcategory, String type) {
		boolean flag = false;
		if(projcategory!=null){
			try{
				if("C".equals(type)){// 添加信息 
				   flag = daoFactory.getProjcategoryMapper().insertSelective(projcategory)>0;
				}else if("U".equals(type)){
					flag = daoFactory.getProjcategoryMapper().updateByPrimaryKeySelective(projcategory)>0;
				}else if("D".equals(type)){
					Projcategory pg = daoFactory.getProjcategoryMapper().selectByPrimaryKey(projcategory.getId());
					if(pg!=null){
						pg.setCatflag(projcategory.getCatflag());
						flag = daoFactory.getProjcategoryMapper().updateByPrimaryKeySelective(projcategory)>0;
					}
				}
			}catch (Exception e) {
				logger.error("修改维修项目类别的信息失败!");
			}
		} 
		return flag;
	}

	 

}
