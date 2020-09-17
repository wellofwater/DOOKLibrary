package com.vo;

import java.util.Date;

public class UseSeatVO {
	private int id;
	private String userid;
	private String sid;
	private Date intime;
	private Date outtime;
	public UseSeatVO() {
	}
	public UseSeatVO(String userid, String sid) {
		this.userid = userid;
		this.sid = sid;
	}
	public UseSeatVO(int id, String userid, String sid, Date intime) {
		super();
		this.id = id;
		this.userid = userid;
		this.sid = sid;
		this.intime = intime;
	}
	public UseSeatVO(int id, String userid, String sid, Date intime, Date outtime) {
		super();
		this.id = id;
		this.userid = userid;
		this.sid = sid;
		this.intime = intime;
		this.outtime = outtime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public Date getIntime() {
		return intime;
	}
	public void setIntime(Date intime) {
		this.intime = intime;
	}
	public Date getOuttime() {
		return outtime;
	}
	public void setOuttime(Date outtime) {
		this.outtime = outtime;
	}
	@Override
	public String toString() {
		return "UseSeatVO [id=" + id + ", userid=" + userid + ", sid=" + sid + ", intime=" + intime + ", outtime="
				+ outtime + "]";
	}
	
}






