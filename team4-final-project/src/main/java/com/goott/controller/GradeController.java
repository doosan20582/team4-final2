package com.goott.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goott.domain.GradeVO;
import com.goott.service.GradeService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class GradeController {
	
	@Inject
	GradeService gradeService;
	
	@RequestMapping(value = "/grade")
	public ModelAndView grade(@RequestParam Map<String,Object> map){
		ModelAndView mv = new ModelAndView();
		
		String member_id = map.get("member_id").toString();
		
		Map<String, Object> Info = gradeService.getUserGradeInfo(member_id);
		
		//해당 아이디의 등급 정보 가져와 모델에 저장
		mv.addObject("Info", Info);
		
		//다음 등급 정보 가져오기
		int next_grade_id  = Integer.parseInt( Info.get("grade_id").toString() ) + 1;
		//다음 등급 정보 가져오기 쿼리
		GradeVO nextInfo = gradeService.select(next_grade_id);
		mv.addObject("nextInfo", nextInfo);
		
		//리턴 주소 저장
		mv.setViewName("/user/grade");
		
		
		return mv;
	}
}
