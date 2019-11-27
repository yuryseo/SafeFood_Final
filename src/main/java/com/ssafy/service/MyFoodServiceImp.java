package com.ssafy.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.model.dao.IMyFoodMgr;
import com.ssafy.model.dto.DuplicateException;
import com.ssafy.model.dto.InfoNotFoundException;
import com.ssafy.model.dto.MyFood;

@Service
public class MyFoodServiceImp implements MyFoodService {
	@Autowired
	private IMyFoodMgr dao;

	@Override
	public MyFood search(String id, int code, String date) {
		try {
			MyFood find = dao.search(id, code, date);
			return find;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<MyFood> searchAll(String key, String word) {
		try {
			List<MyFood> find = dao.searchAll(key, word);
			return find;
		} catch (InfoNotFoundException e) {
			throw new InfoNotFoundException();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insert(MyFood myfood) {
		try {
			MyFood find = dao.search(myfood.getId(), myfood.getCode(), myfood.getDate());
			dao.insert(myfood);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(MyFood myfood) {
		try {
			dao.update(myfood);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void remove(String id, int code, String date) {
		try {
			dao.remove(id, code, date);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<MyFood> searchDate(String id, int code, String date) {
		try {
			List<MyFood> find = dao.searchDate(id, code, date);
			return find;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
