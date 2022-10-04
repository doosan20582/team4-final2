<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/shop/draw_customer.css">
<link rel="stylesheet" href="/resources/css/shop/draw_admin.css">
<title>Document</title>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="header.jsp" />

	<main>
		<div class="draw_container">
		<%--  <c:if test="${sessionScope.login_auth eq '회원'} || ${sessionScope.login_auth eq null}" >  --%>
		 
		 		<%-- 	 </c:if>  --%>
			<div class="">
				<div class="section1">
					<h1>
						Camping
						<span> Draw</span>
					</h1>
					<div class="section1_img">
						<img src="/resources/img/shop/럭키드로우.png" alt="">
					</div>
				</div>
				<div class="section2">
					<div class="section2-top">
						<span>드로우 목록</span>
					</div>

					<div class="section2-bottom">
						<!--foreach 반복 디비전-->
						<c:forEach var="row" items="${data}">
							<div class="section2_img">
								<!--이벤트 이미지-->
								<img src="" alt="">
							</div>
							<div class="section2_font">
								<!--이벤트 텍스트-->
								<div class="font_top">
									<h1>[진행 이벤트] 이벤트3</h1>
									<!--이벤트 제목-->
									<div class="adminBtnsContainer">
										<input type="hidden" value="수정" class="adminBtns">
										<input type="hidden" value="삭제" class="adminBtns">
									</div>
								</div>
								<div class="font_bottom">
									<table>
										<tbody>
											<tr>
												<td>상품키</td>
												<td>${row.product_id}</td>
											</tr>
											<tr>
												<td>상품 제목</td>
												<td>${row.draw_title}</td>
											</tr>
											<tr>
												<td>가격</td>
												<td>${row.draw_price}</td>
											</tr>
											<tr>
												<td>인원</td>
												<td>${row.draw_reqruit}</td>
											</tr>
											<tr>
												<td>이벤트 시작일</td>
												<td><fmt:formatDate value="${row.draw_event_start_date}" />
												 <%-- <fmt:parseDate value="${row.draw_event_start_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
												 <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>
											</tr>
												<tr>
												<td>이벤트 종료일</td>
												<td> <fmt:formatDate value="${row.draw_event_end_date}" /> 
												<%-- <fmt:parseDate value="${row.draw_event_end_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
												 <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>

											</tr>
											<tr>
												<td>구매 시작일</td>
												<td>  <fmt:formatDate value="${row.draw_pur_start_date}" /> 
												<%-- <fmt:parseDate value="${row.draw_pur_start_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
												 <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>
												
												<tr>
												<td>구매 종료일</td>
												<td> <fmt:formatDate value="${row.draw_pur_end_date}" />
												<%-- <fmt:parseDate value="${row.draw_pur_end_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
												 <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>

											</tr>
											
											<tr>
												<td>코멘트</td>
												<td>${row.draw_comment}</td>
											</tr>

										</tbody>
									</table>
                                   <div class="button_container">
                                   <input type="button" value="응모하기" class="font_top_button" id="font_top_button">
									<button class="font_top_button_end">
										응모 결과 보기
									</button>
                                   </div>
								
								</div>
							</div>
							<form method="POST" class="list_form" action="shop/draw_customer_draw"">
				<input type="hidden" name="member_id" id="user_id" value="${sessionScope.member_id}">
				
				<input type="hidden" name="draw_id" id="draw_id" value="${row.draw_id}">
				<input type="hidden" name="login_id" id="login_id" value="${sessionScope.login_id}">
		</form>
						</c:forEach> 
					</div>

                    <!-- 응모 성공 모달 -->
					<div class="modal_container">
						<div class="modal_body">
							<div class="modal_top">응모에 성공하셨습니다</div>
						 	<div class="modal_bottom">
								<button class="modal_bottom_btn">확인</button>
							</div>
						</div>
					</div>
					<div class="modal_final_container">
						<div class="modal_final_body">
							<div class="modal_final_top">추첨결과</div>
							<c:forEach var="row" items="${draw_resultList}">
							<div class="modal_final_middle">
							<div> ${row.member_id}</div>
							</c:forEach>
							</div> 
							<div class="modal_final_bottom">
							<c:if test="${row.member_id eq sessinScope.login_id}">
								<button class="modal_final_bottom_btn">확인</button>
								<button class="modal_final_bottom_btn">구매하기</button>
								</c:if>
								<c:if test="${row.member_id ne sessinScope.login_id}">
								<button class="modal_final_bottom_btn">확인</button>
								</c:if>
								
							</div>
							
						</div>
					</div>
				</div>
			</div>

		</div>
		
	</main>

	<!-- 푸터 -->
	<jsp:include page="footer.jsp" />
	<script src="/resources/js/shop/draw_customer.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	let draw_id = $('#draw_id').val(); // ajax 통신에 이용할 드로우 번호
	let user_id = $('#user_id').val();
	//let user_id = document.querySelector('#user_id').value; // 현재 접속중인 유저 아이디
	console.log(user_id);
    const login_id = document.querySelector("#user_id").value;//현재 로그인 아이디 
	const draw_btn = document.querySelector(".font_top_button");// 응모 버튼
	draw_btn.addEventListener("click",function(){ // 응모
		
		if(user_id==null || user_id==""){
			if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
				location.href='/login';
			}
		} else {
			let draw_apply = {
					draw_id : draw_id,
					member_id : login_id 
			}
			$.ajax({
				type : "POST",
				url : "/shop/draw_customer_button",
				contentType : "application/json",
				data : JSON.stringify(draw_apply),
				success : function(data) {
					if(data=="fail"){
						alert("이미 응모했습니다.");
					}
					$('.draw_customer').load(location.href+' .draw_customer');
				},
				error : function(data) {
					console.log(data);
				}
			});
		}
	})

	
	
/* 	
	let draw_modal= document.querySelector('.modal_container'); // 응모 성공 모달
	let draw_button=document.querySelector('.font_top_button');
	
	
	draw_button.addEventListener('click' , ajaxMemberID);
	
	function ajaxMemberID(){
		alert("너는 바보다");
		// 카테고리 아이디 파람으로 설정
		const param = {draw_id : this.innerHTML }

		
		//에이잭스 시작
		$.ajax({ 
			//url
			url : '/shop/customer_memberId.os',
			//내가 보낼 거 
			data : param,
			dataType : 'json',
			//method (get/post)
			type : 'get',
			//에이잭스 통신 실패 했을시 실행할 함수
			error : function(){
				alert('카테고리 에이잭스 통신 실패');
			},
			//에이잭스 통신 성공 했을시 실행할 함수
			success : function(MemberList){
		
				
				const modal_final_middle = document.querySelector('.modal_final_middle');
				// 반복문을 통해 리무브 차일드 하기
				for(let i = 0; i < MemberList.length; i++){
							//productList 값으로 버튼 생성
							let testdiv = document.createElement('div');
							testdiv.className = 'memberIds';
							//카테고리 구역에 버튼들 추가
							modal_final_middle.appendChild(testdiv);
							//버튼에 브랜드 이름 추가
							testdiv .innerHTML = MemberList[i].member_id;
				
						
				}
				
			}
				
		})
		}; */
	
	</script>
</body>

</html>