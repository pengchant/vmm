package com.javaweb.views;

/**
 * 查看已经结算的view
 * 
 * @author PengChan
 *
 */
public class SettleOrderView {
	private String ordersid;// 订单的编号
	private String customerid;// 客户的编号
	private String numbering;// 用户名
	private String contactinfo;// 联系方式
	private String vehicleid;// 交通工具的编号
	private String platenum;// 汽车牌号
	private String warrcontent;// 维修项目内容
	private String settlementdate;// 结算时间
	private String totalamount;// 总额

	public String getOrdersid() {
		return ordersid;
	}

	public void setOrdersid(String ordersid) {
		this.ordersid = ordersid;
	}

	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public String getNumbering() {
		return numbering;
	}

	public void setNumbering(String numbering) {
		this.numbering = numbering;
	}

	public String getContactinfo() {
		return contactinfo;
	}

	public void setContactinfo(String contactinfo) {
		this.contactinfo = contactinfo;
	}

	public String getVehicleid() {
		return vehicleid;
	}

	public void setVehicleid(String vehicleid) {
		this.vehicleid = vehicleid;
	}

	public String getPlatenum() {
		return platenum;
	}

	public void setPlatenum(String platenum) {
		this.platenum = platenum;
	}

	public String getWarrcontent() {
		return warrcontent;
	}

	public void setWarrcontent(String warrcontent) {
		this.warrcontent = warrcontent;
	}

	public String getSettlementdate() {
		return settlementdate;
	}

	public void setSettlementdate(String settlementdate) {
		this.settlementdate = settlementdate;
	}

	public String getTotalamount() {
		return totalamount;
	}

	public void setTotalamount(String totalamount) {
		this.totalamount = totalamount;
	}

}
