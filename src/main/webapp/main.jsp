<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
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
	
	<section class="booking_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="booking_menu">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active"id="hotel-tab" data-toggle="tab" href="#hotel" role="tab"
								aria-controls="hotel" aria-selected="true">식품 검색</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="tricket-tab" data-toggle="tab" href="#tricket" role="tab"
								aria-controls="tricket" aria-selected="false" onclick="isLogined(${empty member.id})">내 섭취정보 검색</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="searchtop4">
						<div class="form-row">
							<ul>
								 &nbsp; &nbsp; &nbsp;자주 검색한 식품명 검색 &nbsp;

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
												<select class="nc_select" id="searchOption" name="searchOption">
													<option selected>검색 조건</option>
													<option id="searchName" value="searchName">상품명</option>
													<option id="searchMaker" value="searchMaker">제조사</option>
													<option id="searchMaterial" value="searchMaterial">첨가재료</option>
													<option id="searcEtc" value="searcEtc">기타</option>
												</select>
											</div>
											<div class="form_colum">
												<input type="text" class="nc_input" id="searchItem" name="searchItem" placeholder="검색 단어">
											</div>
											<div class="form_btn">
												<button type="submit" class="btn_1" id="searchBtn" name="searchBtn">검색</button>
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
												<select class="nc_select" id="searchOption" name="searchOption">
													<option selected>검색 조건</option>
													<option id="searchName" value="searchName">상품명</option>
													<option id="searchMaker" value="searchMaker">제조사</option>
													<option id="searchMaterial" value="searchMaterial">첨가재료</option>
													<option id="searcEtc" value="searcEtc">기타</option>
												</select>
											</div>
											<div class="form_colum">
												<input type="text" class="nc_input" id="searchItem" name="searchItem" placeholder="검색 단어">
											</div>
											<div class="form_btn">
												<button type="submit" class="btn_1" id="searchBtn" name="searchBtn">검색</button>
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
</body>
</html>