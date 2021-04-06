package com.cereal.books.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/bc_board")
public class ClubController {

	// 북 클럽 상세페이지
	@RequestMapping("/bcBoardDetail")
	public String clubDetail() {
		
		return "board/bc_board/bcBoardDetail";
	}
	
	//	북 클럽 메인페이지
	@RequestMapping("/bcBoardMain")
	public String clubMain() {
		
		return "board/bc_board/bcBoardMain";
	}
	
	//	북 클럽 제안 리스트
	@RequestMapping("/bcBoardList")
	public String proposeList() {
		
		return "board/bc_board/bcBoardList";
	}
	

	// 북 클럽 제안페이지
	@RequestMapping("/bcBoardPropose")
	public String clubPropose() {

		return "board/bc_board/bcBoardPropose";
	}
	
	// 북 클럽 글쓰기페이지
	@RequestMapping("/bcBoardWrite")
	public String clubWrite() {

		return "board/bc_board/bcBoardWrite";
	}
	
	// 북 클럽 결제페이지
	@RequestMapping("/bcBoardPayment")
	public String clubPayment() {
		
		return "board/bc_board/bcBoardPayment";
	}

}
