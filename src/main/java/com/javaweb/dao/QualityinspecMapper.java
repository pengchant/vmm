package com.javaweb.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.javaweb.entity.Qualityinspec;
import com.javaweb.utils.PagedResult;
import com.javaweb.views.QualityView;

public interface QualityinspecMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Qualityinspec record);

    int insertSelective(Qualityinspec record);

    Qualityinspec selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Qualityinspec record);

    int updateByPrimaryKey(Qualityinspec record);
    
    /*查询待质检的消息纪录*/
    List<QualityView> selectZhiJian(
    		@Param("keyworld")String keyworld,
    		@Param("starttime")String starttime,
    		@Param("endtime")String endtime,
    		@Param("bustatusid")String bustatusid,
    		@Param("userinfoid")String userinfoid);
}