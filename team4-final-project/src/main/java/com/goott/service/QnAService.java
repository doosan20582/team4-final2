package com.goott.service;

import java.util.List;
import java.util.Map;

import com.goott.domain.PagingVO;
import com.goott.domain.QnAVO;

public interface QnAService {
	
	public List<QnAVO> list();

	public void Question(QnAVO QnA);

	public Object QnA_detail(Map<String, Object> map);

	public void QnA_update(QnAVO QnA);

	public void delete(QnAVO QnA);
	// 게시물 총 갯수
	public int countQnABoard();

	// 페이징 처리 게시글 조회
	public List<QnAVO> selectQnABoard(PagingVO vo);
}
