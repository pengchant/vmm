package com.javaweb.dao;

import com.javaweb.entity.Partproc;

public interface PartprocMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Partproc record);

    int insertSelective(Partproc record);

    Partproc selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Partproc record);

    int updateByPrimaryKey(Partproc record);
}