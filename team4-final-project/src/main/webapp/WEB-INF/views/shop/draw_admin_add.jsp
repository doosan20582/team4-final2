<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2/xeicon.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<!-- 글로벌 css -->
<link rel="stylesheet" href="/resources/css/global.css">
<link rel="stylesheet" href="/resources/css/shop/shop_global.css">

<link rel="stylesheet" href="/resources/css/shop/draw_admin_add.css">

<title>Document</title>

</head>




<body>
	<!--헤더-->
	<header>
		<div class="logo">
			<h1>
				Camp<span>ing</span>
			</h1>
		</div>
		<div class="menu">
			<a href="shop.html">Shop</a> <a href="draw_customer.html">Draw</a> <a
				href="">Q&A</a>
		</div>
		<div class="login">
			<a href=""> <i class="xi-search"></i>
			</a> <a href=""> <i class="xi-truck"></i>
			</a> <a href="basket.html"> <i class="xi-cart"></i>
			</a> <a href="">LogIn</a> <a href="">SignUp</a>
		</div>
	</header>
	<!--메인-->
	<main>
	<!-- 드로우 상품 추가하기  테이블-->
		<form class="admin_container" id="admin_container"
			name="admin_container" method="POST" action="/shop/draw_admin_add">
			<div class="draw_container">

				<div class="admin_main"> <!--  input을 줘서 히든을 줘라 -->
					<table class="admin_body">
						<!-- <tr class="admin_body_file">
                            <td class="file_top_fir">이벤트 이미지</td>
                            <td>
                                <input type="file" name="file" class="drawInputs">
                            </td>
                        </tr> -->
                          <!-- 상품키 모달 버튼 -->
						<tr class="admin_title">
							<td>상품키</td>
							<td><input type="button" value="상품 보기" id="selectDrawBtn">
								<span id="selectedDrawName"></span></td>
						</tr>
						 <!-- 상품이름 -->
						<tr class="admin_title">
							<td>상품 이름</td>
							<td class="admin_title_name">
								<input type="text" id="draw_title" name="draw_title">
							</td>
						<!-- 상품가격 -->
						<tr class=" admin_title">
							<td>상품 가격</td> 
							<td class="admin_title_price"> 
								<input type="text" id="draw_price" name="draw_price">
							</td>
						</tr>
						<!-- 모집인원 -->
						<tr class="admin_title">
							<td>인원</td>
							<td><input type="number" value="1" id="selectDrawBtn" name="draw_reqruit">
							</td>
						</tr>
						<!-- 이벤트 시작일 -->
						<tr class="admin_title">
							<td>이벤트 시작일</td>
							<td><input type="date" class="drawInputs" name="draw_event_start_date"></td>
						</tr> 
						<tr class="admin_title">
							<td>이벤트 종료일</td>
							<td><input type="date" class="drawInputs"  name="draw_event_end_date"></td>
						</tr> 
						
						<tr class="admin_title">
							<td>구매 시작일</td>
							<td><input type="date" class="drawInputs" name="draw_pur_start_date"></td>
						</tr> 
					
						<tr class="admin_title">
							<td>구매 종료일</td>
							<td><input type="date" class="drawInputs" name="draw_pur_end_date"></td>
						</tr>  
					
						<tr class="admin_title">
							<td>코멘트</td>
							<td><textarea name="draw_comment" id="" cols="30" rows="10" ></textarea>
							</td>
						</tr>
					</table>

				</div>
				<input type="button" value="등록" class="file_submit">
			</div>
		</form>
		<!--디비에서 한정판 상품 목록 보여주는 디비전 -->
		<div class="selectDrawProductContainer">
			<div class="drawList">
				<div class="drawList_cc">
					카테고리
					<div class="drawList_ul">
						<ul>
							<li class="drawList_li">
								<button class="btn" data-product-category-id="1">선풍기</button>
							</li>
							<li class="drawList_li">
								<button class="btn" data-product-category-id="2">수납박스</button>
							</li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="3">아이스박스</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="4">야전침대</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="5">체어</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="6">취사도구</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="7">침낭</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="8">컵</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="9">코펠</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="10">타프</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="11">테이블</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="12">텐트</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="13">텐트소품</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="14">프라이팬</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="15">화롯대</button></li>
						    <li class="drawList_li"><button class="btn"
									data-product-category-id="16">난로</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="17">랜턴</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="18">매트리스</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="19">버너</button></li>
							<li class="drawList_li"><button class="btn"
									data-product-category-id="20">베개</button></li>
						</ul>
					</div>
				</div>
				<!-- 브랜드 카테고리 -->
				<div class="drawList_b">
					<div class="drawList_title"><h3>브랜드</h3></div>
					<div class= "drawList_brand"></div>
				</div>
				<!-- 상품 카테고리 -->
				<div class="drawList_i">
				<div class="drawList_title"><h3>상품</h3></div>
					<div class= "drawList_product"></div>
				</div>
			</div>
		</div>
	</main>
	<!--푸터-->
	<footer>
		<div class="footer_logo">
			<h1>
				Camp<span>ing</span>
			</h1>
		</div>
		<div class="footer_content">
			<h1>푸터 내용</h1>
		</div>
	</footer>
	<script src="/resources/js/shop/draw_customer_add.js"></script>
	<script>
