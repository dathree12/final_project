package com.cereal.books.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.member.model.service.MemberService;
import com.cereal.books.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	
	/*로그인 페이지 이동*/
	@GetMapping("member/login")
	public void loginViews() {
		
	
	}
	
	/*로그인*/
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model) {
	
	 return model;	
	}
	
	
	
	/*회원가입 약관*/
	@RequestMapping("member/enrollTerms")
	public String enrollTerms(){
		
		return "member/enrollTerms";
		
	}
	
	/*회원가입 패이지 요청*/
	@RequestMapping("member/enroll")
	public String enrollViews(){
		
		return "member/enroll";
		
	}
	
	/*회원가입페이지 작성 */
	@RequestMapping(value = "member/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member){
		
		int result =service.saveMember(member);
		
		
		return model;
		
	}

}
