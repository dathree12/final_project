package com.cereal.books.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminPageController {
	
	@RequestMapping("admin")
	public String admin() {
		
		return "member/mypage/admin_page";
	}
}
