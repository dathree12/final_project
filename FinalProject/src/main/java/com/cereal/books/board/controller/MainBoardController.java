package com.cereal.books.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.cereal.books.board.model.service.MainBoardService;
import com.cereal.books.board.model.vo.BookSearch;

import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("board/main_board")
public class MainBoardController {
	
	@Autowired
	private MainBoardService service;
	
	
	@RequestMapping("/mainBoardDetail")
	public ModelAndView detailViews(ModelAndView model, @RequestParam("brIsbn")String brIsbn) {
		

		model.addObject("list", brIsbn);
		model.setViewName("board/main_board/mainBoardDetail");
				
		return model;
	}
	
	@RequestMapping("/boardSearch")
	public ModelAndView boardSearch(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "5") int listLimit,
			@RequestParam("nav_keyword")String search ) {
		List<BookSearch> list = null;
		int boardCount = service.getBoardSearchCount(search);
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);
		
		
		
		list = service.getBoardSearch(pageInfo, search);
		
		if(list.isEmpty()) {
			model.addObject("msg", "검색 결과가 없습니다.");
			model.setViewName("common/msg");
		}else {
			model.addObject("search", search);
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("board/main_board/boardSearch");
		}
		
		
		
		return model;
	}
	
		
}