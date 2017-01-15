package com.javaweb.entity;

import java.util.Date;

public class Materhis {
    private Integer id;

    private String serialnumber;

    private String customername;

    private String carname;

    private String mateialname;

    private Double materialnum;

    private Double unitprice;

    private Double sum;

    private Date checkintime;

    private String recipients;

    private String receiver;

    private Date rectime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSerialnumber() {
        return serialnumber;
    }

    public void setSerialnumber(String serialnumber) {
        this.serialnumber = serialnumber == null ? null : serialnumber.trim();
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername == null ? null : customername.trim();
    }

    public String getCarname() {
        return carname;
    }

    public void setCarname(String carname) {
        this.carname = carname == null ? null : carname.trim();
    }

    public String getMateialname() {
        return mateialname;
    }

    public void setMateialname(String mateialname) {
        this.mateialname = mateialname == null ? null : mateialname.trim();
    }

    public Double getMaterialnum() {
        return materialnum;
    }

    public void setMaterialnum(Double materialnum) {
        this.materialnum = materialnum;
    }

    public Double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Double unitprice) {
        this.unitprice = unitprice;
    }

    public Double getSum() {
        return sum;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }

    public Date getCheckintime() {
        return checkintime;
    }

    public void setCheckintime(Date checkintime) {
        this.checkintime = checkintime;
    }

    public String getRecipients() {
        return recipients;
    }

    public void setRecipients(String recipients) {
        this.recipients = recipients == null ? null : recipients.trim();
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }

    public Date getRectime() {
        return rectime;
    }

    public void setRectime(Date rectime) {
        this.rectime = rectime;
    }
}