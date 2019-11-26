package com.ssafy.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.model.dao.IFoodMgr;
import com.ssafy.model.dto.DuplicateException;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.InfoNotFoundException;
import com.ssafy.model.dto.SafefoodException;

@Service
public class FoodServiceImp implements FoodService {
	@Autowired
	private IFoodMgr dao;

	@Override
	public List<Food> All() throws Exception {
		try {
			List<Food> find = dao.All();
			return find;
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("All");
		}
	}

	@Override
	public List<Food> searchAll(String key, String word) {
		try {
			System.out.println("foodserviceImpl"+key+"    "+word);
			List<Food> find = dao.searchAll(key, word);
			return find;
		} catch (InfoNotFoundException e) {
			throw new InfoNotFoundException();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Food search(int code) {
		try {
			Food find = dao.search(code);
			if (find == null) {
				throw new InfoNotFoundException();
			} else {
				return find;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void add(Food food) {
		try {
			dao.add(food);
		} catch (DuplicateException e) {
			throw new DuplicateException();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void searchcount(int code)  {
		try {
			dao.searchcount(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void intakecount(int code) {
		try {
			dao.intakecount(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Food> intakecountTop4() {
		try {
			List<Food> find = dao.intakecountTop4();
			System.out.println("intakecountTop4");
			if (find == null) {
				throw new InfoNotFoundException();
			} else {
				for (int i = 0; i < find.size(); i++) {
					System.out.println("intakeTop4...."+find.get(i).getName());
				}
				return find;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Food> searchcountTop4() {
		try {
			List<Food> find = dao.searchcountTop4();
			
			if (find == null) {
				throw new InfoNotFoundException();
			} else {
				for (int i = 0; i < find.size(); i++) {
					System.out.println("searchTop4...."+find.get(i).getName());
				}
				return find;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
