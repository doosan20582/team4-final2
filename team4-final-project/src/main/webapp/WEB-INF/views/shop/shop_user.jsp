<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- shop css -->
<link rel="stylesheet" href="/resources/css/shop/shop_user.css">
<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">

<!-- Jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Shop_User</title>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="header.jsp" />


	<!--광고-->
	<div class="carousel">
		<i class="xi-angle-left carousel_button_L"></i>
		<!--광고 컨테이너-->
		<div class="adContainer">

			<div class="adSubCon">

				<div class="carouselImgDiv">
					<img src="" alt="">
				</div>
				<div class="carouselContentDiv">광고 1</div>

			</div>
			<div class="adSubCon">

				<div class="carouselImgDiv">
					<img src="" alt="">
				</div>
				<div class="carouselContentDiv">광고 2</div>

			</div>
			<div class="adSubCon">

				<div class="carouselImgDiv">
					<img src="" alt="">
				</div>
				<div class="carouselContentDiv">광고 3</div>

			</div>
			<div class="adSubCon">

				<div class="carouselImgDiv">
					<img src="" alt="">
				</div>
				<div class="carouselContentDiv">광고 4</div>

			</div>
			<div class="adSubCon">

				<div class="carouselImgDiv">
					<img src="" alt="">
				</div>
				<div class="carouselContentDiv">광고 5</div>

			</div>



		</div>

		<i class="xi-angle-right carousel_button_R"></i>
	</div>
	<!--carousel-->

	<!--메인-->
	<main>
		<!--왼쪽 섹션-->
		<div class="section">
			<!--상품 탑 10 헤드-->
			<div class="section_best_header">
				<h1>
					Best
					<span>10</span>
				</h1>
				<!-- 인기 상품 -->
			</div>
			<!--상품 탑 10 내용-->
			<div class="section_best">
				<i class="xi-angle-left best_button_L"></i>

				<div class="section_best_items">
					<div class="section_item">1</div>
					<div class="section_item">2</div>
					<div class="section_item">3</div>
					<div class="section_item">4</div>
					<div class="section_item">5</div>
					<div class="section_item">6</div>
					<div class="section_item">7</div>
					<div class="section_item">8</div>
					<div class="section_item">9</div>
					<div class="section_item">10</div>
				</div>


				<i class="xi-angle-right best_button_R"></i>
			</div>
			<!--상품 헤더-->
			<div class="section_items_header">
				<h1>Item</h1>
				<!-- 상품 -->
			</div>
			<!--상품 컨테이너-->
			<div class="section_items_main">
				<!-- 현재 페이지 정보 -->
				<input type="hidden" id="currentPageInput" value="${pageShop.currentPage}">
				<!-- 전체 페이지 정보 -->
				<input type="hidden" id="totalPageInput" value="${pageShop.totalPage}">
				<!--상품 더보기 클릭시 상품 그릴 디비전-->
				<div class="productDiv">
					<!-- 처음 상품 10개  -->
					<c:forEach var="item" items="${productList}">
						<div class="section_items">
							<%-- <input type="hidden" value="${item.product_id }"> --%>
							<a href="/product/detail?product_id=${item.product_id }"> ${item.product_name } </a>
							<div class="thumbnailDiv">
								<img src="/productImg/${item.product_thumbnail_img_url}" class="thumbnailImg" art="이미지 준비중 입니다.">
							</div>
						</div>
					</c:forEach>



				</div>
			</div>

			<div class="section_view_more">
				<!-- <i class="xi-angle-down view_more_btn"></i> -->
				<span class="moreSpan">더보기</span>
			</div>
		</div>

		<div class="side">
			<div class="side_navBar">
				<!-- 등급 구역 -->
				<div class="gradeDiv">
				
				</div>
				<!-- 카테고리 구역 -->
				<div class="categoryDiv">
					<div class="categoryInnerDiv">
						<span class="categorySpan" data-category-id = "0">All</span>
					</div>
					
					<c:forEach var="item" items="${categoryList }">
						<div class="categoryInnerDiv">
							<span class="categorySpan" data-category-id = "${item.product_category_id }">${item.product_category_name }</span>
						
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
		
	</main>
	<!-- 푸터 -->
	<jsp:include page="footer.jsp" />
	
	<!-- shop js -->
	<script src="/resources/js/shop/shop_user.js"></script>
</body>

</html>