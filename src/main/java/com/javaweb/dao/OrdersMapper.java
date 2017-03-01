package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Orders;
import com.javaweb.views.MainitemUsedView;
import com.javaweb.views.OrderMaintence;
import com.javaweb.views.PartUsedView;
import com.javaweb.views.PayViews;

public interface OrdersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKeyWithBLOBs(Orders record);

    int updateByPrimaryKey(Orders record);
   
    /**
     * 维修人员查询自己的任务单
     * @param userinfoid		维修人员信息编号
     * @param keyworld			关键字(用户名，手机号，车牌号)     
     * @param starttime			开始时间
     * @param endtime			结束时间
     * @param sort				需要排序的字段名
     * @param order				排序的方式
     * @return
     */
    List<OrderMaintence> selectOrdersMaint(@Param("userinfoid")String userinfoid,
    		@Param("keyworld")String keyworld, 
    		@Param("starttime")String starttime,
    		@Param("endtime")String endtime,
    		@Param("sort")String sort,
    		@Param("order")String order,
    		@Param("category")String category,
    		@Param("orderstatus")String orderstatus);
    
    /**
     * 查询待付款的订单信息
     * @param keyworld
     * @param starttime
     * @param endtime
     * @param bustatusid
     * @param ordersid
     * @return
     */
    List<PayViews> selctMyPayOrders(
    		@Param("keyworld")String keyworld,
    		@Param("starttime")String starttime,
    		@Param("endtime")String endtime,
    		@Param("bustatusid")String bustatusid,
    		@Param("ordersid")String ordersid,
    		@Param("paystatusid")String paystatusid);
    
    /**
     * 查询所有的用料的情况
     * @param ordersid	订单的编号
     * @return
     */
    List<PartUsedView> selectAllYLList(@Param("ordersid")String ordersid);
    
    /**
     * 查询所有的维修的情况
     * @param ordersid	订单的编号
     * @return
     */
    List<MainitemUsedView> selectAllWXList(@Param("ordersid")String ordersid);
    
}