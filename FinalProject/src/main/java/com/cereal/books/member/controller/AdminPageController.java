package com.cereal.books.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.common.util.PageInfo;
import com.cereal.books.member.model.service.MemberService;
import com.cereal.books.member.model.vo.Member;

@Controller
public class AdminPageController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("/member/admin/admin_page")
	public String admin() {
		
		return "member/admin/admin_page";
	}
	
	@RequestMapping(value = "/member/admin/admin_page", method = {RequestMethod.POST})
	public ModelAndView list(
			ModelAndView model,
			@RequestParam(value = "status", required = false) char status,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit) {
		
		System.out.println("status : " + status);
		List<Member> list = null;
		int boardCount = mService.getMemberCount(status);
		PageInfo pageInfo = new PageInfo(page, 10, boardCount, listLimit);
//		char status = ' ';
		
		System.out.println(boardCount);
		
		list = mService.getMemberList(pageInfo, status);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("member/admin/admin_page");
		
		return model;
	}
}
