package com.goott.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goott.domain.PageReview;
import com.goott.domain.PageShop;
import com.goott.domain.ProductReviewVO;
import com.goott.domain.ProductVO;
@Mapper
public interface ProductMapper {
	
	/**
	 * 상품 재고 개수 가져오기
	 * @param product_id 상품 아이디(PK)
	 * @return 상품 재고
	 */
	public int selectStock(int product_id);
	/**
	 * 상품 등록
	 * @param productVO 상품 엔티티
	 */
	public void insert(ProductVO productVO); 
	/**
	 * 상품 상세 정보 가져오기
	 * @param Product_id 상품 아이디(PK)
	 * @return 상품 엔티티
	 */
	public ProductVO get(int Product_id);
	/**
	 * 상품 10개씩 가져오기(일반 회원)
	 * 한정판, 삭제 상품 포함 x
	 * @param pageShop 페이지 엔티티
	 * @return 상품 리스트 
	 */
	public List<ProductVO> list(PageShop pageShop);
	/**
	 * 전체 상품 갯수 가져오기(일반 회원)
	 * 한정판, 삭제 상품은 노출 x
	 * @param category_id 카테고리 아이디(PK)
	 * @return 상품 개수
	 */
	public int total(int category_id);
	/**
	 * 상품 10개씩 가져오기(관리자)
	 * @param pageShop 페이징 엔티티
	 * @return 상품 리스트
	 */
	public List<ProductVO> listAll(PageShop pageShop);
	/**
	 * 카테고리별 전체 품목 수 가져오기(관리자)
	 * @param category_id 상품 아이디(0 : all)
	 * @return 상품 개수 
	 */
	public int totalAll(int category_id);
	/**
	 * 상품 수정
	 * @param productVO 상품 엔티티
	 */
	public int update(ProductVO productVO);
	/**
	 * 상품 주문서 작성 정보 가져오기
	 * @param product_id 상품 번호
	 * @return 상품 번호, 재고량, 상품 이름, 상품 가격, 썸네일 이미지, 배송일
	 */
	public Map<String, Object> selectOrderProduct(int product_id);
	
	
	/**
	 * 상품 카테고리 번호, 브랜드 번호 가져오기
	 * @param product_id 상품 번호
	 * @return 카테고리 번호, 브랜드 번호
	 */
	public Map<String, Object> selectCidBid(int product_id);
	
	/**
	 * 상품 리뷰 리스트 10개 가져오기
	 * @param product_id
	 * @return
	 */
	public List<ProductReviewVO> selectReviewAll(PageReview pageReview);
	
	/**
	 * 제일 최신 상품 정보 가져오기
	 * @return 상품 엔티티
	 */
	public ProductVO selectNewProduct();
	
	/**
	 * 리뷰 총 개수 가져오기
	 * @param product_id 상품 번호(PK)
	 * @return 리뷰 총 개수 
	 */
	public int selectCountReview(int product_id);
	/**
	 * 상품 후기 배송 정보 가져오기
	 * @param product_id 상품 번호(PK)
	 * @return 상품 후기 배송 카운트 (느려요, 보통이에요, 빨라요)
	 */
	public List<Map<String, Object>> selectCountSpeed(int product_id);
	/**
	 * 상품 평점 정보 가져오기
	 * @param product_id 상품 번호(PK)
	 * @return 상품 평점 정보 카운트(1, 2, 3, 4, 5)
	 */
	public List<Map<String, Object>> selectCountGrade(int product_id);
	
	/**
	 * 상품 비공개 처리
	 * @param product_id 상품 번호(PK)
	 */
	public int updateDelete(int product_id);
	/**
	 * 리뷰 이미지, 영상 주소 가져오기
	 * @param product_review_id 리뷰 번호(PK)
	 * @return 맵(product_review_img_url, product_review_video_url)
	 */
	public Map<String, Object> selectReviewUrl(int product_review_id);
	
	/**
	 * 상품 판매량 탑 10 가져오기
	 * @return map(product_id, count, product_name, product_thumbnail_img_url) 상위 10개
	 */
	public List<Map<String, Object>> selectTopProduct();
}