//====== 상품 카테고리를 클릭했을때 ====== //
	const btn = document.querySelectorAll('.btn');
	let draw_title; 
	let draw_title2 = document.querySelector("#draw_title");
	let draw_price = document.querySelector("#draw_price");
	let file_submit= document.querySelector(".file_submit");
	let frm1 = document.querySelector('#admin_container');
	let test;
	
	file_submit.addEventListener('click', function(){
		console.log(test);
		//console.log(draw_price.childNodes[0].data);
		//console.log(draw_title2.childNodes[0].data);
		//let form_data= $("#admin_container").serialize();
		//form_data += '&draw_title='+draw_title2.childNodes[0].data;
		//form_data += '&draw_price='+draw_price.childNodes[0].data;
		//console.log(form_data);
		
		//$("#admin_container").submit();

	});
	
	
	
	btn.forEach( function(item) {
		item.addEventListener('click' , ajaxCategory);
	});
	
	function ajaxCategory(){
		// 카테고리 아이디 파람으로 설정
		const param = { product_category_id : this.dataset.productCategoryId }
		console.log(param);
		
		//에이잭스 시작
		$.ajax({ 
			//url
			url : '/shop/admin_add_plus.os',
			//내가 보낼 거 
			data : param,
			dataType : 'json',
			//method (get/post)
			type : 'get',
			//에이잭스 통신 실패 했을시 실행할 함수
			error : function(){
				alert('카테고리 에이잭스 통신 실패');
			},
			//에이잭스 통신 성공 했을시 실행할 함수
			success : function(productList){
				console.log(productList);
		
				
				const drawList_b = document.querySelector('.drawList_brand');
				// 반복문을 통해 리무브 차일드 하기
				while(drawList_b.hasChildNodes()){
					drawList_b.removeChild(drawList_b.firstChild);
				}
				for(let i = 0; i < productList.length; i++){
							//productList 값으로 버튼 생성
							let testBtn = document.createElement('button');
							testBtn.className = 'categoryBtns';
							//카테고리 구역에 버튼들 추가
							drawList_b.appendChild(testBtn);
							//버튼에 브랜드 이름 추가
							testBtn.innerHTML = productList[i].product_brand_name;
							//checkTest.setAttribute('checked',true);
							testBtn.setAttribute('data-product-category-id', productList[i]. product_category_id);
							testBtn.addEventListener('click' , ajaxProduct);	
						    testBtn.addEventListener('click' , ajaxproductname);
						    testBtn.addEventListener('click' , ajaxproductprice);
						
				}
				
			}
				
		})
		};
		
