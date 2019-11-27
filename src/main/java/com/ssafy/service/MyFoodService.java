package com.ssafy.service;

import java.util.List;
import com.ssafy.model.dto.MyFood;

public interface MyFoodService {
	public MyFood search(String id, int code);

	public List<MyFood> searchAll(String key, String word);

	public void insert(MyFood myfood);

	public void update(MyFood myfood);

	public void delete(String id, int code);
}
