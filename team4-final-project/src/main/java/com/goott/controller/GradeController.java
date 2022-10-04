package com.goott.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goott.domain.GradeVO;
import com.goott.service.GradeAdminService;
import com.goott.service.GradeService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class GradeController {
	
	@Inject
	GradeService gradeService;
	
	@Autowired
	GradeAdminService gradeAdminService;
	
	
	//유저 등급(내 정보) 확인
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
	
	
	//관리자 - 등급 정책 리스트(gradePolicy_admin)
	@RequestMapping(value="/gradePolicy_admin")
	public ModelAndView gradePolicy(ModelAndView mav) {
		mav.setViewName("/gradePolicy_admin");
		mav.addObject("gradePolicy", gradeAdminService.gradePolicy());
		return mav;
	}
	
	//관리자 - 등급 정책 삭제
//	@RequestMapping(value = "/gradePolicy_adminDelete")
//	@ResponseBody
//	public String gradePolicyDelete(@RequestParam HashMap<String,Object>) {
//		log.info(gradeVO);
//		String[] ajaxMsg = gradeVO;
//		log.info(ajaxMsg);
//		int size = ajaxMsg.length;
//		for(int i=0; i<size; i++) {
//			gradeAdminService.gradePolicyDelete(ajaxMsg[i]);
//		}
//		
//		return "redirect:/gradePolicy_admin";
//	}

	//관리자 - 등급 정책 추가
	@RequestMapping(value="/gradePolicyAdd_admin", method =RequestMethod.GET)
    public String gradePolicyAdd() {
     return "/gradePolicyAdd_admin";
  }
	
	@RequestMapping(value="/gradePolicyAdd_admin", method =RequestMethod.POST)
    public String gradePolicyAdd(GradeVO gradeVO) {
		gradeAdminService.gradePolicyAdd(gradeVO);
		log.info(gradeVO);
     return "redirect:/gradePolicy_admin";
  }
	

	
	
	
	
}
