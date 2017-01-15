package com.javaweb.dao;

import java.util.List;

import com.javaweb.entity.Vehicle;
import com.javaweb.views.CustomerVehicle;

public interface VehicleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Vehicle record);

    int insertSelective(Vehicle record);

    Vehicle selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Vehicle record);

    int updateByPrimaryKey(Vehicle record);
    
    List<CustomerVehicle> selectVehicleByKey(String keyworld);
    
}