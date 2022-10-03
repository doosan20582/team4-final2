package com.goott.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	/**
	 * 회원 프로필 이미지 저장
	 * @param map 이미지주소, 아이디
	 */
	public void updateUserImg(Map<String, Object> map);
	
	/**
	 * 회원 프로필 이미지 저장 주소 가져오기
	 * @param member_id 아이디
	 * @return 프로필 이미지 저장 주소
	 */
	public String selectUserImg(String member_id);
	/**
	 * 비밀번호 변경
	 * @param member_id
	 * @param member_pw
	 * @return 변경된 레코드 수
	 */
	public int updatePw(@Param("member_id") String member_id, @Param("member_pw") String member_pw);
}
