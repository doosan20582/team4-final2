<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/shop/popup.css">
<title>신상품</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<div class="popupCon">
		<form name="popupForm" action="/product/detail" method="get">
			<h2>
				<span class="animateText">New</span> 
				<span class="material-symbols-outlined animateText"> new_releases </span>
				${item.product_name }
			</h2>
			
			<input type="hidden" value="${item.product_id }" id="product_id" name="product_id">
			<div class="imgDiv">
				<img alt="" src="/productImg/${item.product_img_url1 }" id="popupImg">
			</div>
		</form>



	</div>

	<script src="/resources/js/shop/popup.js"></script>
</body>
</html>