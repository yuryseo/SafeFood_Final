<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
<title>SAFE FOOD</title>

<script type="text/javascript">
function isLogined(flag){
	if(flag){
		alert("로그인이 필요한 기능입니다.");
		event.stopPropagation();
	}
}

</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="banner.jsp"></jsp:include>
	<!-- banner part start-->

	<!-- booking part start-->
	<section class="booking_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="booking_menu">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="hotel-tab" data-toggle="tab" href="#hotel" role="tab"
								aria-controls="hotel" aria-selected="true">식품 검색</a></li>
							<li class="nav-item"><a class="nav-link" id="tricket-tab"
								data-toggle="tab" href="#tricket" role="tab"
								aria-controls="tricket" aria-selected="false"
								onclick="isLogined(${empty member.id})">내 섭취정보 검색</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="searchtop4">
						<div class="form-row">
							<ul>
								자주 검색한 식품명 검색 &nbsp;

								<c:forEach var='f' items="${searchTop4}">
									<a href="foodDetail.do?foodcode=${f.code}">&nbsp; &nbsp;
										${f.name}&nbsp; &nbsp; </a>
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="booking_content">
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="hotel" role="tabpanel"
								aria-labelledby="hotel-tab">
								<div class="booking_form">
									<form method="get" action="foodList.do" id="frm">
										<div class="form-row">
											<div class="form_colum">
												<select class="nc_select" id="sortOption" name="sortOption">
													<option selected>정렬</option>
													<option id="sortName" value="sortName">상품명순</option>
													<option id="sortMaker" value="sortMaker">브랜드순</option>
												</select>
											</div>
											<div class="form_colum">
												<select class="nc_select" id="searchOption"
													name="searchOption">
													<option selected>검색 조건</option>
													<option id="searchName" value="searchName">상품명</option>
													<option id="searchMaker" value="searchMaker">제조사</option>
													<option id="searchMaterial" value="searchMaterial">첨가재료</option>
													<option id="searcEtc" value="searcEtc">기타</option>
												</select>
											</div>
											<div class="form_colum">
												<input type="text" class="nc_input" id="searchItem"
													name="searchItem" placeholder="검색 단어">
											</div>
											<div class="form_btn">
												<button type="submit" class="btn_1" id="searchBtn"
													name="searchBtn">검색</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="tab-pane fade" id="tricket" role="tabpanel"
								aria-labelledby="tricket-tab">
								<div class="booking_form">
									<form method="get" action="myFoodList.do" id="frm">
										<div class="form-row">
											<div class="form_colum">
												<select class="nc_select" id="sortOption" name="sortOption">
													<option selected>정렬</option>
													<option id="sortName" value="sortName">상품명순</option>
													<option id="sortMaker" value="sortMaker">브랜드순</option>
												</select>
											</div>
											<div class="form_colum">
												<select class="nc_select" id="searchOption"
													name="searchOption">
													<option selected>검색 조건</option>
													<option id="searchName" value="searchName">상품명</option>
													<option id="searchMaker" value="searchMaker">제조사</option>
													<option id="searchMaterial" value="searchMaterial">첨가재료</option>
													<option id="searcEtc" value="searcEtc">기타</option>
												</select>
											</div>
											<div class="form_colum">
                                                <input id="datepicker_1" name="searchDate" placeholder="검색 날짜">
                                            </div>
											<div class="form_colum">
												<input type="text" class="nc_input" id="searchItem"
													name="searchItem" placeholder="검색 단어">
											</div>
											<div class="form_btn">
												<button type="submit" class="btn_1" id="searchBtn"
													name="searchBtn">검색</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- booking part end-->

	<!--top place start-->
	<section class="top_place section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="section_tittle text-center">
						<h2>Top Foods</h2>
						<p>사람들이 많이 먹은 식품 	</p>
					</div>
				</div>
			</div>
			<div class="row">

				<c:forEach items="${intakeTop4}" var="food">
					<div class="col-lg-3 col-md-3">
						<div class="single_place">
							<img src="${food.img}" alt="">
							<div
								class="hover_Text d-flex align-items-end justify-content-between">
								<div class="hover_text_iner">
									<h3>${food.name}</h3>
									<a href="foodDetail.do?foodcode=${food.code}" class="place_btn">상세보기</a>
									
									<div class="place_review">
										<a href="foodDetail.do?foodcode=${food.code}"><i class="fas fa-star"></i></a>
										 <a href="foodDetail.do?foodcode=${food.code}"><i class="fas fa-star"></i></a>
										 <a href="foodDetail.do?foodcode=${food.code}"><i class="fas fa-star"></i></a>
										 <a href="foodDetail.do?foodcode=${food.code}"><i class="fas fa-star"></i></a>
										 <a href="foodDetail.do?foodcode=${food.code}"><i class="fas fa-star"></i></a>
											 <ul style="color: white">${food.intakecount} takes</ul>
									</div>
								</div>
								<!-- <div class="details_icon text-right">
								<i class="ti-share"></i>
							</div> -->
							</div>
						</div>
					</div>
				</c:forEach>


				<a href="foodList.do" class="btn_1 text-cnter">전체 상품 목록 보러가기</a>
			</div>
		</div>
	</section>
	<!--top place end-->

	 <!--event_part start-->
	<!--<section class="event_part section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="event_slider owl-carousel">
						<div class="single_event_slider">
							<div class="row justify-content-end">
								<div class="col-lg-6 col-md-6">
									<div class="event_slider_content">
										<h5>Upcoming Event</h5>
										<h2>Maldeve - Asia</h2>
										<p>Waters make fish every without firmament saw had.
											Morning air subdue. Our. Air very one. Whales grass is fish
											whales winged.</p>
										<p>
											date: <span>12 Aug 2019</span>
										</p>
										<p>
											Cost: <span>Start from $820</span>
										</p>
										<p>
											Organizer: <span> Martine Agency</span>
										</p>
										<div class="rating">
											<span>Rating:</span>
											<div class="place_review">
												<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a>
											</div>
										</div>
										<a href="#" class="btn_1">Plan Details</a>
									</div>
								</div>
							</div>
						</div>
						<div class="single_event_slider">
							<div class="row justify-content-end">
								<div class="ol-lg-6 col-md-6">
									<div class="event_slider_content">
										<h5>Upcoming Event</h5>
										<h2>Maldeve - Asia</h2>
										<p>Waters make fish every without firmament saw had.
											Morning air subdue. Our. Air very one. Whales grass is fish
											whales winged.</p>
										<p>
											date: <span>12 Aug 2019</span>
										</p>
										<p>
											Cost: <span>Start from $820</span>
										</p>
										<p>
											Organizer: <span> Martine Agency</span>
										</p>
										<div class="rating">
											<span>Rating:</span>
											<div class="place_review">
												<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a>
											</div>
										</div>
										<a href="#" class="btn_1">Plan Details</a>
									</div>
								</div>
							</div>
						</div>
						<div class="single_event_slider">
							<div class="row justify-content-end">
								<div class="ol-lg-6 col-md-6">
									<div class="event_slider_content">
										<h5>Upcoming Event</h5>
										<h2>Maldeve - Asia</h2>
										<p>Waters make fish every without firmament saw had.
											Morning air subdue. Our. Air very one. Whales grass is fish
											whales winged.</p>
										<p>
											date: <span>12 Aug 2019</span>
										</p>
										<p>
											Cost: <span>Start from $820</span>
										</p>
										<p>
											Organizer: <span> Martine Agency</span>
										</p>
										<div class="rating">
											<span>Rating:</span>
											<div class="place_review">
												<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a> <a href="#"><i
													class="fas fa-star"></i></a>
											</div>
										</div>
										<a href="foodList.do" class="btn_1">전체 상품 정보 보기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> -->
	<!-- event_part end -->

	<!--::industries start::-->
