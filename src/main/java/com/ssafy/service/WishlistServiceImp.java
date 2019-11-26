package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.IWishlistMgr;
import com.ssafy.model.dto.SafefoodException;
import com.ssafy.model.dto.Wishlist;

@Service
public class WishlistServiceImp implements WishlistService {
	
	@Autowired
	private IWishlistMgr dao;
	
	
	@Override
	public void insert(Wishlist wishlist) {
		try {
			dao.insert(wishlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void delete(Wishlist wishlist) {
		try {
			dao.delete(wishlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Wishlist> search(String id) {
		try {
			System.out.println("WishlistServiceImp....."+id);
			
					List<Wishlist> find = dao.search(id);
					System.out.println("find....."+find);
					return find;
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("wish리스트에서 찾아오기 중 오류 발생ㅠㅠ");
		}
		
	}


}
