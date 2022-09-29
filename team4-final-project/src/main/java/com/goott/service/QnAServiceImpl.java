package com.goott.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goott.domain.PagingVO;
import com.goott.domain.QnAVO;
import com.goott.mapper.QnAMapper;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnAMapper qnaMapper;
	
//	@Override
//	public List<QnAVO> list() {
//		// TODO Auto-generated method stub
//		return qnaMapper.list();
//	}
	
	@Override
	public void Question(QnAVO QnA) {
		 qnaMapper.Question(QnA);
	}

	@Override
	public Object QnA_detail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return qnaMapper.QnA_detail(map);
	}

	@Override
	public void QnA_update(QnAVO QnA) {
		// TODO Auto-generated method stub
		qnaMapper.QnA_update(QnA);
	}

	@Override
	public void delete(QnAVO QnA) {
		// TODO Auto-generated method stub
		qnaMapper.delete(QnA);
	}

	@Override
	public int countQnABoard() {
		return qnaMapper.countQnABoard();
	}

	@Override
	public List<QnAVO> selectQnABoard(PagingVO vo, String ckeckcategory) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
//		전체검색을 했을때와 카테고리 값이 있을때 ckeckcategory 조건의 기준을 찾아
		map.put("ckeckcategory", ckeckcategory);
		System.out.println(map);
		return qnaMapper.selectQnABoard(map);
	}

	

}
