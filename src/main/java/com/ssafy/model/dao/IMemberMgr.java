package com.ssafy.model.dao;

import org.apache.ibatis.annotations.Mapper;
import com.ssafy.model.dto.Member;

@Mapper
public interface IMemberMgr {
	public void insert(Member member) throws Exception;

	public Member search(String id) throws Exception;

	public Member searchbyname(String name);

	public void update(Member member) throws Exception;

	public void remove(String id) throws Exception;

	public boolean login(String id, String pw) throws Exception;
}
