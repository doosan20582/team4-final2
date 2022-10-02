package com.goott.domain;

import lombok.Data;

@Data
public class MemberVO {
	/**
	 * 회원 엔티티
	 *  member_id varchar(20) primary key comment "아이디(pk)",
		member_pw varchar(100) not null comment "비밀번호",
		member_email varchar(30) unique not null comment "이메일(30자, 유니크)",
		member_name varchar(20) not null comment "이름(20자)",
		member_phone varchar(11) unique not null comment "핸드폰(11자, 문자형, 유니크)",
		member_age int unsigned not null comment "나이",
		member_gender varchar(2) not null comment "성별(남자/여자, 2자)",
		member_postal_code varchar(10) not null comment "우편번호",
		member_address varchar(200) not null comment "주소(200자)",
		member_join_date datetime default now() comment "가입 날짜(입력 x)",
		member_last_login_date datetime default now() comment "마지막 로그인 날짜(입력 x, 매 로그인시 갱신)",
		member_state varchar(2) default "정상" comment "현재 상태(정상/휴면, 오늘 날짜 - 마지막 로그인 날짜 == 365 면 휴면 처리)",
		member_withdrawal varchar(1) default "n" comment "탈퇴 여부(y/n, n이면 로그인 x)",
		member_email_agree varchar(1) not null comment "email 수신 동의(y/n)",
		member_service_agree varchar(1) default "y" comment "이용약관 동의(y/n)",
		member_personal_agree varchar(1) default "y" comment "개인정보 수집 동의(y/n)",
		grade_id int unsigned default 1 comment "등급(fk)",
		member_purchase_point int unsigned default 0 comment "누적 구매 포인트",
		member_write_point int unsigned default 0 comment "누적 게시글 작성 포인트",
		member_profile_img_url varchar(100) not null comment "회원 프로필 이미지 주소",
		member_auth varchar(3) default "회원" comment "등급(회원/관리자)",
	 * */
	
	String member_id;
	String member_pw;
	String member_email;
	String member_name;
	String member_phone;
	int member_age;
	String member_gender;
	String member_postal_code;
	String member_address;
	String member_email_agree;
	String member_profile_img_url;
	int member_purchase_point;
	int member_write_point;
}
