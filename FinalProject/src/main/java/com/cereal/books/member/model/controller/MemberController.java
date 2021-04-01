package com.cereal.books.member.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	/*회원가입 약관*/
	@RequestMapping("member/enrollTerms")
	public String enrollTerms(){
		
		return "member/enrollTerms";
		
	}
	
	/*회원가입가입 */
	@RequestMapping("member/enroll")
	public String enroll(){
		
		return "member/enroll";
		
	}

}
