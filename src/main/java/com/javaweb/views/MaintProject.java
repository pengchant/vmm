package com.javaweb.views;

/**
 * 维修项目登记实体
 * 
 * @author cp
 *
 */
public class MaintProject {
	private String orderid;// 订单表的编号
	private String mainprojid;// 维修项目编号
	private String mainproj;// 维修项目
	private String mainprojcateid;// 维修项目类别编号
	private String mainprojcate;// 维修项目类别
	private String recpter;// 登记人
	private String regdatetime;// 登记时间
	private String totalhours;// 所用工时
	private String mainstatus;// 维修的状态
	private String haspassed;// 是否通过质检

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getMainprojid() {
		return mainprojid;
	}

	public void setMainprojid(String mainprojid) {
		this.mainprojid = mainprojid;
	}

	public String getMainproj() {
		return mainproj;
	}

	public void setMainproj(String mainproj) {
		this.mainproj = mainproj;
	}

	public String getMainprojcateid() {
		return mainprojcateid;
	}

	public void setMainprojcateid(String mainprojcateid) {
		this.mainprojcateid = mainprojcateid;
	}

	public String getMainprojcate() {
		return mainprojcate;
	}

	public void setMainprojcate(String mainprojcate) {
		this.mainprojcate = mainprojcate;
	}

	public String getRecpter() {
		return recpter;
	}

	public void setRecpter(String recpter) {
		this.recpter = recpter;
	}

	public String getRegdatetime() {
		return regdatetime;
	}

	public void setRegdatetime(String regdatetime) {
		this.regdatetime = regdatetime;
	}

	public String getTotalhours() {
		return totalhours;
	}

	public void setTotalhours(String totalhours) {
		this.totalhours = totalhours;
	}

	public String getMainstatus() {
		return mainstatus;
	}

	public void setMainstatus(String mainstatus) {
		this.mainstatus = mainstatus;
	}

	public String getHaspassed() {
		return haspassed;
	}

	public void setHaspassed(String haspassed) {
		this.haspassed = haspassed;
	}

}
