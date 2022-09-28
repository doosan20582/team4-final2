package com.goott.controller;

import java.io.Console;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
//	@RequestMapping(value = "/QnA", method = RequestMethod.GET)
//	public ModelAndView QnA(@RequestParam Map<String, Object> map) {
//		List<QnAVO> list = qnaservice.list();
//		log.info("QnA ==========================================================");
//		log.info("QnA 데이터 : " + list.toString());
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/shop/QnA");
//		mv.addObject("list", list);
//		return mv;
//	}			
	
	@RequestMapping(value = "/QnA")
	public String QnA(PagingVO vo, Model model	
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = qnaservice.countQnABoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		} 
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list", qnaservice.selectQnABoard(vo));
		log.info(vo);
		return "/shop/QnA";
	}
	
	@RequestMapping(value="/Question", method =RequestMethod.GET)
    public String Question() {
     return "/shop/Question";
  }

	@RequestMapping(value="/Question", method =RequestMethod.POST)
    public ModelAndView Question(QnAVO QnA) {
	  log.info(QnA);
	  qnaservice.Question(QnA);
	  log.info("작업끝");
     ModelAndView mv = new ModelAndView();
     mv.setViewName("redirect:/shop/QnA");
     return mv;
  } 
  
  @RequestMapping(value="/Question_update", method =RequestMethod.GET)
  public String QnA_update(@RequestParam String qna_id, Model model) {
	  model.addAttribute("qna_id", qna_id) ;
   return "/shop/Question_update";
}

  @RequestMapping(value="/Question_update", method =RequestMethod.POST)
  public ModelAndView QnA_update(QnAVO QnA) {
	 qnaservice.QnA_update(QnA);
	 ModelAndView mv = new ModelAndView();
	 mv.setViewName("redirect:QnA");
	 return mv;
}
 
  
  
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
	
  @RequestMapping(value="/delete", method =RequestMethod.POST)
  public String delete(QnAVO QnA) {
	  log.info(QnA);
	  qnaservice.delete(QnA);
   return "redirect:/shop/QnA";
} 

}