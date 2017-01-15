package com.javaweb.dao;

import com.javaweb.entity.Account;
import com.javaweb.views.LoginBean;

public interface AccountMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
    
    LoginBean selectcount(Account account);
}