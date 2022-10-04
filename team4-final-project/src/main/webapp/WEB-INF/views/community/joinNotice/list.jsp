<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${empty list}">
		<div class=not_found>
			<i class="xi-search side_nav_search_btn"></i>
			<h1>검색 결과가 없습니다</h1>
		</div>
</c:if>

<c:forEach var="data" items="${list}">
<div class="section_notice_main_content">
	<li>${data.camping_id}</li>
	<li class="camping_title">${data.camping_title} [${data.reply_count}]</li>
	<li>${data.member_id}</li>
	<li>${data.camping_region}</li>
	<li>${data.camping_applicant}/${data.camping_recruitment}</li>
	<li><fmt:formatDate value="${data.camping_departure}" pattern="yy-MM-dd" /></li>
	<li>${data.camping_period}</li>
	<li>${data.camping_hit}</li>
	<c:if test="${data.camping_close eq '마감'}">
		<li style="color:red">${data.camping_close}</li>
	</c:if>
	<c:if test="${data.camping_close ne '마감'}">
		<li>${data.camping_close}</li>
	</c:if>
		<c:if test="${member_auth eq '관리자'}">
			<input class="list_check" type="checkbox">
		</c:if>
		<c:if test="${member_auth ne '관리자'}">
			<input class="list_check" type="checkbox" style="display: none">
		</c:if>
	</div>
		<form method="POST" class="list_form" action="/community/joinNotice/go_detail">
				<input type="hidden" name="user_id" value="${data.member_id}">
				<input type="hidden" name="camping_id" value="${data.camping_id}">
				<input type="hidden" name="login_id" value="${sessionScope.login_id}">
		</form>
</c:forEach>