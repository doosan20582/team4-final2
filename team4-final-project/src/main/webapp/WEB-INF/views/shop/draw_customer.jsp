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
<link rel="stylesheet" href="/resources/css/shop/draw_admin.css">
<title>Document</title>
</head>

<body>
	<!-- ��� -->
	<jsp:include page="header.jsp" />

	<main>
		<div class="draw_container">
			<div class="">
				<div class="section1">
					<h1>
						Camping
						<span> Draw</span>
					</h1>
					<div class="section1_img">
						<img src="/resources/img/shop/��Ű��ο�.png" alt="">
					</div>
				</div>
				<div class="section2">
					<div class="section2-top">
						<span>��ο� ���</span>
					</div>

					<div class="section2-bottom">
						<!--foreach �ݺ� �����-->
						<c:forEach var="row" items="${list}">
							<div class="section2_img">
								<!--�̺�Ʈ �̹���-->
								<img src="" alt="">
							</div>
							<div class="section2_font">
								<!--�̺�Ʈ �ؽ�Ʈ-->
								<div class="font_top">
									<h1>[���� �̺�Ʈ] �̺�Ʈ3</h1>
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
												<td>��ǰŰ</td>
												<td>${row.draw_id}</td>
											</tr>
											<tr>
												<td>��ǰ ����</td>
												<td>${row.draw_title}</td>
											</tr>
											<tr>
												<td>����</td>
												<td>${row.draw_price}</td>
											</tr>
											<tr>
												<td>�ο�</td>
												<td>${row.draw_reqruit}</td>
											</tr>
											<tr>
												<td>�̺�Ʈ ������</td>
												<td><fmt:formatDate value="${row.draw_event_start_date}" />
												 <%-- <fmt:parseDate value="${row.draw_event_start_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
												 <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>
											</tr>
												<tr>
												<td>�̺�Ʈ ������</td>
												<td> <fmt:formatDate value="${row.draw_event_end_date}" /> 
												<%-- <fmt:parseDate value="${row.draw_event_end_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
												 <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>

											</tr>
											<tr>
												<td>���� ������</td>
												<td>  <fmt:formatDate value="${row.draw_pur_start_date}" /> 
												<%-- <fmt:parseDate value="${row.draw_pur_start_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
												 <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>
												
												<tr>
												<td>���� ������</td>
												<td> <fmt:formatDate value="${row.draw_pur_end_date}" />
												<%-- <fmt:parseDate value="${row.draw_pur_end_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
												 <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>

											</tr>
										
										
											

											</tr>
											
											<tr>
												<td>�ڸ�Ʈ</td>
												<td>${row.draw_comment}</td>
											</tr>

										</tbody>
									</table>
                                   <div class="button_container">
                                   <button class="font_top_button"">
										�����ϱ�
									</button>
									<button class="font_top_button_end"">
										���� ��� ����
									</button>
                                   </div>
								
								</div>
							</div>
						</c:forEach>
					</div>

                    <!-- ���� ���� ��� -->
					<div class="modal_container">
						<div class="modal_body">
							<div class="modal_top">���� �����ϼ̽��ϴ�</div>
						 	<div class="modal_bottom">
								<button class="modal_bottom_btn">Ȯ��</button>
							</div>
						</div>
					</div>
					<div class="modal_final_container">
						<div class="modal_final_body">
							<div class="modal_final_top">��÷���</div>
							<div class="modal_final_middle">
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
								<span>lynn1535</span>
							</div>
							<div class="modal_final_bottom">
								<button class="modal_final_bottom_btn">Ȯ��</button>
							</div>
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