package com.goott.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goott.domain.T_board_VO;
import com.goott.domain.T_board_tag_VO;
import com.goott.service.Community_freeNotice_service;

@Controller
@RequestMapping("/community/freeNotice/*")
public class Community_freeNotice_controller {
	
	@Autowired
	private Community_freeNotice_service fservice;
	
	@GetMapping("/main") //자유게시판 목록 페이지
	public void getList(@RequestParam Map<String, Object> map , T_board_tag_VO tag_vo, Model model, HttpServletRequest request) {

		String sort_value = (String) map.get("sort_value");
		
		String keyword = (String) map.get("keyword");
		if(keyword==null) { // 키워드가 없으면 value없이 key만 던짐
			map.put("keyword", "");
		}
		
		int tag_id = tag_vo.getBoard_tag_id();
		HttpSession session = request.getSession();
		String member_auth = " ";
		
		if(session.getAttribute("login_id")!=null) {//세션에 저장된 아이디
			String member_id = session.getAttribute("login_id").toString();
			member_auth= fservice.adminConfirmation(member_id); // 회원 관리자 여부
		}

		model.addAttribute("data", fservice.getList(map));
		model.addAttribute("tag", fservice.getTag());
		model.addAttribute("count", fservice.listCount(map));
		model.addAttribute("keyword", keyword);
		model.addAttribute("tag_id", tag_id);
		model.addAttribute("sort_value", sort_value);
		model.addAttribute("member_auth", member_auth);
	}
	
	@GetMapping("/input") //글 입력 페이지
	public void inputNotice(Model model) {
		model.addAttribute("tag", fservice.getTag());
	}
	
	@PostMapping("/input") // 글 입력 페이지에서 글 등록하기
	public String inputPost (T_board_VO board) {
		
		 fservice.inputPost(board); 
		 fservice.inputPoint(board);
		 
		return "redirect:/community/freeNotice/main";
	}
	
	@PostMapping("/go_detail")// 상세페이지 조건
	public String goDetail (@RequestParam Map<String, Object> map) {
		String user_id = map.get("user_id").toString();
		String login_id = map.get("login_id").toString();
		String board_id = map.get("board_id").toString();
		if(user_id.equals(login_id)) {
			return "redirect:/community/freeNotice/detail_user?board_id="+board_id;
		} else {
			return "redirect:/community/freeNotice/detail?board_id="+board_id;
		}
	}
	
	@GetMapping("/detail") // 게시판 상세 페이지
	public void detailPage (int board_id, Model model) {
		fservice.increase(board_id);
		String member_id = fservice.getDetail(board_id).getMember_id();
		model.addAttribute("tag", fservice.getTag());
		model.addAttribute("data", fservice.getDetail(board_id));
		model.addAttribute("reply_data", fservice.replyList(board_id));
		model.addAttribute("reply_count", fservice.replyCount(board_id));
		model.addAttribute("profile", fservice.getImg(member_id));
	}
	
	@GetMapping("/detail_user") // 게시판 유저 페이지
	public void detailUserPage (int board_id, Model model) {
		String member_id = fservice.getDetail(board_id).getMember_id();
		fservice.increase(board_id);
		model.addAttribute("tag", fservice.getTag());
		model.addAttribute("data", fservice.getDetail(board_id));
		model.addAttribute("reply_data", fservice.replyList(board_id));
		model.addAttribute("reply_count", fservice.replyCount(board_id));
		model.addAttribute("profile", fservice.getImg(member_id));
	}
	
	@GetMapping("/correction") // 게시글 수정 페이지
	public void correctionPage(int board_id, Model model) {
		model.addAttribute("tag", fservice.getTag());
		model.addAttribute("data", fservice.getDetail(board_id));
	}
	
	@PostMapping("/correction") // 게시글 수정하기 
	public String correction(T_board_VO board, RedirectAttributes rttr) {
		fservice.correct(board);
		rttr.addFlashAttribute("result", "correction complete");
		return "redirect:/community/freeNotice/detail_user?board_id="+board.getBoard_id();
	}
	
	@PostMapping("/delete") // 게시글 삭제하기
	public String delete(int board_id, RedirectAttributes rttr)	{
		fservice.delete(board_id);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/community/freeNotice/main";
	}
	
	@PostMapping("reply_input") // 댓글 달기
	public ModelAndView reply_input(@RequestBody Map<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		this.fservice.reply_input(map);
		String reply_id = map.get("board_reply_id").toString();
		String id_cast = map.get("board_id").toString();
		int board_id = Integer.parseInt(id_cast);
		mv.addObject("data", fservice.getReply(reply_id));
		mv.addObject("reply_count", fservice.replyCount(board_id));
		mv.setViewName("community/freeNotice/reply");
		return mv;
	}
	
	@PostMapping("delete_reply") // 댓글 삭제
	@ResponseBody
	public void delete_reply(@RequestBody Map<String, Object> map) {
		fservice.delete_reply(map);
	}
	
	@PostMapping("view_more") // 댓글 view more
	public ModelAndView view_more(@RequestBody Map<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", fservice.get_viewMore(map));
		mv.setViewName("community/freeNotice/view_more");
		return mv;
	}
	
	@PostMapping("change_page") // 자유게시판 게시글 리스트 페이지 전환
	public ModelAndView change_page(@RequestBody Map<String, Object> map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_auth = " ";
		//세션에 저장된 아이디
		if(session.getAttribute("login_id")!=null) {
			String member_id = session.getAttribute("login_id").toString();
			member_auth= fservice.adminConfirmation(member_id); // 회원 관리자 여부
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", fservice.change_page(map));
		mv.addObject("member_auth", member_auth);
		mv.setViewName("community/freeNotice/list");
		return mv;
	}
	
	@PostMapping("admin_delete") // 관리자 계정 글 삭제 기능
	@ResponseBody
	public void admin_delete(HttpServletRequest request) {
		String[] delete_list = request.getParameterValues("delete_list");
		int size = delete_list.length;
		for(int i = 0; i<size; i++) {
			int board_id = Integer.parseInt(delete_list[i]);
			fservice.delete(board_id);
		}
	}
	
	@PostMapping("recommend") // 추천기능
	@ResponseBody
	public String recommend(@RequestBody Map<String, Object> map) {
		if(fservice.recommend_check(map)!=0) {
			return "fail";
		} else {
			fservice.recommend(map);
			fservice.board_recommend(map);
			return "success";
		}
	}
}
