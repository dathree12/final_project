package com.cereal.books.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SecurityController {
	
	@RequestMapping(value = "/accessError" , method= {RequestMethod.POST,RequestMethod.GET})
	public String accessDenied(Model model) {
	
		model.addAttribute("msg", "접근권한이 없습니다.");
		return "common/accessError";
	}

}
