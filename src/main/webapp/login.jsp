<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN FORM</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">

</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class=" p-l-85 p-r-85 p-t-55 p-b-55">
				<form   class="login100-form validate-form flex-sb flex-w">
					<div><span class=" p-b-32">
						Login
					</span>
					</div>
					<span class="txt1 p-b-11">
						아 이 디
					</span>
					<div class=" m-b-36" data-validate = "Username is required">
						<input class="input100" type="text" name="name" >
						
					</div>
					
					<span class="txt1 p-b-11">
						비 밀 번 호
					</span>
					<div class=" m-b-12" data-validate = "Password is required">
						
						<input class="input100" type="password" name="password" >
						
					</div>
					
					<div class="flex-sb-m w-full p-b-48">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>

						<div>
							<a href="findId.jsp" class="txt3">
								아이디 찾기
							</a>
							<a href="#" class="txt3">
								비밀번호 찾기
							</a>
						</div>
					</div>

					<button type="button" class="btn btn-info">Login</button>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
</body>
</html>