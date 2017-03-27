 package com.javaweb.entity;

import java.util.Date;

public class Orders {
    private Integer id;

    private String numbering;

    private Integer customerid;

    private Integer vehicleid;

    private Double miles;

    private Short ifused;

    private Short ifcheckspare;

    private Short ifclean;

    private Date esdeliverytime;

    private String warrcontent;

    private String caritems;

    private String valuableobj;

    private Short hassettled;

    private Short hascompleted;

    private Short completedate;

    private Date settlecompdate;

    private Integer bustatusid;

    private Integer paystatusid;

    private String ownerdescribtion;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumbering() {
        return numbering;
    }

    public void setNumbering(String numbering) {
        this.numbering = numbering == null ? null : numbering.trim();
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public Integer getVehicleid() {
        return vehicleid;
    }

    public void setVehicleid(Integer vehicleid) {
        this.vehicleid = vehicleid;
    }

    public Double getMiles() {
        return miles;
    }

    public void setMiles(Double miles) {
        this.miles = miles;
    }

    public Short getIfused() {
        return ifused;
    }

    public void setIfused(Short ifused) {
        this.ifused = ifused;
    }

    public Short getIfcheckspare() {
        return ifcheckspare;
    }

    public void setIfcheckspare(Short ifcheckspare) {
        this.ifcheckspare = ifcheckspare;
    }

    public Short getIfclean() {
        return ifclean;
    }

    public void setIfclean(Short ifclean) {
        this.ifclean = ifclean;
    }

    public Date getEsdeliverytime() {
        return esdeliverytime;
    }

    public void setEsdeliverytime(Date esdeliverytime) {
        this.esdeliverytime = esdeliverytime;
    }

    public String getWarrcontent() {
        return warrcontent;
    }

    public void setWarrcontent(String warrcontent) {
        this.warrcontent = warrcontent == null ? null : warrcontent.trim();
    }

    public String getCaritems() {
        return caritems;
    }

    public void setCaritems(String caritems) {
        this.caritems = caritems == null ? null : caritems.trim();
    }

    public String getValuableobj() {
        return valuableobj;
    }

    public void setValuableobj(String valuableobj) {
        this.valuableobj = valuableobj == null ? null : valuableobj.trim();
    }

    public Short getHassettled() {
        return hassettled;
    }

    public void setHassettled(Short hassettled) {
        this.hassettled = hassettled;
    }

    public Short getHascompleted() {
        return hascompleted;
    }

    public void setHascompleted(Short hascompleted) {
        this.hascompleted = hascompleted;
    }

    public Short getCompletedate() {
        return completedate;
    }

    public void setCompletedate(Short completedate) {
        this.completedate = completedate;
    }

    public Date getSettlecompdate() {
        return settlecompdate;
    }

    public void setSettlecompdate(Date settlecompdate) {
        this.settlecompdate = settlecompdate;
    }

    public Integer getBustatusid() {
        return bustatusid;
    }

    public void setBustatusid(Integer bustatusid) {
        this.bustatusid = bustatusid;
    }

    public Integer getPaystatusid() {
        return paystatusid;
    }

    public void setPaystatusid(Integer paystatusid) {
        this.paystatusid = paystatusid;
    }

    public String getOwnerdescribtion() {
        return ownerdescribtion;
    }

    public void setOwnerdescribtion(String ownerdescribtion) {
        this.ownerdescribtion = ownerdescribtion == null ? null : ownerdescribtion.trim();
    }
}