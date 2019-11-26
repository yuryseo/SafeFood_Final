package com.ssafy.service;

import java.util.List;

import com.ssafy.model.dto.Food;

public interface FoodService {
	public List<Food> searchAll(String key, String value);
	public List<Food> All() throws Exception;
	public Food search(int code);

	public void add(Food food);

	public void searchcount(int code) ;
	public void intakecount(int code) ;
	public List<Food> intakecountTop4();
	public List<Food> searchcountTop4();
}
