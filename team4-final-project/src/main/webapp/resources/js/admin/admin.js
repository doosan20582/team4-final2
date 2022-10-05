/**
 * 
 */
'use strict'

//네비
const nav = document.querySelector('.nav');
//메인
const main = document.querySelector('.main');
//네비 인아웃 플래그
let navFlag = false;
//네비 아이콘
const navIcon = document.querySelector('.navIcon');
//모든 회원 보기
const allMemberAnchor = document.querySelector('.allMemberAnchor');
//프로모션 메일 보내기
const mailAnchor = document.querySelector('.mailAnchor');
//모니터링
const graphAnchor = document.querySelector('.graphAnchor');
// =====================================================================================================
navIcon.addEventListener('click', navInOut);
allMemberAnchor.addEventListener('click', showMemberList);
mailAnchor.addEventListener('click', showSend);
graphAnchor.addEventListener('click', monitoringFunc);

// =====================================================================================================
//모니터링 정보
function monitoringFunc(){
	$.ajax({
		type: 'get',
		url: '/admin/count',
		error: function(){
			alert('죄송합니다. 잠시후 다시 시도해 주세요.');
		},
		success: function(data){
		
			$('.mainBottom').html(data);
		}
	});
}

//메일 보내기 폼
function showSend(){
	$.ajax({
		type: 'get',
		url: '/admin/send',
		error: function(){
			alert('죄송합니다. 잠시후 다시 시도해 주세요.');
		},
		success: function(data){
			
			$('.mainBottom').html(data);
		}
	});
}
//모든 회원 정보
function showMemberList(){
	$.ajax({
		type: 'get',
		url: '/admin/list',
		error: function(){
			alert('죄송합니다. 잠시후 다시 시도해 주세요.');
		},
		success: function(data){
			
			$('.mainBottom').html(data);
		}
	});
}

//네비 인아웃
function navInOut(){
	if(navFlag == false){
		nav.style.width = '20%';
		main.style.width = '80%';
		navFlag = true;
		navIcon.style.transform = 'rotateZ(90deg)';
		allMemberAnchor.innerHTML = '전체 회원 보기';
		mailAnchor.innerHTML = '프로모션 메일 보내기';
		graphAnchor.innerHTML = '모니터링 하기';
	}
	else{
		nav.style.width = '5%';
		main.style.width = '95%';
		navFlag = false;
		navIcon.style.transform = 'rotateZ(0)';
		allMemberAnchor.innerHTML = '<span class="material-symbols-outlined"> group </span>';
		mailAnchor.innerHTML = '<span class="material-symbols-outlined"> mail </span>';
		graphAnchor.innerHTML = '<span class="material-symbols-outlined"> monitoring </span>';
		
	}
}