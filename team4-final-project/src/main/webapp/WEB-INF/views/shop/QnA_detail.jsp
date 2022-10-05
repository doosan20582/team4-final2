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
				<button class="list_btn4">목록</button>
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
					<p><fmt:formatDate value="${data.qna_regdate}" pattern="yyyy-MM-dd ,a, HH:mm:ss" /></p>
				</div>
			</div>
			<div class="name3">
				<p>내용</p>
				${data.qna_text}
			</div>
			 <div class="name3">
			 	<p>답변 내용</p>
			 	${data.qna_answer_text}
			 </div>
			 <input type="text" value="${data.qna_admin_answer}">
		</div>
		<div>
			<%-- <input type="hidden" name="qna_answer_text" value="${data.qna_answer_text}"> --%>
			<input type="hidden" name="qna_id" value="${data.qna_id}">
			<%-- <a href="Question_update?qna_id=${data.qna_id}">수정</a>
			<a href="Question_modrfy?qna_id=${data.qna_id}">수1정</a>  --%>
			<%-- <c:if test="${sessionScope.login_id eq data.member_id || sessionScope.login_auth eq '관리자'}">
			<form action="Question_update" method="POST">
				<input type="hidden" name=qna_id value="${data.qna_id}"/>
				<input type="submit" value="수정"/>
			</form>
			</c:if> --%>
			<c:if test="${sessionScope.login_auth eq '관리자' && data.qna_answer_text eq null}">
			<form action="Question_admin" method="get">
   			 <input type="hidden" id="qna_id" name="qna_id" value='${data.qna_id}'/>
   			 <input type="submit" value="답변" />
			</form>
			<c:if test="${sessionScope.login_auth eq '관리자'}">
			<form action="Question_admin_update" method="get">
   			 <input type="hidden" id="qna_id" name="qna_id" value='${data.qna_id}'/>
   			 <input type="submit" value="답변수정" />
			</form>
			</c:if>
			</c:if>
			<c:if test="${sessionScope.login_id eq data.member_id}">
			<form action="Question_update" method="get">
   			 <input type="hidden" id="qna_id" name="qna_id" value='${data.qna_id}'/>
   			 <input type="submit" value="수정" />
			</form>
			</c:if>
			<c:if test="${sessionScope.login_id eq data.member_id || sessionScope.login_auth eq '관리자'}">
			<form method="POST" action="delete">
				<input type="hidden" name="qna_id" value="${data.qna_id}" />
				<input type="submit" value="삭제" />
			</form>
			</c:if>
		</div>
	</main>
	
	
	<!-- footer -->
	<%@include file="./footer.jsp" %>

	<script type="text/javascript">
    /* let update_btn = document.querySelector(".update_btn"); */
    console.log('<c:out value="${data.qna_admin_answer}"/>')
    let list_btnn = document.querySelector(".list_btn4");
    
    list_btnn.addEventListener('click',function(){
    	if(${sessionScope.login_id == 'admin'}){
    		location.href="QnA_admin"
    	}
    		
    	else{
    		location.href="QnA" 
    	}
    	
    	
    	
    });
    
    /* update_btn.addEventListener('click',function(){
    	location.href="Question_update?qna_id=${data.qna_id}"
    }); */
    
	</script>
	
</body>
</html>