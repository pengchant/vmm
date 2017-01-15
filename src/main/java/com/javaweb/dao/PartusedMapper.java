package com.javaweb.dao;

import com.javaweb.entity.Partused;

public interface PartusedMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Partused record);

    int insertSelective(Partused record);

    Partused selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Partused record);

    int updateByPrimaryKey(Partused record);
}