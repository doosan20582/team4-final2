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
<link rel="stylesheet" href="/resources/css/shop/draw_admin_count.css">
<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>

<body>
	<!-- 헤더 -->
	<jsp:include page="header.jsp" />
	<!--메인-->
	<main>
		<div class="draw_container">
			<form class="count_container">
				<div class="count_main">
				<!--foreach 반복 디비전-->
				<c:forEach var="row" items="${list}">
					<table class="count_body">
						<thead>
							<tr class="count_Title_title">
								<th colspan="4">이벤트 1 응모회원 목록</th>
							</tr>
						</thead>
						<tbody>
							<tr class="count_Title">
								<td><input type="checkbox" class="box">${row.member_id}</td>
							</tr>
						</tbody>
					</table>
					<input type="button" name="submit" value="적용하기" class="file_submit" type="button" onclick="location.href='draw_admin.html'">
                </c:forEach>
				</div>

			</form>
		</div>

	</main>
	<!-- 푸터 -->
	<jsp:include page="footer.jsp" />

</body>

</html>