package com.cereal.books.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board/br_board")
public class ReviewController {
	
	@RequestMapping(value="/brBoardMain")
	public String brBoardMain() {
		
		return "board/br_board/brBoardMain";
	}

	@RequestMapping(value="/brBoardWrite")
	public String brBoardWrite() {
		
		return "board/br_board/brBoardWrite";
	}
	
	@RequestMapping(value="/brReviewDetail")
	public String brReviewDetail() {
		
		return "board/br_board/brReviewDetail";
	}
}