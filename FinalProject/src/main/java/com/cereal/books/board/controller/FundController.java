package com.cereal.books.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/bf_board")
public class FundController {
	@RequestMapping(value="/bf_boardList")
	public String listView() {
		
		return "board/bf_board/bf_boardList";
	}
	
	@RequestMapping(value="/bf_boardWrite")
	public String writeView() {
		
		return "board/bf_board/bf_boardWrite";
	}
	
	@RequestMapping(value="/bf_agreement")
	public String agreement() {
		
		return "board/bf_board/bf_agreement";
	}
	
	@RequestMapping(value="/bf_payment")
	public String payment() {
		
		return "board/bf_board/bf_payment";
	}
	
	@RequestMapping(value="/bf_payFailure")
	public String payFailure() {
		
		return "board/bf_board/bf_payFailure";
	}
	
	@RequestMapping(value="/bf_paySuccess")
	public String paySuccess() {
		
		return "board/bf_board/bf_paySuccess";
	}
	
	@RequestMapping(value="/bf_viewDetail")
	public String viewDetail() {
		
		return "board/bf_board/bf_viewDetail";
	}
}
