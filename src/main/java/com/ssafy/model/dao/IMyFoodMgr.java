package com.ssafy.model.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ssafy.model.dto.MyFood;

@Mapper
public interface IMyFoodMgr {
	public MyFood search(String id, int code) throws Exception;

	public List<MyFood> searchAll(String key, String word) throws Exception;
	
	public List<MyFood> searchDate(String id, int code, String date) throws Exception;

	public void insert(MyFood myfood) throws Exception;

	public void update(MyFood myfood) throws Exception;

	public void remove(String id, int code) throws Exception; 
}
