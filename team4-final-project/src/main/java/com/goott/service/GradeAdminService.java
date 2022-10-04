package com.goott.service;

import java.util.List;

import com.goott.domain.GradeVO;

public interface GradeAdminService {

	//관리자 - 등급 정책 리스트(gradePolicy_admin)
	public List<GradeVO> gradePolicy();
	
	//관리자 - 등급 정책 삭제
	public void gradePolicyDelete(GradeVO gradeVO);
	
	public void gradePolicyAdd(GradeVO gradeVO);
}