<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--���θ� �۷ι� ������ cdn-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>

<body>
	<!-- ��� -->
	<jsp:include page="header.jsp" />
	<!--����-->
	<main>
		<div class="draw_container">
			<form class="count_container" method="POST"
				action="/shop/draw_admin_count?draw_id=${draw_id}">


				<div class="count_main">
					<table class="count_body">
						<thead>
							<tr class="count_Title_title">
								<th><label class="checkbox-inline"> <input
										type="checkbox" id="allCheckBox" onclick="allChecked()">
								</label></th>
								<th colspan="4">�̺�Ʈ 1 ����ȸ�� ���</th>
							</tr>
						</thead>
						<tbody>

							<tr class="count_Title">
								<c:forEach var="row" items="${data}">
									<td><label class="all-chckbox"> 
									<input type="checkbox" name="chk" class="chk" onclick="chkClicked()" value=${row.member_id}>
									</label>
									
									<td> ${row.member_id}</td>
								</c:forEach>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="draw_id" id="hidden" value="${map.draw_id}">
					<input value="�����ϱ�" class="file_submit"
						type="button" onclick="checkForm()">
				</div>


			</form>
		</div>

	</main>
	<!-- Ǫ�� -->
	<jsp:include page="footer.jsp" />
	<script src="/resources/js/shop/draw_admin_count.js"></script>
	<script>
	function checkForm(){
		var draw_id= document.querySelector("#hidden").value;
		var checkArray = new Array();
		// let testt = JSON.parse('${filter}');
		checkArray.push(draw_id);
		$('input[name=chk]:checked').each(function(){
			checkArray.push($(this).val());
		});
		console.log(checkArray);
	$.ajax({
			url : "/shop/draw_admin_count.os",
			type : "POST",
			dataType : "text",
			data : {
				valueArrTest:checkArray
			},
			success : function(){
		alert("���� �Ϸ�Ǿ����ϴ�");
		
				 
		     }

				
				
			}) 
		}
	</script>

</body>

</html>