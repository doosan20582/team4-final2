/**
 * 
 */

'use strict'
//사진 앵커
const popupAnchor = document.querySelector('#popupImg');

//=======================================================================
popupAnchor.addEventListener('click' , goUrl);

//=======================================================================

//팝업창 이미지 클릭시 이동 함수
function goUrl(){
	const form = document.forms.popupForm;
	opener.name = 'parentPage';
	form.target = opener.name;
	form.submit();
	self.close();
	
}