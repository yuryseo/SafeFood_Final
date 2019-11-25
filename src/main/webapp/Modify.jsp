<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODIFY</title>
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
							<th><h3>회원 정보</h3></th>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" id="id" name="id" value="${member.id }">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="password" placeholder="영문 숫자 포함 6자리 이상" value="${member.password }"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" id="name" placeholder="User Name" name="name" value="${member.name }"></td>
						</tr>
						<tr>
							<th>주소 <font color="red"></font></th>
							<td><input type="text" id="address" placeholder="address" name="address" value="${member.address }"></td>
						</tr>
						<tr>
							<th>전화번호 <font color="red"></font></th>
							<td><input type="text" id="phone" placeholder="010-xxxx-xxxx" name="phone" value="${member.phone }"></td>
						</tr>
						<tr>
							<th>알레르기 <font color="red"></font></th>
							<td>
								<fieldset id="allegebox"
									style="width: 400px; border: solid 1px black;">
									<legend style="width: auto">
										<font size="4em">Check</font>
									</legend>
									<input id="bean" type="checkbox" name="allergy"
										<c:if test="${fn:contains(member.allergy,'대두')}">
                            			checked
                           				</c:if> value="대두"/><label>대두</label>
									<input id="peanut" type="checkbox" name="allergy" 
										<c:if test="${fn:contains(member.allergy,'땅콩')}">
                            			checked
                           				</c:if> value="땅콩"/><label>땅콩</label>
									<input id="milk" type="checkbox" name="allergy" 
										<c:if test="${fn:contains(member.allergy,'우유')}">
                            			checked
                           				</c:if>value="우유"/><label>우유</label>
									<input id="crab" type="checkbox" name="allergy" 
										<c:if test="${fn:contains(member.allergy,'게')}">
                            			checked
                           				</c:if>value="게"/><label>게</label><br />
									<input id="shrimp" type="checkbox" name="allergy"
										<c:if test="${fn:contains(member.allergy,'새우')}">
                            			checked
                           				</c:if>value="새우"/><label>새우</label>
									<input id="tuna" type="checkbox" name="allergy" 
										<c:if test="${fn:contains(member.allergy,'참치')}">
                            			checked
                           				</c:if>value="참치"/><label>참치</label>
									<input id="salmon" type="checkbox" name="allergy"
										<c:if test="${fn:contains(member.allergy,'연어')}">
                            			checked
                           				</c:if>value="연어"/><label>연어</label>
									<input id="mugwort" type="checkbox" name="allergy" 
										<c:if test="${fn:contains(member.allergy,'쑥')}">
                            			checked
                           				</c:if>value="쑥"/><label>쑥</label><br />
									<input id="beef" type="checkbox" name="allergy" 
										<c:if test="${fn:contains(member.allergy,'소고기')}">
                            			checked
                           				</c:if>value="소고기"/><label>소고기</label>
									<input id="chicken" type="checkbox" name="allergy" 
										<c:if test="${fn:contains(member.allergy,'닭고기')}">
                            			checked
                           				</c:if>value="닭고기"/><label>닭고기</label>
									<input id="pork" type="checkbox" name="allergy" 
										<c:if test="${fn:contains(member.allergy,'돼지고기')}">
                            			checked
                           				</c:if>value="돼지고기"/><label>돼지고기</label><br />
									<input id="peach" type="checkbox" name="allergy" 
										<c:if test="${fn:contains(member.allergy,'복숭아')}">
                            			checked
                           				</c:if>value="복숭아"/><label>복숭아</label>
									<input id="dandelion" type="checkbox" name="allergy"
										<c:if test="${fn:contains(member.allergy,'민들레')}">
                            			checked
                           				</c:if>value="민들레"/><label>민들레</label>
									<input id="eggwhite" type="checkbox" name="allergy"
										<c:if test="${fn:contains(member.allergy,'계란흰자')}">
                            			checked
                           				</c:if>value="계란흰자"/><label>계란흰자</label><br />
								</fieldset>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" class="btn btn-primary" formaction="memberUpdate.do" value="수정"/>
								<input type="submit" class="btn btn-primary" formaction="memberRemove.do" value="회원탈퇴"/></td>
						</tr>
					</table>
				</div>
			</form>
		</article>
	</section>
	<jsp:include page="copyright.jsp" />
	
</body>
</html>