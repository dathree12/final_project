package com.cereal.books.board.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.ProposeService;
import com.cereal.books.board.model.vo.Propose;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/bc_board")
public class ProposeController {

	@Autowired
	ProposeService service;

	// 북 제안서 상세페이지
	@RequestMapping(value = "/bcBoardRead", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView model, 
			@RequestParam("proposeNo") int proposeNo
			) {
		
		Propose propose = null;
		
		propose = service.findProposeByNo(proposeNo);
		
		System.out.println("propose : " + propose);
		
		model.addObject("propose", propose);
		model.setViewName("board/bc_board/bcBoardRead");
		
		return model;
	}

	// 리스트 불러오기
	@RequestMapping(value = "/bcBoardList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit
			) {

		List<Propose> proposeList = null;

		int boardCount = service.getProposeCount();

		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);

		proposeList = service.getProposeList(pageInfo);
		
		model.addObject("proposeList", proposeList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("boardCount", boardCount);
		model.setViewName("board/bc_board/bcBoardList");

//		System.out.println(proposeList);
//		System.out.println(pageInfo);
//		System.out.println(boardCount);

		return model;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(ModelAndView model,
			@RequestParam("proposeNo") int proposeNo
			) {
		
		int result = service.deleteBoard(proposeNo);
		
		if (result > 0) {
			model.addObject("msg", "정상적으로 삭제되었습니다.");
			model.addObject("location", "/board/bc_board/bcBoardList");
		} else {
			model.addObject("msg", "실패하였습니다.");
			model.addObject("location", "/board/bc_board/bcBoardList");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}

	// 리스트 추가하기
	@RequestMapping(value = "/bcBoardWrite", method = RequestMethod.POST)
	public ModelAndView insert(ModelAndView model, Principal user, Propose propose) {

		if (user.getName().equals(propose.getUserId())) {
			propose.setUserId(user.getName());

			int result = 0;

			result = service.saveBoard(propose);
			
			System.out.println(propose.getProposeContent());
			
			if (result > 0) {
				model.addObject("msg", "게시글 등록 성공");
				model.addObject("location", "/board/bc_board/bcBoardMain");
			} else {
				model.addObject("msg", "게시글 등록 실패");
				model.addObject("location", "/board/bc_board/bcBoardMain");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/board/bc_board/bcBoardMain");
		}

		model.setViewName("common/msg");

		return model;
	}
	
	@RequestMapping("/bcBoardList")
	public String boardList() {

		return "board/bc_board/bcBoardList";
	}

	@RequestMapping(value = "/secret", method = RequestMethod.POST)
	public ModelAndView secret(
			ModelAndView model,
			Propose propose,
			@RequestParam("proposePwd") int proposePwd,
			@RequestParam("proposeNo") int proposeNo
			) {

		System.out.println(proposePwd);
		System.out.println(proposeNo);
		propose = service.comparePwd(proposeNo, proposePwd);
		
		System.out.println(propose);
		
		model.addObject("propose", propose);
		model.setViewName("board/bc_board/secret");
		
		return model;
	}

	@RequestMapping(value = "/bcBoardRead")
	public String read() {

		return "board/bc_board/bcBoardRead";
	}
}