<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--쇼핑몰 글로벌 css-->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/gradePolicy_admin.css">

 <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<title>등급 정책</title>
</head>
<body>
	<!--헤더-->
	<%@include file="shop/header.jsp" %>
	<!--메인-->
	<main>
		<div class="navDiv"></div>
		<div class="mainDiv">
			<h1>등급 정책</h1>
			<div class="subnav">
				<p>
					총 개의 등급이 있습니다.
				</p>
				<div class="btn">
					<input type="submit" value="추가" class="btn  insert_btn" onclick="location.href='/gradePolicyAdd_admin'"/>
<!-- 					 <input type="submit" value="수정" class="btn  update_btn" onclick="location.href='/gradePolicyUpdate_admin'" /> -->
					<input type="button" value="삭제" class="btn  delete_btn" onclick="selectDelete();"/>
				</div>
			</div>
				<div class="form">
					<table border="1">
						<thead>
							<tr>
								<th><input type="checkbox" name="selectall" 
								value="all" onclick="selectAll(this)"></th>
								<th>번호</th>
								<th>등급명</th>
								<th>시작 포인트</th>
								<th>끝 포인트</th>
								<th>할인율</th>
								<th>적립율</th>
								<th>배경색</th>
								<th>글자색</th>
								<th>이미지</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${gradePolicy}" var="row">
								<tr>
									<td><input type="checkbox" name="grade" 
									value="${row.grade_id}"  onclick="checkSelectAll()"></td>
									<td>${row.grade_id}</td>
									<td>${row.grade_name}</td>
									<td>${row.grade_start_point}</td>
									<td>${row.grade_end_point}</td>
									<td>${row.grade_discount*100}%</td>
									<td>${row.grade_accrual_rate*100}%</td>
									<td style = "background-color:${row.grade_color}"></td>
									<td style = "background-color:${row.grade_font_color}"></td>
									<td><img src="/gradeImg/${row.grade_img_url}"
										width="80%" height="100%"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			

		</div>
	</main>
	<!--푸터-->
	<%@include file="shop/footer.jsp" %>
	<script src="resources/js/gradePolicy_admin.js"></script>

</body>
</html>