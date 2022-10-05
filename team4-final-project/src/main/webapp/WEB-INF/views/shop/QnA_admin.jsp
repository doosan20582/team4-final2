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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Document</title>

</head>
<!-- header -->
<%@include file="./header.jsp"%>

<!--메인-->
<body>
	<main>
		
		<div class="QnA_Title">
			<h1>QnA</h1>
			<input id="QnA_Title_btn1" class="asked" type="button" value="자주묻는질문">
		</div>
		<form action="/shop/QnA_admin" name="sk">
			<div class="QnA_Nav">
				<label for="QnA_Nav_btn7"><input type="radio" name="checkadmin" class="checkadmintype" id="QnA_Nav_btn7" value="all">전체</label> 
				<label for="QnA_Nav_btn8"><input type="radio" name="checkadmin" class="checkadmintype" id="QnA_Nav_btn8" value='Y'>Y</label>
				<label for="QnA_Nav_btn9"><input type="radio" name="checkadmin" class="checkadmintype" id="QnA_Nav_btn9" value='n'>n</label>
				<input type="button" id="checkadminboxbtn" value="정렬하기">
			</div> 
			<div class="QnA_Search">
				<input id="QnA_Search_text" name="QnASearch" type="search" placeholder="제목을 검색하세요.">
				<input id="QnA_Search_btn" type="submit" value="검색">
			</div> 
		
		<!-- <div class="QnA_Nav">
			<label for="QnA_Nav_btn6"><input type="radio" name="checkcategory" class="checktype" id="QnA_Nav_btn6" value="all">전체</label>
			<label for="QnA_Nav_btn2"><input type="radio" name="checkcategory" class="checktype" id="QnA_Nav_btn2" value='배송'>배송</label> 
			<label for="QnA_Nav_btn1"><input type="radio" name="checkcategory" class="checktype" id="QnA_Nav_btn1" value='주문/결제' >주문/결제</label> 
			<label for="QnA_Nav_btn3"><input type="radio" name="checkcategory" class="checktype" id="QnA_Nav_btn3" value='취소/교환/환불'>취소/교환/환불</label> 
			<label for="QnA_Nav_btn4"><input type="radio" name="checkcategory" class="checktype" id="QnA_Nav_btn4" value='회원'>회원</label> 
			<label for="QnA_Nav_btn5"><input type="radio" name="checkcategory" class="checktype" id="QnA_Nav_btn5" value='기타'>기타</label>
			<input type="button" id="checkboxbtn" value="정렬하기">
		</div> -->
		
		</form>
		<div class="QnA_Admin_Main">
			<table class="QnA_Admin_Main_Table">
				<thead>
					<tr>
						<th>구분</th>
						<th>제목</th>
						<th>작성일</th>
						<th>답변여부</th>
					</tr>
				</thead>

				<c:forEach var="row" items="${list}">
					<tr class="qna_table">
						<td>${row.qna_category}</td>
						<c:if test="${row.qna_public eq '공개' || sessionScope.login_auth eq '관리자' || row.member_id eq sessionScope.login_id}">
						<td><a href="QnA_detail?qna_id=${row.qna_id}">${row.qna_title}</a></td>
						</c:if>
						<c:if test="${row.qna_public ne '공개' && sessionScope.login_auth ne '관리자' && row.member_id ne sessionScope.login_id}">
						<td>
						비공개글입니다.
						</td>
						</c:if>
						<td><fmt:formatDate value="${row.qna_regdate}" pattern="yyyy-MM-dd ,a, HH:mm:ss" /></td>
						<td>${row.qna_admin_answer}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="QnA_Paging">
					
		<c:if test="${paging.startPage != 1 }">
			<a href="/shop/QnA_admin?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/shop/QnA_admin?nowPage=${p }&cntPerPage=${paging.cntPerPage}&checkadmin=${checkadmin}&QnASearch=${QnASearch}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/shop/QnA_admin?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	
		</div>
		
		<input type="hidden" value="${sessionScope.login_id}" class="sesseionlogin_id">
	</main>


	<!-- footer -->
	<%@include file="./footer.jsp"%>


	<!-- <script src="js/QnA.js"></script> -->

	<script type="text/javascript">
	let login_id = document.querySelector(".sesseionlogin_id");
    let QnA_Title_btn = document.querySelector("#QnA_Title_btn");
    let checkboxbtn = document.querySelector("#checkboxbtn");
    let checktype = document.querySelectorAll(".checktype");
    let checkadminboxbtn = document.querySelector("#checkadminboxbtn");
    let checkadmintype = document.querySelectorAll(".checkadmintype");
    let asked = document.querySelector(".asked");
    
    /* QnA_Title_btn.addEventListener('click',function(){
    	if(login_id.value!=null && login_id.value!=''){
    		console.log(login_id);
    		location.href="Question";
    	}else{
    		alert("로그인 후 이용해주세요!");
    		location.href="/login";
    	}
    	
    }); */
    
    asked.addEventListener('click', function(){
    	location.href="asked_Question";
    }); 
    
    
    /* checkboxbtn.addEventListener('click', function(){
    	for(let i=0; i<checktype.length; i++){
    		if(checktype[i].checked == true){
    			console.log(checktype[i].value);
    			document.sk.submit();
    		}
    	}
    		
    }); */
    
    checkadminboxbtn.addEventListener('click', function(){
    	for(let i=0; i<checkadmintype.length; i++){
    		if(checkadmintype[i].checked == true){
    			console.log(checkadmintype[i].value);
    			document.sk.submit();
    		}
    	}
    		
    });
  
	</script> 
</body>
</html>