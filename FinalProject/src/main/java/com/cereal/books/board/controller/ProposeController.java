package com.cereal.books.board.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.ProposeService;
import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.Propose;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/bc_board")
public class ProposeController {

	@Autowired
	ProposeService service;

	// 북 제안서 상세페이지
	@RequestMapping(value = "/bcBoardRead", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView model, @RequestParam("proposeNo") int proposeNo, HttpServletRequest request, HttpServletResponse response) {

		Propose propose = null;

		propose = service.findProposeByNo(proposeNo);

		System.out.println("propose : " + propose);

		// 조회수 증가, 쿠키를 이용한 중복 조회수 증가방지
		Cookie[] cookies = request.getCookies();
		// 비교하기 위해 새로운 쿠키생성
		Cookie viewCookie = null;

		// 쿠키가 있을 경우
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {

				// Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌
				if (cookies[i].getName().equals("cookie" + proposeNo)) {
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");

					viewCookie = cookies[i];
				}
			}
		}

		if (propose != null) {
			System.out.println("System - 해당 상세 리뷰페이지로 넘어감");

			model.addObject("propose", propose);

			// 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
			if (viewCookie == null) {
				System.out.println("cookie 없음");

				// 쿠키 생성(이름, 값)
				Cookie newCookie = new Cookie("cookie" + proposeNo, "|" + proposeNo + "|");

				// 쿠키 추가
				response.addCookie(newCookie);

				// 쿠키를 추가 시키고 조회수 증가시킴
				int result = service.increaseViewcnt(proposeNo);

				if (result > 0) {
					System.out.println("조회수 증가");
				} else {
					System.out.println("조회수 증가 에러");
				}
			}
			// viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
			else {
				System.out.println("cookie 있음");

				// 쿠키 값 받아옴.
				String value = viewCookie.getValue();

				System.out.println("cookie 값 : " + value);

			}

			model.setViewName("board/bc_board/bcBoardRead");
			return model;
		} else {
			// 에러 페이지 설정
			model.setViewName("/");
			return model;
		}
	}

	// 리스트 불러오기
	@RequestMapping(value = "/bcBoardList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView list(ModelAndView model, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit) {

		List<Propose> proposeList = null;

		int boardCount = service.getProposeCount();

		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);

		proposeList = service.getProposeList(pageInfo);

		model.addObject("proposeList", proposeList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("boardCount", boardCount);
		model.setViewName("board/bc_board/bcBoardList");

//		System.out.println(proposeList);
//		System.out.println(pageInfo);
//		System.out.println(boardCount);

		return model;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(ModelAndView model, @RequestParam("proposeNo") int proposeNo) {

		int result = service.deleteBoard(proposeNo);

		if (result > 0) {
			model.addObject("msg", "정상적으로 삭제되었습니다.");
			model.addObject("location", "/board/bc_board/bcBoardList");
		} else {
			model.addObject("msg", "실패하였습니다.");
			model.addObject("location", "/board/bc_board/bcBoardList");
		}

		model.setViewName("common/msg");

		return model;
	}

	// 리스트 추가하기
	@RequestMapping(value = "/bcBoardWrite", method = RequestMethod.POST)
	public ModelAndView insert(ModelAndView model, Principal user, Propose propose) {

		if (user.getName().equals(propose.getUserId())) {
			propose.setUserId(user.getName());

			int result = 0;

			result = service.saveBoard(propose);

			System.out.println(propose.getProposeContent());

			if (result > 0) {
				model.addObject("msg", "게시글 등록 성공");
				model.addObject("location", "/board/bc_board/bcBoardMain");
			} else {
				model.addObject("msg", "게시글 등록 실패");
				model.addObject("location", "/board/bc_board/bcBoardMain");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/board/bc_board/bcBoardMain");
		}

		model.setViewName("common/msg");

		return model;
	}

	@RequestMapping("/bcBoardList")
	public String boardList() {

		return "board/bc_board/bcBoardList";
	}

	@RequestMapping(value = "/secret", method = RequestMethod.POST)
	public ModelAndView secret(ModelAndView model, Propose propose, @RequestParam("proposePwd") int proposePwd, @RequestParam("proposeNo") int proposeNo) {

		System.out.println(proposePwd);
		System.out.println(proposeNo);
		propose = service.comparePwd(proposeNo, proposePwd);

		System.out.println(propose);

		model.addObject("propose", propose);
		model.setViewName("board/bc_board/secret");

		return model;
	}

	@RequestMapping(value = "/bcBoardRead")
	public String read() {

		return "board/bc_board/bcBoardRead";
	}

	// 코멘트 DB저장하기
	@RequestMapping(value = "/saveComment", method = { RequestMethod.POST })
	@ResponseBody
	public int saveComment(@RequestParam("proposeNo") int proposeNo, @RequestParam("comWriter") String comWriter, @RequestParam("comContent") String comContent,
			Comment comment, ModelAndView model) throws Exception {

		int result = 0;

		System.out.println(comment);

		result = service.saveComment(comment);

		System.out.println(result);

		return result;
	}

	// 코멘트 불러오기
	@RequestMapping(value = "/commentList", method = { RequestMethod.GET })
	@ResponseBody
	public List<Comment> getCommentList(@RequestParam int proposeNo) throws Exception {
		List<Comment> list = null;
		list = service.listComment(proposeNo);
		System.out.println(list);
		return list;
	}
}