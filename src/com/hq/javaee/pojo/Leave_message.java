package com.hq.javaee.pojo;

import java.util.Date;

public class Leave_message {
    private Integer leavemessageid;

    private Integer leavemessagepersonid;

    private Integer userid;

    private String leavemessagecontent;

    private Date leavemessagetime;

    public Integer getLeavemessageid() {
        return leavemessageid;
    }

    public void setLeavemessageid(Integer leavemessageid) {
        this.leavemessageid = leavemessageid;
    }

    public Integer getLeavemessagepersonid() {
        return leavemessagepersonid;
    }

    public void setLeavemessagepersonid(Integer leavemessagepersonid) {
        this.leavemessagepersonid = leavemessagepersonid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getLeavemessagecontent() {
        return leavemessagecontent;
    }

    public void setLeavemessagecontent(String leavemessagecontent) {
        this.leavemessagecontent = leavemessagecontent == null ? null : leavemessagecontent.trim();
    }

    public Date getLeavemessagetime() {
        return leavemessagetime;
    }

    public void setLeavemessagetime(Date leavemessagetime) {
        this.leavemessagetime = leavemessagetime;
    }
}