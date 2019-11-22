<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>FindPassword</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/index.css">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	
</script>
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
							<td colspan="2"  ><h3><b>비밀번호 찾기</b></h3></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" id="id" name="id" value="${member.id }">
							</td>
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
							<td><input type="submit" class="btn btn-primary" formaction="passwordFind.do" value="비밀번호 찾기"/></td>
							<td><c:if test="${not empty password}">
								<c:if test="${not empty member}">
								${member.name } 님의  비밀번호는 <span style="color: blue;"> ${password}</span> 입니다
								</c:if>
								</c:if> </td>
						</tr>
					</table>
				</div>
			</form>
		</article>
	</section>
	<jsp:include page="copyright.jsp" />
	
</body>
</html>