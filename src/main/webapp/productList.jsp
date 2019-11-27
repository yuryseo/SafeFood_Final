<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/gijgo.min.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/index.css">

<title>PRODUCT LIST</title>

<script type="text/javascript">
function goDetail(foodcode){
	location.href="foodDetail.do?foodcode=" + foodcode;
}
function goAteFood(flag, flag2) {
	if(flag){
		alert("로그인이 필요한 기능입니다.");
		return false;
	}
	if(!flag2){
		if(confirm("알러지 성분이 있는 식품입니다! 섭취하시겠습니까?") == true)
			return true;
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="main.jsp" />
	<section id='content'>
		<article id="contentArea">
			<br>
			<h2 align="center">상품 목록</h2>
			<table id='listTable' align='center' width='80%'>
				<c:forEach items="${list}" var="food">
				<form method='post' action="addwishlist.do">
				<input type="hidden" name="code" value="${food.code}" />
					<tr id='listTableFistTr'>
						<td rowspan='5' width='20%'>
							<img src="${food.img}" id="${food.code}" name="${food.code}" width="260px" height="260px" class="imgContent" onclick="goDetail(this.name);")>
						</td>
						<td id="listTableFistTd" align="left">
							<b><font size='5px'>${food.name}</font></b>
						</td>
					</tr>
					<tr>
						<td align='left'>
							<font size='4px'>제조사 : ${food.maker}</font>
						</td>
					</tr>
					<tr>
						<td align='left'>
							<a href='#'><i class='fa fa-calendar'></i> Feb, 2007</a>&nbsp;&nbsp;&nbsp;
							<a href='#'><i class='fa fa-tag'></i> Web Design</a><hr>
						</td>
					</tr>
					<tr>
						<td align='left' height="80%">${food.material}</td>
					</tr>
					<tr id='listTableLastTr'>
						<td align='left'>
							<%-- <button type='button' class='btn btn-info' name="${food.code}" onclick="goDetail(this.name);">
							<i class='fa fa-plus'></i> 추가</button> --%>
							<button type='submit' class='btn btn-info'  onclick="return goAteFood(${empty member.id}, ${empty allergyIngredients});">
							<i class='fa fa-star'></i> 찜</button>
						</td>
					</tr>
					</form>
				</c:forEach>
			</table>
		</article>
	</section>
	<jsp:include page="copyright.jsp" />
	
	<script src="js/jquery.magnific-popup.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/gijgo.min.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>