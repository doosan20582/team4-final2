let camping_title = document.querySelectorAll(".camping_title"); // 자유게시글 제목 (상세페이지로 넘어가게)
let board_title = document.querySelectorAll(".board_title"); // 모임게시글 제목 (상세페이지로 넘어가게)

for(let i=0; i<board_title.length; i++){ // 제목 누르면  상세페이지로(자유게시판)
	board_title[i].addEventListener("click",function(){
		this.parentNode.nextElementSibling.submit();
	})
}

for(let i=0; i<camping_title.length; i++){ // 제목 누르면 상세페이지로(모임게시판)
	camping_title[i].addEventListener("click",function(){
		this.parentNode.nextElementSibling.submit();
	})
}