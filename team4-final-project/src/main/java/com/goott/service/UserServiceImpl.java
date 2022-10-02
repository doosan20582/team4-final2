package com.goott.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
	//회원 이미지 저장
	@Override
	public Map<String, Object> changeProfileImg(MultipartFile file, String member_id) {
		//기본 이미지 저장 주소
		String basicImgUrl = "/resources/img/user/basic_profile.jpg";
		
		
		String filePath = "C:/uploadtest/uploadUserProfileImg/" + member_id;
		
		filePath.replace("/", File.separator);
		
		//폴더 생성
		File folder = new File(filePath);
		folder.mkdirs();
		
		String uuid = UUID.randomUUID().toString();
		String extention = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf('.'));
		String fileName = uuid + extention;
		fileName.replace("/", File.separator);
		
		//이미지 파일 저장
		File img = new File(filePath, fileName);
		try {
			file.transferTo(img);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//이전 프로필 이미지 삭제
		String exImgUrl = this.getUserImgUrl(member_id);
		//만약 기본 프로필 주소라면 삭제처리 생략
		if(exImgUrl.equals(basicImgUrl)) {
			log.info("기본 프로필 이미지여서 프로필 이미지 삭제 처리를 넘어갑니다.");
		}
		else {
			exImgUrl = "C:/uploadtest" + exImgUrl;
			exImgUrl = exImgUrl.replace("/", File.separator);
			
			
			
			String exImgUrlFileName = exImgUrl.substring(exImgUrl.lastIndexOf(File.separator) + 1);
			log.info(exImgUrlFileName);
			String exImgUrlFile = exImgUrl.substring(0, exImgUrl.lastIndexOf(File.separator) + 1);
			log.info(exImgUrlFile);
			
			File oldImg = new File(exImgUrlFile, exImgUrlFileName);
			
			if(oldImg.exists()) {
				oldImg.delete();
				log.info("이전 프로필 이미지 삭제 완료.");
			}
			else
				log.info("이전 프로필 이미지를 찾을수 없습니다.");
		}
		
			
		
		//디비에 저장할 프로필 이미지 주소
		String member_profile_img_url = "/uploadUserProfileImg/" + member_id + "/" + fileName;
		member_profile_img_url.replace("/", File.separator);
		Map<String, Object> map = new HashMap<>();
		map.put("member_profile_img_url", member_profile_img_url);
		map.put("member_id", member_id);
		
		
		//디비 로직
		userMapper.updateUserImg(map);
		
		return map;
	}
	
	//프로필 이미지 주소 
	@Override
	public String getUserImgUrl(String member_id) {
		
		return userMapper.selectUserImg(member_id);
	}
	
	

}
