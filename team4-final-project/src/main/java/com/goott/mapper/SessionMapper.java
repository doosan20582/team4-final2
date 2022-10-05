package com.goott.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.goott.domain.SessionVO;

@Mapper
public interface SessionMapper {
	/**
	 * 세션 생성 정보 저장
	 * @param sessionVO
	 * @return
	 */
	public int insertSession(SessionVO sessionVO);
}
