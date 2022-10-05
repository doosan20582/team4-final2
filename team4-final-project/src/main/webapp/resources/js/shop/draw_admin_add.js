
/*한정판 상품 목록 컨테이너 */
const selectDrawProductContainer = document.querySelector('.selectDrawProductContainer');
/*한정판 상품 */
const drawItem = document.querySelectorAll('.drawItem');
/*한정판 상품 이름 집어넣을 스팬 */
const selectedDrawName = document.querySelector('#selectedDrawName');
/*한정판 상품 목록 보기 버튼 */
const selectDrawBtn = document.querySelector('#selectDrawBtn');




 // value 값을 찾아서 



/*var now_utc = Date.now()  //// 지금 날짜를 밀리초로
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0]; // new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환-
document.getElementById("Date").setAttribute("min", today); // 오늘기준으로 오늘 전날들은 선택못하게 설정

var now_utc2 = Date.now()  //// 지금 날짜를 밀리초로
var timeOff2 = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
var today2 = new Date(now_utc2-timeOff).toISOString().split("T")[0]; // new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환-
document.getElementById("Date_event_end").setAttribute("min", today);
*/








selectDrawBtn.addEventListener('click' , showDrawContainer);

/*한정판 상품목록 컨테이너 여는 함수 */
function showDrawContainer(){
    selectDrawProductContainer.style.display = 'block';
}




