package com.cereal.books;


import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.cereal.books.member.model.vo.Member;



@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(  Model model, @AuthenticationPrincipal Member member ) {
	
	
		System.out.println(member);
		
		
		return "mainpage";
	}
	
}
