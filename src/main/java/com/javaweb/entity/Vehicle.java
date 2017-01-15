package com.javaweb.entity;

import java.util.Date;

public class Vehicle {
    private Integer id;

    private String vehname;

    private String carmodel;

    private Date inspectiondate;

    private Double milage;

    private String platenum;

    private String vehflag;

    private Integer customerid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getVehname() {
        return vehname;
    }

    public void setVehname(String vehname) {
        this.vehname = vehname == null ? null : vehname.trim();
    }

    public String getCarmodel() {
        return carmodel;
    }

    public void setCarmodel(String carmodel) {
        this.carmodel = carmodel == null ? null : carmodel.trim();
    }

    public Date getInspectiondate() {
        return inspectiondate;
    }

    public void setInspectiondate(Date inspectiondate) {
        this.inspectiondate = inspectiondate;
    }

    public Double getMilage() {
        return milage;
    }

    public void setMilage(Double milage) {
        this.milage = milage;
    }

    public String getPlatenum() {
        return platenum;
    }

    public void setPlatenum(String platenum) {
        this.platenum = platenum == null ? null : platenum.trim();
    }

    public String getVehflag() {
        return vehflag;
    }

    public void setVehflag(String vehflag) {
        this.vehflag = vehflag == null ? null : vehflag.trim();
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }
}