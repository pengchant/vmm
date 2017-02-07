package com.javaweb.dao;

import java.util.List;

import com.javaweb.entity.Userinfo;
import com.javaweb.views.UserSector;

public interface UserinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Userinfo record);

    int insertSelective(Userinfo record);

    Userinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Userinfo record);

    int updateByPrimaryKey(Userinfo record);
    
    List<UserSector> selectAllUserByDep();
    
}