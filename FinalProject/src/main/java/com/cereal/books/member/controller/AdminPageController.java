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

import com.cereal.books.board.model.service.FundService;
import com.cereal.books.board.model.vo.FundBoard;
import com.cereal.books.common.util.PageInfo;
import com.cereal.books.member.model.service.MemberService;
import com.cereal.books.member.model.vo.Member;

@Controller
public class AdminPageController {
	
	@Autowired
	private MemberService mService;
	private FundService fService;
	
	// 관리자 페이지 불러오기
	@RequestMapping("/member/admin/admin_page")
	public ModelAndView mypage(ModelAndView model) {
		String status = null;
		List<Member> list = null;
		List<FundBoard> bflist = null;
		int boardCount = mService.getMemberCount(status);
		int fBoardCount = fService.getFundCount(status);
		PageInfo pageInfo = new PageInfo(1, 10, boardCount, 10);
		PageInfo fundPageInfo = new PageInfo(1, 10, fBoardCount, 10);
		list = mService.getMemberList(pageInfo, status);
		bflist = fService.getFundList(fundPageInfo, status);
		
		model.addObject("list", list);
		model.addObject("bflist", bflist);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("member/admin/admin_page");
		
		return model;
	}
	
	// 회원 목록 불러오기
	@RequestMapping("/member/admin")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "mStatus", required = false, defaultValue = "ALL") String status
			) {
		
		if(status.equals("ALL")) {
			status = null;
		}
		
		List<Member> list = null;
		int boardCount = mService.getMemberCount(status);
		PageInfo pageInfo = new PageInfo(1, 10, boardCount, 10);
		list = mService.getMemberList(pageInfo, status);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("list", list);
		result.put("pageInfo", pageInfo);
		
		return result;
	}
	
	// 회원 상태값 변경
	@RequestMapping(value = "/member/admin/updatemst", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Object list(
			@RequestParam(value = "newstatus", required = false) String status,
			@RequestParam(value = "idlist[]", required = false) List<String> userId
			) {
		System.out.println("status : " + status);
		
		System.out.println("userId" + userId);
		
		mService.getMemberStatus(status, userId);

        Map<String, Object> retVal = new HashMap<String, Object>();
        
        retVal.put("code", "OK");
		return retVal;
	}
}
