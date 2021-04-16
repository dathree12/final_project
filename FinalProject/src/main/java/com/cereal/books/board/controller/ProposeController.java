package com.cereal.books.board.controller;

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

@Controller
@RequestMapping("/board/bc_board")
public class ProposeController {
	
	@Autowired
	ProposeService service;
	
	@RequestMapping(value = "/bcBoardList", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit) {
		
		List<Propose> list = null;
		
		int boardCount = service.getProposeCount();
		
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);
		
		list = service.getProposeList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("boardCount", boardCount);
		model.setViewName("board/bc_board/bcBoardList");
		
		System.out.println(list);
		
		return model;
	}
}
