package com.cereal.books.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("member/mypage/mypage")
	public String mypage() {
		
		return "member/mypage/mypage";
	}
	
	// 회원정보 수정
	@RequestMapping("member/mypage/profile")
	public String profile(Model model, @AuthenticationPrincipal Member member) {
		
//		System.out.println(member);
		
		return "/member/mypage/profile";
	}
	
	// 닉네임 중복검사
	@RequestMapping("member/mypage/NnameCheck")
	@ResponseBody
	public Object idCheck(@RequestParam("userNname") String userNname) {
		
		System.out.println("userNname : " + userNname);
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.NnameValidate(userNname));
		
		return map;
	}
	
	
	@RequestMapping("member/update")
	public ModelAndView update(@ModelAttribute Member member,
			@AuthenticationPrincipal Member loginMember,
			ModelAndView model) {
		
		System.out.println("member : " + member);
		System.out.println("loginMember : " + loginMember);
		
		int result = 0;
		
		if(loginMember.getUserId().equals(member.getUserId())) {
			member.setUserNo(loginMember.getUserNo());
			
			result = service.saveMember(member);
			
			if(result > 0) {
//				model.addObject("loginMember", service.findMemberByUserId(loginMember.getUserId()));
				model.addObject("msg", "회원정보 수정을 완료했습니다.");
				model.addObject("location", "/member/mypage/mypage");
			} else {
				model.addObject("msg", "회원정보 수정에 실패했습니다.");
				model.addObject("location", "/member/mypage/profile");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 비밀번호 변경
	@RequestMapping("member/updatePwd")
	public String userPwd() {
		
		return "member/mypage/updatePwd";
	}
	
	@RequestMapping(value = "member/updatePwd", method = {RequestMethod.POST})
	@ResponseBody
	public Object updatePwd(ModelAndView model, @AuthenticationPrincipal Member member,
			@RequestParam("userPwd") String userPwd) {
		int result = service.updatePwd(member.getUserId(), userPwd);
		
//		System.out.println("userPwd : " + userPwd);
			
			if(result > 0) {
				model.addObject("msg", "정상적으로 변경되었습니다.");
				model.addObject("script", "self.close()");
			} else {
				model.addObject("msg", "변경 실패하였습니다.");
				model.addObject("script", "/member/updatePwd");
			}
			
		return model;
	}

	// 회원탈퇴
	@RequestMapping("member/withdrawal")
	public String withdrawal(@AuthenticationPrincipal Member member) {
		
		return "/member/mypage/withdrawal";
	}
	
	@RequestMapping("member/delete")
	public ModelAndView withdrawal(ModelAndView model, @AuthenticationPrincipal Member member,
			 @RequestParam("userPwd") String userPwd) {
		
//		System.out.println(userPwd);
//		System.out.println(member.getUserId());
		int result = 0;
		
		if(member.getUserId().equals(member.getUserId())) {
			result = service.deleteMember(member.getUserId(), userPwd);
			
			if(result > 0) {
				model.addObject("msg", "정상적으로 탈퇴되었습니다.");
				model.addObject("location", "/");
			} else {
				model.addObject("msg", "회원 탈퇴 실패하였습니다.");
				model.addObject("location", "/member/withdrawal");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
}
