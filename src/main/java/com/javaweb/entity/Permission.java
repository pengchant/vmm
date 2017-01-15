package com.javaweb.entity;

public class Permission {
    private Integer id;

    private String pername;

    private String authcategory;

    private String perurl;

    private String perflag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPername() {
        return pername;
    }

    public void setPername(String pername) {
        this.pername = pername == null ? null : pername.trim();
    }

    public String getAuthcategory() {
        return authcategory;
    }

    public void setAuthcategory(String authcategory) {
        this.authcategory = authcategory == null ? null : authcategory.trim();
    }

    public String getPerurl() {
        return perurl;
    }

    public void setPerurl(String perurl) {
        this.perurl = perurl == null ? null : perurl.trim();
    }

    public String getPerflag() {
        return perflag;
    }

    public void setPerflag(String perflag) {
        this.perflag = perflag == null ? null : perflag.trim();
    }
}