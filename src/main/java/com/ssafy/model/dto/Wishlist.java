package com.ssafy.model.dto;

public class Wishlist {
	/*
	 * wno int primary key auto_increment, userid varchar(15), code int
	 */
	int wno;
	String userid;
	int code;
	public Wishlist(int wno, String userid, int code) {
		this.wno = wno;
		this.userid = userid;
		this.code = code;
	}
	public Wishlist(String userid, int code) {
		this.userid = userid;
		this.code = code;
	}
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "Wishlist [wno=" + wno + ", userid=" + userid + ", code=" + code + "]";
	}
	
	
}
