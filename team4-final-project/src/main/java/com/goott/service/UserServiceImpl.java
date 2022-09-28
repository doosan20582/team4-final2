package com.goott.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.goott.domain.ProductReviewVO;
import com.goott.domain.SalesVO;
import com.goott.mapper.OrderMapper;
import com.goott.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	UserMapper userMapper;
	@Inject
	OrderMapper orderMapper;
	
	//회원 구매 확정 목록 가져오기
	@Override
	public List<SalesVO> getUserSalesList(String member_id) {
		
		return userMapper.selectSalesAll(member_id);
	}
	//상품 리뷰 작성
	//리뷰 테이블 insert + 매출 데이터 리뷰 작성 여부 업데이트
	@Override
	@Transactional
	public void writeReview(ProductReviewVO productReviewVO, int sales_id) {
		//리뷰 데이터 insert
		userMapper.insertReview(productReviewVO);
		//매출 레코드 > 리뷰 작성 여부 업데이트
		this.setReviewState(sales_id);
	}
	//리뷰 작성 위해 대상 상품, 구매자 정보 가져오기
	@Override
	public Map<String, Object> getReviewInfo(int sales_id) {
		
		return orderMapper.selectReviewInfo(sales_id);
	}
	
	//리뷰 작성후 리뷰상태 업데이트
	@Override
	public void setReviewState(int sales_id) {
		userMapper.updateReviewState(sales_id);
		
	}

}
