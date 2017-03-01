package com.javaweb.views;

/**
 * 维修用料情况
 * 
 * @author cp
 *
 */
public class PartUsedView {
	private String ordersid;
	private String partname;
	private String receivednum;
	private String salesprice;
	private String ptotal;

	public String getOrdersid() {
		return ordersid;
	}

	public void setOrdersid(String ordersid) {
		this.ordersid = ordersid;
	}

	public String getPartname() {
		return partname;
	}

	public void setPartname(String partname) {
		this.partname = partname;
	}

	public String getReceivednum() {
		return receivednum;
	}

	public void setReceivednum(String receivednum) {
		this.receivednum = receivednum;
	}

	public String getSalesprice() {
		return salesprice;
	}

	public void setSalesprice(String salesprice) {
		this.salesprice = salesprice;
	}

	public String getPtotal() {
		return ptotal;
	}

	public void setPtotal(String ptotal) {
		this.ptotal = ptotal;
	}

}
