package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Orders;
import com.javaweb.views.OrderMaintence;

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
    		@Param("category")String category);
    
}