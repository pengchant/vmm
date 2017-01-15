package com.javaweb.entity;

public class Part {
    private Integer id;

    private String partnumbering;

    private Integer partcategoryid;

    private String partname;

    private Double purchaseprice;

    private Double salesprice;

    private String specifications;

    private String remarks;

    private String partflag;

    private Integer supplierid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPartnumbering() {
        return partnumbering;
    }

    public void setPartnumbering(String partnumbering) {
        this.partnumbering = partnumbering == null ? null : partnumbering.trim();
    }

    public Integer getPartcategoryid() {
        return partcategoryid;
    }

    public void setPartcategoryid(Integer partcategoryid) {
        this.partcategoryid = partcategoryid;
    }

    public String getPartname() {
        return partname;
    }

    public void setPartname(String partname) {
        this.partname = partname == null ? null : partname.trim();
    }

    public Double getPurchaseprice() {
        return purchaseprice;
    }

    public void setPurchaseprice(Double purchaseprice) {
        this.purchaseprice = purchaseprice;
    }

    public Double getSalesprice() {
        return salesprice;
    }

    public void setSalesprice(Double salesprice) {
        this.salesprice = salesprice;
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications == null ? null : specifications.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public String getPartflag() {
        return partflag;
    }

    public void setPartflag(String partflag) {
        this.partflag = partflag == null ? null : partflag.trim();
    }

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }
}