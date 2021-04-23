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

import com.cereal.books.board.model.service.ClubService;
import com.cereal.books.board.model.service.FundService;
import com.cereal.books.board.model.vo.ClubBoard;
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
	@Autowired
	private ClubService cService;
	
	// 관리자 페이지 불러오기
	@RequestMapping(value="/member/admin/admin_page", method = {RequestMethod.GET})
	public ModelAndView mypage(ModelAndView model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage,
			@RequestParam(value = "cListLimit", required = false, defaultValue = "10") int cListLimit,
			@RequestParam(value = "fPage", required = false, defaultValue = "1") int fPage,
			@RequestParam(value = "fListLimit", required = false, defaultValue = "10") int fListLimit,
			@RequestParam(value = "uPage", required = false, defaultValue = "1") int uPage,
			@RequestParam(value = "uListLimit", required = false, defaultValue = "10") int uListLimit
			) {
		String status = null;
		String fStatus = null;
		String cStatus = null;
		
		// 회원관련
		List<Member> list = null;
		int boardCount = mService.getMemberCount(status);
		PageInfo pageInfo = new PageInfo(uPage, 10, boardCount, uListLimit);
		list = mService.getMemberList(pageInfo, status);
		
		// 북펀딩
		List<FundBoard> bfList = null;
		int fBoardCount = fService.getFundCount(fStatus);
		PageInfo fundPageInfo = new PageInfo(fPage, 10, fBoardCount, fListLimit);
		bfList = fService.getFundList(fundPageInfo, fStatus);
		
		// 북클럽
		List<ClubBoard> bcList = null;
		int cBoardCount = cService.getAdminClubCount(cStatus);
		PageInfo clubPageInfo = new PageInfo(cPage, 10, cBoardCount, cListLimit);
		bcList = cService.getAdminClubList(clubPageInfo, cStatus);
				
		model.addObject("list", list);
		model.addObject("bfList", bfList);
		model.addObject("bcList", bcList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("fundPageInfo", fundPageInfo);
		model.addObject("clubPageInfo", clubPageInfo);
		model.setViewName("member/admin/admin_page");
		
		return model;
	}
	
	// 클럽 목록 비동기
	@RequestMapping("/member/admin/club")
	@ResponseBody
	public Map<String, Object> clublist(
			@RequestParam(value = "bcStatus", required = false) String cStatus
			) {
		
		if(cStatus.equals("ALL")) {
			cStatus = null;
		}
		
		List<ClubBoard> cList = null;
		int cBoardCount = cService.getAdminClubCount(cStatus);
		PageInfo clubPageInfo = new PageInfo(1, 10, cBoardCount, 10);
		cList = cService.getAdminClubList(clubPageInfo, cStatus);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("bcList", cList);
		result.put("clubPageInfo", clubPageInfo);
		
		return result;
	}
	// 펀드 목록 비동기
	@RequestMapping("/member/admin/funding")
	@ResponseBody
	public Map<String, Object> fundlist(
			@RequestParam(value = "bfStatus", required = false) String bfStatus
			) {
		
		if(bfStatus.equals("ALL")) {
			bfStatus = null;
		}
		
		List<FundBoard> flist = null;
		int fBoardCount = fService.getFundCount(bfStatus);
		PageInfo fundPageInfo = new PageInfo(1, 10, fBoardCount, 10);
		flist = fService.getFundList(fundPageInfo, bfStatus);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("flist", flist);
		result.put("fundPageInfo", fundPageInfo);
		
		return result;
	}
	// 펀드 상태값 변경
		@RequestMapping(value = "/member/admin/updateFundlist", method={RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public Object updateFundlist(
				@RequestParam(value = "newstatus", required = false) String status,
				@RequestParam(value = "bfNolist[]", required = false) List<Integer> bfNo
				) {
			System.out.println("status : " + status);
			
			System.out.println("bfNo : " + bfNo);
			
			fService.adminFundStatus(status, bfNo);

	        Map<String, Object> retVal = new HashMap<String, Object>();
	        
	        retVal.put("code", "OK");
			return retVal;
		}
	
	// 회원 목록 비동기
	@RequestMapping("/member/admin")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value = "mStatus", required = false, defaultValue = "ALL") String status
//			@RequestParam(value = "uPage", required = false, defaultValue = "1") int uPage,
//			@RequestParam(value = "uListLimit", required = false, defaultValue = "10") int uListLimit
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
//		result.put("pageInfo", pageInfo);
		
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
