package com.ssafy.model.dto;

public class SearchMyFoodInfo2 {
	/** 검색 조건 */
	private String key;
	/** 검색 단어 */
	private String word;
	private String id;
	private int code;
	private String date;

	public SearchMyFoodInfo2() {
	}

	public SearchMyFoodInfo2(String key, String word, String id, int code, String date) {
		this.key = key;
		this.word = word;
		this.id = id;
		this.code = code;
		this.date = date;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "SearchMyFoodInfo2 [key=" + key + ", word=" + word + ", id=" + id + ", code=" + code + ", date=" + date
				+ "]";
	}
}
