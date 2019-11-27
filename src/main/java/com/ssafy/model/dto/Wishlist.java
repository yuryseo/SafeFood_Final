package com.ssafy.model.dto;

public class Wishlist {
	/*
	 * wno int primary key auto_increment, userid varchar(15), code int
	 */
	int wno;
	String id;
	int code;
	public Wishlist(int wno, String id, int code) {
		this.wno = wno;
		this.id = id;
		this.code = code;
	}
	public Wishlist(String id, int code) {
		this.id = id;
		this.code = code;
	}
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "Wishlist [wno=" + wno + ", id=" + id + ", code=" + code + "]";
	}

	
}
