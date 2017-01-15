package com.javaweb.entity;

public class Mainitem {
    private Integer id;

    private String mainnumbering;

    private String projname;

    private Integer projcategoryid;

    private Double itemprice;

    private String mainflag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMainnumbering() {
        return mainnumbering;
    }

    public void setMainnumbering(String mainnumbering) {
        this.mainnumbering = mainnumbering == null ? null : mainnumbering.trim();
    }

    public String getProjname() {
        return projname;
    }

    public void setProjname(String projname) {
        this.projname = projname == null ? null : projname.trim();
    }

    public Integer getProjcategoryid() {
        return projcategoryid;
    }

    public void setProjcategoryid(Integer projcategoryid) {
        this.projcategoryid = projcategoryid;
    }

    public Double getItemprice() {
        return itemprice;
    }

    public void setItemprice(Double itemprice) {
        this.itemprice = itemprice;
    }

    public String getMainflag() {
        return mainflag;
    }

    public void setMainflag(String mainflag) {
        this.mainflag = mainflag == null ? null : mainflag.trim();
    }
}