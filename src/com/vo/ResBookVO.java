package com.vo;

import java.util.Date;

public class ResBookVO {
	private int id;
	private String userid;
	private String bookid;
	private Date brdate;
	private Date rtdate;
	private Date duedate;
	private String state;
	
	public ResBookVO() {
		super();
	}

	public ResBookVO(int id, String userid, String bookid, Date brdate, Date rtdate, Date duedate, String state) {
		super();
		this.id = id;
		this.userid = userid;
		this.bookid = bookid;
		this.brdate = brdate;
		this.rtdate = rtdate;
		this.duedate = duedate;
		this.state = state;
	}
	
	

	public ResBookVO(String userid, String bookid, String state) {
		super();
		this.userid = userid;
		this.bookid = bookid;
		this.state = state;
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

	public String getBookid() {
		return bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	public Date getBrdate() {
		return brdate;
	}

	public void setBrdate(Date brdate) {
		this.brdate = brdate;
	}

	public Date getRtdate() {
		return rtdate;
	}

	public void setRtdate(Date rtdate) {
		this.rtdate = rtdate;
	}

	public Date getDuedate() {
		return duedate;
	}

	public void setDuedate(Date duedate) {
		this.duedate = duedate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "ResBookVO [id=" + id + ", userid=" + userid + ", bookid=" + bookid + ", brdate=" + brdate + ", rtdate="
				+ rtdate + ", duedate=" + duedate + ", state=" + state + "]";
	}
	
	
	
	
	
	
	
	
}






