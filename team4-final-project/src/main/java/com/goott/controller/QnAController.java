package com.goott.controller;

import java.io.Console;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goott.domain.PagingVO;
import com.goott.domain.QnAVO;
import com.goott.service.QnAService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value= ("/shop/*"))
public class QnAController {

	@Autowired
	QnAService qnaservice;
			
	// 게시물 조회 , 목록
	@RequestMapping(value = "/QnA")
	public String QnA(PagingVO vo, Model model	
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(defaultValue = "all")String checkcategory
			, @RequestParam(defaultValue = "all")String QnASearch, QnAVO qnA
			) {
		log.info("게시글페이지 보기------------------------------------");
		log.info("카테고리 "+checkcategory);
		log.info("검색어 "+QnASearch);
		log.info("현재페이지 "+nowPage);
		log.info("페이지개수 "+cntPerPage);
		log.info("내가 검색하고싶은거는"+QnASearch);
		int total = qnaservice.countQnABoardCategory(checkcategory, QnASearch);
		
//		// 문의글 총 개수 조회
//		if( (checkcategory.isEmpty() || checkcategory.contentEquals("all") ) && (QnASearch.isEmpty() || QnASearch.contentEquals("")) ){
//			total = qnaservice.countQnABoard();
//		}
//		// 카테고리 값은 있고 검색 값은 없는경우 조회
//		else if( (!checkcategory.isEmpty() || !checkcategory.contentEquals("all") ) && (QnASearch.isEmpty() || QnASearch.contentEquals("")) ){
//			total = qnaservice.countQnABoard();
//		}
//		// 카테고리 값은 없고 검색 값은 있는경우 조회
//		else if( (checkcategory.isEmpty() || checkcategory.contentEquals("all") ) && (!QnASearch.isEmpty() || !QnASearch.contentEquals("")) ){
//			return null;
//		}
//		// 카테고리 값 없고 검색 값 없는 경우 조회
//		else{
//			return null;
//		}
		
		
		
		
//		if(checkcategory.isEmpty() || checkcategory.contentEquals("all") ) {
//			total = qnaservice.countQnABoard();
//		}
//		// 카테고리 별 문의글 총 개수 
//		else if(!checkcategory.isEmpty()){
//
//			total = qnaservice.countQnABoardCategory(checkcategory, QnASearch);
//		}
//		else if(QnASearch.isEmpty() || QnASearch.contentEquals("all")) {
//			total = qnaservice.countQnABoard();
//		}
//		else if(!QnASearch.isEmpty()) {
//			total = qnaservice.countQnABoardCategory(checkcategory, QnASearch);
//		}
//		
		log.info(" 게시글 총 개수     " +total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		} 
		

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		log.info("-------------------------------");
		log.info("vo는 " +vo);
		List<QnAVO> data = qnaservice.selectQnABoard(vo, checkcategory, QnASearch);
		model.addAttribute("paging", vo);
		model.addAttribute("list", data);
		model.addAttribute("checkcategory",checkcategory);
		model.addAttribute("QnASearch", QnASearch);
		log.info("-------------------------------");
		log.info(data);
		log.info("-------------------------------");
		
		return "/shop/QnA";
	}
	
	// 게시물 작성
	@RequestMapping(value="/Question", method =RequestMethod.GET)
    public String Question() {
     return "/shop/Question";
  }
	// 게시물 작성
	@RequestMapping(value="/Question", method =RequestMethod.POST)
    public ModelAndView Question(QnAVO QnA) {
	  log.info(QnA);
	  qnaservice.Question(QnA);
	  log.info("작업끝");
     ModelAndView mv = new ModelAndView();
     mv.setViewName("redirect:/shop/QnA");
     return mv;
  } 
  
  // 게시물 상세페이지
  @RequestMapping(value="/QnA_detail", method = RequestMethod.GET)
  public ModelAndView Question_detail(@RequestParam Map<String, Object> map, QnAVO QnA) {
	   log.info(QnA);
	   log.info(map);
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("shop/QnA_detail");
	   mv.addObject("data", qnaservice.QnA_detail(map));
	   log.info(mv);
      return mv;
  } 
  
  // 게시물 수정
  @RequestMapping(value="/Question_update", method =RequestMethod.GET)
  public String QnA_update(@RequestParam Map<String,Object> map, Model model) {
	  model.addAttribute("data",qnaservice.QnA_detail(map));
   return "/shop/Question_update";
}
  // 게시물 수정
  @RequestMapping(value="/Question_update", method =RequestMethod.POST)
  public ModelAndView QnA_update(@RequestParam Map<String,Object> map,  QnAVO QnA) {
	 System.out.println(map);
	 ModelAndView mv = new ModelAndView();
	  qnaservice.Question_update(QnA);
//	 mv.addObject("data", qnaservice.Question_update(map));
	 mv.setViewName("redirect:/shop/QnA");
	 return mv;
}
  
  // 게시물 삭제
  @RequestMapping(value="/delete", method =RequestMethod.POST)
  public String delete(QnAVO QnA) {
	  log.info(QnA);
	  qnaservice.delete(QnA);
   return "redirect:/shop/QnA";
  } 
  
  // 게시물 답변
  @RequestMapping(value="/Question_admin", method =RequestMethod.GET)
  public String Quetion_admin(@RequestParam Map<String, Object> map, Model model) {
	  model.addAttribute("data",qnaservice.QnA_detail(map));
	  log.info("=============================================");
	  log.info(model);
	  log.info("=============================================");
	  return "/shop/Question_admin";
  }

  // 게시물 답변
  @RequestMapping(value="/Question_admin", method =RequestMethod.POST)
  public ModelAndView Question_admin(@RequestParam Map<String,Object> map,  QnAVO QnA) {
	  ModelAndView mv = new ModelAndView();
	  qnaservice.Question_admin(QnA);
	  qnaservice.Question_admin_answer(QnA);
	  
	  mv.setViewName("redirect:/shop/QnA");
	  return mv;
  }
  
  @RequestMapping(value="/asked_Question", method =RequestMethod.GET)
  public String asked_Question() {
	     return "/shop/asked_Question";
	  }
  
}