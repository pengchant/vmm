package com.javaweb.entity;

import java.util.Date;

public class Consumsettle {
    private Integer id;

    private String ordernum;

    private Date createtime;

    private String customername;

    private String carbrand;

    private String conntactinfo;

    private String contactadd;

    private Double consumptotal;

    private Double offers;

    private Double paid;

    private String manager;

    private String mananum;

    private Date settletime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(String ordernum) {
        this.ordernum = ordernum == null ? null : ordernum.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername == null ? null : customername.trim();
    }

    public String getCarbrand() {
        return carbrand;
    }

    public void setCarbrand(String carbrand) {
        this.carbrand = carbrand == null ? null : carbrand.trim();
    }

    public String getConntactinfo() {
        return conntactinfo;
    }

    public void setConntactinfo(String conntactinfo) {
        this.conntactinfo = conntactinfo == null ? null : conntactinfo.trim();
    }

    public String getContactadd() {
        return contactadd;
    }

    public void setContactadd(String contactadd) {
        this.contactadd = contactadd == null ? null : contactadd.trim();
    }

    public Double getConsumptotal() {
        return consumptotal;
    }

    public void setConsumptotal(Double consumptotal) {
        this.consumptotal = consumptotal;
    }

    public Double getOffers() {
        return offers;
    }

    public void setOffers(Double offers) {
        this.offers = offers;
    }

    public Double getPaid() {
        return paid;
    }

    public void setPaid(Double paid) {
        this.paid = paid;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager == null ? null : manager.trim();
    }

    public String getMananum() {
        return mananum;
    }

    public void setMananum(String mananum) {
        this.mananum = mananum == null ? null : mananum.trim();
    }

    public Date getSettletime() {
        return settletime;
    }

    public void setSettletime(Date settletime) {
        this.settletime = settletime;
    }
}