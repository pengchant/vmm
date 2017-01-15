package com.javaweb.entity;

import java.util.Date;

public class Partused {
    private Integer id;

    private Integer ordersid;

    private Integer partid;

    private Double useamount;

    private String applicant;

    private String jobnumber;

    private String concatinfo;

    private Date applicattime;

    private Double registedspecnum;

    private Double noreceivingnum;

    private Double receivednum;

    private String receivestatus;

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

    public Integer getPartid() {
        return partid;
    }

    public void setPartid(Integer partid) {
        this.partid = partid;
    }

    public Double getUseamount() {
        return useamount;
    }

    public void setUseamount(Double useamount) {
        this.useamount = useamount;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant == null ? null : applicant.trim();
    }

    public String getJobnumber() {
        return jobnumber;
    }

    public void setJobnumber(String jobnumber) {
        this.jobnumber = jobnumber == null ? null : jobnumber.trim();
    }

    public String getConcatinfo() {
        return concatinfo;
    }

    public void setConcatinfo(String concatinfo) {
        this.concatinfo = concatinfo == null ? null : concatinfo.trim();
    }

    public Date getApplicattime() {
        return applicattime;
    }

    public void setApplicattime(Date applicattime) {
        this.applicattime = applicattime;
    }

    public Double getRegistedspecnum() {
        return registedspecnum;
    }

    public void setRegistedspecnum(Double registedspecnum) {
        this.registedspecnum = registedspecnum;
    }

    public Double getNoreceivingnum() {
        return noreceivingnum;
    }

    public void setNoreceivingnum(Double noreceivingnum) {
        this.noreceivingnum = noreceivingnum;
    }

    public Double getReceivednum() {
        return receivednum;
    }

    public void setReceivednum(Double receivednum) {
        this.receivednum = receivednum;
    }

    public String getReceivestatus() {
        return receivestatus;
    }

    public void setReceivestatus(String receivestatus) {
        this.receivestatus = receivestatus == null ? null : receivestatus.trim();
    }
}