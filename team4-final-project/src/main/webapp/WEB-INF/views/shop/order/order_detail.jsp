<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="/resources/css/shop/order/order_detail.css">
<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<!-- 제이쿼리 cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<%@include file="../header.jsp"%>

	<main>
		<form action="order/buy" method="post">
			<!--주문 상세 컨테이너-->
			<div class="orderContainer">
				<!--주소-->
				<div class="orderAddressDiv">
					<div class="orderAddressTop">
						<p>배송지 정보 구역</p>
						
					</div>
					<div class="orderAddressBottom">
						<div class="addressDiv">
							<p>${list.member_postal_code }</p>
							<p>${list.member_address }</p>
							<!-- 주소 -->
							<input type="hidden" name="order_address" value="${list.member_postal_code}, ${list.member_address}">
							<!--form 전송 데이터-->
						</div>
						<div class="requestDiv">
							<select name="" id="requestSelect">
								<option value="" selected>배송 메시지를 선택해 주세요.</option>
								<option value="">배송전 연락 바랍니다.</option>
								<option value="">부재시 경비실에 맡겨주세요.</option>
								<option value="">부재시 연락주세요.</option>
								
							</select>
							<!-- 메시지 -->
							<textarea name="order_comment" id="requestTextarea" cols="30" rows="10" maxlength="500" placeholder="배송 메시지를 입력해 주세요."></textarea>
							

						</div>
					</div>
				</div>
				<!--상품정보-->
				<div class="orderProductDiv">
					<div class="orderProductTop">주문상품 정보 구역</div>
					<div class="orderProductBottom">
						<div class="productImgDiv">
							<img src="/productImg/${product.product_thumbnail_img_url }" alt="이미지 준비중 입니다." class="productImg">
						</div>
						<div class="productDetail">
							주문 상품 상세 정보
							<p>상품키 : ${product.product_id}</p>
							<p>이름 : ${product.product_name}</p>
							<p>재고 : ${product.product_stock}</p>
							<p>가격 : ${product.product_price}</p>
							<p>배송일 : ${product.product_delivery_day }</p>
							<input type="hidden" id="productCategory" value="${product.product_category_id }">
							<input type="hidden" id="productBrand" value="${product.product_brand_id }">
							
							<input type="hidden" name="product_id" value="${product.product_id}">
							<!--form 전송 데이터-->
						</div>
					</div>
				</div>
				<!--결제정보-->
				<div class="orderPriceDiv">
					<div class="orderPriceTop">결제 정보 구역</div>
					<div class="orderPriceBottom">
						<table>
							<tr>
								<td>
									선택 상품 
									<span class="productQuantitySpan">${order_quantity }</span>개 
									<input type="hidden" name="order_quantity" value="${order_quantity }">
									금액 
								</td>
								<td>
									<fmt:formatNumber value="${product.product_price * order_quantity }" type="number" />
									<input type="hidden" value="${product.product_price * order_quantity }" id="order_purchase_amount_before">
									 원
								</td>
							</tr>
							<tr>
								<td>배송비</td>
								<td>
									<span>0</span>
									원
								</td>
							</tr>
							<tr>
								<td colspan="2">할인금액 합계</td>
							</tr>
							<tr>
								<td>
									등급할인 
									<span class="gradeNameSpan">${grade.grade_name }</span> 
									등급
								</td>
								<td>
									-
									<span class="discountSpan">
										<fmt:formatNumber type="number" minFractionDigits="0" value="${grade.grade_discount * product.product_price }"/>
										<input type="hidden" value="${grade.grade_discount * product.product_price }" id="discount" name="discount">
									</span>
									원
								</td>
							</tr>
							<tr>
								<td>적립포인트</td>
								<td>
									<fmt:formatNumber type="number" minFractionDigits="0" value="${grade.grade_accrual_rate * product.product_price }"/>
									<input type="hidden" name="getPoint" value="${grade.grade_accrual_rate * product.product_price }">
									포인트
								</td>
							</tr>
							<tr>
								<td>쿠폰할인 <input type="hidden" name="">
								</td>
								<td>
									<!-- 쿠폰 정도 -->
									<div class="couponInfoDiv">
										-
										
										<span id="couponPrice" class="discountSpan">0</span> 
										<input type="hidden" id="couponPriceHidden" value="0">
										원
										<span class="couponCancle"> [취소] </span>
										<input type="hidden" name="order_coupon_num" value="no use coupon" id="useCouponNum">
									</div>
									
									<input type="button" value="쿠폰번호입력" id="insertCouponBtn"> 
									
								</td>
							</tr>

							<tr>
								<td>결제금액</td>
								<td>
									<span id="resultPriceSpan">0</span>
									원
								</td>
								<input type="hidden" name="order_purchase_amount" id="order_purchase_amount">
								<!--form 전송 데이터-->
							</tr>
						</table>
					</div>
				</div>
				<!--결제하기버튼-->
				<div class="orderPaymentDiv">
					<div class="orderPaymentTop">결제하기 버튼 구역</div>
					<div class="orderPaymentBottom">
						<input type="submit" value="결제하기" id="paymentBtn">
					</div>
				</div>
			</div>
		</form>
		<!--쿠폰사용컨테이너-->
		<div class="couponUseCon">
			<div class="couponDiv">
				<input type="text" name="" id="useCouponText" maxlength="16">
				<button id="useCouponBtn">사용하기</button>
			</div>
		</div>
	</main>
	
	<%@include file="../footer.jsp"%>
	
<script src="/resources/js/shop/order/order_detail.js"></script>
</body>
</html>