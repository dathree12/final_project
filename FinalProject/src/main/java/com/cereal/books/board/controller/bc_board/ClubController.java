package com.cereal.books.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClubController {
	
	@RequestMapping("board/bcBoard")
	public String viewTest() {
		
		return "board/bcBoard";
	}
}
