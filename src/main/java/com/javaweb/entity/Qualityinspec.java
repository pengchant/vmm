package com.javaweb.entity;

import java.util.Date;

public class Qualityinspec {
    private Integer id;

    private Integer mainprojregid;

    private String inspectperson;

    private String jobnum;

    private Date inspecttime;

    private String remarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMainprojregid() {
        return mainprojregid;
    }

    public void setMainprojregid(Integer mainprojregid) {
        this.mainprojregid = mainprojregid;
    }

    public String getInspectperson() {
        return inspectperson;
    }

    public void setInspectperson(String inspectperson) {
        this.inspectperson = inspectperson == null ? null : inspectperson.trim();
    }

    public String getJobnum() {
        return jobnum;
    }

    public void setJobnum(String jobnum) {
        this.jobnum = jobnum == null ? null : jobnum.trim();
    }

    public Date getInspecttime() {
        return inspecttime;
    }

    public void setInspecttime(Date inspecttime) {
        this.inspecttime = inspecttime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}