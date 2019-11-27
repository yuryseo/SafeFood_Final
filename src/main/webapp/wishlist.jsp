<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wish List</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script type='text/javascript' src='js/jquery-3.3.1.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="main.jsp" />

	<section class="hotel_list section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="section_tittle text-center">
						<h2>
							</i>찜한 식품 목록
						</h2>

					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${list}" var="food">
					<div class="col-lg-3 col-sm-3">
						<form method='post' action="myFoodInsert.do">
							<input type="hidden" name="code" value="${food.code}" /> <input
								type="hidden" name="quantity" value="1" />
							<div class="single_ihotel_list">
								<img src="${food.img }" alt="">
								<div class="hover_text">
									<div class="hotel_social_icon">
										<ul>
											<li><input class="intake" type="submit" value="섭취"
												formaction="myFoodInsert.do" /></li>
											<li><input class="intake" type="submit" value="삭제"
												formaction="deletewishlist.do" /></li>
										</ul>
									</div>
									<div class="share_icon">
										<i class="ti-share"></i>
									</div>
								</div>
								<div class="hotel_text_iner">
									<h3>
										<a href="foodDetail.do?foodcode=${food.code}"><i
											class="ti-heart"></i><span>&nbsp;${food.name}</span></a>
									</h3>
								</div>
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
			<br/><br/><br/>
			<article id="contentArea">
				<h2 align="center">내 섭취 식품 목록</h2>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-8">
						<canvas id="myChart"></canvas>
					</div>
					<div class="col-md-3"></div>
				</div>
			</article>
		</div>
	</section>


	<jsp:include page="copyright.jsp" />
	<script type="text/javascript">
		$(function() {
			/* var calory = $("#calory").text();
			var carbo = $("#carbo").text();
			var protein = $("#protein").text();
			var fat = $("#fat").text();
			var sugar = $("#sugar").text();
			var natrium = $("#natrium").text();
			var chole = $("#chole").text();
			var fattyacid = $("#fattyacid").text();
			var transfat = $("#transfat").text(); */
			
			var calory = ${todayfood.calory}
			var carbo =  ${todayfood.carbo}
			var protein =  ${todayfood.protein}
			var fat =  ${todayfood.fat}
			var sugar =  ${todayfood.sugar}
			var natrium =  ${todayfood.natrium}
			var chole = ${todayfood.chole}
			var fattyacid = ${todayfood.fattyacid}
			var transfat =  ${todayfood.transfat}
			
			var calory2 = calory+${wishfood.calory}
			var carbo2 =  carbo+${wishfood.carbo}
			var protein2 = protein+ ${wishfood.protein}
			var fat2 =  fat+${wishfood.fat}
			var sugar2 = sugar+ ${wishfood.sugar}
			var natrium2 = natrium+ ${wishfood.natrium}
			var chole2 =chole+ ${wishfood.chole}
			var fattyacid2 = fattyacid+${wishfood.fattyacid}
			var transfat2 = transfat+ ${wishfood.transfat}
		
			/* 	var mcalory = 2600;
			 var mcarbo = 410;
			 var mprotein = 65;
			 var mfat = 65;
			 var msugar = 25;
			 var mnatrium = 1500;
			 var mchole = 300;
			 var mfattyacid = 15;
			 var mtransfat = 2.2;

			 var fcalory = 2100;
			 var fcarbo = 320;
			 var fprotein = 55;
			 var ffat = 45;
			 var fsugar = 25;
			 var fnatrium = 1500;
			 var fchole = 300;
			 var ffattyacid = 15;
			 var ftransfat = 2.2; */

			console.log(calory, carbo, protein, fat, sugar, natrium, chole,
					fattyacid, transfat);
			/* console.log(mcalory, mcarbo, mprotein, mfat, msugar, mnatrium, mchole,
					mfattyacid, mtransfat);
			console.log(fcalory, fcarbo, fprotein, ffat, fsugar, fnatrium, fchole,
					ffattyacid, ftransfat); */
			barChart(calory, carbo, protein, fat, sugar, natrium, chole,
					fattyacid, transfat, calory2, carbo2, protein2, fat2,
					sugar2, natrium2, chole2, fattyacid2, transfat2);
		});

		function barChart(calory, carbo, protein, fat, sugar, natrium, chole,
				fattyacid, transfat, calory2, carbo2, protein2, fat2, sugar2,
				natrium2, chole2, fattyacid2, transfat2) {
			// 우선 컨텍스트를 가져옵니다. 
			var ctx = document.getElementById("myChart").getContext('2d');
			/*
			 - Chart를 생성하면서, 
			 - ctx를 첫번째 argument로 넘겨주고, 
			 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
			 */
			var myChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ "칼로리", "탄수화물", "단백질", "지방", "당류", "나트륨",
							"콜레스테롤", "포화지방산", "트랜스지방" ],
					datasets : [
							{
								label : '오늘 섭취량',
								data : [ calory, carbo, protein, fat, sugar,
										natrium, chole, fattyacid, transfat ],
								backgroundColor : [ 'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)' ],
								borderColor : [ 'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)' ],
								borderWidth : 1
							},
							{
								label : '찜한식품 섭취시 섭취량',
								data : [ calory2, carbo2, protein2, fat2,
										sugar2, natrium2, chole2, fattyacid2,
										transfat2 ],
								backgroundColor : [ 'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(255, 206, 86, 0.2)' ],
								borderColor : [ 'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(255, 206, 86, 1)' ],
								borderWidth : 1
							} ]
				},
				options : {
					maintainAspectRatio : true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
		}
	</script>
	<script src="js/jquery.magnific-popup.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/gijgo.min.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>