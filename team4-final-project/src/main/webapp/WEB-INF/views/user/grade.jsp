<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!-- 의미 파악 필요!!!! -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/user/grade.css">
<!--쇼핑몰 글로벌 아이콘 cdn-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<title>Document</title>
</head>
<body> 
	 
	<!--메인-->
	<main>
		<div class="mainDiv">
			<!-- 메인 윗 부분 : 이번달 내 등급 -->
			<div class="myGrade">
				<div class="myGradeState" style="background-color: ${Info.grade_color}">
					<div class="myGradeState_top">
						<h3>${Info.member_id} 님의 등급은 ${Info.grade_name}</h3>
					</div>
					<div class="myGradeState_bottom">
						<div id="circle">등급혜택</div>
						<div id="text1" >제품 구매 시 전 제품 ${Info.grade_accrual_rate*100}% 적립</div>
						<div id="text2">제품 구매 시 전 제품 ${Info.grade_discount*100}% 할인</div>
					</div>
				</div>
				<div class="NextMonthGrade">
					<div class="NextMonthGrade" style="background-color: ${Info.grade_color}">
						<p class="p1">
							다음달 예상등급은
							<span id="cus_nextgrade">$$</span>
						</p>
						<p class="p1">
							<span id="cus_money">$$$$$</span>
							원 더 모으면 레벨업!
						</p>
					</div>
				</div>
			</div>





			<!-- 메인 아랫부분 : 등급별 혜택 안내 -->
			<div class="gradeAdventage">

				<div class="grade_info">
					<ul>
						<h3>등급별 혜택 안내</h3>
						<li>전달 누적 금액을 합산 후, 매월 1일에 등급을 산정합니다.</li>
						<li>등급 관련 변경사항이 있을 시 공지사항을 통해 공지합니다.</li>
					</ul>
				</div>
				<div class="grade level1">
					<div class="grade_left">
						<h3>앰버</h3>
						<p>누적 포인트  ${Info.grade_start_point}만원 이상</p>
						<p>
							적립 시
							<span id="l1">기본 0.5% 적립</span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/resources/img/앰버.PNG">
					</div>
				</div>
				<div class="grade level2">
					<div class="grade_left">
						<h3>에메랄드</h3>
						<p>한달 누적 금액 0만원 이상</p>
						<p>
							구매 시
							<span id="l2">전 품목 4% 할인</span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/resources/img/에메랄드.PNG">
					</div>
				</div>
				<div class="grade level3">
					<div class="grade_left">
						<h3>루비</h3>
						<p>한달 누적 금액 0만원 이상</p>
						<p>
							구매 시
							<span id="l3">전 품목 8% 할인</span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/resources/img/루비.PNG">
					</div>
				</div>
				<div class="grade level4">
					<div class="grade_left">
						<h3>사파이어</h3>
						<p>한달 누적 금액 0만원 이상</p>
						<p>
							구매 시
							<span id="l4">전 품목 12% 할인</span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/resources/img/사파이어.PNG">
					</div>
				</div>
				<div class="grade level5">
					<div class="grade_left">
						<h3>다이아몬드</h3>
						<p>한달 누적 금액 0만원 이상</p>
						<p>
							구매 시
							<span id="l5">전 품목 16% 할인</span>
						</p>
					</div>
					<div class="grade_right">
						<img src="/resources/img/다이아몬드.PNG">
					</div>
				</div>

			</div>
		</div>
		</div>
	</main>
	

</body>
</html>