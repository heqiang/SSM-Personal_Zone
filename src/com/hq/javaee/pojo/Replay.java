package com.hq.javaee.pojo;

import java.util.Date;

public class Replay {
    private Integer relayid;

    private Integer commentid;

    private String replayname;

    private String replaycontetnt;

    private Date replaytime;

    public Integer getRelayid() {
        return relayid;
    }

    public void setRelayid(Integer relayid) {
        this.relayid = relayid;
    }

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public String getReplayname() {
        return replayname;
    }

    public void setReplayname(String replayname) {
        this.replayname = replayname == null ? null : replayname.trim();
    }

    public String getReplaycontetnt() {
        return replaycontetnt;
    }

    public void setReplaycontetnt(String replaycontetnt) {
        this.replaycontetnt = replaycontetnt == null ? null : replaycontetnt.trim();
    }

    public Date getReplaytime() {
        return replaytime;
    }

    public void setReplaytime(Date replaytime) {
        this.replaytime = replaytime;
    }
}