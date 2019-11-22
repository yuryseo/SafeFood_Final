package com.ssafy.model.dto;

public class MyFood {
	String id;
	int code;
	int quantity;
	String date;
	String name;
	String img;

	public MyFood() {
		super();
	}

	public MyFood(String id, int code, int quantity) {
		this.id = id;
		this.code = code;
		this.quantity = quantity;
	}

	public MyFood(String id, int code, int quantity, String date) {
		this.id = id;
		this.code = code;
		this.quantity = quantity;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "MyFood [id=" + id + ", code=" + code + ", quantity=" + quantity + "]";
	}

}
