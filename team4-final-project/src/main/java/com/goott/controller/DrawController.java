package com.goott.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goott.domain.DrawEnterVO;
import com.goott.domain.DrawResultVO;
import com.goott.domain.DrawVO; 
import com.goott.domain.T_board_tag_VO;
import com.goott.service.DrawServiceAdmin;
 
import lombok.extern.log4j.Log4j; 

@Log4j
@Controller
public class DrawController {

	@Inject
	DrawServiceAdmin drawServiceAdmin;

	@RequestMapping(value = "/shop/draw_admin", method = RequestMethod.GET)
	public ModelAndView draw_admin() {
		log.info("draw 목록 관리자 =====================================================");
		List<DrawVO> draw_admin = drawServiceAdmin.draw_admin();



		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/draw_admin");
		mv.addObject("list", draw_admin);

		return mv;

	}
	@RequestMapping(value = "/shop/draw_customer", method = RequestMethod.GET)
	public void draw_customer(@RequestParam Map<String, Object> map , DrawVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String member_auth = " ";
		//if문을써라
		String member_id = session.getAttribute("login_id").toString();
		
		session.setAttribute("member_id", member_id);
		log.info(member_id);
		List<DrawResultVO> draw_resultList =drawServiceAdmin.getResultList(map);
		log.info("안들어오나"+draw_resultList);
		if(session.getAttribute("login_id")!=null) {//세션에 저장된 아이디
			member_auth= drawServiceAdmin.adminConfirmation(member_id); // 회원 관리자 여부
		}
		model.addAttribute("data", drawServiceAdmin.draw_customer(map));
		model.addAttribute("member_auth", member_auth);
		model.addAttribute("draw_resultList", draw_resultList);
	}

	/*
	 * @RequestMapping(value = "/shop/draw_customer", method = RequestMethod.GET)
	 * public ModelAndView draw_customer() {
	 * log.info("draw 목록 관리자 ====================================================");
	 * 
	 * List<DrawVO> draw_customer = drawServiceAdmin.draw_customer();
	 * 
	 * 
	 * 
	 * ModelAndView mv = new ModelAndView(); mv.setViewName("shop/draw_customer");
	 * mv.addObject("list", draw_customer);
	 * 
	 * return mv;
	 * 
	 * }
	 */
	
	@RequestMapping(value = "shop/draw_customer_draw", method = RequestMethod.POST)// 상세페이지 조건
	public String draw_customer_draw (@RequestParam Map<String, Object> map) {
		String user_id = map.get("user_id").toString();
		String login_id = map.get("login_id").toString();
		String draw_id = map.get("board_id").toString();
		if(user_id.equals(login_id)) {
			return "redirect:/shop/draw_customer?draw_id="+draw_id;
		} else {
			return "redirect:/shop/draw_customer?draw_id="+draw_id;
		} 
	}

	@RequestMapping(value = "shop/draw_admin_add", method = RequestMethod.GET)
	public String draw_admin_add_get() {
		return "/shop/draw_admin_add";
	}

