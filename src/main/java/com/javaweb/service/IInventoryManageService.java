package com.javaweb.service;


import java.util.List;

import com.javaweb.utils.PagedResult;
import com.javaweb.views.LoginBean;
import com.javaweb.views.PartProcView;
import com.javaweb.views.PartStorageView;

/**
 * 库存管理的接口
 * @author cp
 *
 */
public interface IInventoryManageService {
	
	/**
	 * 分页采购单
	 * @param keyworld		关键字
	 * @param purchstatus	采购的状态
	 * @param starttime		开始时间
	 * @param endtime		结束时间
	 * @param pageNo		页号
	 * @param pageSize		页面的大小
	 * @return
	 */
	public PagedResult<PartProcView> queryPagedPartProc(
			String keyworld,
    		String purchstatus,
    		String starttime,
    		String endtime,
    		Integer pageNo,
    		Integer pageSize);
	
	/**
	 * 根据时间范围查询所有的采购的信息
	 * @param starttime		开始时间
	 * @param endtime		结束时间
	 * @return
	 */
	public List<PartProcView> queryAllPartProc(
			String purchstatus,
			String starttime,
    		String endtime);
	
	/**
	 * 采购零件
	 * @param partid		零件的编号
	 * @param partprocid	零件采购的编号
	 * @param user			用户
	 * @param price			价格
	 * @param num			数量
	 * @return				操作的结果
	 */
	public boolean partProcing(String partid,String partprocid,LoginBean user,double price,double num);
	
	
	/**
	 * 查询所有的零件存储信息
	 * @param keyworld		关键字
	 * @param pageNo		页号
	 * @param pageSize		页面的大小
	 * @return
	 */
	PagedResult<PartStorageView> queryAllPartStorage(String keyworld,Integer pageNo,Integer pageSize);
	
	
	/**
	 * 修改零件的销售价格
	 * @param partid
	 * @param price
	 * @return
	 */
	boolean modifyPrice(Integer partid,double price);
}
