package com.javaweb.dao;

import com.javaweb.entity.Mainitem;

public interface MainitemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Mainitem record);

    int insertSelective(Mainitem record);

    Mainitem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Mainitem record);

    int updateByPrimaryKey(Mainitem record);
}