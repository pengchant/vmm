package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Warehouse;
import com.javaweb.views.PartStorageView;

public interface WarehouseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Warehouse record);

    int insertSelective(Warehouse record);

    Warehouse selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Warehouse record);

    int updateByPrimaryKey(Warehouse record);
    
    /**
     * 查询
     * @param keyword
     * @return
     */
    List<PartStorageView> selectPartStorage(@Param("key")String keyword);
}