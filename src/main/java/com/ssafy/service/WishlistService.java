package com.ssafy.service;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Wishlist;

@Mapper
public interface WishlistService {
	public void insert(Wishlist wishlist);
	public void delete(Wishlist wishlist);
	public List<Wishlist> search(String id);
}
