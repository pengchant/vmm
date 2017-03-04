package com.javaweb.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;
import com.javaweb.utils.MyWebUtils;
import com.javaweb.utils.XLS;
import com.javaweb.views.LoginBean;
import com.javaweb.views.PartProcEXCELView;
import com.javaweb.views.PartProcView;
import com.mysql.fabric.xmlrpc.base.Array;

/**
 * 库存管理的控制器
 * 
 * @author cp
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/inventory")
public class InventoryManageController extends BaseController {

	@Autowired
	private ServiceFactory serviceFactory;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	private static final Logger logger = LoggerFactory.getLogger(InventoryManageController.class);

	/**
	 * 分页查询待采购的订单的信息
	 * 
	 * @param keyworld
	 *            关键字
	 * @param purchstatus
	 *            支付的状态
	 * @param starttime
	 *            开始时间
	 * @param endtime
	 *            结束时间
	 * @param pageNo
	 *            页号
	 * @param pageSize
	 *            页面的大小
	 * @return 返回分页的信息
	 */
	@RequestMapping("/queryPagedPartProc")
	@ResponseBody
	public String queryPagedPartProc(String keyworld, String purchstatus, String starttime, String endtime,
			Integer page, Integer rows) {
		return responseSuccess(serviceFactory.getInventoryManageService().queryPagedPartProc(keyworld, purchstatus,
				starttime, endtime, page, rows));
	}

	/**
	 * 导出excel
	 */
	@RequestMapping(value = "/toPartProcExcel")
	public void toPartProcExcel(HttpServletResponse response, String purchstatus, String starttime, String endtime) {
		String title = "";
		if (StringUtils.isNotBlank(starttime) && StringUtils.isNotBlank(endtime)				
				&& StringUtils.isNotBlank(purchstatus)) {
			title = "汽车维系管理系统(" + com.javaweb.utils.StringUtils.getTimeStr(starttime)+ "~" + com.javaweb.utils.StringUtils.getTimeStr(endtime) + ")零件采购表【"
					+ (StringUtils.equals(purchstatus, "0") ? "待采购" : "已采购") + "】";
		}else if(StringUtils.isNotBlank(starttime) && StringUtils.isNotBlank(endtime)
				&& StringUtils.isBlank(purchstatus)){
			title = "汽车维系管理系统(" + com.javaweb.utils.StringUtils.getTimeStr(starttime)+ "~" + com.javaweb.utils.StringUtils.getTimeStr(endtime) + ")零件采购表";
		}else {
			title = "汽车维系管理系统_零件采购表";
		}
		try {
			List<PartProcView> partProcViews = serviceFactory.getInventoryManageService().queryAllPartProc(purchstatus,
					starttime, endtime);
			
			logger.info("===================>"+JSON.toJSONString(partProcViews));
			
			// 将数据库查询出来的结果重新封装
			List<PartProcEXCELView> partProcEXCELViews = new ArrayList<>();
			for (PartProcView p : partProcViews) {
				PartProcEXCELView excelView = new PartProcEXCELView(p);
				partProcEXCELViews.add(excelView);
			}
			
			logger.info("===================>"+JSON.toJSONString(partProcEXCELViews));
			
			
			XLS<PartProcEXCELView> myXLS = new XLS<PartProcEXCELView>(PartProcEXCELView.class);
			String[] titles = new String[] { "零件名称", "零件类别", "供应商名称", "需求量", "创建时间", "供应商联系电话", "供应商联系人", "联系人电话", "地址",
					"邮箱", "传真", "采购的状态","采购人","采购数量","采购价格","采购总计"};
			HSSFWorkbook workbook = myXLS.writeExcel(title, titles, partProcEXCELViews,
					myXLS.getCommonStyle(titles.length));
			myXLS.printStream(response, title + ".xls", workbook);
		} catch (Exception e) {
			logger.info("下载失败!");
		}
	}
	
	/**
	 * 采购零件
	 * @return
	 */
	@RequestMapping("/procpart")
	public String parocpart(HttpServletRequest request,String partid,String partprocid,double price,double num){
		boolean flag = false;	
		try {
			flag = serviceFactory.getInventoryManageService().partProcing(partid, partprocid, MyWebUtils.getCurrentUser(request), price, num);
		} catch (Exception e) {
			logger.info("采购失败.......");
		} 
		return flag?responseSuccess(null, "采购成功！"):responseFail("采购失败!");
	}
	
	/**
	 * 查询存储零件的数据
	 * @param keyword
	 * @return
	 */
	@RequestMapping("/queryStorage")
	@ResponseBody
	public String queryStorage(String keyword,Integer page,Integer rows){		
		return responseSuccess(serviceFactory.getInventoryManageService().queryAllPartStorage(keyword, page, rows));
	}
	
	
	/**
	 * 修改价格
	 * @param partid
	 * @param price
	 * @return
	 */
	@RequestMapping("/updatePrice")
	@ResponseBody
	public String updatePrice(Integer partid,double price){
		boolean flag = serviceFactory.getInventoryManageService().modifyPrice(partid, price);
		return flag?responseSuccess(null,"成功!"):responseFail("更新失败!");
	}

}
