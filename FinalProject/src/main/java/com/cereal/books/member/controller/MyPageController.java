package com.cereal.books.member.controller;

import java.util.HashMap;
import java.util.List;
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

import com.cereal.books.board.model.service.ClubService;
import com.cereal.books.board.model.service.FundService;
import com.cereal.books.board.model.service.ProposeService;
import com.cereal.books.board.model.service.ReviewService;
import com.cereal.books.board.model.vo.BookScrap;
import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.board.model.vo.FundBoard;
import com.cereal.books.board.model.vo.ReviewBoard;
import com.cereal.books.common.util.PageInfo;
import com.cereal.books.member.model.service.MemberService;
import com.cereal.books.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@SessionAttributes("loginMember")
public class MyPageController {
	@Autowired
	private MemberService service;
	@Autowired
	private FundService fService;
	@Autowired
	private ClubService cService;
	@Autowired
	private ProposeService pService;
	@Autowired
	private ReviewService rService;
	
	@RequestMapping(value = "member/mypage/mypage", method= {RequestMethod.GET})
	public ModelAndView bookFunding(ModelAndView model, @AuthenticationPrincipal Member member) {
		int userNo = member.getUserNo();
		
		// 스크랩
//		List<BookScrap> myScrapList = null;
//		
//		int myScrapCount = fService.getMyFundCount(userNo);
//		PageInfo myScrapPageInfo = new PageInfo(1, 3, myScrapCount, 3);
		
//		myScrapList = fService.getMyFundList(myScrapPageInfo, userNo);
		
		// 내가 쓴 북리뷰
		List<ReviewBoard> myReviewList = null;
		
//		int myReviewCount = fService.getMyFundCount(userNo);
//		PageInfo myReviewPageInfo = new PageInfo(1, 3, myReviewCount, 3);
		
		myReviewList = rService.getMyReviewList(userNo);
		
		System.out.println(myReviewList);
		
		// 참여중인 펀드
		List<FundBoard> myFundList = null;
		
		int myFundCount = fService.getMyFundCount(userNo);
		PageInfo myFundPageInfo = new PageInfo(1, 3, myFundCount, 3);
		
		myFundList = fService.getMyFundList(myFundPageInfo, userNo);
		
		// 개설 신청한 펀드
		List<FundBoard> myAplctFundList = null;
		
		int myAplctFundCount = fService.getMyAplctFundCount(userNo);
		PageInfo pageInfo = new PageInfo(1, 5, myAplctFundCount, 5);
		
		myAplctFundList = fService.getMyAplctFundList(pageInfo, userNo);
		
		// 참여중인 클럽
		List<ClubBoard> myClubList = null;
		
		int myClubCount = cService.getMyClubCount(userNo);
		PageInfo myClubPageInfo = new PageInfo(1, 3, myClubCount, 3);
		
		myClubList = cService.getMyClubList(myClubPageInfo, userNo);
		
		// 개설 신청한 클럽
		List<ClubBoard> myAplctClubList = null;
		
		int myAplctClubCount = pService.getMyAplctClubCount(userNo);
		PageInfo myAplctClubpageInfo = new PageInfo(1, 5, myAplctClubCount, 5);
		
		myAplctClubList = pService.getMyAplctClubList(myAplctClubpageInfo, userNo);
		
//		model.addObject("myScrapList", myScrapList);
//		model.addObject("myScrapPageInfo", myScrapPageInfo);
		model.addObject("myFundList", myFundList);
		model.addObject("myFundPageInfo", myFundPageInfo);
		model.addObject("myAplctFundList", myAplctFundList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("myClubList", myClubList);
		model.addObject("myClubPageInfo", myClubPageInfo);
		model.addObject("myAplctClubList", myAplctClubList);
		model.addObject("myAplctClubpageInfo", myAplctClubpageInfo);
		model.addObject("myReviewList", myReviewList);
		model.addObject("member", member);
		model.setViewName("member/mypage/mypage");
		
		return model;
	}
	
	// 회원정보 수정
	@RequestMapping("member/mypage/profile")
	public String profile(Model model, @AuthenticationPrincipal Member member) {
		
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
	@RequestMapping("member/newPwd")
	public String userPwd() {
		
		return "member/mypage/updatePwd";
	}
	
	@RequestMapping("member/updatePwd")
	@ResponseBody
	public ModelAndView updatePwd(ModelAndView model, @AuthenticationPrincipal Member member,
			@RequestParam("userPwd") String userPwd) {
		int result = 0;
		
		System.out.println(userPwd);
		result = service.updatePwd(member.getUserId(), userPwd);
		
			if(result > 0) {
				model.addObject("msg", "정상적으로 변경되었습니다.");
			} else {
				model.addObject("msg", "변경 실패하였습니다.");
			}
			
			model.setViewName("common/msg");
			
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
