package com.javaweb.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Customer;
import com.javaweb.entity.Customervisithis;
import com.javaweb.entity.Mainitem;
import com.javaweb.entity.Mainprojreg;
import com.javaweb.entity.Orders;
import com.javaweb.entity.Personallocate;
import com.javaweb.entity.Projcategory;
import com.javaweb.entity.Vehicle;
import com.javaweb.utils.PagedResult;
import com.javaweb.views.CustomerVehicle;
import com.javaweb.views.EasyUITreeNode;
import com.javaweb.views.MaintProject;
import com.javaweb.views.OrderMaintence;

/**
 * 汽车维修服务
 * 
 * @author cp
 *
 */
public interface IVehicleMaintence {

	/**
	 * 通过关键字查询用户和车辆的信息
	 * 
	 * @param keyworld
	 *            关键字
	 * @return 返回所有的用户和车辆的信息
	 */
	List<CustomerVehicle> queryUserVehiByKeyWorld(String keyworld);

	/**
	 * 通过关键字查询用户的信息
	 * 
	 * @param keyworld
	 *            关键字
	 * @return 用户的信息
	 */
	List<Customer> queryCustomerByKey(String keyworld);

	/**
	 * 添加用户的信息和汽车的信息
	 * 
	 * @param customer
	 *            用户的实体类
	 * @param vehicle
	 *            交通工具的实体类
	 * @return 插入数据库的结果
	 */
	boolean addUserVehicleInfo(Customer customer, Vehicle vehicle);

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
	PagedResult<CustomerVehicle> queryUserVehicelByPage(String keyworld, Integer pageNo, Integer pageSize);

	/**
	 * 获取所有的维修的大类
	 * 
	 * @return
	 */
	List<Projcategory> queryProjCategory();

	/**
	 * 获取easyui的树形目录
	 */
	List<EasyUITreeNode> queryUserSectorInEUI();

	/**
	 * 接单操作
	 * 
	 * @param orders
	 *            订单信息
	 * @param personallocates
	 *            人员分配信息
	 * @param customervisithis
	 *            来访的历史表
	 * @return
	 */
	boolean newOrderList(Orders orders, List<Personallocate> personallocates, Customervisithis customervisithis);

	/**
	 * 工作人员查看自己的任务
	 * @param userinfoid		用户信息的编号		
	 * @param keyworld			关键字
	 * @param starttime			开始时间
	 * @param endtime			结束时间
	 * @param sort				排序的字段
	 * @param order				排序的方式
	 * @param category			任务的类别
	 * @param pageNo			页数
	 * @param pageSize			页面的大小
	 * @param orderstatus 		订单的状态
	 * @return
	 */
	PagedResult<OrderMaintence> queryMaintanceOrders(String userinfoid, String keyworld, String starttime, String endtime,
			String sort, String order,String category,Integer pageNo,Integer pageSize,String orderstatus);
	
	/**
	 * 查询所有项目的类别
	 * @return
	 */
	List<Projcategory> queryAllProjCategory();
	
	/**
	 * 根据项目的大类别查询所有的项目
	 * @param categoryid	类别的编号
	 * @return				项目大类返回的所有的项目
	 */
	List<Mainitem> queryAllMainItemByCatId(String categoryid);
	
	/**
	 * 添加维修项目记录
	 * @param mainprojreg	维修项目
	 * @return				返回添加维修项目之后的结果(true?false)
	 */
	boolean addMainItemRecord(Mainprojreg mainprojreg);
	
	/**
	 * 根据订单表的编号来查询汽修人员已经添加过的项目
	 * @param ordersid		订单表的编号
	 * @param userid		登记人的userinfo表的id
	 * @return				汽修人员已经添加过的项目
	 */
	List<MaintProject> queryAllMainregedProj(String ordersid,String userid);
	
	/**
	 * 根据维修项目的编号查询该维修项目是否已经被审核通过
	 * @param mainprojregid	维修项目登记表的编号
	 * @return				该登记是佛已经被质检过(如果被质检过则不能对其进行修改或者删除)
	 */
	boolean checkhasPassed(String mainprojregid);
	
	/**
	 * 修改维修项目登记表
	 * @param mainprojreg	维修项目登记实体类
	 * @return				返回操作的结果
	 */
	boolean updateMainregRecord(Mainprojreg mainprojreg);
	
	/**
	 * 删除已经登记的维修项目
	 * @param mainprojreg	维修项目登记
	 * @return				返回是否已经别成功删除
	 */
	boolean deleteMainregRecord(Mainprojreg mainprojreg);
}
