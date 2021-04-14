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
	@Autowired
	private FundService fService;
	
	// 관리자 페이지 불러오기
	@RequestMapping("/member/admin/admin_page")
	public ModelAndView mypage(ModelAndView model) {
		String status = null;
		String fStatus = null;
		
		// 회원관련
		List<Member> list = null;
		int boardCount = mService.getMemberCount(status);
		PageInfo pageInfo = new PageInfo(1, 10, boardCount, 10);
		list = mService.getMemberList(pageInfo, status);
		
		// 북펀딩
		List<FundBoard> bfList = null;
		int fBoardCount = fService.getFundCount(fStatus);
		PageInfo fundPageInfo = new PageInfo(1, 10, fBoardCount, 10);
		bfList = fService.getFundList(fundPageInfo, fStatus);
		
		System.out.println(fBoardCount);
		System.out.println(bfList);
				
		model.addObject("list", list);
		model.addObject("bfList", bfList);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("member/admin/admin_page");
		
		return model;
	}
	
	// 펀드 목록 비동기
	@RequestMapping("/member/admin/funding")
	@ResponseBody
	public Map<String, Object> fundlist(
			@RequestParam(value = "fStatus", required = false, defaultValue = "ALL") String fStatus
			) {
		
		if(fStatus.equals("ALL")) {
			fStatus = null;
		}
		
		List<FundBoard> flist = null;
		int fBoardCount = fService.getFundCount(fStatus);
		PageInfo fundPageInfo = new PageInfo(1, 10, fBoardCount, 10);
		flist = fService.getFundList(fundPageInfo, fStatus);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("flist", flist);
		result.put("fundPageInfo", fundPageInfo);
		
		return result;
	}
	// 펀드 상태값 변경
		@RequestMapping(value = "/member/admin/updatefst", method={RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public Object updateFundlist(
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
	
	// 회원 목록 비동기
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
