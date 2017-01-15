package com.javaweb.entity;

import java.util.Date;

public class Personallocate {
    private Integer id;

    private Integer userinfoid;

    private Integer ordersid;

    private String taskcategory;

    private Date allocatetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserinfoid() {
        return userinfoid;
    }

    public void setUserinfoid(Integer userinfoid) {
        this.userinfoid = userinfoid;
    }

    public Integer getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(Integer ordersid) {
        this.ordersid = ordersid;
    }

    public String getTaskcategory() {
        return taskcategory;
    }

    public void setTaskcategory(String taskcategory) {
        this.taskcategory = taskcategory == null ? null : taskcategory.trim();
    }

    public Date getAllocatetime() {
        return allocatetime;
    }

    public void setAllocatetime(Date allocatetime) {
        this.allocatetime = allocatetime;
    }
}