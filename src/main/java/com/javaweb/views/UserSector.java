package com.javaweb.views;

/**
 * 用户和部门的信息
 * @author cp
 *
 */
public class UserSector {
	
	// 部门的编号
	private String sectorid;
	
	// 部门的名称
	private String deptname;
	
	// 用户的编号
	private String userid;
	 
	// 用户的名称
	private String username;
	
	public String getSectorid() {
		return sectorid;
	}
	public void setSectorid(String sectorid) {
		this.sectorid = sectorid;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
}
