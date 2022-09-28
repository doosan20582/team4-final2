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

<!--ì¼íëª° QnA css-->
<link rel="stylesheet" href="/resources/css/shop/QnA.css?after">
<!--ì¼íëª° ê¸ë¡ë² ìì´ì½ cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>

</head>

	<script type="text/javascript">
    let QnA_Title_btn = document.querySelector("#QnA_Title_btn");
    QnA_Title_btn.addEventListener('click',function(){
    	location.href="Question";
    });
    
     
  
	</script>

<!-- header -->
<%@include file="./header.jsp"%>


<!--메인-->
<body>
	<main>
		<form action="">
		<div class="QnA_Title">
			<h1>QnA</h1>
			<c:if test="${sessionScope.login_id != null}">
			<input id="QnA_Title_btn" class="btn" type="button" value="문의하기">
			</c:if>
		</div>
		
			<div class="QnA_Search">
				<input id="QnA_Search_text" type="search" placeholder="무엇을 도와드릴까요?">
				<input id="QnA_Search_btn" type="submit" value="검색">
			</div>
		</form>
		<div class="QnA_Nav">
			<label for="QnA_Nav_btn1"><input type="checkbox" name="" id="QnA_Nav_btn1" value="주문/결제">주문/결제</label> <label for="QnA_Nav_btn2"><input type="checkbox" name="" id="QnA_Nav_btn2" value="배송">배송</label> <label for="QnA_Nav_btn3"><input type="checkbox" name="" id="QnA_Nav_btn3" value="취소/교환/환불">취소/교환/환불</label> <label for="QnA_Nav_btn4"><input type="checkbox" name="" id="QnA_Nav_btn4" value="회원">회원</label> <label for="QnA_Nav_btn5"><input type="checkbox" name="" id="QnA_Nav_btn5" value="기타">기타</label>
			<input type="button" value="정렬하기">
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
				<c:forEach var="row" items="${list}">
					<tr>
						<!-- <input type="hidden" name=""> -->
						<td>${row.qna_category}</td>
						<td><a href="QnA_detail?qna_id=${row.qna_id}">${row.qna_title}</a></td>
						<td>${row.qna_regdate}</td>
						<td>${row.qna_admin_answer}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="QnA_Paging">
					
		<c:if test="${paging.startPage != 1 }">
			<a href="/shop/QnA?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/shop/QnA?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/shop/QnA?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	
		</div>
	</main>


	<!-- footer -->
	<%@include file="./footer.jsp"%>


	<!-- <script src="js/QnA.js"></script> -->

</body>
</html>