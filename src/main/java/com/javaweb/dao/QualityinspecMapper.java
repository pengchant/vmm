package com.javaweb.dao;

import com.javaweb.entity.Qualityinspec;

public interface QualityinspecMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Qualityinspec record);

    int insertSelective(Qualityinspec record);

    Qualityinspec selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Qualityinspec record);

    int updateByPrimaryKey(Qualityinspec record);
}