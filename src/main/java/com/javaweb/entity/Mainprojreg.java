package com.javaweb.entity;

import java.util.Date;

public class Mainprojreg {
    private Integer id;

    private Integer ordersid;

    private Integer mainitemid;

    private String regperson;

    private Date regtime;

    private Double spenttime;

    private String mainstatus;

    private Short haspassed;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(Integer ordersid) {
        this.ordersid = ordersid;
    }

    public Integer getMainitemid() {
        return mainitemid;
    }

    public void setMainitemid(Integer mainitemid) {
        this.mainitemid = mainitemid;
    }

    public String getRegperson() {
        return regperson;
    }

    public void setRegperson(String regperson) {
        this.regperson = regperson == null ? null : regperson.trim();
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public Double getSpenttime() {
        return spenttime;
    }

    public void setSpenttime(Double spenttime) {
        this.spenttime = spenttime;
    }

    public String getMainstatus() {
        return mainstatus;
    }

    public void setMainstatus(String mainstatus) {
        this.mainstatus = mainstatus == null ? null : mainstatus.trim();
    }

    public Short getHaspassed() {
        return haspassed;
    }

    public void setHaspassed(Short haspassed) {
        this.haspassed = haspassed;
    }
}