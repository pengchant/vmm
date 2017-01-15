package com.javaweb.entity;

public class Partcategory {
    private Integer id;

    private String numbering;

    private String partcategory;

    private String partcatflag;

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

    public String getPartcategory() {
        return partcategory;
    }

    public void setPartcategory(String partcategory) {
        this.partcategory = partcategory == null ? null : partcategory.trim();
    }

    public String getPartcatflag() {
        return partcatflag;
    }

    public void setPartcatflag(String partcatflag) {
        this.partcatflag = partcatflag == null ? null : partcatflag.trim();
    }
}