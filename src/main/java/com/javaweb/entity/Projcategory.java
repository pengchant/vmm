package com.javaweb.entity;

public class Projcategory {
    private Integer id;

    private String numbering;

    private String projcatenum;

    private String projname;

    private String catflag;

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

    public String getProjcatenum() {
        return projcatenum;
    }

    public void setProjcatenum(String projcatenum) {
        this.projcatenum = projcatenum == null ? null : projcatenum.trim();
    }

    public String getProjname() {
        return projname;
    }

    public void setProjname(String projname) {
        this.projname = projname == null ? null : projname.trim();
    }

    public String getCatflag() {
        return catflag;
    }

    public void setCatflag(String catflag) {
        this.catflag = catflag == null ? null : catflag.trim();
    }
}