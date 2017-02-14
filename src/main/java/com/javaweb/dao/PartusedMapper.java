package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Partused;
import com.javaweb.utils.PagedResult;
import com.javaweb.views.PartPickingView;
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
    
    /**
     * 分页查询维修领料的情况
     * @param applicattime	登记的时间
     * @param keyworld		关键词(维修人员的工号和维修人员的姓名)
     * @param searchtype	查询的类型(Y:表示已经领取的,W:未曾领取的)
     * @return
     */
    List<PartPickingView> selectPartUsed(
    		@Param("applicattime")String applicattime,
    		@Param("keyworld")String keyworld,
    		@Param("searchtype")String searchtype);
}