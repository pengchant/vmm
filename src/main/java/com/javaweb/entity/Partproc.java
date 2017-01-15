package com.javaweb.entity;

public class Partproc {
    private Integer id;

    private String partcategoryname;

    private String partcategorycode;

    private String partname;

    private String partcode;

    private String suppliercode;

    private String suppliername;

    private Double pruchdemand;

    private Double pruchprice;

    private String pruchernum;

    private String prucher;

    private Double totalpurchase;

    private String purchstatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPartcategoryname() {
        return partcategoryname;
    }

    public void setPartcategoryname(String partcategoryname) {
        this.partcategoryname = partcategoryname == null ? null : partcategoryname.trim();
    }

    public String getPartcategorycode() {
        return partcategorycode;
    }

    public void setPartcategorycode(String partcategorycode) {
        this.partcategorycode = partcategorycode == null ? null : partcategorycode.trim();
    }

    public String getPartname() {
        return partname;
    }

    public void setPartname(String partname) {
        this.partname = partname == null ? null : partname.trim();
    }

    public String getPartcode() {
        return partcode;
    }

    public void setPartcode(String partcode) {
        this.partcode = partcode == null ? null : partcode.trim();
    }

    public String getSuppliercode() {
        return suppliercode;
    }

    public void setSuppliercode(String suppliercode) {
        this.suppliercode = suppliercode == null ? null : suppliercode.trim();
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername == null ? null : suppliername.trim();
    }

    public Double getPruchdemand() {
        return pruchdemand;
    }

    public void setPruchdemand(Double pruchdemand) {
        this.pruchdemand = pruchdemand;
    }

    public Double getPruchprice() {
        return pruchprice;
    }

    public void setPruchprice(Double pruchprice) {
        this.pruchprice = pruchprice;
    }

    public String getPruchernum() {
        return pruchernum;
    }

    public void setPruchernum(String pruchernum) {
        this.pruchernum = pruchernum == null ? null : pruchernum.trim();
    }

    public String getPrucher() {
        return prucher;
    }

    public void setPrucher(String prucher) {
        this.prucher = prucher == null ? null : prucher.trim();
    }

    public Double getTotalpurchase() {
        return totalpurchase;
    }

    public void setTotalpurchase(Double totalpurchase) {
        this.totalpurchase = totalpurchase;
    }

    public String getPurchstatus() {
        return purchstatus;
    }

    public void setPurchstatus(String purchstatus) {
        this.purchstatus = purchstatus == null ? null : purchstatus.trim();
    }
}