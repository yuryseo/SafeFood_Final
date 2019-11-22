<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEADER</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/index.css">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function goSignUp() {
		location.href="RegisterGo.do";
	}
	
	function goMemberInfo() {
		location.href="memberInfoGo.do";
	}
</script>
</head>
<body>
	<header>
		<div class="dropdown">
			<button type="button" id="loginBtn"
				class="btn btn-dark dropdown-toggle" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				<c:choose>
					<c:when test="${empty member.id}">─ Login</c:when>
					<c:otherwise>─ Logout</c:otherwise>
				</c:choose>
			</button>
			<div class="dropdown-menu dropdown-menu-right">
				<c:choose>
					<c:when test="${empty member.id}">
						<c:if test="${not empty cookie.id}">
				 		  	<c:set var="idSave"  value="value='${cookie.id.value}'"/>
				 		  	<c:set var="checked"  value="checked='checked'"/>
			 		 	</c:if>
						<form method="post" action="login.do">
							<table id="loginForm">
								<tr>
									<td colspan="2">Login</td>
								</tr>
								<tr>
									<td>아 이 디</td>
									<td><input class="form-control" type="text" name="id"></td>
								</tr>
								<tr>
									<td>비 밀 번 호</td>
									<td><input  class="form-control" type="password" name="password"></td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<input class="" name="idSave" type="checkbox" value="t" ${checked}>
										<label class="">Remember me</label>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="right">
										<a href="findIdGo.do" id="">아이디 찾기 </a> / <a href="findPasswordGo.do" class=""> 비밀번호 찾기 </a>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<button type="submit" class="btn btn-info">Login</button>
									</td>
								</tr>
							</table>
						</form>
					</c:when>
					<c:otherwise>
						<form method="post" action="logout.do">
							<table id="logoutForm">
								<tr>
									<td align="center">ID</td>
									<td>${member.id}</td>
								</tr>
								<tr>								
									<td align="center">NAME</td>
									<td>${member.name}</td>
								</tr>
								<tr>
									<td colspan="2">
										<button type="submit" class="btn btn-info">Logout</button>
									</td>
								</tr>
							</table>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
			<button type="button" class="btn btn-dark" id="signUpBtn" onclick="goSignUp();">┌ SignUp</button>
			<button type="button" class="btn btn-dark" id="MemberInfoBtn" onclick="goMemberInfo();">│ 회원정보</button>
		</div>
	</header>
	<section id='menubar'>
		<a href="index.jsp"><img id='logoIMG' src='img/header-logo.jpg'></a>
		<nav>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="foodList.do">상품정보</a></li>
				<c:if test="${not empty member.id}">
					<li><a href="#">베스트 섭취정보</a></li>
					<li><a href="myFoodList.do">내 섭취정보</a></li>
					<li><a href="#">예상 섭취정보</a></li>
					<li><a href="#">상품 DB 저장</a></li>
				</c:if>
				<li><a href="qna.do">QnA</a></li>
				<li><a href="#"><i class="fa fa-search"></i></a></li>
			</ul>
		</nav>
	</section>
</body>
</html>