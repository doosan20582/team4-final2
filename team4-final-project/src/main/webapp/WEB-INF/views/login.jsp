<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/login.css">
<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">

<title>로그인</title>
<style>
</style>
</head>

<body>
	
	<!--로그인 컨테이너-->
	<div class="loginContainer">
		<form action="login" method="post">
			<!--아이디 컨테이너-->
			<div class="idDiv">
				<input type="text" name="member_id" id="" class="formInputs" placeholder="아이디" required="required">
			</div>
			<!--비밀번호 컨테이너-->
			<div class="pwDiv">
				<input type="password" name="member_pw" id="" class="formInputs" placeholder="비밀번호" required="required">
			</div>
			<!--서브밋-->
			<div class="btnDiv">
				<input type="submit" value="로그인" class="formBtns">
			</div>
		</form>
	</div>
	<script src="/resources/js/login.js"></script>
</body>

</html>