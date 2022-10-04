package com.goott.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.goott.domain.PagingVO;
import com.goott.domain.QnAVO;

@Mapper
public interface QnAMapper {
//	public List<QnAVO> list();
	
	// 게시물 작성
	public void Question(QnAVO QnA);
	
	// 게시물 상세 페이지
	public Object QnA_detail(Map<String, Object> map);

	
	// 게시물 수정
	public void QnA_update(QnAVO qnA);
	
	// 게시물 삭제
	public void delete(QnAVO QnA);
	// 게시물 총 갯수
	public int countQnABoard();

	// 페이징 처리 게시글 조회
	public List<QnAVO> selectQnABoard(Map<String, Object> map);
	
	// 카테고리 및 검색으로 게시글 총 개수 조
	public int countQnABoardCategory(Map<String, Object> map);

	public void Question_admin(QnAVO qnA);

	public void Question_admin_answer(QnAVO qnA);

	






}

