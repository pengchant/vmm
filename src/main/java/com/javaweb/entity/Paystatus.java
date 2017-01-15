package com.javaweb.entity;

public class Paystatus {
    private Integer id;

    private String paystatuscode;

    private String statusname;

    private String remarks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPaystatuscode() {
        return paystatuscode;
    }

    public void setPaystatuscode(String paystatuscode) {
        this.paystatuscode = paystatuscode == null ? null : paystatuscode.trim();
    }

    public String getStatusname() {
        return statusname;
    }

    public void setStatusname(String statusname) {
        this.statusname = statusname == null ? null : statusname.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}