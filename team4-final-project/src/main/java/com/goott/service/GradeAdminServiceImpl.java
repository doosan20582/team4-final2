package com.goott.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goott.domain.GradeVO;
import com.goott.mapper.GradeMapper;

@Service
public class GradeAdminServiceImpl implements GradeAdminService{

	@Inject
	GradeMapper gradeMapper;
	
	
	//관리자 - 등급 정책 리스트(gradePolicy_admin)
	@Override
	public List<GradeVO> gradePolicy() {
		
		
		return gradeMapper.gradePolicy();
	}

	//관리자 - 등급 정책 삭제(gradePolicy_admin)
	@Override
	public void gradePolicyDelete(GradeVO gradeVO) {
		gradeMapper.gradePolicyDelete(gradeVO);
	}

	@Override
	public void gradePolicyAdd(GradeVO gradeVO) {
		gradeMapper.gradePolicyAdd(gradeVO);
		
	}
	
	
	
	
	

}
