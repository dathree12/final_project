package com.cereal.books.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminPageController {
	
	@RequestMapping("member/admin/admin_page")
	public String admin() {
		
		return "member/admin/admin_page";
	}
}
