package com.javaweb.entity;

import java.util.Date;

public class Arrears {
    private Integer id;

    private Double currentamount;

    private Date lastsettletime;

    private Integer ordersid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getCurrentamount() {
        return currentamount;
    }

    public void setCurrentamount(Double currentamount) {
        this.currentamount = currentamount;
    }

    public Date getLastsettletime() {
        return lastsettletime;
    }

    public void setLastsettletime(Date lastsettletime) {
        this.lastsettletime = lastsettletime;
    }

    public Integer getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(Integer ordersid) {
        this.ordersid = ordersid;
    }
}