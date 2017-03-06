package com.javaweb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.Null;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.tools.ant.taskdefs.condition.And;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaweb.entity.Mainitem;
import com.javaweb.entity.Permission;
import com.javaweb.entity.Projcategory;
import com.javaweb.entity.Supplier;
import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;
import com.javaweb.utils.StringUtils;
import com.javaweb.utils.XLS;
import com.javaweb.views.CustomerView;

/**
 * 基础数据管理的控制器
 * 
 * @author PengChan
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/baseData")
public class BaseDataController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(BaseDataController.class);

	@Autowired
	private ServiceFactory serviceFactory;

	/**
	 * 查看所有用户的视图
	 * 
	 * @return
	 */
	@RequestMapping("/queryPagedCustomerView")
	@ResponseBody
	public String queryPagedCustomerView(String key, String sort, String order, Integer page, Integer rows) {
		return responseSuccess(
				serviceFactory.getBaseDataManageService().queryPagedCustomerView(key, sort, order, page, rows));
	}

	/**
	 * 导出客户的excel表格
	 */
	@RequestMapping("/toCusttomerExcel")
	public void toCusttomerExcel(HttpServletRequest request, HttpServletResponse response) {
		String title = "汽车维修管理系统-客户信息";
		logger.info(title);
		try {
			List<CustomerView> customerViews = serviceFactory.getBaseDataManageService().queryAllCustomer();
			XLS<CustomerView> myXls = new XLS<CustomerView>(CustomerView.class);
			String[] titles = new String[] { "用户编号", "用户名", "联系方式", "联系地址", "汽车编号", "汽车牌号", "汽车类型", "年检日期", "里程数",
					"发动机号" };
			HSSFWorkbook workbook = myXls.writeExcel(title, titles, customerViews, myXls.getCommonStyle(titles.length));
			myXls.printStream(response, title + ".xls", workbook);
		} catch (Exception e) {
			logger.info("下载失败!");
		}
	}

	/**
	 * 更新用户的信息
	 * 
	 * @param customerView
	 * @return
	 */
	@RequestMapping("/modifyCustomer")
	@ResponseBody
	public String modifyCustomer(CustomerView customerView) {
		boolean flag = serviceFactory.getBaseDataManageService().modifyCustomer(customerView);
		return flag ? responseSuccess(null) : responseFail("修改用户信息失败!");
	}

	/**
	 * 查询所有的权限
	 * 
	 * @return
	 */
	@RequestMapping("/queryallPermisson")
	@ResponseBody
	public String queryallPermisson() {
		return responseArraySuccess(serviceFactory.getBaseDataManageService().queryPermission());
	}

	/**
	 * 修改权限
	 * 
	 * @param permission
	 * @return
	 */
	@RequestMapping("/modifyPermission")
	@ResponseBody
	public String modifyPermission(Permission permission) {
		boolean flag = false;
		flag = serviceFactory.getBaseDataManageService().modifyPermission(permission);
		return flag ? responseSuccess(null) : responseFail("修改失败!");
	}

	/**
	 * 查询所有的维修项目大类
	 * 
	 * @return
	 */
	@RequestMapping("/queryAllProjCategory")
	@ResponseBody
	public String queryAllProjCategory() {
		return responseArraySuccess(serviceFactory.getBaseDataManageService().queryAllProjCategory());
	}

	/**
	 * 查询所有的维修项目
	 * 
	 * @return
	 */
	@RequestMapping("/queryAllMainItem")
	@ResponseBody
	public String queryAllMainItem() {
		return responseArraySuccess(serviceFactory.getBaseDataManageService().queryAllMainItem());
	}

	/**
	 * 修改维修项目的大类
	 * 
	 * @return
	 */
	@RequestMapping("/modifyPartCategory")
	@ResponseBody
	public String modifyPartCategory(String projcategorycode, String projcategory, String type, Integer id,
			String categoryflag) {
		boolean flag = false;
		if ("C".equals(type) || "U".equals(type) || "D".equals(type)) {
			Projcategory pc = new Projcategory();
			pc.setNumbering(projcategorycode);
			pc.setProjcatenum(projcategorycode);
			pc.setProjname(projcategory);
			if (id != null) {
				pc.setId(id);
			}
			if (categoryflag != null) {
				pc.setCatflag(categoryflag);
			}
			flag = serviceFactory.getBaseDataManageService().modifyPartCategory(pc, type);
		}
		return flag ? responseSuccess(null) : responseFail("修改维修项目dalei失败!");
	}

	/**
	 * 修改维修项目
	 * 
	 * @return
	 */
	@RequestMapping("/modifyMainitem")
	@ResponseBody
	public String modifyMainitem(Mainitem mainitem, String type) {
		boolean flag = false;
		if ("C".equals(type) || "U".equals(type) || "D".equals(type)) {
			flag = serviceFactory.getBaseDataManageService().modifyMainitem(mainitem, type);
		}
		return flag ? responseSuccess(null) : responseFail("修改维修项目失败!");
	}

	/**
	 * 分页查询供应商的信息
	 * 
	 * @param key
	 * @param sort
	 * @param order
	 * @param flag
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/querySupplier")
	@ResponseBody
	public String querySupplier(String key, String sort, String order, String flag, Integer page, Integer rows) {
		return responseSuccess(
				serviceFactory.getBaseDataManageService().queryAllSupplier(key, sort, order, flag, page, rows));
	}
	
	
	/**
	 * 修改供应商的信息
	 * @param supplier
	 * @param type
	 * @return
	 */
	@RequestMapping("/modifySupplier")
	@ResponseBody
	public String modifySupplier(Supplier supplier,String type) {
		if(supplier!=null && org.apache.commons.lang.StringUtils.isBlank(supplier.getId()+"")){
			supplier.setId(null);
		}
		boolean flag = serviceFactory.getBaseDataManageService().modifySupplier(supplier, type);
		return flag?responseSuccess(null):responseFail("修改失败!");
	}

}
