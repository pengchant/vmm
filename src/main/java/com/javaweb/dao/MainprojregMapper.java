package com.javaweb.dao;

import com.javaweb.entity.Mainprojreg;

public interface MainprojregMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Mainprojreg record);

    int insertSelective(Mainprojreg record);

    Mainprojreg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Mainprojreg record);

    int updateByPrimaryKey(Mainprojreg record);
}