<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    <title>SAFE FOOD</title>
    <link rel="icon" href="img/favicon.png">
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
	function goSignUp() {
		location.href = "RegisterGo.do";
	}

	function goMemberInfo() {
		location.href = "memberInfoGo.do";
	}
</script>
</head>
<body>

	<!--::section part start::-->
	<section class="main_menu">
		<div class="sub_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-sm-12 col-md-12">
						<div class="sub_menu_social_icon">
							헤더
							<button type="button" id="loginBtn"
								class="genric-btn success-border radius" data-toggle="dropdown"
								aria-labelledby="navbarDropdown" aria-haspopup="true" aria-expanded="true">
								<c:choose>
									<c:when test="${empty member.id}"> Login</c:when>
									<c:otherwise> Logout</c:otherwise>
								</c:choose>
							</button>
							<div class="dropdown-menu " aria-labelledby="navbarDropdown_1">
								<c:choose>
									<c:when test="${empty member.id}">
										<c:if test="${not empty cookie.id}">
											<c:set var="idSave" value="value='${cookie.id.value}'" />
											<c:set var="checked" value="checked='checked'" />
										</c:if>
										<form method="post" action="login.do">

											<div>
												<span class=" p-b-32"> Login </span>
											</div>
											<span class="txt1 p-b-11"> 아 이 디 </span>
											<div class=" m-b-36" data-validate="Username is required">
												<input class="input100" type="text" name="id" />
											</div>

											<span class="txt1 p-b-11"> 비 밀 번 호 </span>
											<div class=" m-b-12" data-validate="Password is required">
												<input class="input100" type="password" name="password" />
											</div>

											<div class="flex-sb-m w-full p-b-48">
												<div class="contact100-form-checkbox">
													<input class="input-checkbox100" id="ckb1" type="checkbox"
														name="remember-me" /> <label class="label-checkbox100"
														for="ckb1"> Remember me </label>
												</div>

												<div>
													<a href="findId.jsp" class="txt3"> 아이디 찾기 </a> <a href="#"
														class="txt3"> 비밀번호 찾기 </a>
												</div>
											</div>

											<button type="submit" class="btn btn-info">Login</button>


										</form>
									</c:when>
									<c:otherwise>
										<form method="post" action="logout.do">
											<table id="logoutForm">
												<tr>
													<td width="80" height="40"  align="center">ID</td>
													<td><b>${member.id}</b></td>
												</tr>
												<tr>
													<td width="80" height="40" align="center">NAME</td>
													<td><b>${member.name}</b></td>
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
							<button type="button" class="genric-btn success-border radius"
								id="signUpBtn" onclick="goSignUp();">SignUp</button>
							<button type="button" class="genric-btn success-border radius"
								id="MemberInfoBtn" onclick="goMemberInfo();">회원정보</button>

						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="main_menu_iner">
			<div class="container">
				<div class="row align-items-center ">
					<div class="col-lg-12">
						<nav
							class="navbar navbar-expand-lg navbar-light justify-content-between">
							<a class="navbar-brand" href="index.jsp"> <img id='logoIMG'
								src='img/header-logo.jpg' alt="logo">
							</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div
								class="collapse navbar-collapse main-menu-item justify-content-center"
								id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item"><a class="nav-link" href=#>공지사항</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="foodList.do">상품정보</a></li>
									<c:if test="${not empty member.id}">
										<li class="nav-item"><a class="nav-link" href="#">베스트
												섭취정보</a></li>
										<li class="nav-item"><a class="nav-link" href="#">어떤메뉴</a>
										</li>
										<li class="nav-item"><a class="nav-link"
											href="myFoodList.do">내 섭취정보</a></li>
									</c:if>
									<li class="nav-item"><a class="nav-link"
										href="#">QnA</a></li>
								

								</ul>
							</div>
							<!--   <a href="#" class="btn_1 d-none d-lg-block">book now</a> -->
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- section part end-->


</body>
</html>