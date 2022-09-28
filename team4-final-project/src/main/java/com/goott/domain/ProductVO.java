package com.goott.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	/**
	 * 상품 엔티티
	 *  product_id int unsigned  primary key auto_increment comment "상품 pk",
		product_category_id int unsigned, 
		product_brand_id int unsigned,
		product_limited varchar(3) not null comment "한정판 여부(일반/한정판)",
		product_stock int unsigned not null comment "재고량",
		product_name varchar(20) not null comment "상품 이름",
		product_comment varchar(200) not null comment "상품 설명",
		product_price int unsigned not null comment "상품 가격",
		product_thumbnail_img_url varchar(100) not null comment "상품 썸네일 이미지 주소",
		product_img_url1 varchar(100) not null comment "상품 이미지 주소1",
		product_img_url2 varchar(100) not null comment "상품 이미지 주소2",
		product_img_url3 varchar(100) not null comment "상품 이미지 주소3",
		product_description_img_url1 varchar(100) not null comment "상품 설명 이미지 주소1",
		product_description_img_url2 varchar(100) not null comment "상품 설명 이미지 주소2",
		product_youtube_url varchar(100) not null comment "상품 유튜브 주소",
		product_regdate datetime default now() comment "상품 등록일",
		product_delivery_day int unsigned not null comment "상품 배송기간", 
		product_delete varchar(1) not null default "n" comment  "상품 삭제 여부(y/n)",
		product_public varchar(1) not null default "y" comment "상품 공개 여부(y/n)",
		foreign key (product_category_id) references t_product_category (product_category_id),
		foreign key (product_brand_id) references t_product_brand (product_brand_id)
	 * 
	 */
	private int product_id; //상품 pk
	private int product_category_id; //상품 카테고리 FK
	private int product_brand_id; //상품 브랜드 FK
	private String product_limited; //한정판 여부(일반/한정판)
	private int product_stock; //재고
	private String product_name; //상품 이름
	private String product_comment; //상품 설명
	private int product_price; //가격
	private String product_thumbnail_img_url;
	private String product_img_url1; //상품 이미지1
	private String product_img_url2; //상품 이미지2
	private String product_img_url3; //상품 이미지3
	private String product_description_img_url1; //설명 이미지1
	private String product_description_img_url2; //설명 이미지2
	private String product_youtube_url; //유튜브 주소
	private Date product_regdate; //상품 등록일
	private int product_delivery_day; //상품 배송기간
	private String product_delete; //상품 삭제 여부(y/n)
	private String product_public; //상품 공개 여부(y/n)
	
	//주소 입력 안했을시 초기화
	public ProductVO() {
		this.setProduct_thumbnail_img_url("no url");
		this.setProduct_img_url1("no url");
		this.setProduct_img_url2("no url");
		this.setProduct_img_url3("no url");
		this.setProduct_description_img_url1("no url");
		this.setProduct_description_img_url2("no url");
		
		
	}
	
}