<!--	<section class="hotel_list section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="section_tittle text-center">
						<h2>찜한 식품 목록</h2>
						<p>Waters make fish every without firmament saw had. Morning
							air subdue. Our. Air very one. Whales grass is fish whales
							winged.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6">
					<div class="single_ihotel_list">
						<img src="img/ind/industries_1.png" alt="">
						<div class="hover_text">
							<div class="hotel_social_icon">
								<ul>
									<li><a href="#"><i class="ti-facebook"></i></a></li>
									<li><a href="#"><i class="ti-twitter-alt"></i></a></li>
									<li><a href="#"><i class="ti-linkedin"></i></a></li>
								</ul>
							</div>
							<div class="share_icon">
								<i class="ti-share"></i>
							</div>
						</div>
						<div class="hotel_text_iner">
							<h3>
								<a href="#"> Hotel Polonia</a>
							</h3>
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <span>(210 review)</span>
							</div>
							<p>London, United Kingdom</p>
							<h5>
								From <span>$500</span>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--::industries end::-->

	<!--top place start-->
	<section class="client_review section_padding">
		<div class="container">
			<div class="row ">
				<div class="col-xl-6">
					<div class="section_tittle">
						<h2>What we provide</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="client_review_slider owl-carousel">
						<c:forEach items="${list}" var="f">
						<div class="single_review_slider">
							<div class="place_review">
							<img src="${f.img}" />
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<h5>${f.maker}</h5>
							<h3>${f.name}</h3>
						</div>
						</c:forEach>
						<!-- <div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div>
						<div class="single_review_slider">
							<div class="place_review">
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
								<a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
									class="fas fa-star"></i></a>
							</div>
							<p>Waters make fish every without firmament saw had. Morning
								air subdue. Our Air very one whales grass is fish whales winged
								night yielding land creeping that seed</p>
							<h5>- Allen Miller</h5>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--top place end-->

		<jsp:include page="copyright.jsp" />



	<!-- jquery plugins here-->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- magnific js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- masonry js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- masonry js -->
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/gijgo.min.js"></script>
	<!-- contact js -->
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/contact.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>

</html>