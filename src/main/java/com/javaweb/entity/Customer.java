package com.javaweb.entity;

public class Customer {
    private Integer id;

    private String numbering;

    private String mailbox;

    private String contactinfo;

    private String contactadd;

    private String idcard;

    private String customerflag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumbering() {
        return numbering;
    }

    public void setNumbering(String numbering) {
        this.numbering = numbering == null ? null : numbering.trim();
    }

    public String getMailbox() {
        return mailbox;
    }

    public void setMailbox(String mailbox) {
        this.mailbox = mailbox == null ? null : mailbox.trim();
    }

    public String getContactinfo() {
        return contactinfo;
    }

    public void setContactinfo(String contactinfo) {
        this.contactinfo = contactinfo == null ? null : contactinfo.trim();
    }

    public String getContactadd() {
        return contactadd;
    }

    public void setContactadd(String contactadd) {
        this.contactadd = contactadd == null ? null : contactadd.trim();
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getCustomerflag() {
        return customerflag;
    }

    public void setCustomerflag(String customerflag) {
        this.customerflag = customerflag == null ? null : customerflag.trim();
    }
}