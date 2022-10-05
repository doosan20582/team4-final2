package com.goott.service;

import java.util.HashMap;
import java.util.Map;

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

	@Override
	public int getCountTotal() {
		// TODO Auto-generated method stub
		return sessionMapper.selectCountTotal();
	}

	@Override
	public int getCountToday() {
		// TODO Auto-generated method stub
		return sessionMapper.selectCountToday();
	}

	@Override
	public int getCountWeek() {
		// TODO Auto-generated method stub
		return sessionMapper.selectCountWeek();
	}

	@Override
	public Map<String, Object> countBasic() {
		int totalCount = this.getCountTotal();
		int weekCount = this.getCountWeek();
		int todayCount = this.getCountToday();
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("totalCount", totalCount);
		map.put("weekCount", weekCount);
		map.put("todayCount", todayCount);
		
		return map;
	}

}
