package com.javaweb.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.javaweb.service.impl.ServiceFactory;
import com.javaweb.utils.BaseController;
import com.javaweb.views.EChartMap;


/**
 * 财务管理控制器
 * @author PengChan
 *
 */
@Controller
@RequestMapping("/financial")
@Scope("prototype")
public class FinancialManagementController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(FinancialManagementController.class);
	
	@Autowired
	private ServiceFactory serviceFactory;
	
	/**
	 * 查询所有的订单
	 * @param starttime		开始时间
	 * @param endtime		结束时间
	 * @param page			页号
	 * @param rows			页面数据大小
	 * @return
	 */
	@RequestMapping("/getOrders")
	@ResponseBody
	public String getOrders(String starttime,String endtime,Integer page,Integer rows){		
		return responseSuccess(serviceFactory.getFinanicalManagement().queryallSettled(starttime, endtime, page, rows));
	}
	
	/**
	 * 查询所有的维修单
	 * @param starttime
	 * @param endtime
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/getPartProc")
	@ResponseBody
	public String getPartProc(String starttime,String endtime,Integer page,Integer rows){
		return responseSuccess(serviceFactory.getFinanicalManagement().queryAllPartProc(starttime, endtime, page, rows));
	}
	
	/**
	 * 接单量
	 * @return
	 */
	@RequestMapping("/jiedanliang")
	@ResponseBody
	public String jiedanliang(){
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		Map<String,String> result = serviceFactory.getFinanicalManagement().jiedantongji(year+"");
		logger.info(JSON.toJSONString(result));
		int[] data = null;
		try {
			if(result!=null){
				data = new int[result.size()];
				for(int i = 0;i<result.size();i++){
					data[i] = Integer.parseInt(String.valueOf(result.get(String.valueOf(i+1))));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("接单量统计有误!");
		}
		// 遍历结果
		return responseArraySuccess(data);
	}
	
	/**
	 * 营销额统计
	 * @return
	 */
	@RequestMapping("/yinxiaoe")
	@ResponseBody
	public String yinxiaoe(){
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		Map<String,String> result = serviceFactory.getFinanicalManagement().xiaoshouetongji(year+"");
		double[] data = null;
		try {
			if(result!=null){
				data = new double[result.size()];
				for(int i = 0;i<result.size();i++){
					data[i] = Double.valueOf(String.valueOf(result.get(String.valueOf(i+1))));
				}
			}
		} catch (Exception e) {
			logger.info("营销额统计有误!");
		}
		// 遍历结果
		return responseArraySuccess(data);
	}
	
	/**
	 * 采购金额
	 * @return
	 */
	@RequestMapping("/caigoujine")
	@ResponseBody
	public String caigoujine(){
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		Map<String,String> result = serviceFactory.getFinanicalManagement().caigoujinetongji(year+"");
		double[] data = null;
		try {
			if(result!=null){
				data = new double[result.size()];
				for(int i = 0;i<result.size();i++){
					data[i] = Double.valueOf(String.valueOf(result.get(String.valueOf(i+1))));
				}
			}
		} catch (Exception e) {
			logger.info("采购金额统计有误!");
		}
		// 遍历结果
		return responseArraySuccess(data);
	}
	
	
	/**
	 * 占比图
	 * @return
	 */
	@RequestMapping("/zhanbi")
	@ResponseBody
	public String zhanbi(){
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		String[] data = serviceFactory.getFinanicalManagement().zhanbitongji(year+"");		
		ArrayList<EChartMap> eChartMaps = new ArrayList<>();
		if(data!=null){
			try {
				EChartMap element = new EChartMap();
				element.setName("营销额");
				element.setValue(data[0]);
				eChartMaps.add(element);
				EChartMap element2 = new EChartMap();
				element2.setName("采购总额");
				element2.setValue(data[1]);
				eChartMaps.add(element2);
			} catch (Exception e) {
				logger.info("占比图统计有误!");
			}
		}
		return responseArraySuccess(eChartMaps);
	}
	
	
}
