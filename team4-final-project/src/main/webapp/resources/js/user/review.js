'use strict'

/*별들 */
const star = document.querySelectorAll('.star');
/*별점 스팬 */
const productGradeSpan = document.querySelector('.productGradeSpan');
/*별점 인풋 히든 */
const productGradeInput = document.querySelector('#productGradeInput');
/*배송 속도 디비전 */
const speedDiv = document.querySelectorAll('.speedDiv');
/*배송 속도 인풋 히든*/
const productSpeedInput = document.querySelector('#productSpeedInput');
// =========================================================================================
speedDiv.forEach((item) => {
    item.addEventListener('click' , selectSpeed);
})

star.forEach((item) => {
    item.addEventListener('mouseenter' , drawStar);
});

// ==========================================================================================

//폼 체크 함수
function checkForm(){
	
	if(productGradeInput.value == null || productGradeInput.value == undefined || (productGradeInput.value).trim() == ''){
		alert('별점을 작성해 주세요.');
		return false;
	}
	else if(productSpeedInput.value == null || productSpeedInput.value == undefined || (productSpeedInput.value).trim() == ''){
		alert('배송속도를 선택해 주세요.')
		return false;
	}
	else
		return true;
	
}
/*배송 속도 선택 함수 */
function selectSpeed(){
    speedDiv.forEach((item) => {
        item.style.backgroundColor = 'white';
        item.style.color = 'black';
    })
    this.style.backgroundColor = 'black';
    this.style.color = 'white';
    productSpeedInput.value = this.innerHTML;
    console.log(`선택한 배송속도 : ${productSpeedInput.value}`);
}

/*별들 색칠하는 함수 */
function drawStar(e){
    star.forEach((item) => {
        item.style.fontVariationSettings = `'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48`;
    });

    for(let i = 0; i < star.length; i++){
        star[i].style.fontVariationSettings = `'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 48`;
        productGradeSpan.innerHTML = `${i + 1}점`;
        productGradeInput.value = `${i + 1}`;
        // console.log(star[i].className);
        // console.log(e.target.className);
        if(star[i].className == e.target.className)
            break;
    }
   
}