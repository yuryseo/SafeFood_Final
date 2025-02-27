<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FindId</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<style type="text/css">
	<style type="text/css">
	#table{
		margin : auto;
	}
	
	#jointable{
		width : 600px;
	}
	
	#jointable th{
		text-align : right;
		width : 70px
		
	}
	
	#jointable td{
		width : 500px;
	}
	
	#jointable{
		border-spacing: 10px;
		border-collapse: separate;
		border : solid 1px black;
		border-radius:10px;
	}
	
	#jointable input[type=text]{
		width : 400px;
		border-radius:6px;
	}
	
	#jointable input[type=password]{
		width : 400px;
		border-radius:6px;
	}
	

</style>

</head>
<body>
	<jsp:include page="header.jsp" />
	<section id='content'>
		<article id="contentArea">
			<form method="post" >
				<div id="table" align="center">
					<table id="jointable">
						<tr>
							<td><h3><b>아이디 찾기</b></h3></td>
						</tr>
					
						<tr>
							<th>이름</th>
							<td><input type="text" id="name" placeholder="User Name" name="name" value="${member.name }"></td>
						</tr>
						
						<tr>
							<th>전화번호 <font color="red"></font></th>
							<td><input type="text" id="phone" placeholder="010-xxxx-xxxx" name="phone" value="${member.phone }"></td>
						</tr>
						
						<tr>
						
							<td><input type="submit" class="btn btn-primary" formaction="idFind.do" value="아이디 찾기"/></td>
							<td><c:if test="${not empty mid}">
								<c:if test="${not empty member}">
								${member.name } 님의  id 는 <span style="color: blue;"> ${mid}</span> 입니다
								</c:if>
								</c:if> </td>
						</tr>
						<tr>
						</tr> 
						
						
					</table>
				</div>
			</form>
		</article>
	</section>
	<jsp:include page="copyright.jsp" />
	
</body>
</html>