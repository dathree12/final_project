package com.cereal.books.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.common.util.PageInfo;
import com.cereal.books.member.model.service.MemberService;
import com.cereal.books.member.model.vo.Member;

@Controller
public class AdminPageController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("/member/admin/admin_page")
public String mypage() {
		
		return "member/admin/admin_page";
	}
	@RequestMapping("/member/admin")
	@ResponseBody
	public Map<String, Object> list(
//			ModelAndView model,
			@RequestParam(value = "mStatus", required = false, defaultValue = "ALL") String status
			) {
		
//		String status = null;
		if(status.equals("ALL")) {
			status = null;
		}
		
		System.out.println("status : " + status);
		List<Member> list = null;
		int boardCount = mService.getMemberCount(status);
		PageInfo pageInfo = new PageInfo(1, 10, boardCount, 10);
		list = mService.getMemberList(pageInfo, status);
		
		System.out.println("list : " + list);
//		System.out.println(boardCount);
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("list", list);
		result.put("pageInfo", pageInfo);
//		model.addObject("list", list);
//		model.addObject("pageInfo", pageInfo);
//		model.setViewName("member/admin/admin_page");
		
		return result;
	}
	
	@RequestMapping("/member/admin/updatemst")
	public ModelAndView list(
			ModelAndView model
//			@RequestParam(value = "mStatus", required = false) String status
//			@RequestParam(value = "mStatus", required = false) List userId
			) {
		String status = "N";
		System.out.println("status : " + status);
		List<String> userId = new ArrayList<>();
		userId.add("su94h");
		userId.add("user1");
		System.out.println("userId" + userId);
		
		mService.getMemberStatus(status, userId);
		
//		model.addObject("list", list);
		return model;
	}
}
