<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/index.css">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
function goDetail(foodcode){
	location.href="foodDetail.do?foodcode=" + foodcode;
}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
		<section id='content'>
			<section id='intro'>
			<div id='introFirstComment'>
				<font>WHAT WE <b>PROVIDE</b></font>
			</div>
			<div>
				건강한 삶을 위한 먹거리 프로젝트
			</div>
		</section>
		<section id='searchForm'>
			<form method="get" action="myFoodList.do" id="frm">
				<table align="center">
					<tr>
						<td>정렬</td>
						<td>검색 조건</td>
						<td>검색 단어</td>
						<td></td>
					</tr>
					<tr>
						<td><select class="form-control" id="sortOption" name="sortOption">
								<option id="sortName" value="sortName">상품명순</option>
								<option id="sortMaker" value="sortMaker">브랜드순</option>
						</select></td>
						<td><select class="form-control" id="searchOption" name="searchOption">
								<option id="all" value="all">선택</option>
								<option id="searchName" value="searchName">상품명</option>
								<option id="searchMaker" value="searchMaker">제조사</option>
								<option id="searchMaterial" value="searchMaterial">첨가재료</option>
								<option id="searcEtc" value="searcEtc">기타</option>
						</select></td>
						<td><input type="text" class="form-control" id="searchItem" name="searchItem"></td>
						<td><button type="submit" class="btn btn-primary" id="searchBtn" name="searchBtn">섭취식품 검색</button></td>
					</tr>
				</table>
			</form>
		</section>
		<article id="contentArea">
			<h2>내 섭취 식품 목록</h2>
			<table id='listTable' align='center' width='80%'>
				<c:forEach items="${list}" var="food">
					<form method="post" id="frm2">
					<input type="hidden" id="code" name="code" value="${food.code}" />
					<tr id='listTableFistTr'>
						<td rowspan='3' width='20%'>
							<img src="${food.img}" id="${food.code}" name="${food.code}" width="200px" height="200px" class="imgContent" onclick="goDetail(this.name);")>
						</td>
						<td id="listTableFistTd" align="left">
							<b><font size='5px'>${food.name}</font></b>
						</td>
					</tr>
					<tr>
						<td align='left'>
							<font size='4px'>섭취 수량 : </font>
							<input type="text" id="quantity" name="quantity" value="${food.quantity}" />
						</td>
					</tr>
					<tr id='listTableLastTr'>
						<td align='left'>
							<input type="submit" formaction="myFoodUpdate.do" class='btn btn-info' value="수정"/>
							<input type="submit" formaction="myFoodDelete.do" class='btn btn-info' value="삭제"/>
						</td>
					</tr>
					</form>
				</c:forEach>
			</table>
		
		</article>
	</section>
	<jsp:include page="copyright.jsp" />
</body>
</html>