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


<!--ì¼íëª° Question_admin css-->
<link rel="stylesheet" href="/resources/css/shop/Question_admin.css">
<!--ì¼íëª° ê¸ë¡ë² ìì´ì½ cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>

<body>
	<!-- header -->
	<%@include file="./header.jsp" %>
	<!--메인-->
	<main>
		<div class="Answer_Header">
			<h1>문의 답변</h1>
		</div>
		<form action="">
			<div class="Answer_Name">
				<h3>작성자 아이디</h3>
				<span>goot1234</span>
			</div>
			<div class="Answer_Date">
				<h3>작성일</h3>
				<span>22/07/30</span>
			</div>
			<div class="Answer_Type">
				<h3>문의유형</h3>
				<span>주문/결제</span>
			</div>
			<div class="Answer_Title">
				<h3>게시글 번호</h3>
				<input type="text" readonly>
				<input type="hidden" name="">
			</div>
			<div class="Answer_Content">
				<h3>내용</h3>
				<textarea name="" id="Answer_Content_Textarea" cols="30" rows="10"></textarea>
			</div>
			<div class="Answer_Check">
				<input type="submit" value="답변하기">
			</div>
		</form>
	</main>
	<!-- footer -->
	<%@include file="./footer.jsp" %>
	<script src="/resources/js/shop/Question_admin.js"></script>
</body>

</html>