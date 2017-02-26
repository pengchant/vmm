package com.javaweb.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Customer;
import com.javaweb.entity.Customervisithis;
import com.javaweb.entity.Mainitem;
import com.javaweb.entity.Mainprojreg;
import com.javaweb.entity.Orders;
import com.javaweb.entity.Partused;
import com.javaweb.entity.Personallocate;
import com.javaweb.entity.Projcategory;
import com.javaweb.entity.Qualityinspec;
import com.javaweb.entity.Vehicle;
import com.javaweb.utils.PagedResult;
import com.javaweb.views.CustomerVehicle;
import com.javaweb.views.EasyUITreeNode;
import com.javaweb.views.FixingViews;
import com.javaweb.views.LoginBean;
import com.javaweb.views.MaintProject;
import com.javaweb.views.OrderMaintence;
import com.javaweb.views.PartPickingView;
import com.javaweb.views.PartUsedInfo;
import com.javaweb.views.PartsInfo;
import com.javaweb.views.PickedPartView;
import com.javaweb.views.QualityView;

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
	
	/**
	 * 分页查询所有的零件的信息
	 * @param parname		维修零件的信息
	 * @param pageNo 		当前页数
	 * @param pageSize 		页面的大小
	 * @return				零件的信息列表
	 */
	PagedResult<PartsInfo> queryAllPartinfo(String parname,Integer pageNo,Integer pageSize);
	
	
	/**
	 * 添加零件使用登记
	 * @param partused		零件使用登记实体
	 * @return				零件使用登记实体的结果
	 */
	boolean addPartRegtion(Partused partused);
	
	/**
	 * 根据零件使用登记的编号来删除零件使用登记
	 * @param partusedid	零件使用登记表的编号
	 * @return				操作的结果
	 */
	boolean removePartRegtion(Integer partusedid);
	
	/**
	 * 检查是否已经领取过
	 * @param partusedid	零件使用登记表的编号
	 * @return				操作的结果
	 */
	boolean checkIfTooked(Integer partusedid);
	
	/**
	 * 查询用户已经登记过的信息
	 * @param ordersid		订单的编号
	 * @param userid		用户的编号
	 * @return				用户已经登记过零件的信息
	 */
	List<PartUsedInfo> queryAllRegedPart(String ordersid,String userid);
	
	/**
	 * 分页查询用户维修领料的数据
	 * @param startTime		开始的时间
	 * @param endTime		结束的时间
	 * @param keyworld		关键字(用户的工号和姓名)
	 * @param searchType	查询的方式(Y:已经领取的，W:未曾领取的)
	 * @param pageNo 		页号
	 * @param pageSize		页面数据量的大小
	 * @return
	 */
	PagedResult<PartPickingView> queryPickingView(String startTime,String endTime,String keyworld,String searchType,Integer pageNo,Integer pageSize);
	
	/**
	 * 查询已经领取的的零件的视图
	 * @param partUsedId	零件使用表的编号
	 * @return
	 */
	List<PickedPartView> queryPickedPartView(String partUsedId);
	
	/**
	 * 领取材料
	 * @param PartPickingView
	 * @return
	 */
	float pickPart(PartPickingView partPickingView);
	
	/**
	 * 维修完毕
	 */
	boolean finishedFixed(Integer ordersid);
	
	/**
	 * 质检完毕
	 */
	boolean finshedQalited(Integer ordersid);
	
	/**
	 * 查询待质检的数据
	 * @param keyworld			关键字段
	 * @param starttime			开始时间
	 * @param endTime			结束时间
	 * @param bustatusid		业务的状态
	 * @param userinfoid		用户信息的编号
	 * @return
	 */
	PagedResult<QualityView> queryNeedQuality(
			String keyworld,
			String starttime,
			String endTime,
			String bustatusid,
			String userinfoid,
			Integer pageNo,
			Integer pageSize);
	
	/**
	 * 项目质检
	 * @param fixProjid			质检项目的编号
	 * @param qualityinspec		质检的详情
	 * @param hasPassed			是否通过？1：表示通过,0:表示未通过
	 * @return
	 */
	boolean qualityProject(Integer fixProjid,Qualityinspec qualityinspec,Short hasPassed);
	
	/**
	 * 查询订单下所有的待审核的内容
	 * @param ordersid
	 * @return
	 */
	List<FixingViews> queryAllFlexing(String ordersid);
}
