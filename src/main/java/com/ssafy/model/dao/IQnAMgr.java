package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Aboard;
import com.ssafy.model.dto.Qboard;


@Mapper
public interface IQnAMgr {
	
	
	public void insert(Qboard qboard) throws Exception;
	public void update(Qboard qboard)throws Exception;
	public void remove(int qno) throws Exception;
	public Qboard search(int qno) throws Exception;
	public List<Qboard> searchAll()throws Exception;
	
	public void insertAnswer(Aboard aboard)throws Exception;
	public void removeAnswer(int ano) throws Exception;
	public Aboard searchAnswer(int ano) throws Exception;
	public List<Aboard> searchAnswerAll(int qno) throws Exception;
	public void hitup(int qno)throws Exception;

}
