<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- �۷ι� css -->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/user/grade.css">
<!--���θ� �۷ι� ������ cdn-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>
<body>



	<!--����-->
	<main>
		<div class="mainDiv">
			<!-- ���� �� �κ� : �̹��� �� ��� -->
<!-- 			<div class="myGrade"> -->
				<div class="myGradeState"
					style="background-color: ${Info.grade_color}">
					<div class="myGradeState_top">
						<h3>${Info.member_id}���ǵ���� ${Info.grade_name}</h3>
					</div>
					<div class="myGradeState_bottom" style= "border: solid 1px ${Info.grade_font_color}">
						<div id="circle">�������</div>
						<div id="text1">
							��ǰ ���� �� �� ��ǰ <b ${Info.grade_font_color}> <fmt:formatNumber type="percent"  value="${Info.grade_accrual_rate}" /> ����</b>
			
<%-- 						<div id="text2">
							��ǰ ���� �� �� ��ǰ <b ${Info.grade_font_color}> ${Info.grade_discount*100}% ����</b>
						</div> --%>
					</div>
					</div>
					<div>
					
					</div>
				<!-- </div> -->
<%-- 					<div class="NextMonthGrade"
						style="background-color: ${nextInfo.grade_color}">
						<p class="p1">
							<span id="cus_money"><fmt:formatNumber type="Number" pattern = "#,###"  value="${Info.grade_end_point+1-Info.grade_start_point}" /></span>
							P �� ������ ������!
						</p>
					</div> --%>
			</div>



			<!-- ���� �Ʒ��κ� : ��޺� ���� �ȳ� -->
			<div class="gradeAdventage">

				<div class="grade_info">
					<ul>
						<h3>��޺� ���� �ȳ�</h3>
						<li>���� ����Ʈ �ջ� ��, �ڵ����� ����� �����մϴ�.</li>
						<li>��� ���� ��������� ���� �� ���������� ���� �����մϴ�.</li>
					</ul>
				</div>
					<c:forEach var="Info" items="${map.InfoAll}" >
		
					
					<div class="grade" data-hover="${Info.grade_font_color}" style="background-color: ${Info.grade_color}; border:solid 2px ${Info.grade_font_color};">
						<div class="grade_left">
							<h3 style="color: ${Info.grade_font_color}">${Info.grade_name }</h3>
							<p>���� ����Ʈ <fmt:formatNumber type="Number" pattern = "#,###"  value="${Info.grade_start_point}" />P �̻�</p>
							<p>
								���� �� <span style="color: ${Info.grade_font_color}"><fmt:formatNumber type="percent"  value="${Info.grade_discount}" /> ����</span>
								<span style="color: ${Info.grade_font_color}"><fmt:formatNumber type="percent"  value="${Info.grade_accrual_rate}" /> ���� </span>
							</p>
						</div>
						<div class="grade_right">
							<img src="/gradeImg/${Info.grade_img_url }">
						</div>
					</div>
					</c:forEach>



			</div>
		</div>
	</main>
	<script src="resources/js/user/grade.js"></script>

</body>
</html>