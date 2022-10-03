package com.goott.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@RequestMapping(value = {"/admin/*", "/admin"})
@Log4j
@Controller
public class AdminController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String adminGet() {
		log.info("관리자 메인 ========================================");
		
		return "/admin/admin";
	}
}
