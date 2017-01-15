package com.javaweb.dao;

import com.javaweb.entity.Accessoryhis;

public interface AccessoryhisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Accessoryhis record);

    int insertSelective(Accessoryhis record);

    Accessoryhis selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Accessoryhis record);

    int updateByPrimaryKey(Accessoryhis record);
}