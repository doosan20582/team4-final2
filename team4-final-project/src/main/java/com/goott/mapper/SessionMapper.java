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
	/**
	 * 총 방문자수
	 * @return
	 */
	public int selectCountTotal();
	/**
	 * 오늘 방문자수
	 * @return
	 */
	public int selectCountToday();
	/**
	 * 이번주 방문자수
	 * @return
	 */
	public int selectCountWeek();
}
