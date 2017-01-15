package com.javaweb.dao;

import com.javaweb.entity.Projcategory;

public interface ProjcategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Projcategory record);

    int insertSelective(Projcategory record);

    Projcategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Projcategory record);

    int updateByPrimaryKey(Projcategory record);
}