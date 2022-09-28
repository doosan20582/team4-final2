package com.goott.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.goott.domain.PageReview;
import com.goott.domain.ProductBrandVO;
import com.goott.domain.ProductCategoryVO;
import com.goott.domain.ProductReviewVO;
import com.goott.domain.ProductVO;
import com.goott.service.ProductBrandService;
import com.goott.service.ProductCategoryService;
import com.goott.service.ProductService;

import lombok.extern.log4j.Log4j;

@RequestMapping(value = "/product/*")
@Controller
@Log4j
public class ProductController {

	@Inject
	ProductBrandService productBrandService;
	@Inject
	ProductCategoryService productCategoryService;
	@Inject
	ProductService productService;

	// 상품 등록
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGet(Model model) {
		log.info("상품 등록 get  -----------------------------------");

		List<ProductBrandVO> brandList = productBrandService.getList();
		List<ProductCategoryVO> categoryList = productCategoryService.getList();
		model.addAttribute("brandList", brandList);
		model.addAttribute("categoryList", categoryList);

		return "shop/product/product_add";
	}

	// 상품 등록
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(ProductVO productVO, @RequestParam(value = "imgs1") MultipartFile[] imgs1,
			@RequestParam(value = "imgs2") MultipartFile[] imgs2) {
		log.info("상품 등록 post ------------------------------------");
		// 코멘트 없으면 초기화
		if (productVO.getProduct_comment().trim().equals("") || productVO.getProduct_comment().trim() == null
				|| productVO.getProduct_comment().trim().length() == 0)
			productVO.setProduct_comment("no comment");
		// 유튜브 주소 입력 안하면 초기화
		if (productVO.getProduct_youtube_url().trim().equals("") || productVO.getProduct_youtube_url().trim() == null
				|| productVO.getProduct_youtube_url().trim().length() == 0)
			productVO.setProduct_youtube_url("no url");

		log.info("컨트롤러로 전달된 정보 : " + productVO);
		productService.saveProduct(productVO, imgs1, imgs2);

		return "redirect:/shop/admin";
	}

	// 상품 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGet(@RequestParam String product_id, Model model) {
		log.info("상품 수정 get ------------------------------------");
		ProductVO productVO = productService.getPrdocutDetail(Integer.parseInt(product_id));
		List<ProductBrandVO> brandList = productBrandService.getList();
		List<ProductCategoryVO> categoryList = productCategoryService.getList();
		model.addAttribute("brandList", brandList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("product", productVO);
		log.info(productVO);

		return "shop/product/product_modify";
	}

	// 상품 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(ProductVO productVO, @RequestParam(value = "imgs1") MultipartFile[] imgs1,
			@RequestParam(value = "imgs2") MultipartFile[] imgs2) {
		log.info("상품 수정 post-----------------------------------------");
		// 코멘트 없으면 초기화
		if (productVO.getProduct_comment().trim().equals("") || productVO.getProduct_comment().trim() == null
				|| productVO.getProduct_comment().trim().length() == 0)
			productVO.setProduct_comment("no comment");
		// 유튜브 주소 입력 안하면 초기화
		if (productVO.getProduct_youtube_url().trim().equals("") || productVO.getProduct_youtube_url().trim() == null
				|| productVO.getProduct_youtube_url().trim().length() == 0)
			productVO.setProduct_youtube_url("no url");

		log.info("컨트롤러로 전달된 정보 : " + productVO);
		productService.updateProduct(productVO, imgs1, imgs2);
		return "redirect:/shop/admin";
	}

	// 상품 상세
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detailGet(@RequestParam(value = "product_id") int product_id,
			@RequestParam(defaultValue = "1") int currentPage, Model model) {
		log.info("상품 상세 get ------------------------------------------------");
		// 상품 상세 정보
		ProductVO productVO = productService.getPrdocutDetail(product_id);

		// 리뷰 페이지
		int totalNum = productService.getReviewTotalNum(product_id);
		// 리뷰 페이지 엔티티 초기화
		PageReview pageReview = new PageReview(currentPage, totalNum);

		// 상품 아이디
		pageReview.setProduct_id(product_id);
		log.info(pageReview);

		// 상품 리뷰 목록
		List<ProductReviewVO> reviewList = productService.getProductReviewList(pageReview);
		model.addAttribute("product", productVO);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageReview", pageReview);
	
		return "shop/product/product_detail_user";
	}

	// 상품 상세 관리자
	@RequestMapping(value = "/detail/admin", method = RequestMethod.GET)
	public String detailAdminGet(@RequestParam(value = "product_id") int product_id,
			@RequestParam(defaultValue = "1") int currentPage, Model model) {
		log.info("상품 관리자 상세 get ------------------------------------------------");
		// 상품 상세
		ProductVO productVO = productService.getPrdocutDetail(product_id);

		// 리뷰 페이지
		int totalNum = productService.getReviewTotalNum(product_id);
		// 리뷰 페이지 엔티티 초기화
		PageReview pageReview = new PageReview(currentPage, totalNum);

		// 상품 아이디
		pageReview.setProduct_id(product_id);
		log.info(pageReview);

		// 리뷰 목록
		List<ProductReviewVO> reviewList = productService.getProductReviewList(pageReview);
		model.addAttribute("product", productVO);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageReview", pageReview);
		
		return "shop/product/product_detail_admin";
	}
}
