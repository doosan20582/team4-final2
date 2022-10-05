package com.goott.service;

import com.goott.domain.SessionVO;

public interface SessionService {
	/**
	 * 세션 정보 저장
	 * @param sessionVO
	 * @return
	 */
	public int setSessionInfo(SessionVO sessionVO);
}
