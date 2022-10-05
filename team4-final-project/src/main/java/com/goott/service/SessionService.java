package com.goott.service;

import java.util.Map;

import com.goott.domain.SessionVO;

public interface SessionService {
	/**
	 * 세션 정보 저장
	 * @param sessionVO
	 * @return
	 */
	public int setSessionInfo(SessionVO sessionVO);
	
	public int getCountTotal();
	public int getCountToday();
	public int getCountWeek();
	
	/**
	 * 총 방문수, 이번주 방문수, 오늘 방문수
	 * @return
	 */
	public Map<String, Object> countBasic();
}
