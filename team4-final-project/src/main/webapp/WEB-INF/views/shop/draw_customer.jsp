<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">
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
			<%--  <c:if test="${sessionScope.login_auth eq 'ȸ��'} || ${sessionScope.login_auth eq null}" >  --%>

			<%--     </c:if>  --%>
			<div class="">
				<div class="section1">
					<h1>
						Camping <span> Draw</span>
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
						<c:forEach var="row" items="${data}">
							<div class="section2_img">
								<!--�̺�Ʈ �̹���-->
								<c:if test="${row.product_img_url1 ne 'no url' }">
									<img src="/productImg/${row.product_img_url1 }" alt=""
										class="productMainImg">
								</c:if>
							</div>
							<div class="section2_font">
								<!--�̺�Ʈ �ؽ�Ʈ-->
								<div class="font_top">
									<h1>[���� �̺�Ʈ] <span>${row.draw_title}</span> </h1>
									<!--�̺�Ʈ ����-->
									<div class="adminBtnsContainer">
										<input type="hidden" value="����" class="adminBtns"> <input
											type="hidden" value="����" class="adminBtns">
									</div>
								</div>
								<div class="font_bottom">
									<table>
										<tbody>
											<tr>
												<td class="font_bottom_td">��ǰŰ</td>
												<td>${row.product_id}</td>
											</tr>
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
												<td><fmt:formatDate
														value="${row.draw_event_start_date}" /> <%-- <fmt:parseDate value="${row.draw_event_start_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
                                     <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>
											</tr>
											<tr>
												<td class="font_bottom_td">�̺�Ʈ ������</td>
												<td><fmt:formatDate value="${row.draw_event_end_date}" />
												</td>

											</tr>
											<tr>
												<td class="font_bottom_td">���� ������</td>
												<td><fmt:formatDate value="${row.draw_pur_start_date}" />
												</td>
											<tr>
												<td class="font_bottom_td">���� ������</td>
												<td><fmt:formatDate value="${row.draw_pur_end_date}" />
													<%-- <fmt:parseDate value="${row.draw_pur_end_date}" pattern="yyyy-MM-dd'T'HH:mm" var="date1" type="both" />
                                     <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd a HH:mm:ss" /> --%>
												</td>

											</tr>

											<tr>
												<td class="font_bottom_td">�ڸ�Ʈ</td>
												<td>${row.draw_comment}</td>
											</tr>

										</tbody>
									</table>
									<div class="button_container">
										<input type="button" value="�����ϱ�" class="font_top_button"
											id="font_top_button">
										<button class="font_top_button_end">���� ��� ����</button>
									</div>

								</div>
							</div>
							<form method="POST" class="list_form"
								action="shop/draw_customer_draw" class="draw_modal_form">
								<input type="hidden" name="member_id" id="user_id"
									value="${sessionScope.member_id}"> <input type="hidden"
									name="draw_id" id="draw_id" value="${row.draw_id}"> <input
									type="hidden" name="login_id" id="login_id"
									value="${sessionScope.login_id}">
							</form>
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
							<c:forEach var="row" items="${draw_resultList}">
								<div class="modal_final_middle">
									<span class="modal_fianl_middle_modal">${row.member_id}</span>
								</div>
							</c:forEach> 
						</div>
						<div class="modal_final_bottom">
							<c:if test="${member_id eq sessinScope.login_id}">
								<button class="modal_final_bottom_btn">Ȯ��</button>
								<button class="modal_final_bottom_btn">�����ϱ�</button>
							</c:if>
							<c:if test="${member_id ne sessinScope.login_id}">
								<button class="modal_final_bottom_btn">Ȯ��</button>
							</c:if>

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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
   let draw_id = $('#draw_id').val(); // ajax ��ſ� �̿��� ��ο� ��ȣ
   let user_id = $('#user_id').val();
   //let user_id = document.querySelector('#user_id').value; // ���� �������� ���� ���̵�
   console.log(user_id);
    const login_id = document.querySelector("#user_id").value;//���� �α��� ���̵� 
    const draw_btn = document.querySelectorAll(".font_top_button");// ���� ��ư
    for(let i=0; i<draw_btn.length; i++){
 	   draw_btn[i].addEventListener("click",function(){ // ����
 		     console.log(draw_btn[i]);
      
      if(user_id==null || user_id==""){
         if(confirm("�α����� �ʿ��� �����Դϴ�. �α��� �Ͻðڽ��ϱ�?")) {
            location.href='/login';
         }
      } else {
         let draw_apply = {
               draw_id : draw_id,
               member_id : login_id 
         }
         $.ajax({
            type : "POST",
            url : "/shop/draw_customer_button",
            contentType : "application/json",
            data : JSON.stringify(draw_apply),
            success : function(data) {
               if(data=="fail"){
                  alert("�̹� �����߽��ϴ�.");
               }
               $('.draw_customer').load(location.href+' .draw_customer');
            },
            error : function(data) {
               console.log(data);
            }
         });
      }
   })

    }
   
   
  
   let draw_button2=document.querySelectorAll('.font_top_button_end'); // ��Ʈ ��ư ��
      draw_button2.addEventListener("click",function(){
    	  let draw_button2 = {
                  draw_id : draw_id,
                  console.log(draw_id);
            }
    	  $.ajax({
    	         //url
    	         url : '/shop/draw_customer_button_ajax',
    	         //���� ���� �� 
    	         data : param,
    	         dataType : 'json',
    	         //method (get/post)
    	         type : 'get',
    	         
    	         //�����轺 ��� ���� ������ ������ �Լ�
    	         error : function(){
    	            alert('ī�װ� �����轺 ��� ����');
    	         },
    	         success : function(memberId){
    	            console.log('������Ʈ' +memberId);
    	            const drawList_i = document.querySelector('.drawList_product');
    	              
    	            // �ݺ����� ���� ������ ���ϵ� �ϱ�
    	            while(drawList_i.hasChildNodes()){
    	               drawList_i.removeChild(drawList_i.firstChild);
    	            }
    	            for(let i = 0; i < product.length; i++){
    	               //product ������ ��ư ����
    	               let testBtn = document.createElement('button');
    	               testBtn.className = 'productBtns';
    	               //ī�װ� ������ ��ư�� �߰�
    	               drawList_i.appendChild(testBtn);
    	               //��ư�� �귣�� �̸� �߰�
    	               testBtn.innerHTML =product[i].product_name;
    	               const selectDrawProductContainer = document.querySelector('.selectDrawProductContainer');
    	               testBtn.addEventListener('click',function b(){
    	                  selectDrawProductContainer.style.display = 'none';
    	               })
    	               
    	                  
    	            }
    	            
    	         }
    	         
    	         
    	         
    	      })
      })
    	      
   
   

   </script>
</body>

</html>