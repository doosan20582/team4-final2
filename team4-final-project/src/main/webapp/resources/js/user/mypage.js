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
//회원 탈퇴 앵커
const deleteMemberAnchor = document.querySelector('.deleteMemberAnchor');
//회원 탈퇴 컨테이너
const deleteMemberContainer = document.querySelector('.deleteMemberContainer');
//회원 탈퇴 텍스트 인풋
const deleteInputs = document.querySelector('.deleteInputs');
//회원 탈퇴 스팬
const deleteSpan = document.querySelector('.deleteSpan');
//회원 탈퇴 컨테이너 닫기 아이콘
const closeIcon = document.querySelector('.closeIcon');
//회원 탈퇴 버튼
const deleteBtns = document.querySelector('.deleteBtns');
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
userOrderHistoryDiv.addEventListener('click', showSalesDiv);
orderHistoryModalCon.addEventListener('click', closeSalesDiv);
deleteMemberAnchor.addEventListener('click', showDeleteMemberCon);
deleteMemberContainer.addEventListener('click', closeDeleteMemberCon);
deleteInputs.addEventListener('keyup', checkDeleteText);
closeIcon.addEventListener('click', closeIconFunc);
deleteBtns.addEventListener('click', doDeleteMember);
// =====================================================================================================


//삭제 버튼 클릭시 삭제 요청
function doDeleteMember(){
	let result = confirm('정말 탈퇴 하시겠습니까?');
	
	if(result){
		//삭제 요청시 폼 생성
		//인풋 member_id 생성후 로그인 유저 아이디 넣기
		//post 방식으로 컨트롤러 /user/delete 호출
		
		let tempForm = document.createElement('form');
		
		tempForm.setAttribute('method', 'post');
		tempForm.setAttribute('action', '/user/delete');
		
		let tempInput = document.createElement('input');
		
		tempInput.setAttribute('type', 'hidden');
		tempInput.setAttribute('name', 'member_id');
		
		let tempText = userNameSpan.innerHTML;
		
		tempInput.setAttribute('value', tempText);
		
		document.body.appendChild(tempForm);
		tempForm.appendChild(tempInput);
		
		
		
		tempForm.submit();
	}
	
	
}

//삭제 텍스트 체크 함수
function checkDeleteText(){
	const text = deleteSpan.innerHTML;
	
	if(this.value == text){
		deleteBtns.style.textDecoration = 'none';
		deleteBtns.disabled = false;
	}
	else{
		deleteBtns.style.textDecoration = 'line-through';
		deleteBtns.disabled = true;
		
	}
}

//닫기 아이콘 으로 회원탈퇴창 컨테이너 닫기
function closeIconFunc(){
	deleteMemberContainer.style.display = 'none';
}

//회원탈퇴창 컨테이너 닫기
function closeDeleteMemberCon(e){
	if(e.target.className == 'deleteMemberContainer')
		this.style.display = 'none';
}
//회원탈퇴창 컨테이너 열기
function showDeleteMemberCon(){
	deleteMemberContainer.style.display = 'block';
}

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
