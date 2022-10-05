<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 글로벌 -->
<link rel="stylesheet" href="/resources/css/global.css">
<!--커뮤니티 글로벌 css-->
<link rel="stylesheet" href="<c:url value="/resources/css/community/community_global.css?ver=1"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/community/main.css?ver=1"/>">
<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<title>Document</title>
</head>
<body>
	<!--헤더-->
	<%@ include file="header.jsp"%>

	<!--메인-->
	<main>
		<!-- 화제의 사진 -->
		<div class="recommendation">
			<div class="recommendation_header">
				<h1>
					화제의
					<span>사진</span>
				</h1>
				<h3>+ 더보기</h3>
			</div>

			<div class="recommendation_main">
				<div class="recommendation_main_imgBox">
					<div class="recommendation_img">
						<img src="/community/imgSubmit?uid=67ff1ee8-8ea9-4903-a339-0faee29db899&amp;fileName=캠핑메인.jpg" alt="">
					</div>
					<div class="recommendation_img">
						<img src="/community/imgSubmit?uid=c77ff10a-3b5e-40e1-b8ac-64a788378aff&fileName=메인img.jpg" alt="">
					</div>
					<div class="recommendation_img">
						<img src="/community/imgSubmit?uid=add5a0b0-eedd-45c1-92f1-79819b6f79ae&fileName=메인img2.jpg" alt="">
					</div>
					<div class="recommendation_img">
						<img src="/community/imgSubmit?uid=e30dfbf3-8ea4-42cc-a896-03f494cae303&fileName=메인img3.jpg" alt="">
					</div>
					<div class="recommendation_img">
						<img src="/community/imgSubmit?uid=ce204025-8ceb-4ade-b01d-d87d3ae912c0&fileName=메인img4.jpg" alt="">
					</div>
				</div>
			</div>

		</div>

		<section>
			<div class="section1">
				<!-- 자유게시판 -->
				<div class="section1_noticeBoard">
					<div class="section1_noticeBoard_header">
						<h1>
							자유게시판
							<span>Top 10</span>
						</h1>
						<h3><a href="/community/freeNotice/main">+ 더보기</a></h3>
					</div>

					<div class="section1_noticeBoard_main">
						<div class="section1_noticeBoard_title">
							<li>글번호</li>
							<li>말머리</li>
							<li>제목</li>
							<li>글쓴이</li>
							<li>날짜</li>
							<li>조회수</li>
							<li>추천수</li>
						</div>

						<div class="section1_noticeBoard_content">
							<%@ include file="freeNotice/list.jsp"%>
						</div>
					</div>
				</div>
				<!-- 공지사항 -->
				<div class="section1_notice">
					<div class="section1_notice_header">
						<h1>현재 모집중인 <span>캠핑모임</span></h1>
						<h3><a href="/community/joinNotice/main">+ 더보기</a></h3>
					</div>
					
					<div class="section1_notice_main">
						<div class="section1_notice_title">
							<li>글번호</li>
							<li>제목</li>
							<li>글쓴이</li>
							<li>지역</li>
							<li>인원</li>
							<li>출발일</li>
							<li>기간</li>
							<li>조회수</li>
							<li>마감여부</li>
						</div>

						<div class="section1_notice_content">
							<%@ include file="joinNotice/list.jsp"%>
						</div>
					</div>
				</div>
			</div>

			<div class="section2">
				<!-- 이벤트,프로모션 -->
				<div class="section2_event">
					<div class="section2_event_header">
						<h1>
							이벤트
							<span>& 프로모션</span>
						</h1>
					</div>

					<div class="section2_event_main">
						<div class="section2_event_content"></div>
					</div>
				</div>
				<!-- 날씨 정보 -->
				<div class="section2_map">
					<div class="section2_map_header">
						<h1>날씨정보</h1>

						<select name="camping_region" class="section2_map_list">
							<option class="location_list" value="서울">서울</option>
							<option class="location_list" value="경기도">경기도</option>
							<option class="location_list" value="강원도">강원도</option>
							<option class="location_list" value="전라북도">전라북도</option>
							<option class="location_list" value="전라남도">전라남도</option>
							<option class="location_list" value="경상북도">경상북도</option>
							<option class="location_list" value="경상남도">경상남도</option>
							<option class="location_list" value="충청북도">충청북도</option>
							<option class="location_list" value="충청남도">충청남도</option>
							<option class="location_list" value="제주도">제주도</option>
						</select>
					</div>

					<div class="section2_map_main">
						<div class="section2_map_content">
							<div class="section2_map_content_main">
								<div class="section2_map_content_main_icon">
									<img class="section2_map_content_main_icon_img" src="">
								</div>
								<div class="section2_map_content_main_info">
									<p><span class="temp"></span>&deg;C</p>
									<p class="weather"></p>
									<p class="location"></p>
								</div>
							</div>
							<div class="section2_map_content_footer">
								<div class="section2_map_content_footer_wind">
									<p>Wind speed</p>
									<p><span class="wind_speed"></span> m/s</p>
								</div>
								<div class="section2_map_content_footer_hum">
									<p>Humidity</p>
									<p><span class="humidity"></span> %</p>
								</div>
								<div class="section2_map_content_footer_cloud">
									<p>Clouds</p>
									<p><span class="clouds"></span> %</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 실시간 채팅 -->
				<div class="section2_chat">
					<div class="section2_chat_header">
						<h1>
							실시간
							<span>채팅</span>
						</h1>
						<h3>참여</h3>
					</div>

					<div class="section2_chat_main">
						<div class="section2_chat_content"></div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!--푸터-->
	<%@ include file="footer.jsp"%>

</body>

<script src="<c:url value="/resources/js/community/main.js?ver=1"/>"></script>
</html>