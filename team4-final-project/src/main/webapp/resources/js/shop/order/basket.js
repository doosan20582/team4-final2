'use strict'

/*체크박스들*/
const checkboxs = document.querySelectorAll('.ckeckboxBasket');
/*삭제버튼*/
const deleteBtn = document.querySelector('#deleteBtn');

window.onload = function(){
    /*체크박스의 밸류값은 각 열의 상품 이름*/
    checkboxs.forEach((item)=>{
        item.value = item.parentElement.nextElementSibling.innerHTML;
    });
}

deleteBtn.addEventListener('click' , deleteBasket);


/*체크된 체크박스들의 상품 이름 읽어오는 함수*/
function deleteBasket(){
    let checkedProductNameArray = [];
    checkboxs.forEach((item) => {
        if(item.checked && item.value != undefined){
            /*추후 이 배열을 json 으로 파싱후 ajax 처리 */
            checkedProductNameArray.push(item.value);
        }
    });
    
    if(confirm('선택된 상품(들)을 장바구니에서 제거하시겠어요?')){
        console.log(`데이터베이스에서 ${checkedProductNameArray}를 삭제하였습니다.`);
    }
    else
        console.log('삭제 처리 취소');
}   