	@RequestMapping(value = "shop/draw_admin_add", method = RequestMethod.POST)
	public ModelAndView draw_admin_add(DrawVO vo) {
		drawServiceAdmin.draw_admin_add(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/shop/draw_admin");
		return mv;
	}

	@ResponseBody
	// === 상품 추가하기 (brand) (ajax) === //
	@RequestMapping(value = "/shop/admin_add_plus.os")
	public List<Map<String, Object>> admin_add_plus(HttpServletRequest request) {
		// 에이잭스로 넘어온 데이터(스트링)
		String temp_category_id = request.getParameter("product_category_id");
		// 카테고리 아이디(인트형)
		int product_category_id = Integer.parseInt(temp_category_id);
		// log.info("입력된 카테고리 번호 : " + product_category_id);
		// 카테고리로 정렬된 상품 리스트
		List<Map<String, Object>> list = new ArrayList<>();
		// 디비에서 넘어온 상품 리스트 저장
		list = drawServiceAdmin.admin_add_plus(product_category_id);
		// log.info("한정판 상품 리스트 : " + list);
		return list;
	}

	@ResponseBody
	// === 상품 추가하기 (brand) (ajax) === //
	@RequestMapping(value = "/shop/admin_add_plus_product.os")
	public List<Map<String, Object>> admin_add_plus_product(HttpServletRequest request) {
		// 에이잭스로 넘어온 데이터(스트링)
		String temp_category_id = request.getParameter("product_category_id");
		// 카테고리 아이디(인트형)
		int product_category_id = Integer.parseInt(temp_category_id);
		//log.info(" product 입력된 카테고리 번호 :  " + product_category_id);
		// 에이잭스로 넘어온 데이터(스트링)
		String product_brand_name = request.getParameter("product_brand_name");
		// 카테고리 아이디(인트형)
		//log.info(" product 입력된 브랜드 번호 :  " + product_brand_name);
		// 카테고리로 정렬된 상품 리스트
		List<Map<String, Object>> list = new ArrayList<>();
		// 디비에서 넘어온 상품 리스트 저장
		Map<String, Object> map = new HashMap<>();
		map.put("product_category_id", product_category_id);
		map.put("product_brand_name", product_brand_name);
		list = drawServiceAdmin.admin_add_plus_product(map);
		//log.info(" product 한정판 상품 리스트  :  " + list);
		return list;

	}

	@ResponseBody
	// === 상품 이름 추가하기 (brand) (ajax) === //
	@RequestMapping(value = "/shop/admin_add_plus_product_name.os")
	public List<Map<String, Object>> admin_add_plus_product_name(HttpServletRequest request) {

		// 에이잭스로 넘어온 데이터(스트링)
		String temp_category_id = request.getParameter("product_category_id");
		// 카테고리 아이디(인트형)
		int product_category_id = Integer.parseInt(temp_category_id);
		// 에이잭스로 넘어온 데이터(스트링)
		String product_brand_name = request.getParameter("product_brand_name");
		// 카테고리로 정렬된 상품 리스트
		List<Map<String, Object>> list = new ArrayList<>();
		// 디비에서 넘어온 상품 리스트 저장
		Map<String, Object> map = new HashMap<>();
		map.put("product_category_id", product_category_id);
		map.put("product_brand_name", product_brand_name);
		list = drawServiceAdmin.admin_add_plus_product_name(map);
		//System.out.println(list);
		return list;
	}

	@ResponseBody
	// === 상품가격 넣기 (product) (ajax) === //
	@RequestMapping(value = "/shop/admin_add_plus_product_price.os")
	public List<Map<String, Object>> admin_add_plus_product_price(HttpServletRequest request) {

		// 에이잭스로 넘어온 데이터(스트링)
		String temp_category_id = request.getParameter("product_category_id");
		// 카테고리 아이디(인트형)
		int product_category_id = Integer.parseInt(temp_category_id);
		// 에이잭스로 넘어온 데이터(스트링)
		String product_brand_name = request.getParameter("product_brand_name");
		// 카테고리로 정렬된 상품 리스트
		List<Map<String, Object>> list = new ArrayList<>();
		// 디비에서 넘어온 상품 리스트 저장
		Map<String, Object> map = new HashMap<>();
		map.put("product_category_id", product_category_id);
		map.put("product_brand_name", product_brand_name);
		list = drawServiceAdmin.admin_add_plus_product_price(map);
		//System.out.println(list);
		return list;
	}

	@ResponseBody
	// === 상품아이디 넣기 (product) (ajax) === //
	@RequestMapping(value = "/shop/admin_add_plus_product_product_id.os")
	public List<Map<String, Object>> admin_title_product_id(HttpServletRequest request) {

		// 에이잭스로 넘어온 데이터(스트링)
		String temp_category_id = request.getParameter("product_category_id");
		// 카테고리 아이디(인트형)
		int product_category_id = Integer.parseInt(temp_category_id);
		// 에이잭스로 넘어온 데이터(스트링)
		String product_brand_name = request.getParameter("product_brand_name");
		// 카테고리로 정렬된 상품 리스트
		List<Map<String, Object>> list = new ArrayList<>();
		// 디비에서 넘어온 상품 리스트 저장
		Map<String, Object> map = new HashMap<>();
		map.put("product_category_id", product_category_id);
		map.put("product_brand_name", product_brand_name);
		list = drawServiceAdmin.admin_title_product_id(map);
		//System.out.println(list);
		return list;
	}

	// === admin update === //
	@RequestMapping(value = "/shop/draw_admin_change", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		//log.info(map);
		List<DrawVO> list = this.drawServiceAdmin.draw_admin_change(map);
		//log.info(list);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", drawServiceAdmin.draw_admin_change(map));
		mv.addObject("map", map);
		mv.setViewName("/shop/draw_admin_change");
		//log.info(drawServiceAdmin.draw_admin_change(map));
		return mv;
	}

	// === admin update 디비에 보내기=== //

	@RequestMapping(value = "/shop/draw_admin_change", method = RequestMethod.POST)
	public ModelAndView update(DrawVO vo) {
		//log.info(vo);
		ModelAndView mv = new ModelAndView();
		drawServiceAdmin.update(vo);
		mv.setViewName("redirect:/shop/draw_admin");
		return mv;
	}

	// === admin 삭제기능 === //
	@RequestMapping(value = "/shop/draw_admin_delete", method = RequestMethod.GET)
	public ModelAndView delete(DrawVO vo) {
		ModelAndView mv = new ModelAndView();
		drawServiceAdmin.delete(vo);
		mv.setViewName("redirect:/shop/draw_admin");
		return mv;
	}

	// === admin count === //
	@RequestMapping(value = "/shop/draw_admin_count", method = RequestMethod.GET)
	public ModelAndView admin_count(@RequestParam Map<String, Object> map) {
		List<DrawEnterVO> list = this.drawServiceAdmin.admin_count(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", drawServiceAdmin.admin_count(map));
		mv.addObject("map", map);
		mv.setViewName("/shop/draw_admin_count");
		//log.info(mv);
		return mv;
	}
	 // == admin count DB==
	@ResponseBody
	@RequestMapping(value="/shop/draw_admin_count.os" , method=RequestMethod.POST)
	public void draw_admin_count(@RequestParam(value= "valueArrTest[]") List<String> valueArrTest) {
		
		 // log.info("이거 받아오냐" +valueArrTest.size());
		  int draw_id = Integer.parseInt(valueArrTest.get(0));
		//  System.out.println(draw_id);
		  ModelAndView mav = new ModelAndView();
		  for( int i=1; i<valueArrTest.size(); i++) { 
			  Map<String, Object> map = new HashMap<String, Object>();
			  String member_id = valueArrTest.get(i);
			  map.put("draw_id", draw_id);
			  map.put("member_id", member_id);
			  drawServiceAdmin.draw_admin_count(map);
		  }
	}  
	
	/*
	 * @ResponseBody // === customer창에 아이디값 불러오기 (memberID) (ajax) === //
	 * 
	 * @RequestMapping(value = "/shop/customer_memberId.os") public List<Map<String,
	 * Object>> draw_customer_memberID(HttpServletRequest request) {
	 * 
	 * // 에이잭스로 넘어온 데이터(스트링) String temp_draw_id= request.getParameter("draw_id");
	 * // 카테고리 아이디(인트형) int draw_id = Integer.parseInt(temp_draw_id);
	 * List<Map<String, Object>> list = new ArrayList<>(); // 디비에서 넘어온 상품 리스트 저장
	 * Map<String, Object> map = new HashMap<>(); map.put("draw_id", draw_id); list
	 * = drawServiceAdmin.draw_customer_memberID(map); System.out.println(list);
	 * return list; }
	 */
	
	
 
	
	
	@ResponseBody
	@RequestMapping(value = "/shop/draw_customer_button" , method = RequestMethod.POST)
	public String draw_customer_button(@RequestBody Map<String, Object> map) {
		if(drawServiceAdmin.draw_customer_button_check(map)!=0) {
			return "fail";
		} else {
			drawServiceAdmin.draw_customer_button(map);
			
			return "success";
		}
	}
}
	   
	  

