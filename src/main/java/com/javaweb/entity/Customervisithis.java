package com.javaweb.entity;

import java.util.Date;

public class Customervisithis {
    private Integer id;

    private String customername;

    private String contactinfo;

    private Date visittime;

    private String servicecontent;

    private Short isnew;

    private Integer customer;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername == null ? null : customername.trim();
    }

    public String getContactinfo() {
        return contactinfo;
    }

    public void setContactinfo(String contactinfo) {
        this.contactinfo = contactinfo == null ? null : contactinfo.trim();
    }

    public Date getVisittime() {
        return visittime;
    }

    public void setVisittime(Date visittime) {
        this.visittime = visittime;
    }

    public String getServicecontent() {
        return servicecontent;
    }

    public void setServicecontent(String servicecontent) {
        this.servicecontent = servicecontent == null ? null : servicecontent.trim();
    }

    public Short getIsnew() {
        return isnew;
    }

    public void setIsnew(Short isnew) {
        this.isnew = isnew;
    }

    public Integer getCustomer() {
        return customer;
    }

    public void setCustomer(Integer customer) {
        this.customer = customer;
    }
}