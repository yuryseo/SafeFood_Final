package com.ssafy.model.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ssafy.model.dto.Food;

@Mapper
public interface IFoodMgr {
	public List<Food> searchAll(String key, String value);
	public List<Food> All() throws Exception;
	public Food search(int code);

	public void add(Food food);

	public void searchcount(int code) ;
	public void intakecount(int code) ;
	
	public List<Food> intakecountTop4();
	public List<Food> searchcountTop4();
}
