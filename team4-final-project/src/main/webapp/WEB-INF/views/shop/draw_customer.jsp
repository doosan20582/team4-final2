<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/shop/draw_customer.css">
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
						<div class="section2_img">
							<!--이벤트 이미지-->
							<img src="" alt="">
						</div>
						<div class="section2_font">
							<!--이벤트 텍스트-->
							<div class="font_top">
								<h1>[진행 이벤트] 이벤트3</h1>
								<!--이벤트 제목-->
							</div>
							<div class="font_bottom">
								<table>
									<tbody>
										<tr>
											<td>상품키</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>가격</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>인원</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>이벤트 시작일</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>이벤트 종료일</td>
											<td>데이터1</td>

										</tr>
										<tr>
											<td>구매 시작일</td>
											<td>데이터1</td>

										</tr>
										<tr>
											<td>구매 종료일</td>
											<td>데이터1</td>

										</tr>
										<tr>
											<td>코멘트</td>
											<td>데이터1</td>
										</tr>

									</tbody>
								</table>

								<button class="font_top_button">응모하기</button>
							</div>
						</div>
					</div>
					<div class="section2-bottom">
						<div class="section2_img">
							<img src="" alt="">
						</div>
						<div class="section2_font">
							<div class="font_top">
								<h1>[마감 이벤트] 이벤트2</h1>
							</div>
							<div class="font_bottom">
								<table>
									<tbody>
										<tr>
											<td>상품키</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>가격</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>인원</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>이벤트 시작일</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>이벤트 종료일</td>
											<td>데이터1</td>

										</tr>
										<tr>
											<td>구매 시작일</td>
											<td>데이터1</td>

										</tr>
										<tr>
											<td>구매 종료일</td>
											<td>데이터1</td>

										</tr>
										<tr>
											<td>코멘트</td>
											<td>데이터1</td>
										</tr>

									</tbody>
								</table>

								<button class="font_top_button_end">결과보기</button>
							</div>
						</div>
					</div>
					<div class="section2-bottom">
						<div class="section2_img">
							<img src="" alt="">
						</div>
						<div class="section2_font">
							<div class="font_top">
								<h1>[마감 이벤트] 이벤트1</h1>
							</div>
							<div class="font_bottom">
								<table>
									<tbody>
										<tr>
											<td>상품키</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>가격</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>인원</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>이벤트 시작일</td>
											<td>데이터1</td>
										</tr>
										<tr>
											<td>이벤트 종료일</td>
											<td>데이터1</td>

										</tr>
										<tr>
											<td>구매 시작일</td>
											<td>데이터1</td>

										</tr>
										<tr>
											<td>구매 종료일</td>
											<td>데이터1</td>

										</tr>
										<tr>
											<td>코멘트</td>
											<td>데이터1</td>
										</tr>

									</tbody>
								</table>
								<button class="font_top_button_end">결과보기</button>
							</div>
						</div>
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
					<!-- 응모 결과 모달 -->
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