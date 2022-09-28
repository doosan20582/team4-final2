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

<link rel="stylesheet" href="/resources/css/shop/aad.css">
<!--ì¼íëª° ê¸ë¡ë² ìì´ì½ cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>
<body>
	<!-- header -->
	<%@include file="./header.jsp" %>
	
	
	<!--메인-->
	<main>
		<div class="name1">
			<div class="btn">
				<button class="list_btn">목록</button>
			</div>
			<div class="name2">
				<div class="name2_1">
					<p>아이디</p>
					<p>${data.member_id}</p>
				</div>
				<div class="name2_1">
					<p>제목</p>
					<p>${data.qna_title}</p>
				</div>
				<div class="name2_1">
					<p>문의유형</p>
					<p>${data.qna_category}</p>
				</div>
				<div class="name2_1">
					<p>작성일자</p>
					<p>
						<fmt:formatDate value="${data.qna_regdate}" pattern="yyyy-MM-dd ,a, HH:mm:ss" />
					</p>
				</div>
			</div>
			<div class="name3">
				<p>내용</p>
				<p>${data.qna_text}</p>
			</div>
		</div>
		<div>
			<a href="Question_update?qna_id=${data.qna_id}">수정</a>
			<form method="POST" action="delete">
				<input type="hidden" name="qna_id" value="${data.qna_id}" />
				<input type="submit" value="삭제" />
			</form>
		</div>
	</main>
	
	
	<!-- footer -->
	<%@include file="./footer.jsp" %>

	<script type="text/javascript">
    let update_btn = document.querySelector(".update_btn");
    let list_btn = document.querySelector(".list_btn");
    
    list_btn.addEventListener('click',function(){
    	location.href="QnA"
    });
    
    update_btn.addEventListener('click',function(){
    	location.href="Question_update?qna_id=${data.qna_id}"
    });
    
	</script>
</body>
</html>