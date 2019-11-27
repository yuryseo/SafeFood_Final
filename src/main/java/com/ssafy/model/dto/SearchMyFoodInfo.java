package com.ssafy.model.dto;

public class SearchMyFoodInfo {
	private String id;
	private int code;
	private String date;

	public SearchMyFoodInfo() {
	}

	public SearchMyFoodInfo(String id, int code) {
		this.id = id;
		this.code = code;
	}

	public SearchMyFoodInfo(String id, int code, String date) {
		super();
		this.id = id;
		this.code = code;
		this.date = date;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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
		return "SearchMyFoodInfo [id=" + id + ", code=" + code + ", date=" + date + "]";
	}

}
