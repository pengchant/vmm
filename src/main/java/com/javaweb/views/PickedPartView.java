package com.javaweb.views;

/**
 * 已经领取过的零件的视图
 * 
 * @author PengChan
 *
 */
public class PickedPartView {
	private String partid;
	private String partname;
	private String reciamount;
	private String recipients;
	private String recijobnum;
	private String contactinfo;
	private String recitime;

	public String getPartid() {
		return partid;
	}

	public void setPartid(String partid) {
		this.partid = partid;
	}

	public String getPartname() {
		return partname;
	}

	public void setPartname(String partname) {
		this.partname = partname;
	}

	public String getReciamount() {
		return reciamount;
	}

	public void setReciamount(String reciamount) {
		this.reciamount = reciamount;
	}

	public String getRecipients() {
		return recipients;
	}

	public void setRecipients(String recipients) {
		this.recipients = recipients;
	}

	public String getRecijobnum() {
		return recijobnum;
	}

	public void setRecijobnum(String recijobnum) {
		this.recijobnum = recijobnum;
	}

	public String getContactinfo() {
		return contactinfo;
	}

	public void setContactinfo(String contactinfo) {
		this.contactinfo = contactinfo;
	}

	public String getRecitime() {
		return recitime;
	}

	public void setRecitime(String recitime) {
		this.recitime = recitime;
	}

}
