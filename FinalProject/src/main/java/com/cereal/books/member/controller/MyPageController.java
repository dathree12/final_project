package com.cereal.books.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("member/mypage/mypage")
	public String mypage() {
		
		return "member/mypage/mypage";
	}
}
