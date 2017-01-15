package com.javaweb.dao;

import com.javaweb.entity.Balancesheet;

public interface BalancesheetMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Balancesheet record);

    int insertSelective(Balancesheet record);

    Balancesheet selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Balancesheet record);

    int updateByPrimaryKey(Balancesheet record);
}