package com.javaweb.service;

import java.util.List;

import com.javaweb.entity.Partproc;
import com.javaweb.utils.PagedResult;

/**
 * 财务管理接口
 * @author PengChan
 *
 */
public interface IFinancialManagementService {
	
	/**
	 * 查询所有的已经支付完成的订单
	 * @param starttime
	 * @param endtime
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PagedResult<com.javaweb.views.SettleOrderView> queryallSettled(String starttime,String endtime,Integer pageNo,Integer pageSize);
	
	/**
	 * 分页查询所有的已经采购的订单
	 * @param starttime
	 * @param endtime
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PagedResult<Partproc> queryAllPartProc(String starttime,String endtime,Integer pageNo,Integer pageSize);
}
