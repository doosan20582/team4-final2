/**
 * 
 */

'use strict'
//사진 앵커
const popupAnchor = document.querySelector('#popupImg');
//닫기 버튼
const justExit = document.querySelector('.justExit');
//오늘하루 열지 않기 버튼
const todayExit = document.querySelector('.todayExit');

//=======================================================================
popupAnchor.addEventListener('click' , goUrl);
justExit.addEventListener('click', popupClose);
todayExit.addEventListener('click', popupTodayClose);
//=======================================================================
//오늘하루 닫기
function popupTodayClose(){
	//하루 설정
	/*let todayMaxAge = 1000 * 60 * 60 * 24;*/
	localStorage.setItem('todayClose', 'test');
	let text = localStorage.getItem(todayClose);
	alert(text);
	self.close();
}
//팝업창 닫기
function popupClose(){
	self.close();
}

//팝업창 이미지 클릭시 이동 함수
function goUrl(){
	const form = document.forms.popupForm;
	opener.name = 'parentPage';
	form.target = opener.name;
	form.submit();
	self.close();
	
}