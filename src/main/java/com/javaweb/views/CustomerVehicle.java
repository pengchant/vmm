package com.javaweb.views;

/**
 * 客户以及车辆信息
 * 
 * @author cp
 *
 */
public class CustomerVehicle {
	private String customerid;// 客户表编号
	private String numbering;// 客户名称
	private String contactinfo;// 联系方式
	private String vehname;// 车名
	private String platenum;// 车牌号
	private String carmodel;// 车型
	private String milage;// 行驶里程数
	private String inspectiondate;// 年检日期
	private String vehflag;// 发动机型号
	private String contactadd;// 联系的地址

	public String getVehname() {
		return vehname;
	}

	public void setVehname(String vehname) {
		this.vehname = vehname;
	}

	public String getContactadd() {
		return contactadd;
	}

	public void setContactadd(String contactadd) {
		this.contactadd = contactadd;
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

	public String getPlatenum() {
		return platenum;
	}

	public void setPlatenum(String platenum) {
		this.platenum = platenum;
	}

	public String getCarmodel() {
		return carmodel;
	}

	public void setCarmodel(String carmodel) {
		this.carmodel = carmodel;
	}

	public String getMilage() {
		return milage;
	}

	public void setMilage(String milage) {
		this.milage = milage;
	}

	public String getInspectiondate() {
		return inspectiondate;
	}

	public void setInspectiondate(String inspectiondate) {
		this.inspectiondate = inspectiondate;
	}

	public String getVehflag() {
		return vehflag;
	}

	public void setVehflag(String vehflag) {
		this.vehflag = vehflag;
	}

}
