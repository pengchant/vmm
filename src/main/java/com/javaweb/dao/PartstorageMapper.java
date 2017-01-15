package com.javaweb.dao;

import com.javaweb.entity.Partstorage;

public interface PartstorageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Partstorage record);

    int insertSelective(Partstorage record);

    Partstorage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Partstorage record);

    int updateByPrimaryKey(Partstorage record);
}