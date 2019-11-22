<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
<title>MAIN</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
     <script type='text/javascript' src='js/jquery-3.3.1.js'></script>
     
</head>
<body>
	<input type="hidden" id="detailItem" value="">
	<section class="breadcrumb breadcrumb_bg">
		 <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>WHAT WE <b>PROVIDE</b></h2>
                            <p>건강한 삶을 위한 먹거리 프로젝트</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
	</section>
	<section id=''>
		 <form  method="get" action="foodList.do" id="frm">
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
					<td><button type="submit" class="btn btn-primary" id="searchBtn" name="searchBtn">검색</button></td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>