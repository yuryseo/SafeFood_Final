package com.ssafy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Aboard;
import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.Qboard;
import com.ssafy.service.QnAServiseImp;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@Api("QnA Rest API")
public class QnaController {

	@Autowired
	private QnAServiseImp qnaservice;

	@ExceptionHandler
	public ResponseEntity<Map<String, Object>> handle(Exception e){
		return handleFail(e.getMessage(),HttpStatus.OK);
	}
	public ResponseEntity<Map<String, Object>> handleSuccess(Object data) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "ok");
		resultMap.put("data",data);
		return new ResponseEntity<Map<String,Object>>(resultMap,HttpStatus.OK);
	}
	public ResponseEntity<Map<String, Object>> handleFail(Object data,HttpStatus state) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "fail");
		resultMap.put("data",data);
		return new ResponseEntity<Map<String,Object>>(resultMap,state);
	}

	@PostMapping("/qna/insertQuestion")
	@ApiOperation("새로운 QnA 질문 등록")
	public ResponseEntity<Map<String, Object>> insertQuestion(@RequestBody Qboard qboard) {
		qnaservice.insert(qboard);;
		System.out.println(qboard);
		return handleSuccess(qboard.getQno()+"");
	}
	
	@PutMapping("/qna/updateQuestion")
	@ApiOperation("질문 수정")
	public ResponseEntity<Map<String, Object>> updateQuestion(@RequestBody Qboard qboard) {
		qnaservice.update(qboard);
		System.out.println(qboard);
		return handleSuccess("수정 완료");
	}
	
	@DeleteMapping("/qna/deleteQuestion/{qno}")
	@ApiOperation("질문 삭제")
	public ResponseEntity<Map<String, Object>> deleteEmployee(@PathVariable int qno) {
		System.out.println(qnaservice.search(qno));
		qnaservice.remove(qno);
		return handleSuccess("삭제 완료");
	}


	@GetMapping("/qna/searchQuestion/{qno}")
	@ApiOperation("qno 에 맞는 Qboard를 찾아서 반환,  상세페이지에 보여주기 위해서")
	public ResponseEntity<Map<String, Object>> searchQuestion(@PathVariable int qno) {
		
		System.out.println(qnaservice.search(qno));
		return handleSuccess(qnaservice.search(qno));
	}
	
	@GetMapping("/qna/searchAll")
	@ApiOperation("QnA 질문 리스트 반환, QnA 메인페이지")
	public ResponseEntity<Map<String, Object>> searchAll() {
		System.out.println("searchAll..........");
		return handleSuccess(qnaservice.searchAll());
	}
	
	@PostMapping("/qna/insertAnswer")
	@ApiOperation("새로운 QnA 답변 등록")
	public ResponseEntity<Map<String, Object>> insertAnswer(@RequestBody Aboard aboard) {
		qnaservice.insertAnswer(aboard);
		return handleSuccess(aboard.getQno()+" "+aboard.getAno());
	}
	
	
	@DeleteMapping("/qna/deleteAnswer/{ano}")
	@ApiOperation(" 답변 삭제")
	public ResponseEntity<Map<String, Object>> deleteAnswer(@PathVariable int ano) {
		qnaservice.removeAnswer(ano);
		return handleSuccess("삭제 완료");
	}
	
	@GetMapping("/qna/searchAnswerAll/{qno}")
	@ApiOperation("QnA 답변 리스트 반환, QnA상세 페이지")
	public ResponseEntity<Map<String, Object>> searchAnswerAll(@PathVariable int qno) {
		return handleSuccess(qnaservice.searchAnswerAll(qno));
	}
	
	
	@GetMapping("/qna/searchAnswer/{ano}")
	@ApiOperation("QnA 답변 리스트 반환 , ano")
	public ResponseEntity<Map<String, Object>> searchAnswer(@PathVariable int ano) {
		return handleSuccess(qnaservice.searchAnswer(ano));
	}
	
	@PutMapping("/qna/hitup/{qno}")
	@ApiOperation("QnA 조회수 +1")
	public ResponseEntity<Map<String, Object>> hitup(@PathVariable int qno) {
		System.out.println("Asdasdasdasdasda" + qno);
		qnaservice.hitup(qno);
		return handleSuccess("수정 완료");
	}
	
	@GetMapping("getLoginInfo.do")
	public Map getLoginInfo(HttpSession session) {
		Map<String, Member> loginInfo = new HashMap<String, Member>();
		Member m = (Member) session.getAttribute("member");
		System.out.println(m);
		if(m != null) {
			loginInfo.put("data", m);
		}else {
			Member tempM = new Member("", "", "", "", "", "", "");
			loginInfo.put("data", tempM);			
		}
		return loginInfo;
	}
}
