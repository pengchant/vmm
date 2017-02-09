package com.javaweb.views;

/**
 * login的bean
 * @author cp
 *
 */
public class LoginBean {
	private String accountnumber;
	private String passwords;
	private String accountflag;
	private String username;
	private String jobnumber;
	private String sectorid;
	private String deptname;
	private String userinfoid;
	
	

	public String getUserinfoid() {
		return userinfoid;
	}

	public void setUserinfoid(String userinfoid) {
		this.userinfoid = userinfoid;
	}

	public String getAccountnumber() {
		return accountnumber;
	}

	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}

	public String getPasswords() {
		return passwords;
	}

	public void setPasswords(String passwords) {
		this.passwords = passwords;
	}

	public String getAccountflag() {
		return accountflag;
	}

	public void setAccountflag(String accountflag) {
		this.accountflag = accountflag;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getJobnumber() {
		return jobnumber;
	}

	public void setJobnumber(String jobnumber) {
		this.jobnumber = jobnumber;
	}

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

}
