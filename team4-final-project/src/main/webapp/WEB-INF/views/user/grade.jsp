<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!-- �ǹ� �ľ� �ʿ�!!!! -->

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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>
<body> 
	 
	<!--����-->
	<main>
		<div class="mainDiv">
			<!-- ���� �� �κ� : �̹��� �� ��� -->
			<div class="myGrade">
				<div class="myGradeState" style="background-color: ${Info.grade_color}">
					<div class="myGradeState_top">
						<h3>${Info.member_id} ���� ����� ${Info.grade_name}</h3>
					</div>
					<div class="myGradeState_bottom">
						<div id="circle">�������</div>
						<div id="text1" >��ǰ ���� �� �� ��ǰ ${Info.grade_accrual_rate*100}% ����</div>
						<div id="text2">��ǰ ���� �� �� ��ǰ ${Info.grade_discount*100}% ����</div>
					</div>
				</div>
				<div class="NextMonthGrade">
					<div class="NextMonthGrade" style="background-color: ${Info.grade_color}">
						<p class="p1">
							������ ��������
							<span id="cus_nextgrade">$$</span>
						</p>
						<p class="p1">
							<span id="cus_money">$$$$$</span>
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
						<li>���� ���� �ݾ��� �ջ� ��, �ſ� 1�Ͽ� ����� �����մϴ�.</li>
						<li>��� ���� ��������� ���� �� ���������� ���� �����մϴ�.</li>
					</ul>
				</div>
				<div class="grade level1">
					<div class="grade_left">
						<h3>�ڹ�</h3>
						<p>���� ����Ʈ  ${Info.grade_start_point}���� �̻�</p>
						<p>
							���� ��
							<span id="l1">�⺻ 0.5% ����</span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/resources/img/�ڹ�.PNG">
					</div>
				</div>
				<div class="grade level2">
					<div class="grade_left">
						<h3>���޶���</h3>
						<p>�Ѵ� ���� �ݾ� 0���� �̻�</p>
						<p>
							���� ��
							<span id="l2">�� ǰ�� 4% ����</span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/resources/img/���޶���.PNG">
					</div>
				</div>
				<div class="grade level3">
					<div class="grade_left">
						<h3>���</h3>
						<p>�Ѵ� ���� �ݾ� 0���� �̻�</p>
						<p>
							���� ��
							<span id="l3">�� ǰ�� 8% ����</span>
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
							���� ��
							<span id="l4">�� ǰ�� 12% ����</span>
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
							���� ��
							<span id="l5">�� ǰ�� 16% ����</span>
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