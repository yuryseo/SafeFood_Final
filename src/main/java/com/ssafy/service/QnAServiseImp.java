package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.IQnAMgr;
import com.ssafy.model.dto.Aboard;
import com.ssafy.model.dto.InfoNotFoundException;
import com.ssafy.model.dto.SafefoodException;
import com.ssafy.model.dto.Qboard;

@Service
public class QnAServiseImp implements QnAService {
	@Autowired
	private IQnAMgr dao;

	@Override
	public void insert(Qboard qboard) {
		try {
			System.out.println("Qboard insert...." + qboard);
			dao.insert(qboard);

		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("Qboard 추가 중 오류발생");
		}

	}

	@Override
	public void update(Qboard qboard) {
		try {
			System.out.println("Qboard update...." + qboard);
			dao.update(qboard);

		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("Qboard 수정 중 오류발생");

		}

	}

	@Override
	public void remove(int qno) {
		try {
			System.out.println("Qboard remove...." + qno);
			Qboard find = dao.search(qno);
			if (find == null) {
				throw new InfoNotFoundException();
			} else {
				dao.remove(qno);
				System.out.println(" Question removed");
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("Qboard 수정 중 오류발생");
		}
	}

	@Override
	public Qboard search(int qno) {
		try {
			System.out.println("Qboard search...." + qno);
			Qboard find = dao.search(qno);
			if (find == null) {
				throw new InfoNotFoundException();
			} else {
				return find;
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("Qboard 조회 중 오류발생");
		}
	}

	@Override
	public List<Qboard> searchAll() {
		try {
			System.out.println("Qboard searchall....");
			List<Qboard> find = dao.searchAll();
			if (find == null) {
				throw new InfoNotFoundException();
			} else {
				return find;
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("Qboard List 조회 중 오류발생");
		}
	}

	@Override
	public void insertAnswer(Aboard aboard) {
		try {
			System.out.println("Aboard insertAnswer.........");
			dao.insertAnswer(aboard);

		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("insertAnswer 중 오류발생");
		}

	}

	@Override
	public void removeAnswer(int ano) {
		try {
			System.out.println("Aboard removeAnswer........." + ano);
			Aboard find = dao.searchAnswer(ano);
			if (find == null) {
				throw new InfoNotFoundException();
			} else {
				dao.removeAnswer(ano);
				System.out.println("answer removed");
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("removeAnswer 중 오류 발생");
		}

	}

	public Aboard searchAnswer(int ano) {
		try {
			System.out.println("Aboard search...." + ano);
			return dao.searchAnswer(ano);

		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("Aboard 조회 중 오류발생");
		}

	}

	@Override
	public List<Aboard> searchAnswerAll(int qno) {
		try {
			System.out.println("Aboard List.........");
			List<Aboard> find = dao.searchAnswerAll(qno);
			if (find != null) {
				return find;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("Aboard List 조회 중 오류발생");
		}
	}

	@Override
	public void hitup(int qno) {
		try {
			System.out.println("Qboard hitup...." + qno);
			Qboard find = dao.search(qno);
			if (find == null) {
				throw new InfoNotFoundException();
			} else {
				dao.hitup(qno);
				System.out.println(" Question hitup");
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("조회수 추가 중 오류 발생");
		}
	}

}
