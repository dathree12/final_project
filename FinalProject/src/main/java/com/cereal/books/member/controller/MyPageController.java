package com.cereal.books.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.member.model.service.MemberService;
import com.cereal.books.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@SessionAttributes("loginMember")
public class MyPageController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("mypage")
	public String mypage() {
		
		return "member/mypage/mypage";
	}
	
	// 회원정보 수정
	@RequestMapping("/profile")
	public ModelAndView update(@ModelAttribute Member member,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			ModelAndView model) {
		
//		System.out.println(member);
//		System.out.println(loginMember);
		
		int result = 0;
		
		if(loginMember.getUserId().equals(member.getUserId())) {
			member.setUserNo(loginMember.getUserNo());
			
//			result = service.saveMember(member);
			
			if(result > 0) {
//				model.addObject("loginMember", service.findMemberByUserId(loginMember.getUserId()));
				model.addObject("msg", "회원정보 수정을 완료했습니다.");
				model.addObject("location", "/mpage");
			} else {
				model.addObject("msg", "회원정보 수정에 실패했습니다.");
				model.addObject("location", "/mypage");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 회원탈퇴
	@RequestMapping("withdrawal")
	public ModelAndView withdrawal(ModelAndView model,
			@SessionAttribute(name="loginMember", required = false) Member loginMember,
			@RequestParam("userId")String userId) {
		
		int result = 0;
		
		if(loginMember.getUserId().equals(userId)) {
//			result = service.deleteMember(userId);
			
			if(result > 0) {
				model.addObject("msg", "정상적으로 탈퇴되었습니다.");
//				model.addObject("location", "/logout");
			} else {
				model.addObject("msg", "회원 탈퇴 실패하였습니다.");
				model.addObject("location", "/myPage");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 관리자 페이지
	@RequestMapping("admin")
	public String admin() {
		
		return "member/mypage/admin_page";
	}
	
}
