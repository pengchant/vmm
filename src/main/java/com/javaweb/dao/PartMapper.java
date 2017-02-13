package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Part;
import com.javaweb.views.PartsInfo;

public interface PartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Part record);

    int insertSelective(Part record);

    Part selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Part record);

    int updateByPrimaryKey(Part record);
    
    /**
     * 通过关键字查询零件的信息
     * @param keyworld
     * @return
     */
    List<PartsInfo> selectParts(@Param("keyworld")String keyworld);
}