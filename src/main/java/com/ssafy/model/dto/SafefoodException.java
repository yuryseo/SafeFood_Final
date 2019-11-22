package com.ssafy.model.dto;

public class SafefoodException extends RuntimeException {
	public SafefoodException() {
		super(" 오류 발생");
	}
	public SafefoodException(String msg) {
		super(msg);
	}
}
