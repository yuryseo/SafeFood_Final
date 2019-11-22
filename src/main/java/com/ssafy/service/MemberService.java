package com.ssafy.service;

import com.ssafy.model.dto.Member;

public interface MemberService {
	public Member search(String id);

	public Member searchbyname(String name);

	public void insert(Member member);

	public void update(Member member);

	public void remove(String id);

	public boolean login(String id, String pw);
}
