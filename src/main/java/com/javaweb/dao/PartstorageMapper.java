package com.javaweb.dao;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Partstorage;

public interface PartstorageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Partstorage record);

    int insertSelective(Partstorage record);

    Partstorage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Partstorage record);

    int updateByPrimaryKey(Partstorage record);
    
    /**
     * 更新存储量
     * @param num
     * @param partid
     * @return
     */
    Integer updateStorage(@Param("num")double num,@Param("partid")String partid);
}