package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Mainprojreg;
import com.javaweb.views.MaintProject;

public interface MainprojregMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Mainprojreg record);

    int insertSelective(Mainprojreg record);

    Mainprojreg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Mainprojreg record);

    int updateByPrimaryKey(Mainprojreg record);
    
    /**
     * 查询所有的
     * @param ordersid		订单的编号
     * @param userid		用户的编号
     * @return
     */
    List<MaintProject> selectAllMainregedProj(@Param("ordersid")String ordersid,@Param("userid")String userid);
}