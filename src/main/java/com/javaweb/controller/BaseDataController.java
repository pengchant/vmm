package com.javaweb.controller;
 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaweb.entity.Customer;
import com.javaweb.entity.Permission;
import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;
import com.javaweb.utils.XLS;
import com.javaweb.views.CustomerView;

/**
 * 基础数据管理的控制器
 * @author PengChan
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/baseData")
public class BaseDataController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(BaseDataController.class);
	
	@Autowired
	private ServiceFactory serviceFactory;
	
	/**
	 * 查看所有用户的视图
	 * @return
	 */
	@RequestMapping("/queryPagedCustomerView")
	@ResponseBody
	public String queryPagedCustomerView(String key,String sort,String order,Integer page,Integer rows){
		return responseSuccess(serviceFactory.getBaseDataManageService().queryPagedCustomerView(key, sort, order, page, rows));
	}
	
	/**
	 * 导出客户的excel表格
	 */
	@RequestMapping("/toCusttomerExcel")
	public void toCusttomerExcel(HttpServletRequest request,HttpServletResponse response){
		String title = "汽车维修管理系统-客户信息";	
		logger.info(title);
		try {
			List<CustomerView> customerViews = serviceFactory.getBaseDataManageService().queryAllCustomer();
			XLS<CustomerView> myXls = new XLS<CustomerView>(CustomerView.class);
			String[] titles = new String[] { "用户编号","用户名", "联系方式", "联系地址", "汽车编号", "汽车牌号", "汽车类型","年检日期", "里程数", "发动机号" };
			HSSFWorkbook workbook = myXls.writeExcel(title, titles, customerViews, myXls.getCommonStyle(titles.length));
			myXls.printStream(response, title + ".xls", workbook);
		} catch (Exception e) {
			logger.info("下载失败!");
		}
	}
	
	/**
	 * 更新用户的信息
	 * @param customerView
	 * @return
	 */
	@RequestMapping("/modifyCustomer")
	@ResponseBody
	public String modifyCustomer(CustomerView customerView){
		boolean flag = serviceFactory.getBaseDataManageService().modifyCustomer(customerView);
		return flag?responseSuccess(null):responseFail("修改用户信息失败!");
	}
	
	
	/**
	 * 查询所有的权限
	 * @return
	 */
	@RequestMapping("/queryallPermisson")
	@ResponseBody
	public String queryallPermisson(){
		return responseArraySuccess(serviceFactory.getBaseDataManageService().queryPermission());
	}
	
	
	/**
	 * 修改权限
	 * @param permission
	 * @return
	 */
	@RequestMapping("/modifyPermission")
	@ResponseBody
	public String modifyPermission(Permission permission){
		boolean flag = false;
		flag = serviceFactory.getBaseDataManageService().modifyPermission(permission);
		return flag?responseSuccess(null):responseFail("修改失败!");
	}
	
}
