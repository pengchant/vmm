package com.javaweb.entity;

public class Warehouse {
    private Integer id;

    private String warehousename;

    private String warehouseadd;

    private String remarks;

    private String wareflag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWarehousename() {
        return warehousename;
    }

    public void setWarehousename(String warehousename) {
        this.warehousename = warehousename == null ? null : warehousename.trim();
    }

    public String getWarehouseadd() {
        return warehouseadd;
    }

    public void setWarehouseadd(String warehouseadd) {
        this.warehouseadd = warehouseadd == null ? null : warehouseadd.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public String getWareflag() {
        return wareflag;
    }

    public void setWareflag(String wareflag) {
        this.wareflag = wareflag == null ? null : wareflag.trim();
    }
}