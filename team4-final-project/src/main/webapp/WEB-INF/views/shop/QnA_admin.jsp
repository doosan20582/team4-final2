<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 폰트, 색상 공통 -->
<link rel="stylesheet" href="/resources/css/global.css">


<!--ì¼íëª° QnA_admin css-->
<link rel="stylesheet" href="/resources/css/shop/QnA_admin.css">
<!--ì¼íëª° ê¸ë¡ë² ìì´ì½ cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>

<body>
	<!-- header -->
	<%@include file="./header.jsp" %>
	
	
	
	<!--메인-->
	<main>
		<div class="QnA_Admin_Title">
			<h1>QnA</h1>
			<button id="QnA_Admin_Title_btn">문의하기</button>
		</div>
		<form action="">
			<div class="QnA_Admin_Search">
				<input id="QnA_Admin_Search_text" type="search" placeholder="무엇을 도와드릴까요?">
				<input type="submit" value="검색">
			</div>
		</form>
		<div class="QnA_Admin_Nav">
			<label for="QnA_Admin_Nav_btn1"><input type="checkbox" name="" id="QnA_Admin_Nav_btn1">주문/결제</label> <label for="QnA_Admin_Nav_btn2"><input type="checkbox" name="" id="QnA_Admin_Nav_btn2">배송</label> <label for="QnA_Admin_Nav_btn3"><input type="checkbox" name="" id="QnA_Admin_Nav_btn3">취소/교환/환불</label> <label for="QnA_Admin_Nav_btn4"><input type="checkbox" name="" id="QnA_Admin_Nav_btn4">회원</label> <label for="QnA_Admin_Nav_btn5"><input type="checkbox" name="" id="QnA_Admin_Nav_btn5">기타</label>
			<input type="button" value="정렬하기">
		</div>
		<div class="QnA_Admin_Check">
			<select name="" id="">
				<option value="">답변 완료 보기</option>
				<option value="">답변 대기중 보기</option>
			</select>
		</div>
		<div class="QnA_Admin_Main">
			<table class="QnA_Admin_Main_Table">
				<thead>
					<tr>
						<input type="hidden" name="">
						<th>구분</th>
						<th>제목</th>
						<th>작성일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tr>
					<input type="hidden" name="">
					<td>주문/결제</td>
					<td>결제 방식 변경 방법</td>
					<td>22.08.13</td>
					<td>답변 대기중</td>
				</tr>
				<tr>
					<input type="hidden" name="">
					<td>주문/결제</td>
					<td>비회원 주문하는 방법</td>
					<td>22.08.11</td>
					<td>답변 완료</td>
				</tr>
				<tr>
					<input type="hidden" name="">
					<td>주문/결제</td>
					<td>비공개 질문 입니다</td>
					<td>22.09.01</td>
					<td>답변 대기중</td>
				</tr>
				<tr>
					<input type="hidden" name="">
					<td>배송</td>
					<td>배송지 변경하는 방법</td>
					<td>22.09.11</td>
					<td>답변 대기중</td>
				</tr>
				<tr>
					<input type="hidden" name="">
					<td>배송</td>
					<td>운송장 번호 조회하는 방법</td>
					<td>22.08.09</td>
					<td>답변 완료</td>
				</tr>
				<tr>
					<input type="hidden" name="">
					<td>취소/교환/환불</td>
					<td>비공개 질문 입니다</td>
					<td>22.08.08</td>
					<td>답변 완료</td>
				</tr>
				<tr>
					<input type="hidden" name="">
					<td>취소/교환/환불</td>
					<td>반품 신청 방법</td>
					<td>22.08.13</td>
					<td>답변 대기중</td>
				</tr>
				<tr>
					<input type="hidden" name="">
					<td>취소/교환/환불</td>
					<td>교환 신청 방법</td>
					<td>22.08.13</td>
					<td>답변 대기중</td>
				</tr>
				<tr>
					<input type="hidden" name="">
					<td>회원</td>
					<td>비밀번호 변경 방법</td>
					<td>22.08.20</td>
					<td>답변 대기중</td>
				</tr>
				<tr>
					<input type="hidden" name="">
					<td>회원</td>
					<td>회원 탈퇴 방법</td>
					<td>22.09.29</td>
					<td>답변 대기중</td>
				</tr>
				<tr>
					<input type="hidden" name="">
					<td>기타</td>
					<td>A/S 신청 방법</td>
					<td>22.07.01</td>
					<td>답변 완료</td>
				</tr>
			</table>
		</div>
		<div class="QnA_Admin_Paging">
			<ol>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
			</ol>
		</div>
	</main>
	
	
	<!-- footer -->
	<%@include file="./footer.jsp" %>
	
	
	<script src="/resources/js/shop/QnA_admin.js"></script>
</body>

</html>