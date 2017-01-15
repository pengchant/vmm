package com.javaweb.dao;

import com.javaweb.entity.Orders;

public interface OrdersMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKeyWithBLOBs(Orders record);

    int updateByPrimaryKey(Orders record);
}