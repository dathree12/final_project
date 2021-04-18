package com.cereal.books.board.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.ExpService;
import com.cereal.books.board.model.vo.Exp;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/bc_board")
public class ExpController {
	// 작성은 ExpController에서 하고, View는 Board에서 해야하나?
	
	@Autowired
	ExpService service;
	
	// 후기 작성하기
	@RequestMapping(value = "/bcExpWrite", method = RequestMethod.GET)
	public ModelAndView write(ModelAndView model, Principal user, Exp exp) {

		// 구매자 한정 작성 가능 -> 일단 로그인만 처리
		if (user.getName() != null) {

			int result = 0;

			result = service.saveBoard(exp);

			if (result > 0) {
				model.addObject("msg", "후기 등록 성공");
				model.addObject("location", "/board/bc_board/bcBoardMain");
			} else {
				model.addObject("msg", "후기 등록 실패");
				model.addObject("location", "/board/bc_board/bcBoardMain");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/board/bc_board/bcBoardMain");
		}

		model.setViewName("common/msg");

		return model;
	}

}
