package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.mail.Flags.Flag;
import javax.persistence.criteria.Order;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.javaweb.dao.DaoFactory;
import com.javaweb.entity.Accessoryhis;
import com.javaweb.entity.Balancesheet;
import com.javaweb.entity.Customer;
import com.javaweb.entity.Customervisithis;
import com.javaweb.entity.Mainitem;
import com.javaweb.entity.Mainprojreg;
import com.javaweb.entity.Orders;
import com.javaweb.entity.Partproc;
import com.javaweb.entity.Partstorage;
import com.javaweb.entity.Partused;
import com.javaweb.entity.Personallocate;
import com.javaweb.entity.Projcategory;
import com.javaweb.entity.Qualityinspec;
import com.javaweb.entity.Vehicle;
import com.javaweb.service.IVehicleMaintence;
import com.javaweb.utils.BeanUtil;
import com.javaweb.utils.MyErrorPrinter;
import com.javaweb.utils.PagedResult;
import com.javaweb.views.CustomerVehicle;
import com.javaweb.views.EasyUITreeNode;
import com.javaweb.views.FixingViews;
import com.javaweb.views.LoginBean;
import com.javaweb.views.MainitemUsedView;
import com.javaweb.views.MaintProject;
import com.javaweb.views.OrderMaintence;
import com.javaweb.views.PartPickingView;
import com.javaweb.views.PartUsedInfo;
import com.javaweb.views.PartUsedView;
import com.javaweb.views.PartsInfo;
import com.javaweb.views.PayViews;
import com.javaweb.views.PickedPartView;
import com.javaweb.views.QualityView;
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
	public boolean newOrderList(Orders orders, List<Personallocate> personallocates, Customervisithis visithis) {
		int count = 0;
		try {
			// 1.添加接单表
			// 设置流水号
			orders.setNumbering(com.javaweb.utils.StringUtils.getCode(12));
			// 设置支付的状态和业务的状态
			orders.setBustatusid(1);
			orders.setPaystatusid(1);
			// 添加订单
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
			// 3.添加客户来访历史表
			daoFactory.getCustomervisithisMapper().insert(visithis);
			logger.info("添加用户到访历史表成功,历史表的编号为:" + visithis.getId());
			return true;
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
			return false;
		}
	}

	/**
	 * 工作人员查看自己的维修任务
	 */
	@Override
	public PagedResult<OrderMaintence> queryMaintanceOrders(String userinfoid, String keyworld, String starttime,
			String endtime, String sort, String order, String category, Integer pageNo, Integer pageSize,
			String orderstatus) {
		PagedResult<OrderMaintence> ordermaintences = null;
		try {
			// 复杂查询
			pageNo = pageNo == null ? 1 : pageNo;
			pageSize = pageSize == null ? 10 : pageSize;
			PageHelper.startPage(pageNo, pageSize);
			ordermaintences = BeanUtil.topagedResult(daoFactory.getOrdersMapper().selectOrdersMaint(userinfoid,
					keyworld, starttime, endtime, sort, order, category, orderstatus));
			return ordermaintences;
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return null;
	}

	/**
	 * 查询所有项目的类别
	 */
	@Override
	public List<Projcategory> queryAllProjCategory() {
		List<Projcategory> projcategories = null;
		try {
			projcategories = daoFactory.getProjcategoryMapper().selectAll();
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return projcategories;
	}

	/**
	 * 通过类别的编号查询所有的维修的项目
	 */
	@Override
	public List<Mainitem> queryAllMainItemByCatId(String categoryid) {
		List<Mainitem> mainitems = null;
		try {
			mainitems = daoFactory.getMainitemMapper().selectMainitembyCategory(categoryid);
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return mainitems;
	}

	/**
	 * 添加维修项目登记
	 */
	@Override
	public boolean addMainItemRecord(Mainprojreg mainprojreg) {
		if (mainprojreg == null) {
			return false;
		}
		try {
			daoFactory.getMainprojregMapper().insertSelective(mainprojreg);
			return true;
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
			return false;
		}

	}

	/**
	 * 根据订单表的编号和用户表的编号来查询汽修人员已经添加过的项目
	 */
	@Override
	public List<MaintProject> queryAllMainregedProj(String ordersid, String userid) {
		List<MaintProject> maintProjects = null;
		try {
			maintProjects = daoFactory.getMainprojregMapper().selectAllMainregedProj(ordersid, userid);
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return maintProjects;
	}

	/**
	 * 判断是否已经被质检过
	 */
	@Override
	public boolean checkhasPassed(String mainprojregid) {
		// 根据id获取到用户登记的信息查看是否已经被质检过
		Mainprojreg mainprojreg = null;
		try {
			mainprojreg = daoFactory.getMainprojregMapper()
					.selectByPrimaryKey(com.javaweb.utils.StringUtils.getIntegerValue(mainprojregid, -1));
			if (mainprojreg != null) {
				return StringUtils.equals(mainprojreg.getHaspassed() + "", "1");
			} else {
				return false;
			}
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return false;
	}

	/**
	 * 更新维修登记表
	 */
	@Override
	public boolean updateMainregRecord(Mainprojreg mainprojreg) {
		if (mainprojreg != null && mainprojreg.getId() > 0) {
			try {
				boolean flag = checkhasPassed(String.valueOf(mainprojreg.getId()));
				if (!flag) {// 如果还未曾质检
					daoFactory.getMainprojregMapper().updateByPrimaryKeySelective(mainprojreg);
					return true;
				}
			} catch (Exception e) {
				logger.error(MyErrorPrinter.getErrorStack(e));
			}
		}
		return false;
	}

	/**
	 * 删除维修登记表
	 */
	@Override
	public boolean deleteMainregRecord(Mainprojreg mainprojreg) {
		if (mainprojreg != null && mainprojreg.getId() != null) {
			try {
				boolean flag = checkhasPassed(String.valueOf(mainprojreg.getId()));
				if (!flag) {// 如果还未曾质检
					int t = daoFactory.getMainprojregMapper().deleteByPrimaryKey(mainprojreg.getId());
					return (t > 0);
				}
			} catch (Exception e) {
				logger.error(MyErrorPrinter.getErrorStack(e));
			}
		}
		return false;
	}

	/**
	 * 分页查询零件的信息
	 */
	@Override
	public PagedResult<PartsInfo> queryAllPartinfo(String partname, Integer pageNo, Integer pageSize) {
		PagedResult<PartsInfo> pagedResult = null;
		try {
			// 复杂查询
			pageNo = pageNo == null ? 1 : pageNo;
			pageSize = pageSize == null ? 10 : pageSize;
			PageHelper.startPage(pageNo, pageSize);
			pagedResult = BeanUtil.topagedResult(daoFactory.getPartMapper().selectParts(partname));
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return pagedResult;
	}

	/**
	 * 添加零件使用登记的实体
	 */
	@Override
	public boolean addPartRegtion(Partused partused) {
		boolean flag = false;
		try {
			flag = daoFactory.getPartusedMapper().insertSelective(partused) > 0;
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return flag;
	}

	/**
	 * 删除零件使用登记实体
	 */
	@Override
	public boolean removePartRegtion(Integer partusedid) {
		boolean flag = false;
		try {
			flag = daoFactory.getPartusedMapper().deleteByPrimaryKey(partusedid) > 0;
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return flag;
	}

	/**
	 * 检查是否已经领取过
	 */
	@Override
	public boolean checkIfTooked(Integer partusedid) {
		boolean flag = false;
		try {
			Partused partused = daoFactory.getPartusedMapper().selectByPrimaryKey(partusedid);
			if (partused != null && partused.getReceivednum() != null && partused.getReceivednum() > 0) {
				return true;
			}
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return false;
	}

	/**
	 * 查询已经登记过的零件信息
	 */
	@Override
	public List<PartUsedInfo> queryAllRegedPart(String ordersid, String userid) {
		List<PartUsedInfo> partUsedInfos = null;
		try {
			if (StringUtils.isNotBlank(ordersid) && StringUtils.isNotBlank(userid)) {
				partUsedInfos = daoFactory.getPartusedMapper().selectHasSelectedPart(ordersid, userid);
			}
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return partUsedInfos;
	}

	/**
	 * 分页查询用户维修领料的情况
	 */
	@Override
	public PagedResult<PartPickingView> queryPickingView(String startTime, String endTime, String keyworld,
			String searchType, Integer pageNo, Integer pageSize) {
		logger.info("service层：startTime:" + startTime + ",endTime:" + endTime + ",keyworld:" + keyworld + ",searchType:"
				+ searchType + ",pageNo:" + pageNo + ",pageSize:" + pageSize);
		PagedResult<PartPickingView> partPickingView = null;
		try {
			// 复杂查询
			pageNo = pageNo == null ? 1 : pageNo;
			pageSize = pageSize == null ? 10 : pageSize;
			PageHelper.startPage(pageNo, pageSize);
			partPickingView = BeanUtil.topagedResult(
					daoFactory.getPartusedMapper().selectPartUsed(startTime, endTime, keyworld, searchType));
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return partPickingView;
	}

	/**
	 * 查询所有领取的历史
	 */
	@Override
	public List<PickedPartView> queryPickedPartView(String partUsedId) {
		if (!StringUtils.isBlank(partUsedId)) {
			List<PickedPartView> pickedPartViews = daoFactory.getPartusedMapper().selectPickedPart(partUsedId);
			return pickedPartViews;
		}
		return null;
	}

	/**
	 * 领取材料
	 */
	@Override
	@Transactional
	public float pickPart(PartPickingView partPickingView) {
		// 获取登记的数量
		float regNum = 0f;
		// 获取已经领取的数量
		float receivedNum = 0f;
		// 当前需要领取的数量
		float needNum = 0f;
		float realNum = 0f;
		try {
			Partstorage partstorage = daoFactory.getPartstorageMapper().selectByPrimaryKey(
					com.javaweb.utils.StringUtils.getIntegerValue(partPickingView.getPartstorageid(), -1));			
			Partused partused = daoFactory.getPartusedMapper().selectByPrimaryKey(com.javaweb.utils.StringUtils.getIntegerValue(partPickingView.getPartusedid(), -1));			
			if (partstorage != null) {
				regNum = Float.parseFloat(partPickingView.getRegistedspecnum());
				receivedNum = Float.parseFloat(partPickingView.getReceivednum());
				needNum = regNum - receivedNum;
				// 先判断是否已经领取过了
				if(regNum==receivedNum){
					return -2;// 表示已经领取过了
				}
				// 如果库存量小于需求量
				if (partstorage.getInventory() < needNum) {
					// 先要判断是否已经登记采购过(判断领取状态为"-1"[已登记，-1，已经领取])
					// 如果已经登记过就不用再登记了
					if(partused!=null&&!StringUtils.equals(partused.getReceivestatus(), "-1")){
						
						// 添加采购记录
						float purchaseNum = (float) (needNum - partstorage.getInventory()); 
						Partproc partproc = new Partproc();
						// partcategoryname零件的类别名称为创建的时间(yyyy-MM-dd HH:mm:ss)
						partproc.setPartcategoryname(com.javaweb.utils.StringUtils.getCurrentTimeStr());
						partproc.setPartcategorycode(partPickingView.getCategoryid()); 
						partproc.setPartcode(partPickingView.getPartid());
						// partname为零件的名称为采购成功的时间(yyyy-MM-dd HH:mm:ss)						
						//partproc.setPartname(partPickingView.getPartname());
						partproc.setSuppliercode(partPickingView.getSupplierid());
						partproc.setSuppliername(partPickingView.getSupplierName());
						partproc.setPruchdemand((double) purchaseNum); 
						partproc.setPruchprice(Double.parseDouble(partPickingView.getPurchaseprice()));
						partproc.setTotalpurchase((double) (purchaseNum*Float.parseFloat(partPickingView.getPurchaseprice())));
						partproc.setPurchstatus("0");// 初始状态
					    daoFactory.getPartprocMapper().insertSelective(partproc);
					    
					    // 修改零件使用登记表的状态(-1标记为正在采购中)
					    partused.setReceivestatus("-1");
					    daoFactory.getPartusedMapper().updateByPrimaryKeySelective(partused);
					} 
					// 设置实际领取的数量为0
					realNum = 0;
				}else{// 如果材料足够 
					// 更新存储表
					partstorage.setInventory(partstorage.getInventory()-needNum);
					daoFactory.getPartstorageMapper().updateByPrimaryKeySelective(partstorage);
					// 添加零件领取表
				    Accessoryhis accessoryhis = new Accessoryhis();
				    accessoryhis.setRecitime(new Date());
				    accessoryhis.setReciamount((double) realNum);
				    accessoryhis.setPartusedid(Integer.parseInt(partPickingView.getPartusedid()));
				    daoFactory.getAccessoryhisMapper().insertSelective(accessoryhis);
				    // 更新零件登记表(标记为已经领取)
				    partused.setReceivednum((double) needNum);
				    partused.setReceivestatus("已领取");
				    daoFactory.getPartusedMapper().updateByPrimaryKeySelective(partused);
				    realNum = needNum;
				} 
			}
		} catch (Exception e) {
			logger.info(MyErrorPrinter.getErrorStack(e));
			realNum = -1;// -1表示异常
		}
		return realNum;// 正常返回领取的数量
	}

	
	/**
	 * 结束维修
	 */	
	@Override
	public boolean finishedFixed(Integer ordersid,String isreturn) {
	    if (ordersid!=null) {
			Orders orders = daoFactory.getOrdersMapper().selectByPrimaryKey(ordersid);
			if(orders!=null){
				if("Y".equals(isreturn)){ 
					orders.setBustatusid(1);
				}else{
					orders.setBustatusid(2);
				} 
				return (daoFactory.getOrdersMapper().updateByPrimaryKeySelective(orders)>0);
			}
		}
		return false;
	}

	/**
	 * 结束质检
	 */
	@Override
	public boolean finshedQalited(Integer ordersid) {
		if(ordersid!=null){
			Orders orders = daoFactory.getOrdersMapper().selectByPrimaryKey(ordersid);
			if(orders!=null){ 
				// 修改状态
				orders.setBustatusid(3);
				orders.setHascompleted((short) 1);  
				return (daoFactory.getOrdersMapper().updateByPrimaryKeySelective(orders)>0);
			}
		}
		return false;
	}

	
	/**
	 * 查询待质检的订单信息
	 */
	@Override
	public PagedResult<QualityView> queryNeedQuality(String keyworld, String starttime, String endTime,
			String bustatusid, String userinfoid,Integer pageNo,Integer pageSize) {
		PagedResult<QualityView> qualityViews = null;
		try {
			// 复杂查询
			pageNo = pageNo == null ? 1 : pageNo;
			pageSize = pageSize == null ? 10 : pageSize;
			PageHelper.startPage(pageNo, pageSize);
			qualityViews = BeanUtil.topagedResult(daoFactory.getQualityinspecMapper().selectZhiJian(keyworld, starttime,
					endTime, bustatusid, userinfoid));
		} catch (Exception e) {
		    logger.error("查询待质检的订单失败...");
		}
		return qualityViews;
	}

	/**
	 * 质检项目
	 */
	@Transactional
	@Override
	public boolean qualityProject(Integer fixProjid, Qualityinspec qualityinspec, Short hasPassed) {
		boolean flag = false;
		if(fixProjid!=null){  
			Mainprojreg mainprojreg = daoFactory.getMainprojregMapper().selectByPrimaryKey(fixProjid); 
			if(mainprojreg!=null){
				try {
					mainprojreg.setMainstatus((hasPassed==1)?"已质检":"质检不通过");
					mainprojreg.setHaspassed(hasPassed);
					daoFactory.getMainprojregMapper().updateByPrimaryKeySelective(mainprojreg);
					// 添加质检纪录
					daoFactory.getQualityinspecMapper().insertSelective(qualityinspec);
					flag = true;
				} catch (Exception e) {
					logger.info("质检项目失败");
				}
			}			
		} 
		return flag;
	}

	/**
	 * 更具订单的编号查询所有的待质检的项目
	 */
	@Override
	public List<FixingViews> queryAllFlexing(String ordersid) {
		List<FixingViews> fixingViews = null;
		if(StringUtils.isNotBlank(ordersid)){
			fixingViews = daoFactory.getMainprojregMapper().selectFixingItems(ordersid);
		}
		return fixingViews;
	}

	
	/**
	 * 查询所有的待结算的订单
	 */
	@Override
	public PagedResult<PayViews> queryAllPayingOrder(String keyworld, String starttime, String endtime,
			String bustatusid, String ordersid, Integer pageNo, Integer pageSize,String paystatusid) {
		PagedResult<PayViews> pagedResult = null;
		try {
			// 复杂查询
			pageNo = pageNo == null ? 1 : pageNo;
			pageSize = pageSize == null ? 10 : pageSize;
			PageHelper.startPage(pageNo, pageSize);
			pagedResult = BeanUtil.topagedResult(daoFactory.getOrdersMapper().selctMyPayOrders(
					keyworld, starttime, endtime, bustatusid, ordersid,paystatusid)); 
		} catch (Exception e) {
			logger.error("查询待结算的订单失败!");
		}
		return pagedResult;
	}

	/**
	 * 查询所有的订单中维修使用材料的情况
	 */
	@Override
	public List<PartUsedView> queryAllPartUsedView(String ordersid) { 
		List<PartUsedView> partUsedViews = null;
		try {
			partUsedViews = daoFactory.getOrdersMapper().selectAllYLList(ordersid);
		} catch (Exception e) {
			logger.error("查询所有的订单中维修使用材料的情况失败!");
		}
		return partUsedViews;
	}

	/**
	 * 查询订单中所有的维修项目的情况
	 */
	@Override
	public List<MainitemUsedView> queryAllMainitemView(String ordersid) { 
		List<MainitemUsedView> mainitemUsedViews = null;
		try {
			mainitemUsedViews = daoFactory.getOrdersMapper().selectAllWXList(ordersid);
		} catch (Exception e) {
			logger.error("查询订单中所有的维修项目的情况");
		}
		return mainitemUsedViews;
	}

	
	/**
	 * 支付订单
	 */
	@Override
	public boolean payMyOrders(String ordersid, LoginBean user, Double toalMoney) {
		boolean flag = false;
		if(StringUtils.isNotBlank(ordersid)&&toalMoney>0&&user!=null){
			try {
				Orders orders = daoFactory.getOrdersMapper().selectByPrimaryKey(Integer.parseInt(ordersid));
				if(orders!=null){
					Balancesheet balancesheet = new Balancesheet();
					balancesheet.setSettlementdate(new Date());
					balancesheet.setTotalamount(toalMoney);
					balancesheet.setOrdersid(orders.getId());
					balancesheet.setSettler(user.getUserinfoid());
					daoFactory.getBalancesheetMapper().insertSelective(balancesheet);
					// 跟新表
					orders.setHascompleted((short) 1);
					orders.setHassettled((short) 1);
					orders.setSettlecompdate(new Date());
					orders.setPaystatusid(2);// 已经支付
					orders.setBustatusid(4);// 已经提车
					daoFactory.getOrdersMapper().updateByPrimaryKeySelective(orders);
					flag=true;
				}
			} catch (Exception e) {
				logger.error("支付订单错误!");
			} 
		}
		return flag;
	}
 
	 
}
