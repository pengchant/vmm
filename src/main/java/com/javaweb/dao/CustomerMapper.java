package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Customer;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    List<Customer> selectCustomerByKey(@Param("keyworld")String keyworld);
}