package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Customer;
import com.javaweb.views.CustomerView;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
    List<Customer> selectCustomerByKey(@Param("keyworld")String keyworld);
    
    List<CustomerView> selectCustomer(
    		@Param("key")String key,
    		@Param("sort")String sort,
    		@Param("order")String order);
}