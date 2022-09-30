package com.goott.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.goott.domain.OrderVO;
import com.goott.domain.ProductReviewVO;
import com.goott.domain.SalesVO;
import com.goott.service.OrderService;
import com.goott.service.UserService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = {"/user", "/user/*"})
public class UserController {
	
	@Inject
	OrderService orderService;
	@Inject
	UserService userService;
	

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String userGet(HttpServletRequest request, Model model) {
		log.info("mypage =========================================");
		
		//로그인 유저 아이디
		//인터셉터로 로그인 여부 확인 하기때문에 따로 로그인 아이디 null 처리 불필요
		HttpSession session = request.getSession();
		String member_id = session.getAttribute("login_id").toString();
		//로그인 회원의 구매진행정보 리스트 가져오기
		List<OrderVO> orderList = orderService.getOrderList(member_id);
		//구매 확정 리스트 
		List<SalesVO> salesList = userService.getUserSalesList(member_id);
		log.info(salesList);
		
		model.addAttribute("orderList" , orderList);
		model.addAttribute("salesList" , salesList);
		
		
		return "/user/mypage";
	}
	
	@RequestMapping(value = "review", method = RequestMethod.GET)
	public String reviewGet(@RequestParam int sales_id, Model model) {
		log.info("리뷰작성 ====================================");
		
		
		model.addAttribute("sales_id", sales_id);
		return "/user/review";
	}
	
	@RequestMapping(value = "review", method = RequestMethod.POST)
	public String reviewGet(@RequestParam MultipartFile file, ProductReviewVO productReviewVO, @RequestParam int sales_id) {
		log.info("리뷰작성 post ====================================");
		log.info("매출 번호 : " + sales_id);
		log.info(productReviewVO);
		//파일 업로드 없으면 주소 초기화
		if(file.isEmpty()) {
			productReviewVO.setProduct_review_img_url("no url");
			productReviewVO.setProduct_review_video_url("no url");
		}
		Map<String, Object> map = userService.getReviewInfo(sales_id);
		//구매 정보 가져오기
		String member_id = map.get("member_id").toString();
		int product_id = Integer.parseInt( map.get("product_id").toString() );
		//리뷰 엔티티에 리뷰 정보 넣기
		productReviewVO.setMember_id(member_id);
		productReviewVO.setProduct_id(product_id);
		//리뷰 작성 
		userService.writeReview(productReviewVO, sales_id);
		
		return "redirect:/user";
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteUser(@RequestParam String member_id, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		//포스트 아이디 제대로 넘어오는지 확인
		log.info(member_id);
		
		//세션에 로그인 된 상태인제 체크
		if(session.getAttribute("login_id") != null) {
			String login_id = session.getAttribute("login_id").toString();
			
			//세션에 로그인 된 아이디와 삭제 요청한 아이디가 일치하는지 한번 더 확인
			if(member_id.equals(login_id)) {
				model.addAttribute("msg", "올바른 삭제 처리 접근");
				model.addAttribute("url", "/");
				return "alert";
			}
			//일치하지 않으면 잘못된 요청
			else {
				model.addAttribute("msg", "잘못된 방식으로 삭제 요청을 하였습니다. 확인 후 다시 시도해 주세요.");
				//세션 삭제
				model.addAttribute("url", "logout");
				return "alert";
			}
		}
		//아니면 잘못된 요청
		else {
			model.addAttribute("msg", "로그인 되지 않은 유저입니다. 로그인 후 탈퇴 신청 해주세요.");
			model.addAttribute("url", "login");
			return "alert";
		}
		
	}
}
