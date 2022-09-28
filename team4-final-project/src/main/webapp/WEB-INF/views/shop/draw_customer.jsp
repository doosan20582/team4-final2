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
						<c:forEach var="row" items="${list}">
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
												<td>${row.draw_id}</td>
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
										
										
											

											</tr>
											
											<tr>
												<td>코멘트</td>
												<td>${row.draw_comment}</td>
											</tr>

										</tbody>
									</table>
                                   <div class="button_container">
                                   <button class="font_top_button"">
										응모하기
									</button>
									<button class="font_top_button_end"">
										응모 결과 보기
									</button>
                                   </div>
								
								</div>
							</div>
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
							<div class="modal_final_middle">
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
							</div>
							<div class="modal_final_bottom">
								<button class="modal_final_bottom_btn">확인</button>
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
</body>

</html>