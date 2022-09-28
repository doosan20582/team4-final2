package com.goott.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goott.domain.ProductReviewVO;
import com.goott.domain.SalesVO;

@Mapper
public interface UserMapper {
	/**
	 * 유저의 구매확정 목록 가져오기
	 * @param member_id 회원 아이디
	 * @return 구매 목록 리스트
	 */
	public List<SalesVO> selectSalesAll(String member_id);
	/**
	 * 상품 리뷰 등록
	 * @param productReviewVO 상품 리뷰 엔티티
	 */
	public void insertReview(ProductReviewVO productReviewVO);
	
	/**
	 * 리뷰 작성 여부 업데이트
	 * @param sales_id 매출 번호(PK)
	 */
	public void updateReviewState(int sales_id);
}
