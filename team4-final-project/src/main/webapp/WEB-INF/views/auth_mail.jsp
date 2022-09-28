<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/auth_mail.css">
<title>인증번호 체크</title>
</head>
<body>
	<!--메일인증 처리 전 저장할 임시 데이터 목록 
		
		String member_id;
		String member_pw;
		String member_email;
		String member_name;
		String member_phone;
		int member_age;
		String member_gender;
		String member_postal_code;
		String member_address;
		String member_email_agree;
		String member_profile_img_url;
		
	 -->
	<form action="joinSuccess" method="post" id="joinForm">
		<input type="hidden" name="member_id" value="${member.member_id }">
		<input type="hidden" name="member_pw" value="${member.member_pw }">
		<input type="hidden" name="member_email" value="${member.member_email }">
		<input type="hidden" name="member_name" value="${member.member_name }">
		<input type="hidden" name="member_phone" value="${member.member_phone }">
		<input type="hidden" name="member_gender" value="${member.member_gender }">
		<input type="hidden" name="member_postal_code" value="${member.member_postal_code }">
		<input type="hidden" name="member_address" value="${member.member_address }">
		<input type="hidden" name="member_email_agree" value="${member.member_email_agree }">
		<input type="hidden" name="member_profile_img_url" value="${member.member_profile_img_url }">
	</form>
	
	<h2>랜덤 코드 : [ ${code } ]</h2>
	

	<!-- 이메일 인증번호 -->
	<div class="secretEmailDiv">
		<input type="hidden" id = "codeInput" value=${code }>
		<input type="text" name="secretEmailText" id="secretEmailText" placeholder="인증번호를 입력해 주세요">
		<button class="secretEmailBtn">인증번호 체크</button>
		<span class="secretEmailSpan"></span>
	</div>
	


<script src="/resources/js/auth_mail.js"></script>
</body>
</html>