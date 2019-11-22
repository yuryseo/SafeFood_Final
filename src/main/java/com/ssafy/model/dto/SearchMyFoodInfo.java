package com.ssafy.model.dto;

public class SearchMyFoodInfo {
	private String id;
	private int code;

	public SearchMyFoodInfo() {
	}

	public SearchMyFoodInfo(String id, int code) {
		this.id = id;
		this.code = code;
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
		return "SearchMyFoodInfo [id=" + id + ", code=" + code + "]";
	}
}
