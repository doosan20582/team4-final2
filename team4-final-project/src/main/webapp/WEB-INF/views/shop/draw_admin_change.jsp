<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- �۷ι� css -->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/shop/draw_admin_change.css">
<!--���θ� �۷ι� ������ cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>

<body>
	<!-- ��� -->
	<jsp:include page="header.jsp" />

	<!--����-->
	<main>
		<form class="admin_container">
			<div class="draw_container">

				<div class="admin_main">
					<table class="admin_body">
						<tr class="admin_body_file">
							<td class="file_top_fir">�̺�Ʈ �̹���</td>
							<td><input type="file" name="file" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>��ǰŰ</td>
							<td><span id="selectedDrawName">������ ��ǰ1</span></td>
						</tr>
						<tr class="admin_title">
							<td>�ο�</td>
							<td><input type="number" value="1" id="selectDrawBtn"></td>
						</tr>
						<tr class="admin_title">
							<td>�̺�Ʈ ������</td>
							<td>�̺�Ʈ ������1</td>
						</tr>
						<tr class="admin_title">
							<td>�̺�Ʈ ������</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>���� ������</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>���� ������</td>
							<td><input type="date" class="drawInputs"></td>
						</tr>
						<tr class="admin_title">
							<td>�ڸ�Ʈ</td>
							<td><textarea name="" id="" cols="30" rows="10"></textarea></td>
						</tr>

					</table>

				</div>
				<input type="button" name="submit" value="����" class="file_submit" type="button">
			</div>
		</form>

	</main>
	<!-- Ǫ�� -->
	<jsp:include page="footer.jsp" />
	
	<script src="/resources/js/shop/draw_customer_add.js"></script>
</body>

</html>