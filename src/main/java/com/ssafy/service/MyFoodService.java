package com.ssafy.service;

import java.util.List;
import com.ssafy.model.dto.MyFood;

public interface MyFoodService {
	public MyFood search(String id, int code, String date);

	public List<MyFood> searchAll(String key, String word);
	
	public List<MyFood> searchDate(String id, int code, String date);

	public void insert(MyFood myfood);

	public void update(MyFood myfood);

	public void remove(String id, int code, String date);
}
