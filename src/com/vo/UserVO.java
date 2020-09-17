package com.vo;

public class UserVO{
	private String id;
	private String pwd;
	private String name;
	private int position;
	public UserVO() {
	}
	public UserVO(String id, String pwd, String name, int position) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.position = position;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", position=" + position + "]";
	}
	
}
