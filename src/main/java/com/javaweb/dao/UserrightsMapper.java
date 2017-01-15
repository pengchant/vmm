package com.javaweb.dao;

import com.javaweb.entity.Userrights;

public interface UserrightsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Userrights record);

    int insertSelective(Userrights record);

    Userrights selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Userrights record);

    int updateByPrimaryKey(Userrights record);
}