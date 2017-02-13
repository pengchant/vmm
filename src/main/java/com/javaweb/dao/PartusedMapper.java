package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Partused;
import com.javaweb.views.PartUsedInfo;

public interface PartusedMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Partused record);

    int insertSelective(Partused record);

    Partused selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Partused record);

    int updateByPrimaryKey(Partused record);
    
    /**
     * 查询已经登记过的零件的信息
     * @param ordersid		订单编号
     * @param userid		用户编号
     * @return				返回yoghurt已经登记过的零件的信息
     */
    List<PartUsedInfo> selectHasSelectedPart(@Param("ordersid")String ordersid,@Param("userid")String userid);
}