package com.cereal.books.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WithdrawalController {
	
	@RequestMapping("withdrawal")
	public String withdrawal() {
		
		return "member/mypage/withdrawal";
	}
}
