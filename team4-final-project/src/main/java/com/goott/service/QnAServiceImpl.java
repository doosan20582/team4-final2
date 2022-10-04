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

import lombok.extern.log4j.Log4j;

@Log4j
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
	public void delete(QnAVO qnA) {
		// TODO Auto-generated method stub
		qnaMapper.delete(qnA);
	}

	@Override
	public int countQnABoard() {
		return qnaMapper.countQnABoard();
	}

	@Override
	public List<QnAVO> selectQnABoard(PagingVO vo, String checkcategory, String QnASearch) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("checkcategory", checkcategory);
		map.put("QnASearch", QnASearch);
		return qnaMapper.selectQnABoard(map);
	}

	@Override
	public int countQnABoardCategory(String checkcategory, String QnASearch) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("checkcategory", checkcategory);
		map.put("QnASearch", QnASearch);
		log.info(map);
		return qnaMapper.countQnABoardCategory(map);
	}

	@Override
	public void QnA_update(QnAVO qnA) {
		qnaMapper.QnA_update(qnA);
		
	}

	@Override
	public void Question_update(QnAVO qnA) {
		// TODO Auto-generated method stub
		qnaMapper.QnA_update(qnA);
	}

	@Override
	public void Question_admin(QnAVO qnA) {
		// TODO Auto-generated method stub
		qnaMapper.Question_admin(qnA);
	}

	@Override
	public void Question_admin_answer(QnAVO qnA) {
		// TODO Auto-generated method stub
		qnaMapper.Question_admin_answer(qnA);
	}



	

	



	




	

}
