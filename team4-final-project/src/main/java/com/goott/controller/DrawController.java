package com.goott.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goott.domain.ProductVO;
import com.goott.domain.T_board_VO;
import com.goott.domain.DrawVO;
import com.goott.domain.ProductBrandVO;
import com.goott.domain.ProductCategoryVO;
import com.goott.service.DrawServiceAdmin;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class DrawController {

	@Inject
	DrawServiceAdmin drawServiceAdmin;

	@RequestMapping(value = "/shop/draw_admin", method = RequestMethod.GET)
	public ModelAndView draw_admin() {
		log.info("draw 목록 관리자 ====================================================");

		List<DrawVO> draw_admin = drawServiceAdmin.draw_admin();

		log.info("draw 목록 : " + draw_admin);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/draw_admin");
		mv.addObject("list", draw_admin);

		return mv;

	}
	
	@RequestMapping(value = "shop/draw_admin_add", method = RequestMethod.GET)
	public String draw_admin_add_get() {
		return "/shop/draw_admin_add";
	}
	
	@RequestMapping(value = "shop/draw_admin_add", method = RequestMethod.POST)
	public ModelAndView draw_admin_add(DrawVO vo) {
		System.out.println(vo.toString());
		//drawServiceAdmin.draw_admin_add(map);
		ModelAndView mv = new ModelAndView();  
		mv.setViewName("redirect:/shop/draw_admin_add");
		return mv; 
	}  
	 
	
	@ResponseBody
	// === 상품 추가하기 (brand) (ajax) === //
	@RequestMapping(value = "/shop/admin_add_plus.os")
	public List<Map<String, Object>> admin_add_plus(HttpServletRequest request ) {
		// 에이잭스로 넘어온 데이터(스트링)
		String temp_category_id = request.getParameter("product_category_id");
		// 카테고리 아이디(인트형)
		int product_category_id = Integer.parseInt(temp_category_id);
		//log.info("입력된 카테고리 번호 :  " + product_category_id);
		// 카테고리로 정렬된 상품 리스트
		List<Map<String,Object>> list = new ArrayList<>();
		// 디비에서 넘어온 상품 리스트 저장
		list = drawServiceAdmin.admin_add_plus(product_category_id);
		//log.info("한정판 상품 리스트  :  " + list);
		return list;
	}  
	

	@ResponseBody
	// === 상품 추가하기 (brand) (ajax) === //
	@RequestMapping(value = "/shop/admin_add_plus_product.os")
	public List<Map<String,Object>> admin_add_plus_product(HttpServletRequest request) {
		// 에이잭스로 넘어온 데이터(스트링)
		String temp_category_id = request.getParameter("product_category_id");
		// 카테고리 아이디(인트형)
		int product_category_id = Integer.parseInt(temp_category_id);
		log.info(" product 입력된 카테고리 번호 :  " + product_category_id);
		// 에이잭스로 넘어온 데이터(스트링)
		String product_brand_name = request.getParameter("product_brand_name");
		// 카테고리 아이디(인트형)
		log.info(" product 입력된 브랜드 번호 :  " + product_brand_name);
		// 카테고리로 정렬된 상품 리스트
		List<Map<String,Object>> list = new ArrayList<>();
		// 디비에서 넘어온 상품 리스트 저장
		Map<String,Object> map =new HashMap<>();
		map.put("product_category_id", product_category_id);
		map.put("product_brand_name", product_brand_name); 
		list = drawServiceAdmin.admin_add_plus_product(map);
		log.info(" product 한정판 상품 리스트  :  " + list);
		return list;

	} 
	 

	@ResponseBody
	// === 상품 이름 추가하기 (brand) (ajax) === //
	   @RequestMapping(value = "/shop/admin_add_plus_product_name.os")
	   public List<Map<String,Object>> admin_add_plus_product_name(HttpServletRequest request) {

			//에이잭스로 넘어온 데이터(스트링)
			String temp_category_id = request.getParameter("product_category_id");
			//카테고리 아이디(인트형)
			int product_category_id = Integer.parseInt( temp_category_id );
			//에이잭스로 넘어온 데이터(스트링)
			String product_brand_name = request.getParameter("product_brand_name");
			//카테고리로 정렬된 상품 리스트
			List<Map<String,Object>> list = new ArrayList<>();
			//디비에서 넘어온 상품 리스트 저장 
			Map<String,Object> map =new HashMap<>();
			map.put("product_category_id", product_category_id);
			map.put("product_brand_name", product_brand_name); 
			list = drawServiceAdmin.admin_add_plus_product_name(map);
			System.out.println(list);
			 return list;
	   } 
	  
	@ResponseBody
	// === 상품가격 넣기 (product) (ajax) === //
	   @RequestMapping(value = "/shop/admin_add_plus_product_price.os")
	   public List<Map<String,Object>> admin_add_plus_product_price(HttpServletRequest request) {

			//에이잭스로 넘어온 데이터(스트링)
			String temp_category_id = request.getParameter("product_category_id");
			//카테고리 아이디(인트형)
			int product_category_id = Integer.parseInt( temp_category_id );
			//에이잭스로 넘어온 데이터(스트링)
			String product_brand_name = request.getParameter("product_brand_name");
			//카테고리로 정렬된 상품 리스트
			List<Map<String,Object>> list = new ArrayList<>();
			//디비에서 넘어온 상품 리스트 저장 
			Map<String,Object> map =new HashMap<>();
			map.put("product_category_id", product_category_id);
			map.put("product_brand_name", product_brand_name); 
			list = drawServiceAdmin.admin_add_plus_product_price(map);
			System.out.println(list);
			 return list;
	   } 
	
	@RequestMapping(value = "/shop/draw_admin_count", method = RequestMethod.GET)
	public String draw_admin_count() {
		return "/shop/draw_admin_count";
	}
	
	

}  
