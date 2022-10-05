package com.goott.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goott.domain.SessionVO;
import com.goott.mapper.SessionMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class SessionServiceImpl implements SessionService {

	@Inject
	SessionMapper sessionMapper;
	
	@Override
	public int setSessionInfo(SessionVO sessionVO) {
		
		return sessionMapper.insertSession(sessionVO);
	}

}
