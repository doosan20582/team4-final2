<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--글로벌 css-->
    <link rel="stylesheet"
	href="<c:url value="/resources/css/community/global.css?ver=2"/>">
    <!--쇼핑몰 글로벌 아이콘 cdn-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
    <title>Document</title>
</head>
<body>
     <!--헤더-->
     <header>
        <div class="logo">
            <a href="/community/main"><h1>Camp<span>ing</span></h1></a>
        </div>
        <div class="menu">
            <a href="/community/freeNotice/main">자유게시판</a>
            <a href="">사진게시판</a>
            <a href="/community/joinNotice/main">캠핑모임게시판</a>
        </div>
        <div class="login">
            <a href="">
                <i class="xi-search"></i>
            </a>
            <a href="">
                <i class="xi-truck"></i>
            </a>
            <a href="basket.html">
                <i class="xi-cart"></i>
            </a>
            
             <c:if test="${sessionScope.login_id eq null}">
            	<a href="/login">LogIn</a>
	            <a href="">SignUp</a>
	            <input type=hidden id=user_id value="">
            </c:if>
            <c:if test="${sessionScope.login_id ne null}">
	            <a>${sessionScope.login_id} 님</a>
	            <button id="logOutBtn">LogOut</button>
	            <input type=hidden id=user_id value="${sessionScope.login_id}">
            </c:if>
        </div>
    </header>
      
</body>
</html>