package com.javaweb.entity;

import java.util.Date;

public class Userinfo {
    private Integer id;

    private String username;

    private String jobnumber;

    private String concatinfo;

    private String address;

    private Date entrytime;

    private String userflag;

    private Integer sectorid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getJobnumber() {
        return jobnumber;
    }

    public void setJobnumber(String jobnumber) {
        this.jobnumber = jobnumber == null ? null : jobnumber.trim();
    }

    public String getConcatinfo() {
        return concatinfo;
    }

    public void setConcatinfo(String concatinfo) {
        this.concatinfo = concatinfo == null ? null : concatinfo.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Date getEntrytime() {
        return entrytime;
    }

    public void setEntrytime(Date entrytime) {
        this.entrytime = entrytime;
    }

    public String getUserflag() {
        return userflag;
    }

    public void setUserflag(String userflag) {
        this.userflag = userflag == null ? null : userflag.trim();
    }

    public Integer getSectorid() {
        return sectorid;
    }

    public void setSectorid(Integer sectorid) {
        this.sectorid = sectorid;
    }
}