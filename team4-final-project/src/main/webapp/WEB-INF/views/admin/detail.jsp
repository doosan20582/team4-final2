<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<!--글로벌 css-->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/admin/detail.css">
<!-- 구글 폰트 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- Jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<div class="detailCon">
		<!-- 상단 -->
		<div class="innerTop">
			<div class="topLeft">
				<img alt="" src="${member.member_profile_img_url }" class="profileImg">

			</div>
			<div class="topRight">
				<p>${member.member_id }</p>
				<p>${member.member_email }</p>
				<p>${member.member_name }</p>
				<p>${member.member_phone }</p>
				<p>${member.member_age }</p>
				<p>${member.member_gender }</p>
				<p>${member.member_postal_code }</p>
				<p>${member.member_address }</p>







			</div>



		</div>
		<!-- 하단 -->
		<div class="innerBottom">
			<div class="bottomLeft">
				<fmt:formatDate value="${member.member_join_date }" />
				<fmt:formatDate value="${member.member_last_login_date }" />
				<fmt:formatDate value="${member.member_join_date }" />

				<p>${member.member_state }</p>
				<p>${member.member_withdrawal }</p>
				<p>${member.member_email_agree }</p>
				<p>${member.member_service_agree }</p>
				<p>${member.member_personal_agree }</p>
				<p>${member.grade_id }</p>
				<p>${member.member_purchase_point }</p>
				<p>${member.member_write_point }</p>
				<p>${member.member_login_count }</p>
				<fmt:formatDate value="${member.member_off_limits_date }" />
				<p>${member.member_init_pw }</p>












			</div>
			<div class="bottomRight">
				<!-- 자유 -->
				<div class="freeBoard">
					<h2>자유 게시판 글목록</h2>
					<c:forEach var="item" items="${freeMapList }">
						<div class="lineDiv">
							<span class="idxSpan">${item.board_id }</span>
							<span class="titleSpan">${item.board_title }</span>
						</div>

					</c:forEach>
				</div>
				<!-- 캠핑 -->
				<div class="camping">
					<h2>캠핑 게시판 글목록</h2>
					<c:forEach var="item" items="${campingMapList }">
						<div class="lineDiv">
							<span class="idxSpan">${item.camping_id }</span>
							<span class="titleSpan">${item.camping_title }</span>
						</div>
					</c:forEach>
				</div>
				<!-- 리뷰 -->
				<div class="review">
					<h2>질문 글목록</h2>
					<c:forEach var="item" items="${qnaMapList }">
						<div class="lineDiv">
							<span class="idxSpan">${item.qna_id }</span>
							<span class="titleSpan">${item.qna_title }</span>
						</div>
					</c:forEach>
				</div>
				<!-- 구매 -->
				<div class="review">
					<h2>구매 목록</h2>
					<c:forEach var="item" items="${orderMapList }">
						<div class="lineDiv">
							<span class="idxSpan">${item.order_id }</span>
							<span class="titleSpan">${item.product_name }</span>
							<span class="titleSpan">${item.order_state }</span>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>







	<script src="/resources/js/admin/detail.js"></script>
</body>
</html>