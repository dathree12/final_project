package com.cereal.books;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.MainBoardService;
import com.cereal.books.board.model.vo.ReviewBoard;
import com.cereal.books.common.util.PageInfo;
import com.cereal.books.member.model.vo.Member;



@Controller
public class MainController {
	@Autowired
	private MainBoardService service;
	
	
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView main(ModelAndView model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "2") int listLimit ) {
		List<ReviewBoard> list = null;
		
		int boardCount = service.getBoardCount();
		
		PageInfo pageInfo = new PageInfo(page, 3, boardCount, listLimit);
		
		System.out.println(boardCount);
		
		list = service.getBoardList(pageInfo);
		
		
		System.out.println(list);
		
		model.addObject("list", list);
		model.setViewName("mainpage");
		return model;
	}
	
}
