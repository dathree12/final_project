package com.cereal.books.board.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping("/bcBoardList")
	public String boardList() {
		
		return "board/bc_board/bcBoardList";
	}
	
	@RequestMapping(value = "/secret")
	public String secret() {
		
		return "board/bc_board/secret";
	}
	
	@RequestMapping(value = "/bcBoardRead")
	public String read() {
		
		return "board/bc_board/bcBoardRead";
	}

	// 리스트 불러오기
	@ResponseBody
	@RequestMapping(value = "/bcBoardList", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit,
			@ModelAttribute("propose") Propose propose
			) {
		
		List<Propose> proposeList = null;

		int boardCount = service.getProposeCount();

		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);
		
		
		proposeList = service.getProposeList(pageInfo);
		
		model.addObject("proposePwd", propose.getProposePwd());
		model.addObject("proposeList", proposeList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("boardCount", boardCount);
		model.setViewName("board/bc_board/bcBoardList");
		
		System.out.println(proposeList);
		System.out.println(pageInfo);
		System.out.println(boardCount);

		return model;
	}

	// 리스트 추가하기
	@RequestMapping(value = "/bcBoardWrite", method = RequestMethod.POST)
	public ModelAndView insert(ModelAndView model, Principal user, Propose propose) {

		if (user.getName().equals(propose.getUserId())) {
			propose.setUserId(user.getName());

			int result = 0;

			result = service.saveBoard(propose);

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

}
