<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--쇼핑몰 글로벌 css-->
<link rel="stylesheet" href="<c:url value="/resources/css/community/freeNotice/input.css?ver=4"/>">
<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<!--쇼핑몰 글로벌 css-->
<link rel="stylesheet" href="<c:url value="/resources/css/community/community_global.css?ver=2"/>">
<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<!-- 에디터 스크립트 -->
<script type="text/javascript" src="<c:url value="/resources/editor/ckeditor/ckeditor.js"/>"></script>

<title>Document</title>
</head>

<body>
	<!--헤더-->
	<%@ include file="../header.jsp"%>
	<!--메인-->
	<main>
		<form class="section" method="POST">
			<div class="section_header">
				<h1>제목</h1>
				<select name="board_tag_id" id="" class="section_header_brackets">
					<option value="">말머리 선택</option>
					<option value=1>[잡담]</option>
					<option value=2>[공지]</option>
					<option value=3>[캠핑팁]</option>
					<option value=4>[상품후기]</option>
					<option value=5>[캠핑후기]</option>
				</select>
				<textarea name="board_title" id="" class="section_header_headline" placeholder="제목을 입력하세요."></textarea>
			</div>

			<div class="section_main">
				<h1>내용</h1>
				<textarea name="board_text" id="content" class="section_main_write" placeholder="내용을 입력하세요."></textarea>
				<!-- 에디터 스크립트 -->
				<script type="text/javascript">
					CKEDITOR.replace('content', {
						filebrowserUploadUrl : "/community/imgUpload",
						height : 1050
					});
				</script>
			</div>

			<div class="section_footer">
				<input type="hidden" value="${sessionScope.login_id}" name="member_id">
				<input type="button" value="글 등록" class="section_footer_registrationBtn">
			</div>
		</form>
	</main>
	<!--푸터-->
	<%@ include file="../footer.jsp"%>
	
	<script src="<c:url value="/resources/js/community/freeNotice/input.js?ver=1"/>"></script>
</body>

</html>