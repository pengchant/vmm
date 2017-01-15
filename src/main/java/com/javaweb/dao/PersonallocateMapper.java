package com.javaweb.dao;

import com.javaweb.entity.Personallocate;

public interface PersonallocateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Personallocate record);

    int insertSelective(Personallocate record);

    Personallocate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Personallocate record);

    int updateByPrimaryKey(Personallocate record);
}