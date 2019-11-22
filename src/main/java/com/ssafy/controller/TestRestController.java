package com.ssafy.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Member;
import com.ssafy.service.FoodServiceImp;
import com.ssafy.service.MemberServiceImp;
import com.ssafy.service.MyFoodServiceImp;
import com.ssafy.service.QnAServiseImp;

import io.swagger.annotations.ApiOperation;

/**
 * @RestController : REST Ful 서비스를 위한 컨트롤러로 @ResponseBody 어노테이션을 쓰지 않아도 쓴 효과를 냄
 */
@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
public class TestRestController {
	@Autowired
	private FoodServiceImp foodservice;
	@Autowired
	private MyFoodServiceImp myfoodservice;
	@Autowired
	private MemberServiceImp memberservice;
	@Autowired
	private QnAServiseImp qnaservice;
	@ExceptionHandler
	public ResponseEntity<Map<String, Object>> handleException(Exception e) {
		return handleFail(e.getMessage(), HttpStatus.OK);
	}

	public ResponseEntity<Map<String, Object>> handleSuccess(Object data) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "ok");
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}

	public ResponseEntity<Map<String, Object>> handleFail(Object data, HttpStatus state) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "fail");
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, state);
	}

	@ApiOperation("전체 safefood 목록 조회") // swagger에 추가하는 annotation
	@GetMapping("/safefood")
	public ResponseEntity<Map<String, Object>> safefoodsearchAll() {
		String key = "all";
		String value = "";
		List<Food> list = foodservice.searchAll(key, value);
		System.out.println(memberservice.search("ssafy").toString());
		return handleSuccess(memberservice.search("ssafy"));
	}

	/*
	 * @ApiOperation("safefood 모델명으로 조회") // swagger에 추가하는 annotation
	 * 
	 * @GetMapping("/safefood/{num}") public ResponseEntity<Map<String, Object>>
	 * phone(@PathVariable String num) { return handleSuccess(service.search(num));
	 * }
	 * 
	 * @ApiOperation("safefood 정보 등록") // swagger에 추가하는 annotation
	 * 
	 * @PostMapping("/safefood") public ResponseEntity<Map<String, Object>>
	 * insert(@RequestBody Phone p) { service.insert(p); return
	 * handleSuccess("등록 완료"); }
	 * 
	 * @ApiOperation("safefood 정보 수정") // swagger에 추가하는 annotation
	 * 
	 * @PutMapping("/safefood") public ResponseEntity<Map<String, Object>>
	 * update(@RequestBody Phone p) { service.update(p); return
	 * handleSuccess("수정 완료"); }
	 * 
	 * @ApiOperation("safefood 정보 삭제") // swagger에 추가하는 annotation
	 * 
	 * @DeleteMapping("/safefood/{num}") public ResponseEntity<Map<String, Object>>
	 * delete(@PathVariable String num) { service.delete2(Arrays.asList(num));
	 * return handleSuccess("삭제 완료"); }
	 */
	
}
