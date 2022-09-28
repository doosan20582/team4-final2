<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/user/mypage.css">
<link rel="stylesheet" href="/resources/css/global.css">

<!-- Jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>My Page</title>
</head>
<body>
	<!--내정보-->
	<div class="myInfoCon">
		<div class="navDiv">
			<a href="/">메인</a>
			<a href="/shop">쇼핑몰</a>
			<a href="/community/main">커뮤니티</a>
		</div>
		<div class="infoTopDiv">
			<div class="userImgDiv">
				<img src="" alt="이미지  준비중 입니다." id="userImg">
			</div>
			<div class="userInfoDiv">
				<span class="userNameSpan">${sessionScope.login_id }</span>님
			</div>
			<div class="userModifyDiv">
				<a id="logOutBtn">로그아웃</a>
				<a class="">회원정보수정</a>
				<a class="">회원탈퇴</a>
			</div>
		</div>
		
		<div class="infoBottomDiv">
			<div class="userGradeDiv">회원등급</div>
			<!-- <div class="userQuoponHistoryDiv">쿠폰 사용내역</div> -->
			<div class="userOrderHistoryDiv">구매 내역</div>
		</div>
	</div>
	<!--내 활동 내역-->
	<div class="userHistoryCon">

		<div class="deliveryHisroyDiv">
			<table class="deliveryHisroyTable">
				<thead>
					<tr>
						<th>주문 번호</th>
						<th>상품 번호</th>
						<th>주문일</th>
						<th>도착 예상일</th>
						<th>구매 금액</th>
						<th>상태</th>
						<th>적립 예정 포인트</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${orderList }">
						<tr>
							<td>${item.order_id }</td>
							<td>${item.product_id }</td>
							<td><fmt:formatDate value="${item.order_start_date }"/></td>
							<td><fmt:formatDate value="${item.order_end_date }" /></td>
							<td>${item.order_purchase_amount }</td>
							<td class="confirmBuy" data-state="${item.order_state }">${item.order_state }</td>
							<td>${item.member_purchase_point }</td>
						</tr>
					</c:forEach>
				
				</tbody>
			</table>
		</div>
		<div class="etcHistoryDiv">
			<a>리뷰내역</a> 
			<a>문의내역</a> 
			<a>작성글내역</a>

		</div>
	</div>
	<!-- 구매내역 보기 모달 -->
	<div class="orderHistoryModalCon">
		<div class="orderHistoryDiv">
			<table class="orderHistoryTable">
				<thead>
					<tr>
						<th>매출번호</th>
						<th>주문번호</th>
						<th>구매일</th>
						<th>리뷰작성여부</th>
						<th>확정일</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${salesList }">
						<tr>
							<td>${item.sales_id }</td>
							
							<td>${item.order_id }</td>
							<td>
								<fmt:formatDate value="${item.sales_date }"/>
							</td>
							<td class="reviewTd">
								<c:if test="${item.sales_review eq 'n'}">
									<a href="/user/review?sales_id=${item.sales_id }">작성하기</a>
								</c:if>
								<c:if test="${item.sales_review eq 'y'}">
									<a>작성완료</a>
								</c:if>
							</td>
							<td>
								<fmt:formatDate value="${item.sales_review_date }"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	
	<script src="/resources/js/user/mypage.js"></script>
</body>
</html>