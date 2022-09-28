<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--상품 상제 css-->
<link rel="stylesheet" href="/resources/css/shop/product/product_detail_admin.css">
<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<!-- 제이쿼리 cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Product_Detail_Admin</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../header.jsp" />

	<!--메인-->

	<!-- 상품 pk -->
	<input type="hidden" readonly="readonly" name="product_id" value="${product.product_id }">
	<main>
		<!--상품 이미지, 상품 가격, 상품 설명, 수량, 장바구니 담기, 구매하기-->
		<div class="productTop">
			<div class="topLeft">
				<div class="mainImgDiv">
					<!-- 상품 이미지1 -->
					<c:if test="${product.product_img_url1 ne 'no url' }">
						<img src="/productImg/${product.product_img_url1 }" alt="" class="productMainImg">
					</c:if>


				</div>
				<div class="subImgDiv">
					<!-- 상품 이미지 1~3 -->
					<c:if test="${product.product_img_url1 ne 'no url' }">
						<img src="/productImg/${product.product_img_url1 }" alt="" class="productSubImg">
					</c:if>

					<c:if test="${product.product_img_url2 ne 'no url' }">
						<img src="/productImg/${product.product_img_url2 }" alt="" class="productSubImg">
					</c:if>

					<c:if test="${product.product_img_url3 ne 'no url' }">
						<img src="/productImg/${product.product_img_url3 }" alt="" class="productSubImg">
					</c:if>


				</div>
			</div>
			<div class="topRight">
				<div class="descriptionDiv">
					<table class="descriptionTable">
						<tr>
							<td id="productNameTd">${product.product_name }</td>
						<tr>
							<td id="productPriceTd"><fmt:formatNumber value="${product.product_price}" type="number" /> 원</td>
						</tr>
						<tr>

							<td>코멘트 : ${product.product_comment }</td>

						</tr>
						<tr>
							<td>배송일 : ${product.product_delivery_day } 일</td>
						</tr>
						<tr>
							<td>카테고리 : ${product.product_category_id }</td>
						</tr>
						<tr>
							<td>제조사 : ${product.product_brand_id }</td>
						</tr>
						<tr>
							<td>유튜브 링크 : ${product.product_youtube_url }</td>
						</tr>
					</table>
				</div>
				<div class="quantityDiv">
					<div class="quantityLeft">
						상품 공개 여부 :
						<c:if test="${product.product_public eq 'y'}">
								공개 상품
							</c:if>
						<c:if test="${product.product_public eq 'n'}">
								비공개 상품
							</c:if>

					</div>
					<div class="quantityRight">
						상품 삭제 여부 :
						<c:if test="${product.product_delete eq 'y'}">
							삭제 상품
						</c:if>
						<c:if test="${product.product_delete eq 'n'}">
							정상 상품
						</c:if>


					</div>
				</div>
				<div class="btnDiv">
					<!--수정하기-->
					<a href="/product/modify?product_id=${product.product_id} ">수정하기</a>
					<!--삭제하기-->
					<a>삭제하기</a>
				</div>
			</div>
		</div>
		<input type="hidden" id="productNameInput" name="productName">
		<!--상품 상세 설명, 유튜브 광고 링크-->
		<div class="productMiddle">
			<div class="ajaxResultTest"></div>
			<div class="productImgDiv">
				<!-- 상품 상세 이미지 1~2 -->
				<c:if test="${product.product_description_img_url1 ne 'no url'}">
					<img src="/productImg/${product.product_description_img_url1 }" alt="" class="mainImgs">
				</c:if>

				<c:if test="${product.product_description_img_url2 ne 'no url'}">
					<img src="/productImg/${product.product_description_img_url2 }" alt="" class="mainImgs">
				</c:if>


				<div class="viewMoreDiv">펼처 보기</div>
			</div>
		</div>
		<!--상품 리뷰-->
		<div class="productBottom">
			<!--리뷰 통계-->
			<div class="reviewTop">
				<div class="reviewTitle">상품리뷰</div>
				<div class="reviewGraphDiv">
					<div class="reviewGrade">리뷰 평점</div>
					<div class="reviewGraph">리뷰 그래프</div>
				</div>
			</div>
			<!--리뷰 내용들-->
			<div class="reviewBottom">
				<c:forEach var="item" items="${reviewList }">
					<div class="reviews">
						<p>${item.product_review_id }</p>
						<p>${item.product_id }</p>
						<p>${item.member_id }</p>
						<p>${item.product_review_regdate }</p>
						<p>${item.product_review_text }</p>
						<p>${item.product_review_grade }</p>
						<p>${item.product_review_helpful }</p>
						<p>${item.product_review_img_url }</p>
						<p>${item.product_review_video_url }</p>
						<p>${item.product_review_speed }</p>
					</div>

				</c:forEach>

			</div>
			<c:if test="${pageReview.end eq true }">
				<div class="veiwMoreRewviesDiv noneClass">리뷰 더보기</div>
			</c:if>
			<c:if test="${pageReview.end eq false }">
				<div class="veiwMoreRewviesDiv">리뷰 더보기</div>
			</c:if>
		</div>
		<!--네비게이터-->
		<div class="navigatorContainer">
			<div class="toTopDiv">상단</div>
			<div class="toReveiwCon">리뷰</div>
			<div class="toBottomDiv">하단</div>
			<div class="youtubeDiv">유튜브광고</div>
		</div>
	</main>

	<!-- 푸터 -->
	<jsp:include page="../footer.jsp" />

	<!-- js -->
	<script src="/resources/js/shop/product/product_detail_admin.js"></script>
</body>

</html>