<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Myfood</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
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

<script type="text/javascript">
	function goDetail(foodcode) {
		location.href = "foodDetail.do?foodcode=" + foodcode;
	}
	function check(){
		if(confirm("정말 삭제 하시겠습니까?") == true)
			return true;
		return false;
	}
</script>

<link rel="stylesheet" href="calcss/calendar.css" media="screen">
<style type="text/css">
#wrapper {
	padding: 50px 0 0 325px;
}

#calendar {
	margin: 25px auto;
	width: 370px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="main.jsp" />
	<article id="contentArea">
		<br>
		<h2 align="center">날짜별 검색 섭취 식품 목록</h2>
			<div id="calendar"></div>
	
			<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
			<script src="js/jquery-ui-datepicker.min.js"></script>
			<script>
			
				$('#calendar').datepicker({
					inline : true,
					showOtherMonths : true,
					dateFormat: "yy-mm-dd",
					showAnim: "slide",
					currentText: "오늘",
					gotoCurrent: true,
					defaultDate: searchParam('date'),
					dayNamesMin : [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ],
				});
				
				$('#calendar').change(function (){
		            var date = $('#calendar').val();
					location.href = "myFoodList.do?date=" + date;
		        });
				
				function searchParam(key) {
			  		return new URLSearchParams(location.search).get(key);
				};
			</script>
		<br>
		<table id='listTable' align='center' width='80%'>
			<c:forEach items="${searchList}" var="searchMyFood">
				<form method="post" id="frm2">
					<input type="hidden" id="code" name="code" value="${searchMyFood.code}" />
					<tr id='listTableFistTr'>
						<td rowspan='4' width='20%'>
							<img src="${searchMyFood.img}"id="${searchMyFood.code}" name="${searchMyFood.code}" width="200px" height="200px" class="imgContent" onclick="goDetail(this.name);">
						</td>
						<td id="listTableFistTd" align="left">
							<b><font size='5px'>${searchMyFood.name}</font></b>
						</td>
					</tr>
					<tr>
						<td align='left'>
							<font size='4px'>섭취 수량 : </font>
							<input type="text" id="quantity" name="quantity" value="${searchMyFood.quantity}" />
						</td>
					</tr>
					<tr>
						<td align='left'>
							<font size='4px'>섭취 날짜 : </font>
							${searchMyFood.date}
							<input type="hidden" id="date" name="date" value="${searchMyFood.date}" />
						</td>
					</tr>
					<tr id='listTableLastTr'>
						<td align='left'>
							<input type="submit" formaction="myFoodUpdate.do" class='btn btn-info' value="수정" />
							<input type="submit" formaction="myFoodDelete.do" class='btn btn-info' value="삭제" onclick="return check()" />
						</td>
					</tr>
				</form>
			</c:forEach>
		</table>
		<hr>
		<h2 align="center">내 모든 섭취 식품 목록</h2>
		<table id='listTable' align='center' width='80%'>
			<c:forEach items="${list}" var="food">
				<form method="post" id="frm2">
					<input type="hidden" id="code" name="code" value="${food.code}" />
					<tr id='listTableFistTr'>
						<td rowspan='4' width='20%'>
							<img src="${food.img}"id="${food.code}" name="${food.code}" width="200px" height="200px" class="imgContent" onclick="goDetail(this.name);">
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
					<tr>
						<td align='left'>
							<font size='4px'>섭취 날짜 : </font>
							{food.date}
							<input type="hidden" id="date" name="date" value="${food.date}" />
						</td>
					</tr>
					<tr id='listTableLastTr'>
						<td align='left'>
							<input type="submit" formaction="myFoodUpdate.do" class='btn btn-info' value="수정" />
							<input type="submit" formaction="myFoodDelete.do" class='btn btn-info' value="삭제" onclick="return check()" />
						</td>
					</tr>
				</form>
			</c:forEach>
		</table>

	</article>
	<jsp:include page="copyright.jsp" />

	<script src="js/jquery.magnific-popup.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/gijgo.min.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>