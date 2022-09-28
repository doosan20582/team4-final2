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
<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Document</title>
</head>

<body>
	<div class="side_nav">
		<form class="side_nav_form1" method="get">
			<input name="board_tag_id" class="side_nav_input" type="hidden" value="">
		</form>
		<li class="side_nav_tag all_tag">전체</li>
		<c:forEach var="tag" items="${tag}">
			<li class="side_nav_tag">${tag.board_tag_name}</li>
		</c:forEach>
		<form class="side_nav_form2" method="get">
			<input type="text" class="side_nav_search" name="keyword">
			<i class="xi-search side_nav_search_btn"></i>
		</form>
	</div>
</body>

</html>