//====== product 목록 에이젝스 시작 ====== //
	function ajaxProduct(){
	
		const param = {
				product_category_id : this.dataset.productCategoryId,
						product_brand_name : this.innerHTML
					  }
		console.log(param);
		
		$.ajax({
			//url
			url : '/shop/admin_add_plus_product.os',
			//내가 보낼 거 
			data : param,
			dataType : 'json',
			//method (get/post)
			type : 'get',
			
			//에이잭스 통신 실패 했을시 실행할 함수
			error : function(){
				alert('카테고리 에이잭스 통신 실패');
			},
			success : function(product){
				console.log('프로턱트' +product);
				const drawList_i = document.querySelector('.drawList_product');
			     
				// 반복문을 통해 리무브 차일드 하기
				while(drawList_i.hasChildNodes()){
					drawList_i.removeChild(drawList_i.firstChild);
				}
				for(let i = 0; i < product.length; i++){
					//product 값으로 버튼 생성
					let testBtn = document.createElement('button');
					testBtn.className = 'productBtns';
					//카테고리 구역에 버튼들 추가
					drawList_i.appendChild(testBtn);
					//버튼에 브랜드 이름 추가
					testBtn.innerHTML =product[i].product_name;
					const selectDrawProductContainer = document.querySelector('.selectDrawProductContainer');
					testBtn.addEventListener('click',function b(){
						selectDrawProductContainer.style.display = 'none';
					})
					
						
				}
				
			}
			
			
			
		})
		
	};
	
//====== product 이름 불러오기 ====== //
	function ajaxproductname(){
		console.log()
		const param = {
			product_category_id : this.dataset.productCategoryId,
			product_brand_name : this.innerHTML
        }

$.ajax({
	//url
	url : '/shop/admin_add_plus_product_name.os',
	//내가 보낼 거 
	data : param,
	dataType : 'json',
	//method (get/post)
	type : 'get',
	//에이잭스 통신 실패 했을시 실행할 함수
	error : function(){
		alert('카테고리 에이잭스 통신 실패');
	},
	success : function(product_name){
		// 
		const admin_title_name = document.querySelector('#draw_title');
		// 반복문을 통해 리무브 차일드 하기 (누적되는 값을 지우기)
		while(admin_title_name.hasChildNodes()){
			admin_title_name.removeChild(admin_title_name.firstChild);
		}
		// 하나의 값만 나오게 하기 
		admin_title_name.addEventListener('click',function(event){
			admin_title_name.value=event.target.product_name;
			test=event.target.product_id;
		})
		
		for(let i = 0; i < product_name.length; i++){
			console.log(product_name[i]);
			admin_title_name.value = product_name[i].product_name;
		}
		
	}

})
	 }  
	 
//====== product_price 가격 가져오기 ====== //
	function ajaxproductprice(){
		console.log()
		const param = {
			product_category_id : this.dataset.productCategoryId,
			product_brand_name : this.innerHTML
        }

$.ajax({
	
	//url
	url : '/shop/admin_add_plus_product_price.os',
	//내가 보낼 거 
	data : param,
	dataType : 'json',
	//method (get/post)
	type : 'get',
	//에이잭스 통신 실패 했을시 실행할 함수
	error : function(){
		alert('카테고리 에이잭스 통신 실패');
	},
	success : function(product_price){
		
		const admin_title_price = document.querySelector('#draw_price');
		// 반복문을 통해 리무브 차일드 하기 (누적되는 값을 지우기)
		while(admin_title_price.hasChildNodes()){
			admin_title_price.removeChild(admin_title_price.firstChild);
		}
		// 하나의 값만 나오게 하기 
		admin_title_price.addEventListener('click',function(event){
			admin_title_price.value=event.target.product_price;
		})
		
		for(let i = 0; i < product_price.length; i++){
			console.log(product_price[i]);
			admin_title_price.value = product_price[i].product_price;	
		}
		
	}

})
	 }
	
	 	
	
</script>
</body>

</html>