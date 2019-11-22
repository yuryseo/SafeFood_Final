package com.ssafy.model.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ssafy.model.dto.Food;

@Mapper
public interface IFoodMgr {
	public void add(Food food) throws Exception;

	public List<Food> searchAll(String key, String word) throws Exception;
	public List<Food> All() throws Exception;

	public Food search(int code) throws Exception;
}
