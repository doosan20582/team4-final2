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

<!--ì¼íëª° Question css-->
<link rel="stylesheet" href="/resources/css/shop/Question.css">
<!--ì¼íëª° ê¸ë¡ë² ìì´ì½ cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>

<body>
	<!-- header -->
	<%@include file="./header.jsp" %>
	<!--메인-->
	<main>
		<div class="write">
			<h1>문의</h1>
		</div>
		<form method="post" action="Question">
			<div class="user_Name">
				<h3>ID</h3>
				<input id="user_Name_Text"  name="${data.member_id}" type="text" readonly>
			</div>
			<div class="question_Type">
				<h3>문의유형</h3>
				<select name="qna_category"  id="question_Type_Select" required>
					<option value="주문/결제">주문/결제</option>
					<option value="배송">배송</option>
					<option value="취소/환불/교환">취소/환불/교환</option>
					<option value="회원">회원</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div class="question_Title">
				<h3>제목</h3>
				<input id="question_Title_Text"  name="qna_title" type="text">
			</div>
			<div class="question_Content">
				<h3>내용</h3>
				<textarea name="qna_text" id="question_Content_Textarea"  cols="30" rows="10"></textarea>
			</div>
			<div class="question_Open">
				<h3>공개여부</h3>
				<div class="question_Open_Radio">
					<label for="question_Open_Radio1"><input type="radio" id="question_Open_Radio1" name="qna_public" value="공개" checked>공개</label> <label for="question_Open_Radio2"><input type="radio" id="question_Open_Radio2" name="qna_public" value="비공개">비공개</label>
				</div>
			</div>
			<div class="question_Check">
				<input type="submit" value="등록하기">
			</div>
		</form>
	</main>
	<!-- footer -->
	<%@include file="./footer.jsp" %>
	
	<script src="/resources/js/shop/Question.js"></script>
</body>

</html>