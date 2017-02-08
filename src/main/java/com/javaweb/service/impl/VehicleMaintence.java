package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.javaweb.dao.DaoFactory;
import com.javaweb.entity.Customer;
import com.javaweb.entity.Orders;
import com.javaweb.entity.Personallocate;
import com.javaweb.entity.Projcategory;
import com.javaweb.entity.Vehicle;
import com.javaweb.service.IVehicleMaintence;
import com.javaweb.utils.BeanUtil;
import com.javaweb.utils.MyErrorPrinter;
import com.javaweb.utils.PagedResult;
import com.javaweb.views.CustomerVehicle;
import com.javaweb.views.EasyUITreeNode;
import com.javaweb.views.UserSector;
import com.sun.star.lib.uno.environments.remote.remote_environment;

/**
 * 汽车维系的服务
 * 
 * @author cp
 *
 */
@Service
public class VehicleMaintence implements IVehicleMaintence {

	private static final Logger logger = LoggerFactory.getLogger(VehicleMaintence.class);

	@Resource
	private DaoFactory daoFactory;

	/**
	 * 关键字查询用户的信息和汽车的信息
	 */
	@Override
	public List<CustomerVehicle> queryUserVehiByKeyWorld(String keyworld) {
		List<CustomerVehicle> customerVehicles = null;
		try {
			customerVehicles = daoFactory.getVehicleMapper().selectVehicleByKey(keyworld);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		return customerVehicles;
	}

	/**
	 * 关键字模糊查询用户的信息
	 */
	@Override
	public List<Customer> queryCustomerByKey(String keyworld) {
		List<Customer> customers = null;
		try {
			customers = daoFactory.getCustomerMapper().selectCustomerByKey(keyworld);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		return customers;
	}

	/**
	 * 添加用户和车辆的信息
	 */
	@Override
	public boolean addUserVehicleInfo(Customer customer, Vehicle vehicle) {
		boolean flag = false;
		if (vehicle != null && customer != null) {
			try {
				// 先判断是否是新用户
				// 如果是老用户
				if (customer.getId() != null
						&& daoFactory.getCustomerMapper().selectByPrimaryKey(customer.getId()) != null) {
					// 添加汽车信息
					vehicle.setCustomerid(customer.getId());
				} else {// 如果是新用户
					daoFactory.getCustomerMapper().insert(customer);
					logger.info("获取到用户的编号为:" + customer.getId());
					vehicle.setCustomerid(customer.getId());
				}
				daoFactory.getVehicleMapper().insert(vehicle);
				flag = true;
			} catch (Exception e) {
				logger.error(e.toString());

			}
		}
		return flag;
	}

	/**
	 * 分页查询用户和车辆的信息
	 * 
	 * @param keyworld
	 *            关键字
	 * @param pageNo
	 *            页数
	 * @param pageSize
	 *            分页的大小
	 * @return 返回分页后的数据
	 */
	@Override
	public PagedResult<CustomerVehicle> queryUserVehicelByPage(String keyworld, Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(daoFactory.getVehicleMapper().selectVehicleByKey(keyworld));
	}

	/**
	 * 获取所有的维修的大类
	 * 
	 * @return
	 */
	@Override
	public List<Projcategory> queryProjCategory() {
		try {
			return daoFactory.getProjcategoryMapper().selectAll();
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
			return null;
		}
	}

	/**
	 * 获取easyui的用户和部门的树形目录
	 */
	@Override
	public List<EasyUITreeNode> queryUserSectorInEUI() {
		// 1.获取所有的用户以及部门的数据
		List<UserSector> userSectors = daoFactory.getUserinfoMapper().selectAllUserByDep();
		// 定义set集合用于记录已经添加过的部门
		Set<String> addedSector = new HashSet<String>();
		if (userSectors != null) {
			// 2.定义结果集
			List<EasyUITreeNode> easyUITreeNodes = new ArrayList<>();
			// 3.解析数据
			for (UserSector dept : userSectors) {
				boolean hasAdded = addedSector.contains(dept.getSectorid());
				// 判断是否已经添加过,如果没有添加
				if (!hasAdded) {
					// 部门的大类
					EasyUITreeNode sectorNode = new EasyUITreeNode(dept.getSectorid(), dept.getDeptname(),
							"icon-tag_orange", "open", false, null, null);
					// 4.获取部门下所有的员工
					for (UserSector user : userSectors) {
						// 判断部门的编号是否与用户的部门编号相同
						boolean isEqual = StringUtils.equals(dept.getSectorid(), user.getSectorid());
						if (isEqual) {
							// 5.把匹配到的添加到当前easyui父节点下
							EasyUITreeNode userNode = new EasyUITreeNode(user.getUserid(), user.getUsername(),
									"icon-user", null, false, null, null);
							// 添加属性
							userNode.pushAttributes("jobnumber", user.getJobnumber());
							userNode.pushAttributes("concatinfo", user.getConcatinfo());
							sectorNode.pushChildrenNode(userNode);
						}
					}
					// 6.最后把所有部门的节点添加到easyuiTreeNodes中
					easyUITreeNodes.add(sectorNode);
					// 添加到已经添加过的历史记录中
					addedSector.add(dept.getSectorid());
				}
			}
			logger.info("获取到所有的用户的信息为-->" + JSON.toJSONString(easyUITreeNodes));
			return easyUITreeNodes;
		}
		return null;
	}

	/**
	 * 接单操作
	 */
	@Override
	@Transactional
	public boolean newOrderList(Orders orders, List<Personallocate> personallocates) {
		int count = 0;
		try {
			// 1.添加接单表
			daoFactory.getOrdersMapper().insert(orders);
			logger.info("添加订单表成功，订单表的编号为:" + orders.getId());
			// 2.添加人员分配表
			for (Personallocate allocate : personallocates) {
				allocate.setOrdersid(orders.getId());
				allocate.setAllocatetime(new Date());
				daoFactory.getPersonallocateMapper().insert(allocate);
				count++;
			}
			logger.info("添加订单维修人员和质检人员完毕，一共添加了:" + count + "条记录.");
			return true;
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
			return false;
		}
	}

}
