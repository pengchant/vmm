package com.javaweb.service;

import java.util.ArrayList;

import java.util.Map;

import com.javaweb.entity.Partproc;
import com.javaweb.utils.PagedResult;

/**
 * 财务管理接口
 * 
 * @author PengChan
 *
 */
public interface IFinancialManagementService {

	/**
	 * 查询所有的已经支付完成的订单
	 * 
	 * @param starttime
	 * @param endtime
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PagedResult<com.javaweb.views.SettleOrderView> queryallSettled(String starttime, String endtime, Integer pageNo,
			Integer pageSize);

	/**
	 * 分页查询所有的已经采购的订单
	 * 
	 * @param starttime
	 * @param endtime
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PagedResult<Partproc> queryAllPartProc(String starttime, String endtime, Integer pageNo, Integer pageSize);

	/**
	 * 接单量统计(1-12月份)
	 * 
	 * @param year
	 * @return
	 */
	Map<String, String> jiedantongji(String year);

	/**
	 * 销售额统计
	 * 
	 * @param year
	 * @return
	 */
	Map<String, String> xiaoshouetongji(String year);

	/**
	 * 采购金额统计
	 * 
	 * @param year
	 * @return
	 */
	Map<String, String> caigoujinetongji(String year);

	/**
	 * 占比统计
	 * 
	 * @param year
	 * @return
	 */
     String[] zhanbitongji(String year);
}
