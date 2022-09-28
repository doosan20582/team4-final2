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
<link rel="stylesheet" href="/resources/css/shop/draw_admin_count.css">
<!--���θ� �۷ι� ������ cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>

<body>
	<!-- ��� -->
	<jsp:include page="header.jsp" />
	<!--����-->
	<main>
		<div class="draw_container">
			<form class="count_container">
				<div class="count_main">
					<table class="count_body">
						<thead>
							<tr class="count_Title_title">
								<th colspan="4">�̺�Ʈ 1 ����ȸ�� ���</th>
							</tr>
						</thead>
						<tbody>
							<tr class="count_Title">
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
							</tr>
							<tr class="count_Title">
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
							</tr>
							<tr class="count_Title">
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
							</tr>
							<tr class="count_Title">
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
								<td><input type="checkbox" class="box"> ��÷��</td>
							</tr>
						</tbody>
					</table>
					<input type="button" name="submit" value="�����ϱ�" class="file_submit" type="button" onclick="location.href='draw_admin.html'">

				</div>

			</form>
		</div>

	</main>
	<!-- Ǫ�� -->
	<jsp:include page="footer.jsp" />

</body>

</html>