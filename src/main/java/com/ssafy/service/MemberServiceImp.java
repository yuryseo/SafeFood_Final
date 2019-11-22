package com.ssafy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.IMemberMgr;
import com.ssafy.model.dto.DuplicateException;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.InfoNotFoundException;
import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.SafefoodException;

@Service
public class MemberServiceImp implements MemberService {
	@Autowired
	private IMemberMgr mdao;

	@Override
	public boolean login(String id, String password) {
		try {
			System.out.println("service..."+id+password);
			Member member = mdao.search(id);
			System.out.println(member);
			if (member == null) {
				throw new InfoNotFoundException();
			} else {
				
				if (password.equals(member.getPassword())) {
					return true;
				} else {
					throw new SafefoodException("비밀 번호 오류");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("로그인 중 오류");
		}
	}

	@Override
	public Member search(String id) {
		try {
			Member member = mdao.search(id);
			if (member == null) {
				return null;
			} else {
				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("회원 조회 중 오류 발생");
		}
	}

	@Override
	public void insert(Member member) {
		try {
			System.out.println("#######member : " + member);
			Member find = mdao.search(member.getId());
			System.out.println("#######find : " + find);
			if (find != null) {
				throw new DuplicateException();
			} else {
				mdao.insert(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("회원 가입 중 오류 발생");
		}
	}

	@Override
	public void update(Member member) {
		try {
			Member find = mdao.search(member.getId());
			if (find == null) {
				throw new SafefoodException("수정할 회원 정보가 없습니다.");
			} else {
				mdao.update(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("회원 수정 중 오류 발생");
		}
	}

	@Override
	public void remove(String id) {
		try {
			Member find = mdao.search(id);
			if (find == null) {
				throw new SafefoodException("탈퇴할 회원 정보가 없습니다.");
			} else {
				mdao.remove(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("회원 탈퇴 중 오류 발생");
		}
	}

	public boolean checkID(String id) {
		try {
			Member member = mdao.search(id);
			if (member == null) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("회원 아이디 조회 중 오류 발생");
		}
	}

	public String getAllergyIngredients(Food food, String allergies) {
		if (allergies == null)
			return "";
		
		String[] ingredients = allergies.split(",");
		int size = ingredients.length;
		String answer = "";
		int cnt = 0;
		for (int i = 0; i < size; i++) {
			if (kmp(food.getName(), ingredients[i]) || kmp(food.getMaterial(), ingredients[i])) {
				cnt++;
				if (cnt != 1) {
					answer += ",";
				}
				answer += ingredients[i];
			}
		}
		return answer;
	}

	public boolean kmp(String origin, String allergy) {
		char[] T = origin.toCharArray();
		char[] P = allergy.toCharArray();
		int tLength = T.length, pLength = P.length;
		int[] fail = new int[pLength];

		for (int i = 1, j = 0; i < pLength; ++i) {
			while (j > 0 && P[i] != P[j])
				j = fail[j - 1];

			if (P[i] == P[j])
				fail[i] = ++j;
		}
		int cnt = 0;
		for (int i = 0, j = 0; i < tLength; ++i) {
			while (j > 0 && T[i] != P[j])
				j = fail[j - 1];
			if (T[i] == P[j]) {
				if (j == pLength - 1) {
					return true;
				} else {
					++j;
				}
			}
		}
		return false;
	}

	@Override
	public Member searchbyname(String name) {
		try {
			Member member = mdao.searchbyname(name);
			if (member == null) {
				return null;
			} else {
				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("회원 이름으로 찾기 중 오류 발생");
		}
	}
}
