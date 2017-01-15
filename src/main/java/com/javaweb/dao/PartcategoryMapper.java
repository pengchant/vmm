package com.javaweb.dao;

import com.javaweb.entity.Partcategory;

public interface PartcategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Partcategory record);

    int insertSelective(Partcategory record);

    Partcategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Partcategory record);

    int updateByPrimaryKey(Partcategory record);
}