package com.cereal.books.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FundController {
	@RequestMapping("board/bf_board/bf_boardList")
	public String listView() {
		
		return "board/bf_board/bf_boardList";
	}
	
	@RequestMapping("board/bf_board/bf_boardWrite")
	public String writeView() {
		
		return "board/bf_board/bf_boardWrite";
	}
	
	@RequestMapping("board/bf_board/bf_agreement")
	public String agreement() {
		
		return "board/bf_board/bf_agreement";
	}
	
	@RequestMapping("board/bf_board/bf_payment")
	public String payment() {
		
		return "board/bf_board/bf_payment";
	}
	
	@RequestMapping("board/bf_board/bf_payFailure")
	public String payFailure() {
		
		return "board/bf_board/bf_payFailure";
	}
	
	@RequestMapping("board/bf_board/bf_paySuccess")
	public String paySuccess() {
		
		return "board/bf_board/bf_paySuccess";
	}
}
