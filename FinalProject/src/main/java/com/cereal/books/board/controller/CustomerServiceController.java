package com.cereal.books.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.QAService;
import com.cereal.books.board.model.vo.QA;
import com.cereal.books.common.util.PageInfo;

@Controller
@RequestMapping("board/cs_board")
public class CustomerServiceController {
	
	@Autowired
	QAService service;
	
	@RequestMapping(value="/notiBoardMain")
	public String notiBoardMain() {
		
		return "board/cs_board/notiBoardMain";
	}

	@RequestMapping(value="/notiBoardWrite")
	public String notiBoardWrite() {
		
		return "board/cs_board/notiBoardWrite";
	}
	
	@RequestMapping(value="/notiDetail")
	public String notiDetail() {
		
		return "board/cs_board/notiDetail";
	}
	
	// Q&A
	@RequestMapping(value="/qnaBoardMain")
	public String qnaBoardMain() {
		
		return "board/cs_board/qnaBoardMain";
	}
	
	@RequestMapping(value = "/qnaBoardMain", method = RequestMethod.GET)
	public ModelAndView qnaMain(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "3") int listLimit
			) {
		
		List<QA> list = null;
		PageInfo pageInfo = null;
		int count = 0;
				
		count = service.qaCount();
		pageInfo = new PageInfo(page, 5, count, listLimit);
		list = service.findQAByNo(pageInfo);
		
		System.out.println(list);
		System.out.println(count);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		
		return model;
	}

	@RequestMapping(value="/qnaBoardWrite")
	public String qnaBoardWrite() {
		
		return "board/cs_board/qnaBoardWrite";
	}
	
	@RequestMapping(value="/qnaDetail")
	public String qnaDetail() {
		
		return "board/cs_board/qnaDetail";
	}
}