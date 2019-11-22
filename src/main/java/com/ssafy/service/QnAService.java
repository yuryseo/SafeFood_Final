package com.ssafy.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Aboard;
import com.ssafy.model.dto.Qboard;


@Mapper
public interface QnAService {
	
	
	public void insert(Qboard qboard) ;
	public void update(Qboard qboard);
	public void remove(int qno) ;
	public Qboard search(int qno) ;
	public List<Qboard> searchAll();
	
	public void insertAnswer(Aboard aboard) ;
	public void removeAnswer(int ano) throws Exception;
	public Aboard searchAnswer(int ano) ;
	public List<Aboard> searchAnswerAll(int qno) ;
	
	

}
