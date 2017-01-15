package com.javaweb.dao;

import com.javaweb.entity.Sector;

public interface SectorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Sector record);

    int insertSelective(Sector record);

    Sector selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Sector record);

    int updateByPrimaryKey(Sector record);
}