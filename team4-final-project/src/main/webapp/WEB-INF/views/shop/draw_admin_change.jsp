<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/shop/draw_admin_change.css">
<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="header.jsp" />

	<!--메인-->
	<main>
		<form class="admin_container">
			<div class="draw_container">

				<div class="admin_main">
					<table class="admin_body">
						<tr class="admin_body_file">
							<td class="file_top_fir">이벤트 이미지</td>
							<td><input type="file" name="file" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>상품키</td>
							<td><span id="selectedDrawName">한정판 상품1</span></td>
						</tr>
						<tr class="admin_title">
							<td>인원</td>
							<td><input type="number" value="1" id="selectDrawBtn"></td>
						</tr>
						<tr class="admin_title">
							<td>이벤트 시작일</td>
							<td>이벤트 시작일1</td>
						</tr>
						<tr class="admin_title">
							<td>이벤트 종료일</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>구매 시작일</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>구매 종료일</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>코멘트</td>
							<td><textarea name="" id="" cols="30" rows="10"></textarea></td>
						</tr>

					</table>

				</div>
				<input type="button" name="submit" value="수정" class="file_submit" type="button">
			</div>
		</form>

	</main>
	<!-- 푸터 -->
	<jsp:include page="footer.jsp" />
	
	<script src="/resources/js/shop/draw_customer_add.js"></script>
</body>

</html>