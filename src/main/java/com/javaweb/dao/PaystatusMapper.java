package com.javaweb.dao;

import com.javaweb.entity.Paystatus;

public interface PaystatusMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Paystatus record);

    int insertSelective(Paystatus record);

    Paystatus selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Paystatus record);

    int updateByPrimaryKey(Paystatus record);
}