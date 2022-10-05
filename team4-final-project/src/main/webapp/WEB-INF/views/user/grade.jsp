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
			<div class="myGrade">
				<div class="myGradeState"
					style="background-color: ${Info.grade_color}">
					<div class="myGradeState_top">
						<h3>${Info.member_id}���ǵ���� ${Info.grade_name}</h3>
					</div>
					<div class="myGradeState_bottom">
						<div id="circle">�������</div>
						<div id="text1">
							��ǰ ���� �� �� ��ǰ <b> ${Info.grade_accrual_rate*100}% ����</b>
						</div>
						<div id="text2">
							��ǰ ���� �� �� ��ǰ <b> ${Info.grade_discount*100}% ����</b>
						</div>
					</div>
				</div>
				<div class="NextMonthGrade">
					<div class="NextMonthGrade"
						style="background-color: ${nextInfo.grade_color}">
						<p class="p1">
							������ �������� <span id="cus_nextgrade">${naxtInfo.grade_name}</span>
						</p>
						<p class="p1">
							<span id="cus_money">${naxtInfo.grade_start_point-(Info.member_purchase_point+Info.member_write_point)}</span>
							�� �� ������ ������!
						</p>
					</div>
				</div>
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


					<div class="grade level1">
						<div class="grade_left">
							<h3>�ڹ�</h3>
							<p>���� ����Ʈ ${Info.grade_start_point}���� �̻�</p>
							<p>
								���� �� <span id="l1">${Info.grade_discount*100}% ����</span> <span
									id="l1">${Info.grade_accrual_rate*100}% ���� </span>
							</p>
						</div>
						<div class="grade_right">
							<img src="file:C:/gradeImg/${Info.grade_img_url }">
						</div>
					</div>


				 <div class="grade level2">
					<div class="grade_left">
						<h3>���޶���</h3>
						<p>���� ����Ʈ ${Info.grade_start_point}���� �̻�</p>
						<p>
							���� �� <span id="l1">${Info.grade_discount*100}% ����</span> <span
								id="l1">${Info.grade_accrual_rate*100}% ���� </span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/gradeImg/���޶���.PNG">
					</div>
				</div>
				<div class="grade level3">
					<div class="grade_left">
						<h3>���</h3>
						<p>�Ѵ� ���� �ݾ� 0���� �̻�</p>
						<p>
							���� �� <span id="l3">�� ǰ�� 8% ����</span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/resources/img/���.PNG">
					</div>
				</div>
				<div class="grade level4">
					<div class="grade_left">
						<h3>�����̾�</h3>
						<p>�Ѵ� ���� �ݾ� 0���� �̻�</p>
						<p>
							���� �� <span id="l4">�� ǰ�� 12% ����</span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/resources/img/�����̾�.PNG">
					</div>
				</div>
				<div class="grade level5">
					<div class="grade_left">
						<h3>���̾Ƹ��</h3>
						<p>�Ѵ� ���� �ݾ� 0���� �̻�</p>
						<p>
							���� �� <span id="l5">�� ǰ�� 16% ����</span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/resources/img/���̾Ƹ��.PNG">
					</div>
				</div>

			</div>
		</div>
		</div>
	</main>


</body>
</html>