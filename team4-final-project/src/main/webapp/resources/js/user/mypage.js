'use strict'

//구매 확정 td
const confirmBuy = document.querySelectorAll('.confirmBuy');
//회원 아이디 스팬
const userNameSpan = document.querySelector('.userNameSpan');
//회원 등급 보기
const userGradeDiv = document.querySelector('.userGradeDiv');
//로그아웃 버튼
const logOutBtn = document.querySelector('#logOutBtn');
/*구매 내역 모달 컨테이너 */
const orderHistoryModalCon = document.querySelector('.orderHistoryModalCon');
/*구매 내역 디비전 */
const userOrderHistoryDiv = document.querySelector('.userOrderHistoryDiv');
/*리뷰 작성하러 가기 스팬 */
const writeReviewSpan = document.querySelectorAll('.writeReviewSpan');
// ==================================================================================================
writeReviewSpan.forEach((item) => {
    item.addEventListener('click', writeReview);
});

confirmBuy.forEach((item) => {
	item.addEventListener('click' , purchaseProduct);
	item.addEventListener('mouseenter', changeUpText);
	item.addEventListener('mouseleave', changeDownText);
})



logOutBtn.addEventListener('click' , doLogOut);
userGradeDiv.addEventListener('click' , showMyGrade);
userOrderHistoryDiv.addEventListener('click', showSalesDiv)
orderHistoryModalCon.addEventListener('click', closeSalesDiv)
// =====================================================================================================

//구매확정하기 글자 변경 이벤트
function changeUpText(){
	this.innerHTML = '구매확정';
}
//구매확정하기 글자 변경 이벤트
function changeDownText(){
	this.innerHTML = this.dataset.state;
}
//구매 확정 목록 보기
function showSalesDiv(){
	orderHistoryModalCon.style.display = 'block';
}
//구매 확정 목록 닫기
function closeSalesDiv(e){
	if(e.target.className == 'orderHistoryModalCon')
		orderHistoryModalCon.style.display = 'none';
}
//구매 확정하기 버튼
function purchaseProduct(){
	const order_id = this.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.innerHTML;
	console.log(order_id);
	
	const result = confirm('구매확정 하시겠습니까?');
	if(result){
		location.href = '/order/confirm?order_id=' + order_id;
	}
	
}

//내등급 정보 보기
function showMyGrade(){
	
	location.href = '/grade?member_id=' + userNameSpan.innerHTML;
}
//로그아웃 함수
function doLogOut(e){
	e.preventDefault();
	const result = confirm('로그아웃 하시겠습니까?');
	if(result){
		location.href = '/logout';
	}
}

/*리뷰 작성하러 가기 함수 */
function writeReview(){
    location.href = 'review.html';
}
