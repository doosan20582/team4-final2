'use strict'

/*한정판 상품 목록 컨테이너 */
const selectDrawProductContainer = document.querySelector('.selectDrawProductContainer');
/*한정판 상품 */
const drawItem = document.querySelectorAll('.drawItem');
/*한정판 상품 이름 집어넣을 스팬 */
const selectedDrawName = document.querySelector('#selectedDrawName');
/*한정판 상품 목록 보기 버튼 */
const selectDrawBtn = document.querySelector('#selectDrawBtn');


selectDrawBtn.addEventListener('click' , showDrawContainer);

/*한정판 상품목록 컨테이너 여는 함수 */
function showDrawContainer(){
    selectDrawProductContainer.style.display = 'block';
}




