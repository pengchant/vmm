package com.javaweb.dao;

import com.javaweb.entity.Customervisithis;

public interface CustomervisithisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Customervisithis record);

    int insertSelective(Customervisithis record);

    Customervisithis selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Customervisithis record);

    int updateByPrimaryKey(Customervisithis record);
}