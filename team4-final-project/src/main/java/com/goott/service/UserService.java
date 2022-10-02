package com.goott.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.goott.domain.ProductReviewVO;
import com.goott.domain.SalesVO;

public interface UserService {
	/**
	 * 회원 구매 확정 목록 가져오기
	 * @param member_id 회원 아이디
	 * @return 구매 목록 리스트
	 */
	public List<SalesVO> getUserSalesList(String member_id);
	
	/**
	 * 상품 리뷰 작성
	 * @param productReviewVO 상품 리뷰 엔티티
	 */
	public void writeReview(ProductReviewVO productReviewVO, int sales_id);
	
	/**
	 * 상품 리뷰 작성 위한 정보 가져오기
	 * @param sales_id 매출 번호(PK)
	 * @return member_id, product_id
	 */
	public Map<String, Object> getReviewInfo(int sales_id);
	
	/**
	 * 리뷰 작성 여부 업데이트
	 * @param sales_id 매출 번호(PK)
	 */
	public void setReviewState(int sales_id);
	/**
	 * 회원 프로필 이미지 저장
	 * @param file 이미지
	 * @param member_id 아이디
	 */
	public Map<String, Object> changeProfileImg(MultipartFile file, String member_id);
	
	/**
	 * DB에 저장된 회원의 이미지 저장 주소 가져오기
	 * @param member_id 아이디
	 * @return 주소
	 */
	public String getUserImgUrl(String member_id);
}
