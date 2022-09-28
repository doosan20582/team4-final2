package com.goott.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.goott.domain.GradeVO;

@Mapper
public interface GradeMapper {
	
	/**
	 * 등급 정보 가져오기
	 * @param grade_id 등급 번호(PK)
	 * @return 등급 엔티티
	 */
	public GradeVO select(@Param("grade_id") int grade_id); 
	
	
	/**
	 * 회원의 등급 정보 가져오기
	 * @param member_id 회원 아이디(PK)
	 * @return 회원 등급 정보 + 회원 아이디
	 */
	public Map<String, Object> selectUserGradeId(String member_id);
}
