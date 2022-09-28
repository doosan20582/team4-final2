<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<!--쇼핑몰 글로벌 css-->
<link rel="stylesheet" href="<c:url value="/resources/css/community/community_global.css?ver=2"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/community/joinNotice/detail_user.css?ver=1"/>">

<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">

<!-- 제이쿼리 스크립트 -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 카카오맵 스크립트 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=495d480862b83fe2d322e1f0afe17685"></script>

<title>Document</title>
</head>
<body>
	<!--헤더-->
	<%@ include file="../header.jsp"%>

	<!--메인-->
	<main>

		<div class="section">
			<div class="section_header">
				<div class="section_header_profile">
					<img src="" alt="">
				</div>
				<div class="section_header_info">
					<div class="section_header_info_title">
						<div>
							<P>${data.camping_title}</P>
						</div>
						<div>
							<p>
								지역 :
								<span>${data.camping_region}</span>
							</p>
						</div>
						<div>
							<p>
								작성일 :
								<span>
									<fmt:formatDate value="${data.camping_regdate}" pattern="yy-MM-dd" />
								</span>
							</p>
						</div>
					</div>
					<div class="section_header_info_writer">
						<div>
							<p>
								작성자 :
								<span>${data.member_id}</span>
							</p>
						</div>
						<div>
							<p>
								출발일 :
								<span>
									<fmt:formatDate value="${data.camping_departure}" pattern="yy-MM-dd" />
								</span>
							</p>
						</div>
						<div>
							<p>
								마감여부:
								<span>${data.camping_close}</span>
							</p>
						</div>
					</div>
					<div class="section_header_info_count">
						<div>
							<p>
								모집인원 :
								<span>${data.camping_applicant}/${data.camping_recruitment}</span>
							</p>
						</div>
						<div>
							<p>
								기간 :
								<span>${data.camping_period}</span>
							</p>
						</div>
						<div>
							<p>
								조회수 :
								<span>${data.camping_hit}</span>
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="section_main">${data.camping_text}</div>
			<div class="section_address">
				<p>장소 : ${data.camping_campsite}</p>
				<p>주소 : ${data.campsite_address}</p>
			</div>
			<div class="section_map">
				<script>
            		let latitude = ${data.campsite_lat}; // 위도
            		let longitude = ${data.campsite_lon}; // 경도
            	</script>
			</div>

			<div class="section_list">
				<input type="button" class="section_list_btn" value="목록" onclick="location.href='/community/joinNotice/main'">
			</div>

			<div class="section_footer">
				<h1>
					<c:set var="reply_count" value="${reply_count.camping_reply_count}" />
					<script>
						let reply_count = '<c:out value="${reply_count}"/>';
					</script>
					댓글(
					<span class="reply_count">${reply_count}</span>
					)
				</h1>
				<textarea name="" id="" class="section_footer_commentInput"></textarea>

				<div class="section_footer_btnArea">
					<input type="hidden" class="camping_id" value="${data.camping_id}">
					<input type="button" class="section_footer_btnArea_btn" value="등록">
				</div>

				<div class="section_footer_commentList">
					<c:if test="${reply_count>5}">
						<div class="section_footer_commentList_viewMore">
							<div class="section_footer_commentList_viewMore_btn">
								<h1>View More</h1>
								<i class="xi-angle-down viewMore_btn"></i>
							</div>
						</div>
					</c:if>

					<c:forEach var="reply" items="${reply_data}">
						<div class="section_footer_commentList_comment">
							<div class="section_footer_commentList_comment_count">
								<c:if test="${reply.member_id eq sessionScope.login_id}">
									<i class="xi-close"></i>
									<input type="hidden" value="${reply.camping_reply_id}">
								</c:if>
								<c:if test="${reply.member_id ne sessionScope.login_id}">
									<i class="xi-close" style="display: none"></i>
									<input type="hidden" value="${reply.camping_reply_id}">
								</c:if>
							</div>
							<p>${reply.member_id}</p>
							<P>
								<fmt:formatDate value="${reply.camping_reply_regdate}" pattern="yy-MM-dd HH:mm:ss" />
							</P>
							<div class="section_footer_commentList_comment_text">
								<p>${reply.camping_reply_text}</p>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</main>

	<!--푸터-->
	<%@ include file="../footer.jsp"%>

</body>

<script src="<c:url value="/resources/js/community/joinNotice/detail.js?ver=1"/>"></script>
</html>