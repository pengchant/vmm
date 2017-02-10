package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Mainitem;

public interface MainitemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Mainitem record);

    int insertSelective(Mainitem record);

    Mainitem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Mainitem record);

    int updateByPrimaryKey(Mainitem record);
    
    /**
     * 通过类别的编号查询维修项目
     * @param projcategory			维修项目类别表的编号
     * @return
     */
    List<Mainitem> selectMainitembyCategory(@Param("projcategory")String projcategory);
}