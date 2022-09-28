<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="item" items="${reviewList }">
		<div class="reviews">
			<p>${item.product_review_id }</p>
			<p>${item.product_id }</p>
			<p>${item.member_id }</p>
			<p>${item.product_review_regdate }</p>
			<p>${item.product_review_text }</p>
			<p>${item.product_review_grade }</p>
			<p>${item.product_review_helpful }</p>
			<p>${item.product_review_img_url }</p>
			<p>${item.product_review_video_url }</p>
			<p>${item.product_review_speed }</p>
		</div>
	</c:forEach>
</body>
</html>