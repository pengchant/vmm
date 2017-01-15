package com.javaweb.entity;

import java.util.Date;

public class Balancesheet {
    private Integer id;

    private Date settlementdate;

    private Double totalamount;

    private String settler;

    private Integer ordersid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getSettlementdate() {
        return settlementdate;
    }

    public void setSettlementdate(Date settlementdate) {
        this.settlementdate = settlementdate;
    }

    public Double getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(Double totalamount) {
        this.totalamount = totalamount;
    }

    public String getSettler() {
        return settler;
    }

    public void setSettler(String settler) {
        this.settler = settler == null ? null : settler.trim();
    }

    public Integer getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(Integer ordersid) {
        this.ordersid = ordersid;
    }
}