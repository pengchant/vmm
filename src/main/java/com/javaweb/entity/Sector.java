package com.javaweb.entity;

public class Sector {
    private Integer id;

    private String deptname;

    private String secflag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname == null ? null : deptname.trim();
    }

    public String getSecflag() {
        return secflag;
    }

    public void setSecflag(String secflag) {
        this.secflag = secflag == null ? null : secflag.trim();
    }
}