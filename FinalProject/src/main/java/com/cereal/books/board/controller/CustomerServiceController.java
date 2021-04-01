package com.cereal.books.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board/cs_board")
public class CustomerServiceController {
	
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
	
	@RequestMapping(value="/qnaBoardMain")
	public String qnaBoardMain() {
		
		return "board/cs_board/qnaBoardMain";
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