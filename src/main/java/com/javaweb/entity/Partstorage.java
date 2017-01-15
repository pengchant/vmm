package com.javaweb.entity;

import java.util.Date;

public class Partstorage {
    private Integer id;

    private Integer partid;

    private Integer warehouseid;

    private String detaillocation;

    private Double inventory;

    private Date storagetime;

    private String purchaser;

    private String contactinfo;

    private String jobnumber;

    private String remarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPartid() {
        return partid;
    }

    public void setPartid(Integer partid) {
        this.partid = partid;
    }

    public Integer getWarehouseid() {
        return warehouseid;
    }

    public void setWarehouseid(Integer warehouseid) {
        this.warehouseid = warehouseid;
    }

    public String getDetaillocation() {
        return detaillocation;
    }

    public void setDetaillocation(String detaillocation) {
        this.detaillocation = detaillocation == null ? null : detaillocation.trim();
    }

    public Double getInventory() {
        return inventory;
    }

    public void setInventory(Double inventory) {
        this.inventory = inventory;
    }

    public Date getStoragetime() {
        return storagetime;
    }

    public void setStoragetime(Date storagetime) {
        this.storagetime = storagetime;
    }

    public String getPurchaser() {
        return purchaser;
    }

    public void setPurchaser(String purchaser) {
        this.purchaser = purchaser == null ? null : purchaser.trim();
    }

    public String getContactinfo() {
        return contactinfo;
    }

    public void setContactinfo(String contactinfo) {
        this.contactinfo = contactinfo == null ? null : contactinfo.trim();
    }

    public String getJobnumber() {
        return jobnumber;
    }

    public void setJobnumber(String jobnumber) {
        this.jobnumber = jobnumber == null ? null : jobnumber.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}