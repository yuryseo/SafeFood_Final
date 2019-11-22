<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Project</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/index.css">
<link href="css/basic.css" rel="stylesheet" type="text/css" />
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" /> 
</head>
<body>
<jsp:include page="header.jsp" />
<article id="content"> 
	<article  id="mainContent">
		<table align="center">
			<caption> 에러 발생 </caption>
			<tr><td> ${msg} </td></tr>
			
		</table>
	</article>
</article>		
<footer id="copyright">
</footer>
<jsp:include page="copyright.jsp" />	
</body>
</html>





	





