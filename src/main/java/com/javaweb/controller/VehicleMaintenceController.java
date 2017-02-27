package com.javaweb.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.Null;
import javax.xml.registry.infomodel.ServiceBinding;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.javaweb.entity.Customer;
import com.javaweb.entity.Customervisithis;
import com.javaweb.entity.Mainitem;
import com.javaweb.entity.Mainprojreg;
import com.javaweb.entity.Partused;
import com.javaweb.entity.Projcategory;
import com.javaweb.entity.Qualityinspec;
import com.javaweb.entity.Vehicle;
import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;
import com.javaweb.utils.MyErrorPrinter;
import com.javaweb.utils.MyWebUtils;
import com.javaweb.utils.PagedResult;
import com.javaweb.utils.StringUtils;
import com.javaweb.views.CustomerVehicle;
import com.javaweb.views.EasyUITreeNode;
import com.javaweb.views.LoginBean;
import com.javaweb.views.MaintProject;
import com.javaweb.views.OrderList;
import com.javaweb.views.OrderMaintence;
import com.javaweb.views.PartPickingView;
import com.javaweb.views.PartUsedInfo;
import com.javaweb.views.PartsInfo;
import com.javaweb.views.PickedPartView;
import com.javaweb.views.QualityView;

/**
 * 汽车修理模块控制器
 * 
 * @author cp
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/vehicle")
public class VehicleMaintenceController extends BaseController {

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	private static final Logger logger = LoggerFactory.getLogger(VehicleMaintenceController.class);

	@Autowired
	private ServiceFactory serviceFactory;

	/**
	 * 根据关键字查询用户和车辆的信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getUserVehBykey")
	@ResponseBody
	public String queryCustomAndVehByKey(HttpServletRequest request, Model model) {
		String qString = request.getParameter("q") != null ? request.getParameter("q").toString() : "";
		List<CustomerVehicle> customerVehicles = serviceFactory.getVehicleMaintence().queryUserVehiByKeyWorld(qString);
		logger.info("查询到所有的用户信息为:-->" + JSON.toJSONString(customerVehicles));
		return JSON.toJSONString(customerVehicles);
	}

	/**
	 * 根据关键字查询用户的信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getCustomerBykey")
	@ResponseBody
	public String queryCustomerByKey(HttpServletRequest request, Model model) {
		String qString = request.getParameter("q") != null ? request.getParameter("q").toString() : "";
		List<Customer> customers = serviceFactory.getVehicleMaintence().queryCustomerByKey(qString);
		return JSON.toJSONString(customers);
	}

	/**
	 * 添加用户
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addUser")
	@ResponseBody
	public String addUserInfo(HttpServletRequest request, CustomerVehicle customerVehicle) {
		logger.info("用户：" + JSON.toJSONString(customerVehicle));
		if (customerVehicle != null) {
			// 封装值
			try {
				Customer customer = new Customer();
				Vehicle vehicle = new Vehicle();
				// 用户的信息
				int customerid = org.apache.commons.lang.StringUtils.isBlank(customerVehicle.getCustomerid()) ? -1
						: Integer.valueOf(customerVehicle.getCustomerid());
				customer.setId(customerid);
				customer.setNumbering(customerVehicle.getNumbering());
				customer.setMailbox(customerVehicle.getMailbox());
				customer.setContactinfo(customerVehicle.getContactinfo());
				customer.setContactadd(customerVehicle.getContactadd());
				customer.setIdcard(customerVehicle.getIdcard());
				customer.setCustomerflag("1");// 默认为1
				// 车辆的信息
				vehicle.setCustomerid(customerid);
				vehicle.setVehname(customerVehicle.getVehname());
				vehicle.setCarmodel(customerVehicle.getCarmodel());
				vehicle.setInspectiondate(
						new SimpleDateFormat("yyyy-MM-dd").parse(customerVehicle.getInspectiondate()));
				vehicle.setMilage(StringUtils.getDoubleValue(customerVehicle.getMilage(), 0));
				vehicle.setPlatenum(customerVehicle.getPlatenum());
				vehicle.setVehflag(customerVehicle.getVehflag());
				// 插入到数据库中
				boolean flag = serviceFactory.getVehicleMaintence().addUserVehicleInfo(customer, vehicle);
				logger.info("用户的编号-->" + customer.getId(), "汽车的编号-->" + vehicle.getId());

				// 将插入到数据库中的数据返回给前台
				customerVehicle.setCustomerid(String.valueOf(customer.getId()));
				customerVehicle.setVehicleid(String.valueOf(vehicle.getId()));

				logger.info("添加用户及其车辆信息是否成功?" + flag);
				// 返回插入的结果，如果成功，就返回插入成功之后的数据
				return flag ? responseSuccess(customerVehicle, "添加用户" + customerVehicle.getNumbering() + "信息成功")
						: responseFail("添加用户" + customerVehicle.getNumbering() + "信息失败");
			} catch (Exception e) {
				logger.error(MyErrorPrinter.getErrorStack(e));
			}
		}
		return responseFail("添加用户" + customerVehicle.getNumbering() + "异常!");
	}

	/**
	 * 分页查询用户和车辆的信息
	 * 
	 * @param request
	 * @param model
	 * @param key
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/getUserAndVehBykeyPg")
	@ResponseBody
	public String queryCusAndVehByKeyPaged(HttpServletRequest request, Model model,
			@RequestParam(value = "keyWorld", defaultValue = "") String key,
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "10") Integer rows) {
		return responseSuccess(serviceFactory.getVehicleMaintence().queryUserVehicelByPage(key, page, rows));
	}

	/**
	 * 查询所有的维修大类
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getAllMainCategory")
	@ResponseBody
	public String queryMainProjCat(HttpServletRequest request, Model model) {
		List<Projcategory> projcategories = serviceFactory.getVehicleMaintence().queryProjCategory();
		return (projcategories == null) ? responseFail("对不起暂时未曾查询到保修类别，请稍后重试") : responseArraySuccess(projcategories);
	}

	/**
	 * 查询所有的用户信息
	 * 
	 * @return
	 */
	@RequestMapping("/getAllUserDept")
	@ResponseBody
	public String queryAllUser() {
		List<EasyUITreeNode> easyUITreeNodes = serviceFactory.getVehicleMaintence().queryUserSectorInEUI();
		if (easyUITreeNodes != null) {
			return JSON.toJSONString(easyUITreeNodes);
		}
		return responseFail("加载用户失败!");
	}

	/**
	 * 接单操作
	 * 
	 * @param request
	 * @param orderList
	 * @return
	 */
	@RequestMapping(value = "/receptOrder", method = RequestMethod.POST)
	@ResponseBody
	public String receptOrders(OrderList orderList) {
		logger.info("获取到的订单的信息为:" + JSON.toJSONString(orderList));
		boolean flag = false;
		if (orderList != null && orderList.getOrders() != null && orderList.getPersonallocates() != null) {
			try {
				// 定义用户来访实体
				Customervisithis customervisithis = new Customervisithis();
				customervisithis.setCustomername(orderList.getCustomername());
				customervisithis.setContactinfo(orderList.getCustomerphone());
				customervisithis.setVisittime(new Date());
				customervisithis.setServicecontent(orderList.getOrders().getWarrcontent());
				customervisithis.setIsnew(Short.valueOf(String.valueOf(orderList.getIsNew())));
				customervisithis.setCustomer(orderList.getOrders().getCustomerid());

				flag = serviceFactory.getVehicleMaintence().newOrderList(orderList.getOrders(),
						orderList.getPersonallocates(), customervisithis);
			} catch (Exception e) {
				flag = false;
				logger.error(MyErrorPrinter.getErrorStack(e));
			}
			return flag ? responseSuccess(null, "添加用户信息成功!") : responseFail("添加订单失败!");
		}
		return responseFail("添加订单失败!");
	}

	/**
	 * 工作人员查看自己的维修任务
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/getTasks")
	@ResponseBody
	public String queryAllTasks(HttpServletRequest request) {
		try {
			String userinfoid;// 用户信息的编号
			String keyworld = request.getParameter("keyworld");// 关键字
			String startTime = request.getParameter("startTime");// 开始时间
			String endTime = request.getParameter("endTime");// 结束时间
			String sort = request.getParameter("sort");// 排序字段
			String order = request.getParameter("order");// 排序方式
			String category = request.getParameter("category");// 类别
			String pageNo = request.getParameter("page");// 页数
			String pageSize = request.getParameter("rows");// 页面大小
			String orderstatus = request.getParameter("orderstatus");// 订单的状态
			orderstatus = orderstatus!=null?orderstatus:"1";// 任务状态默认为未曾完成的维修单
			LoginBean user = (LoginBean) request.getSession().getAttribute("user");
			if (user == null) {
				return responseFail("用户登录失效，请重新登录");
			}
			userinfoid = user.getUserinfoid();
			PagedResult<OrderMaintence> pagedResult = serviceFactory.getVehicleMaintence().queryMaintanceOrders(
					userinfoid, keyworld, startTime, endTime, sort, order, category,
					StringUtils.getIntegerValue(pageNo, 1), StringUtils.getIntegerValue(pageSize, 10),orderstatus);
			if (pagedResult == null) {
				return responseFail("系统暂时无法提供查询，请稍后重试");
			} else {
				return responseSuccess(pagedResult);
			}
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return responseFail("获取任务失败!");
	}
	
	/**
	 * 维修项目登记管理功能  			路径变量operation:addMP(添加),modMP(修改),delMP(删除),queMP(查询),
	 * 							isvad(是否已经质检过)
	 * 							gtCT（获取维修的大类）,getIM(根据维修项目大类下查询维修项目)
	 * @param request			request请求对象
	 * @param maintProject		维修项目实体 
	 * @return					操作后的json字符串
	 */
	@RequestMapping("/mainprojrecord/{operation}")
	@ResponseBody
	public String addMaintRegRecord(HttpServletRequest request,Mainprojreg maintProject,@PathVariable("operation")String operation){
		boolean flag = false;
		String failStr = "暂时无法提供服务，请稍后重试!";
		try {
			if(org.apache.commons.lang.StringUtils.equals(operation, "addMP")){
				// 添加
				short haspassed = 0;
				maintProject.setHaspassed(haspassed);
				maintProject.setMainstatus("已登记");
				LoginBean loginBean = (LoginBean) request.getSession().getAttribute("user");
				maintProject.setRegperson(loginBean.getUserinfoid());
				maintProject.setRegtime(new Date()); 
				flag = serviceFactory.getVehicleMaintence().addMainItemRecord(maintProject);
				return flag?responseSuccess(null, "添加成功!"):responseFail(failStr);
			}else if(org.apache.commons.lang.StringUtils.equals(operation, "modMP")){
				// 修改
				flag = serviceFactory.getVehicleMaintence().checkhasPassed(maintProject.getId()+"");
				if(flag){
					return responseFail("对不起改维修项目已经通过质检,您不能修改!"); 
				}else{
					flag = serviceFactory.getVehicleMaintence().updateMainregRecord(maintProject);
					return flag?responseSuccess(null, "修改成功!"):responseFail(failStr);
				} 
			}else if(org.apache.commons.lang.StringUtils.equals(operation, "delMP")){
				// 删除
				flag = serviceFactory.getVehicleMaintence().checkhasPassed(maintProject.getId()+"");
				if(flag){
					return responseFail("对不起改维修项目已经通过质检,您不能删除!");
				}else{
					flag = serviceFactory.getVehicleMaintence().deleteMainregRecord(maintProject);
					return flag?responseSuccess(null,"删除成功!"):responseFail(failStr);	
				} 	
			}else if(org.apache.commons.lang.StringUtils.equals(operation, "queMP")){
				// 查询
				String ordersid = request.getParameter("ordersid");
				LoginBean loginBean = (LoginBean) request.getSession().getAttribute("user");
				maintProject.setRegperson(loginBean.getUserinfoid());
				List<MaintProject> maintProjects = serviceFactory.getVehicleMaintence().queryAllMainregedProj(ordersid, maintProject.getRegperson());
				return responseArraySuccess(maintProjects);
			} else if(org.apache.commons.lang.StringUtils.equals(operation, "isvad")){
				// 是否已经质检过
				flag = serviceFactory.getVehicleMaintence().checkhasPassed(maintProject.getId()+"");
				return responseSuccess(flag);
			}else if(org.apache.commons.lang.StringUtils.equals(operation, "gtCT")){
				// 查询所有大类
				List<Projcategory> projcategories = serviceFactory.getVehicleMaintence().queryAllProjCategory();
				return responseArraySuccess(projcategories);
			}else if(org.apache.commons.lang.StringUtils.equals(operation, "getIM")){
				// 查询大类下的所有的子类
				String q = request.getParameter("q");
				List<Mainitem> mainitems = serviceFactory.getVehicleMaintence().queryAllMainItemByCatId(q);
				return responseArraySuccess(mainitems);
			}
		} catch (Exception e) {
			logger.error(MyErrorPrinter.getErrorStack(e));
		}
		return responseFail("暂不提供该服务，请稍后重试!");
	}
	
	/**
	 * 查询所有的零件
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryAllParts")
	@ResponseBody
	public String queryAllParts(HttpServletRequest request){
		String pageNo = request.getParameter("page");
		String pageSize = request.getParameter("rows");
		Integer pageNoer = StringUtils.getIntegerValue(pageNo, 1);
		Integer pageSizer = StringUtils.getIntegerValue(pageSize, 10);
		String q = request.getParameter("q");	
		PagedResult<PartsInfo> pagedResult = serviceFactory.getVehicleMaintence().queryAllPartinfo(q, pageNoer, pageSizer);		 
		return pagedResult!=null?responseSuccess(pagedResult):responseFail("对不起暂时不提供服务，稍后重试!");
	}
	
	/**
	 * 添加零件使用登记	operation:pmAD添加零件使用登记，pmRM:删除零件使用登记,pmQU:查询已经添加的零件
	 * @param request
	 * @return
	 */
	@RequestMapping("/partsMana/{operation}")
	@ResponseBody
	public String partsManage(HttpServletRequest request,Partused partused,@PathVariable("operation")String operation){ 
		if("pmAD".equals(operation)){
			// 添加零件使用登记
			LoginBean user = MyWebUtils.getCurrentUser(request);
			if(user!=null){
				boolean flag = false;
				partused.setApplicant(user.getUsername());
				partused.setJobnumber(user.getJobnumber());
				// concatinfo 为userinfoid
				partused.setConcatinfo(user.getUserinfoid());
				partused.setApplicattime(new Date());
				partused.setReceivednum(0d);
				partused.setReceivestatus("已登记");
				flag = serviceFactory.getVehicleMaintence().addPartRegtion(partused);
				return flag?responseSuccess(null,"添加成功!"):responseFail("添加失败，请稍后重试!");
			}else{
				return responseFail("对不起，您的登录已经过期，请重新登录!");
			}
		}else if("pmRM".equals(operation)){
			String partusedid = request.getParameter("partuseid");
			// 删除零件使用登记 
			boolean flag = serviceFactory.getVehicleMaintence().checkIfTooked(StringUtils.getIntegerValue(partusedid, -1));
			if(!flag){ 
				flag = serviceFactory.getVehicleMaintence().removePartRegtion(StringUtils.getIntegerValue(partusedid, -1));
				return flag?responseSuccess(null,"删除成功!"):responseFail("删除失败，请稍后重试!");
			}else{
				return responseFail("对不起，您已经领取了该材料不能删除！");
			}
		}else if("pmQU".equals(operation)){
			LoginBean user = MyWebUtils.getCurrentUser(request);
			if(user!=null){
				// 查询当前用户已经登记过的零件信息
				String userid = user.getUserinfoid();
				String ordersid = request.getParameter("ordersid");
				List<PartUsedInfo> partUsedInfos = serviceFactory.getVehicleMaintence().queryAllRegedPart(ordersid, userid);
			    return  responseArraySuccess(partUsedInfos);
			}else{
				return responseFail("对不起，您的登录已经过期，请重新登录!");
			} 
		}
		return responseFail("暂时不提供该服务，请稍后重试!");
	}
	
	/**
	 * 查询维修领料
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryAllPickingRows")
	@ResponseBody
	public String queryAllPickingRows(HttpServletRequest request,String startTime,String endTime,
			String keyworld,String searchType_c,Integer page,Integer rows){
		logger.info("controller层:startTime:"+startTime+",endTime:"+endTime+",keyworld"+keyworld+",searchType_c:"+searchType_c+",page:"+page+",rows:"+rows);
		PagedResult<PartPickingView> pagedResult = serviceFactory.getVehicleMaintence().queryPickingView(startTime,endTime, keyworld, searchType_c, page, rows);
		return responseSuccess(pagedResult,"查询成功!");
	}
	
	/**
	 * 查询领取的历史
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryAllPicked")
	@ResponseBody
	public String queryAllPickHis(HttpServletRequest request,String partUsedId){
		List<PickedPartView> pickedPartViews = serviceFactory.getVehicleMaintence().queryPickedPartView(partUsedId);		
		return responseArraySuccess(pickedPartViews);
	}
	
	/**
	 * 领取材料
	 * @param request
	 * @param partPickingView
	 * @return
	 */
	@RequestMapping("/pickingPart")
	@ResponseBody
	public String pickPart(HttpServletRequest request,PartPickingView partPickingView){
		logger.info("领取材料获取到的数据为："+JSON.toJSONString(partPickingView));
		float real = 0f;
		real = serviceFactory.getVehicleMaintence().pickPart(partPickingView);
		logger.info("领取材料后返回的结果为:"+real);
		return JSON.toJSONString(real);
	}
	
	/**
	 * 结束维修
	 * @param request
	 * @param ordersid
	 * @return
	 */
	@RequestMapping("/endFixed")
	@ResponseBody
	public String endFixed(HttpServletRequest request,Integer ordersid){
		boolean flag = false;
	    flag = serviceFactory.getVehicleMaintence().finishedFixed(ordersid);
	    return flag?responseSuccess(null):responseFail("结束维修状态失败!");
	}
	
	/**
	 * 结束质检
	 */
	@RequestMapping("/endQualitied")
	@ResponseBody
	public String endQualitied(Integer ordersid){
		boolean flag = false;
		flag = serviceFactory.getVehicleMaintence().finshedQalited(ordersid);
	    return flag?responseSuccess(null):responseFail("结束质检失败!");
	}
	
	/**
	 * 查询待质检的纪录
	 * @param keyworld		关键字
	 * @param starttime		开始时间
	 * @param endTime		结束时间
	 * @param bustatusid	业务状态的编号
	 * @param userinfoid	用户信息编号
	 * @param pageNo		页号
	 * @param pageSize		页面大小
	 * @return				返回当前用户待质检的纪录
	 */
	@RequestMapping("/queryQualiting")
	@ResponseBody
	public String endQualitied(HttpServletRequest request, String keyworld, String starttime, String endTime,
			String bustatusid,Integer pageNo,Integer pageSize){
		 PagedResult<QualityView> qualityViews = null;
		 LoginBean user = MyWebUtils.getCurrentUser(request);
		 if(user!=null){
			 // 分页查询待质检的信息
			 qualityViews = serviceFactory.getVehicleMaintence().queryNeedQuality(keyworld, starttime, endTime, bustatusid, user.getUserinfoid(), pageNo, pageSize);
		 }
		 return responseSuccess(qualityViews);
	}
		
	
	/**
	 * 质检项目
	 * @param fixProjid			待质检的项目
	 * @param qualityinspec		质检的详情（备注）
	 * @param hasPassed			是否通过
	 * @return
	 */
	@RequestMapping("/qualityProj")
	@ResponseBody
	public String endQualitied(HttpServletRequest request,Integer fixProjid, String qualityinspec, Short hasPassed){
		boolean flag = false;
		try {
			Qualityinspec quality = new Qualityinspec();
			LoginBean user = MyWebUtils.getCurrentUser(request);
			quality.setMainprojregid(fixProjid);
			quality.setInspectperson(user.getUsername());
			quality.setJobnum(user.getJobnumber());
			quality.setInspecttime(new Date());
			quality.setRemarks(qualityinspec); 
			flag = serviceFactory.getVehicleMaintence().qualityProject(fixProjid, quality, hasPassed);
		} catch (Exception e) {
			logger.error("质检失败...");
		}
		return flag?responseSuccess(null):responseFail("系统暂时无法提供服务,请稍后重试!");
	}
	
	/**
	 * 查询所有的待质检的内容
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryFixing")
	@ResponseBody
	public String queryFixing(HttpServletRequest request,String ordersid){
		 return responseArraySuccess(serviceFactory.getVehicleMaintence().queryAllFlexing(ordersid));
	}
	 
}
