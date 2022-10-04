<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--쇼핑몰 글로벌 css-->
<link rel="stylesheet" href="/resources/css/global.css">
<!--장바구니 css-->
<link rel="stylesheet" href="/resources/css/shop/order/basket.css">
<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<!--장바구니 아이콘 cdn-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- 제이쿼리 cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>장바구니</title>
</head>

<body>
	<%@include file="../header.jsp"%>


	<!--메인-->
	<form name="basketForm" method="post" action="basketToBuy">
		<main>
			<!--장바구니 컨테이너-->
			<div class="basketContainer">
				<!--장바구니 현재 상태 구역-->
				<div class="basketTop">
					<div class="basketTopLeft"></div>
					<div class="basketTopRight">
						<span class="material-symbols-outlined"> shopping_basket 장바구니 </span>
						<span class="material-symbols-outlined"> navigate_next </span>
						<span class="material-symbols-outlined"> receipt_long 주문서 작성 </span>
						<span class="material-symbols-outlined"> navigate_next </span>
						<span class="material-symbols-outlined"> task_alt 주문완료 </span>
					</div>
				</div>
				<!--장바구니 상품 정보 구역-->
				<div class="basketMiddle">
					<table id="basketTable">
						<thead>
							<tr>
								<th></th>
								<th>상품정보</th>
								<th>수량</th>
								<th>가격</th>
								<th>배송비</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<!--상품 이름 저장 input 배열로 전송-->
									<input type="checkbox" name="ckeckboxBasket" id="" class="ckeckboxBasket" value="">
								</td>
								<td>상품1</td>
								<td>수량1</td>
								<td>가격1</td>
								<td>배송비1</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name="ckeckboxBasket" id="" class="ckeckboxBasket" value="">
								</td>
								<td>상품2</td>
								<td>수량2</td>
								<td>가격2</td>
								<td>배송비2</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name="ckeckboxBasket" id="" class="ckeckboxBasket" value="">
								</td>
								<td>상품3</td>
								<td>수량3</td>
								<td>가격3</td>
								<td>배송비3</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name="ckeckboxBasket" id="" class="ckeckboxBasket" value="">
								</td>
								<td>상품4</td>
								<td>수량4</td>
								<td>가격4</td>
								<td>배송비4</td>
							</tr>
							<tr>
								<td>
									<input type="checkbox" name="ckeckboxBasket" id="" class="ckeckboxBasket" value="">
								</td>
								<td>상품5</td>
								<td>수량5</td>
								<td>가격5</td>
								<td>배송비5</td>
							</tr>

						</tbody>
					</table>
				</div>
				<input type="hidden" name="productName">
				<input type="hidden" name="productQuantity">
				<!--장바구니 액션 버튼 구역-->
				<div class="basketBottom">
					<div class="basketBottomLeft">
						<!--삭제는 ajax-->
						<input type="button" value="선택상품 삭제" id="deleteBtn">
					</div>
					<div class="basketBottomRight">
						<!--주문은 submit-->
						<input type="submit" value="선택상품 주문" id="submitBtn">
					</div>
				</div>
			</div>
		</main>
	</form>

	<div class="ajaxResultTest"></div>
	<%@include file="../footer.jsp"%>

	<script src="/resources/js/shop/order/basket.js"></script>
</body>

</html>