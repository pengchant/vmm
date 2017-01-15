package com.javaweb.entity;

public class Account {
    private Integer id;

    private String accountnumber;

    private String passwords;

    private String accountflag;

    private Integer userinfoid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccountnumber() {
        return accountnumber;
    }

    public void setAccountnumber(String accountnumber) {
        this.accountnumber = accountnumber == null ? null : accountnumber.trim();
    }

    public String getPasswords() {
        return passwords;
    }

    public void setPasswords(String passwords) {
        this.passwords = passwords == null ? null : passwords.trim();
    }

    public String getAccountflag() {
        return accountflag;
    }

    public void setAccountflag(String accountflag) {
        this.accountflag = accountflag == null ? null : accountflag.trim();
    }

    public Integer getUserinfoid() {
        return userinfoid;
    }

    public void setUserinfoid(Integer userinfoid) {
        this.userinfoid = userinfoid;
    }
}