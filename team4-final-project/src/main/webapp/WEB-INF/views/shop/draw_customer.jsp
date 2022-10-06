<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- �۷ι� css -->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/shop/draw_customer.css">

<title>Document</title>
</head>

<body>
	<!-- ��� -->
	<jsp:include page="header.jsp" />

	<main>
		<div class="draw_container">
			<%--  <c:if test="${sessionScope.login_auth eq 'ȸ��'} || ${sessionScope.login_auth eq null}" >  --%>

			<%--     </c:if>  --%>
			<div class="">
				<div class="section1">
					<h1>
						Camping
						<span> Draw</span>
					</h1>
					<div class="section1_img">
						<img src="/resources/img/shop/ķ��2.jpg" alt="" id=section1_img_img>
					</div>
				</div>
				<div class="section2">
					<div class="section2-top">
						<span>��ο� ���</span>
					</div>

					<div class="section2-bottom">
						<!--foreach �ݺ� �����-->
						<c:forEach var="row" items="${data}">
							<div class="section2_img">
								<!--�̺�Ʈ �̹���-->
								<c:if test="${row.product_img_url1 ne 'no url' }">
									<img src="/productImg/${row.product_img_url1 }" alt="" class="productMainImg">f
								</c:if>
							</div>
							<div class="section2_font">
								<!--�̺�Ʈ �ؽ�Ʈ-->
								<div class="font_top">
									<h3>
										<span class="deadlineSpan">${row.draw_deadline }</span>
										<span>${row.draw_title}</span>
									</h3>
									<!--�̺�Ʈ ����-->
									<div class="adminBtnsContainer">
										<input type="hidden" value="����" class="adminBtns">
										<input type="hidden" value="����" class="adminBtns">
									</div>
								</div>
								<div class="font_bottom">
									<table>
										<tbody>
											<tr>
												<td class="font_bottom_td">��ǰ ����</td>
												<td>${row.draw_title}</td>
											</tr>
											<tr>
												<td class="font_bottom_td">����</td>
												<td>${row.draw_price}</td>
											</tr>
											<tr>
												<td class="font_bottom_td">�ο�</td>
												<td>${row.draw_reqruit}</td>
											</tr>
											<tr>
												<td class="font_bottom_td">�̺�Ʈ ������</td>
												<td>
													<fmt:formatDate value="${row.draw_event_start_date}" />
													<%-- <fmt:parseDate value="${row.draw_event_start_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
                                     <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>
											</tr>
											<tr>
												<td class="font_bottom_td">�̺�Ʈ ������</td>
												<td>
													<fmt:formatDate value="${row.draw_event_end_date}" />
												</td>

											</tr>
											<tr>
												<td class="font_bottom_td">���� ������</td>
												<td>
													<fmt:formatDate value="${row.draw_pur_start_date}" />
												</td>
											<tr>
												<td class="font_bottom_td">���� ������</td>
												<td>
													<fmt:formatDate value="${row.draw_pur_end_date}" />
												</td>
											</tr>

											<tr>
												<td class="font_bottom_td">�ڸ�Ʈ</td>
												<td>${row.draw_comment}</td>
											</tr>

										</tbody>
									</table>
									<div class="button_container">
										
										<input type="button" value="${row.draw_deadline }" name="draw_deadline" class="font_top_button" id="font_top_button">
										<input type="hidden" name="draw_id" id="draw_id" value="${row.draw_id}">
										&nbsp; &nbsp;
										<input type="button" value="����������" class="font_top_button_end">
										<input type="hidden" value="${row.product_id}">
									</div>

								</div>
							</div>
							<form method="POST" class="list_form" action="shop/draw_customer_draw" class="draw_modal_form">
								<%-- <input type="hidden" name="member_id" id="user_id" value="${sessionScope.member_id}"> --%>
								<input type="hidden" name="login_id" id="login_id" value="${sessionScope.login_id}">
							</form>
						</c:forEach>
					</div>

					<!-- ���� ���� ��� -->
					<!-- <div class="modal_container">
						<div class="modal_body">
							<div class="modal_top">���� �����ϼ̽��ϴ�</div>
							<div class="modal_bottom">
								<button class="modal_bottom_btn">Ȯ��</button>
							</div>
						</div>
					</div> -->


					<div class="modal_final_container">
						<!-- ��� -->
						<div class="modal_final_body">
							<!-- ���� -->
							<div class="modal_final_top">��÷���</div>
							<!-- ��÷�� ��� -->
							<div class="modal_final_middle">
								<%-- <c:forEach var="row" items="${draw_customer_button}">
									<div class="modal_final_middle_ajax"></div>
								</c:forEach> --%>
							</div>



							<!-- �ϴ� -->
							<div class="modal_final_bottom">

								<button class="modal_final_bottom_btn">Ȯ��</button>
								<button class="modal_final_bottom_btn" id="limitedBtns">�����ϱ�</button>

							</div>

						</div>
						<input type="hidden" id="limiteProduct">
					</div>


				</div>
			</div>
		</div>

		</div>

	</main>

	<!-- Ǫ�� -->
	<jsp:include page="footer.jsp" />
	<script src="/resources/js/shop/draw_customer.js"></script>
	
</body>

</html>