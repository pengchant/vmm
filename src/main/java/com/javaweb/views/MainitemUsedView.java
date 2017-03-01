package com.javaweb.views;

/**
 * 维修项目情况
 * 
 * @author cp
 *
 */
public class MainitemUsedView {
	private String ordersid;
	private String mainitemid;
	private String projName;
	private String itemprice;
	private String spenttime;
	private String totalcost;

	public String getOrdersid() {
		return ordersid;
	}

	public void setOrdersid(String ordersid) {
		this.ordersid = ordersid;
	}

	public String getMainitemid() {
		return mainitemid;
	}

	public void setMainitemid(String mainitemid) {
		this.mainitemid = mainitemid;
	}

	public String getProjName() {
		return projName;
	}

	public void setProjName(String projName) {
		this.projName = projName;
	}

	public String getItemprice() {
		return itemprice;
	}

	public void setItemprice(String itemprice) {
		this.itemprice = itemprice;
	}

	public String getSpenttime() {
		return spenttime;
	}

	public void setSpenttime(String spenttime) {
		this.spenttime = spenttime;
	}

	public String getTotalcost() {
		return totalcost;
	}

	public void setTotalcost(String totalcost) {
		this.totalcost = totalcost;
	} 
}
