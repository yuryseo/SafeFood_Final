package com.ssafy.service;

import java.util.List;

import com.ssafy.model.dto.Food;

public interface FoodService {
	public List<Food> searchAll(String key, String value);
	public List<Food> All() throws Exception;
	public Food search(int code);

	public void add(Food food);
}
