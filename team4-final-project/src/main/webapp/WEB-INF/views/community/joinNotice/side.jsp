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
<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<!--쇼핑몰 글로벌 css-->
<link rel="stylesheet" href="<c:url value="/resources/css/community/community_global.css?ver=2"/>">
<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Document</title>
</head>

        <div class="side">
            <h1>캠핑모임<span> 게시판</span></h1>
            <form class="side_nav">
                <li>지역</li>
                <select name="camping_region" class="side_nav_area side_nav_select">
                    <option value="">전체</option>
                    <option value="서울">서울</option>
                    <option value="경기도">경기도</option>
                    <option value="강원도">강원도</option>
                    <option value="전라북도">전라북도</option>
                    <option value="전라남도">전라남도</option>
                    <option value="경상북도">경상북도</option>
                    <option value="경상남도">경상남도</option>
                    <option value="충청북도">충청북도</option>
                    <option value="충청남도">충청남도</option>
                    <option value="제주도">제주도</option>
                </select>
                <li>모집인원</li>
                <select name="camping_recruitment" class="side_nav_number side_nav_select">
                    <option value="">전체</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                </select>
                <li>출발일</li>
                <input name="camping_departure" type="date" class="side_nav_date side_nav_select">
                <li>캠핑기간</li>
                <select name="camping_period" class="side_nav_number side_nav_select">
                    <option value="">기간</option>
                    <option value="당일">당일</option>
                    <option value="1박 2일">1박 2일</option>
                    <option value="2박 3일">2박 3일</option>
                    <option value="3박 4일">3박 4일</option>
                    <option value="4박 5일">4박 5일</option>
                </select>
                <li>마감여부</li>
                <select name="camping_close" class="side_nav_number side_nav_select">
                    <option value="">전체</option>
                    <option value="진행중">진행중</option>
                    <option value="마감">마감</option>
                </select>
                <input type="text" name="keyword" class="side_nav_search">
                <i class="xi-search side_nav_search_btn"></i>
            </form>
        </div>