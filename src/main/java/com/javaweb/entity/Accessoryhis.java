package com.javaweb.entity;

import java.util.Date;

public class Accessoryhis {
    private Integer id;

    private String recipients;

    private String recijobnum;

    private String contactinfo;

    private Double reciamount;

    private Date recitime;

    private Integer partusedid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRecipients() {
        return recipients;
    }

    public void setRecipients(String recipients) {
        this.recipients = recipients == null ? null : recipients.trim();
    }

    public String getRecijobnum() {
        return recijobnum;
    }

    public void setRecijobnum(String recijobnum) {
        this.recijobnum = recijobnum == null ? null : recijobnum.trim();
    }

    public String getContactinfo() {
        return contactinfo;
    }

    public void setContactinfo(String contactinfo) {
        this.contactinfo = contactinfo == null ? null : contactinfo.trim();
    }

    public Double getReciamount() {
        return reciamount;
    }

    public void setReciamount(Double reciamount) {
        this.reciamount = reciamount;
    }

    public Date getRecitime() {
        return recitime;
    }

    public void setRecitime(Date recitime) {
        this.recitime = recitime;
    }

    public Integer getPartusedid() {
        return partusedid;
    }

    public void setPartusedid(Integer partusedid) {
        this.partusedid = partusedid;
    }
}