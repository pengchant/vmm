package com.javaweb.views;
 
import org.apache.commons.lang.StringUtils;

/**
 * 导出excel的数据
 * 
 * @author cp
 *
 */
public class PartProcEXCELView{
	 
	private String partname;
	private String partcategory;
	private String suppliername;
	private String pruchdemand;
	private String createtime; 
	private String phone;
	private String contacts;
	private String contactInfo;
	private String address;
	private String mailbox;
	private String fax;
	private String purchstatus;
	private String prucher; 
	private String pruchprice;
	private String totalpurchase;
	
	
	
	public String getPrucher() {
		return prucher;
	}

	public void setPrucher(String prucher) {
		this.prucher = prucher;
	} 

	public String getPruchprice() {
		return pruchprice;
	}

	public void setPruchprice(String pruchprice) {
		this.pruchprice = pruchprice;
	}

	public String getTotalpurchase() {
		return totalpurchase;
	}

	public void setTotalpurchase(String totalpurchase) {
		this.totalpurchase = totalpurchase;
	}

	public PartProcEXCELView() {
		 
	}
	
	public PartProcEXCELView(PartProcView partProcView) {
		 this.setPartname(partProcView.getPartname());
		 this.setPartcategory(partProcView.getPartcategory());
		 this.setSuppliername(partProcView.getSuppliername());
		 this.setPruchdemand("0".equals(partProcView.getPurchstatus())?"":partProcView.getPruchdemand());
		 this.setCreatetime(partProcView.getCreatetime());
		 this.setPurchstatus((StringUtils.equals("0", partProcView.getPurchstatus())?"待采购":"已经采购"));
		 this.setPhone(partProcView.getPhone());
		 this.setContacts(partProcView.getContacts());
		 this.setContactInfo(partProcView.getContactInfo());
		 this.setAddress(partProcView.getAddress());
		 this.setMailbox(partProcView.getMailbox());
		 this.setFax(partProcView.getFax());
		 this.setPrucher(partProcView.getPrucher()==null?"":partProcView.getPrucher()); 
		 this.setPruchprice(partProcView.getPruchprice()==null?"":partProcView.getPruchprice());
		 this.setTotalpurchase(partProcView.getTotalpurchase()==null?"":partProcView.getTotalpurchase());
	}

	public String getPartname() {
		return partname;
	}

	public void setPartname(String partname) {
		this.partname = partname;
	}

	public String getPartcategory() {
		return partcategory;
	}

	public void setPartcategory(String partcategory) {
		this.partcategory = partcategory;
	}

	public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public String getPruchdemand() {
		return pruchdemand;
	}

	public void setPruchdemand(String pruchdemand) {
		this.pruchdemand = pruchdemand;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getPurchstatus() {
		return purchstatus;
	}

	public void setPurchstatus(String purchstatus) {
		this.purchstatus = purchstatus;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getContactInfo() {
		return contactInfo;
	}

	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMailbox() {
		return mailbox;
	}

	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

}
