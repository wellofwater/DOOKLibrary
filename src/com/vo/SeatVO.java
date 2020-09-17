package com.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class SeatVO {
	private String id;
	private int occupy;
	
	public SeatVO() {
	}
	public SeatVO(String id, int occupy) {
		super();
		this.id = id;
		this.occupy = occupy;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getOccupy() {
		return occupy;
	}

	public void setOccupy(int occupy) {
		this.occupy = occupy;
	}
	@Override
	public String toString() {
		return "SeatVO [id=" + id + ", occupy=" + occupy + "]";
	}
	
}






