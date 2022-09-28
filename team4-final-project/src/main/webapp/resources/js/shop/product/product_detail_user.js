'use strict'

/*메인 이미지 */
const productMainImg = document.querySelector('.productMainImg');
/*서브 이미지들 */
const productSubImg = document.querySelectorAll('.productSubImg');
/*상품 이름 td */
const productNameTd = document.querySelector('#productNameTd');
/*상품 가격 td */
const productPriceTd = document.querySelector('#productPriceTd');
/*상품 수량 text */
const quantityText = document.querySelector('#quantityText');
/*상품 수량 업 btn */
const quantityUpBtn = document.querySelector('#quantityUpBtn');
/*상품 수량 다운 btn */
const quantityDownBtn = document.querySelector('#quantityDownBtn');
/*총 상품 가격 span */
const productPriceSpan = document.querySelector('#productPriceSpan');
/*장바구니 담기 btn */
const basketBtn = document.querySelector('#basketBtn');

/*submit 버튼 */
const submitBtn = document.querySelector('#submitBtn');
/*상품 상세 정보 펼처 보기 디비전 */
const viewMoreDiv = document.querySelector('.viewMoreDiv');
/*상품 상세 이미지 컨테이너 디비전 */
const productImgDiv = document.querySelector('.productImgDiv');
/*네비게이터 컨테이너 */
const navigatorContainer = document.querySelector('.navigatorContainer');
/*네비게이터 상단 이동 디비전 */
const toTopDiv = document.querySelector('.toTopDiv');
/*네비게이터 하단 이동 디비전 */
const toBottomDiv = document.querySelector('.toBottomDiv');
/*리뷰 컨테이너 */
const productBottom = document.querySelector('.productBottom');
/*네비게이터 리뷰 이동 디비전 */
const toReveiwCon = document.querySelector('.toReveiwCon');
//리뷰 현재 페이지 
const currentPage = document.querySelector('#currentPage');
//리뷰 더보기 디비전
const veiwMoreRewviesDiv = document.querySelector('.veiwMoreRewviesDiv');

//==================================================================================================

window.onload = function(){
    /*테이블에서 가격정보 읽어와 초기 가격값 출력 */
    if(productPriceTd.innerHTML != undefined){
        productPriceSpan.innerHTML = productPriceTd.innerHTML;
    }
   
}

//==================================================================================================

window.addEventListener('scroll' , showHideNavigator);

productSubImg.forEach((item) => {
    item.addEventListener('mouseenter', changeMainImg );
});

quantityUpBtn.addEventListener('click' , quantityUp);
quantityDownBtn.addEventListener('click' , quantityDown);
basketBtn.addEventListener('click' , basket);
viewMoreDiv.addEventListener('click' , fullHeightContainer);
toTopDiv.addEventListener('click' , scrollToTop);
toBottomDiv.addEventListener('click' , scrollToBottom);
toReveiwCon.addEventListener('click' , scrollToReview);
veiwMoreRewviesDiv.addEventListener('click' , viewMoreReview);

//==================================================================================================

//리뷰 10개씩 더보기 함수
function viewMoreReview(){
	let temp = parseInt(currentPage.value);
	temp += 1;
	//현재 페이지 1 증가
	currentPage.value = temp;
	//ajax 처리후 다음 10개 가져오기 로직 작성
}

/*리뷰 구역 이동 함수 */
function scrollToReview(){
    window.scroll({ 
        top: productBottom.offsetTop, 
        behavior: 'smooth' 
    });
}
/*상단 이동 함수 */
function scrollToTop(){
    window.scroll({ 
        top: 0, 
        behavior: 'smooth' 
    });
}
/*하단 이동 함수 */
function scrollToBottom(){
    window.scroll({ 
        top: document.documentElement.scrollHeight, 
        behavior: 'smooth' 
    });
}

/*네비게이터 화면 출력 함수 */
function showHideNavigator(){
    let evHeight = window.scrollY;
    if(evHeight > 1000){
        navigatorContainer.style.opacity = '1';
        navigatorContainer.style.pointerEvents = 'auto';
    }
    else{
        navigatorContainer.style.opacity = '0';
        navigatorContainer.style.pointerEvents = 'none';
    }
}

/*펼처 보기 클릭시 상품 상세 이미지 컨테이너 높이 늘어나는 함수 */
function fullHeightContainer(){
    productImgDiv.style.height = 'auto';
    this.style.display = 'none';
}

/*서브이미지에 마우스 호버시 메인 이미지 바뀌는 함수*/
function changeMainImg(){
    productMainImg.src = this.src;
}

/*상품 갯수 추가 함수 */
function quantityUp(){
    if(quantityText.value === '99')
        return;
    
    quantityText.value = parseInt(quantityText.value) + 1 + '';
    productPriceSpan.innerHTML = parseInt(productPriceTd.innerHTML.replace('원','').replace(/,/g,'')) * parseInt(quantityText.value);
    productPriceSpan.innerHTML = priceToString(productPriceSpan.innerHTML); 
}

/*상품 갯수 제거 함수 */
function quantityDown(){
    if(quantityText.value === '1')
        return;
    quantityText.value = parseInt(quantityText.value) - 1 + '';
    productPriceSpan.innerHTML = parseInt(productPriceTd.innerHTML.replace('원','').replace(/,/g,'')) * parseInt(quantityText.value);
    productPriceSpan.innerHTML = priceToString(productPriceSpan.innerHTML);
}

/*가격 정규식 변환 함수 */
function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + ' 원';
}

/*장바구니 담기 클릭시 실행되는 함수 ajax */
/*유저 페이지에서만 실행 */
function basket(){
  
}



