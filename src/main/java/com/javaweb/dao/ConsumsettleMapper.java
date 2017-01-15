package com.javaweb.dao;

import com.javaweb.entity.Consumsettle;

public interface ConsumsettleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Consumsettle record);

    int insertSelective(Consumsettle record);

    Consumsettle selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Consumsettle record);

    int updateByPrimaryKey(Consumsettle record);
}