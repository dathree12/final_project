package com.cereal.books.board.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.QAService;
import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.QA;
import com.cereal.books.common.util.PageInfo;
import com.cereal.books.member.model.vo.Member;

@Controller
@RequestMapping("board/cs_board")
public class CustomerServiceController {

	@Autowired
	QAService service;

	@RequestMapping(value = "/notiBoardMain")
	public String notiBoardMain() {

		return "board/cs_board/notiBoardMain";
	}

	@RequestMapping(value = "/notiBoardWrite")
	public String notiBoardWrite() {

		return "board/cs_board/notiBoardWrite";
	}

	@RequestMapping(value = "/notiDetail")
	public String notiDetail() {

		return "board/cs_board/notiDetail";
	}

	// Q&A

	@RequestMapping(value = "/qnaBoardMain", method = RequestMethod.GET)
	public ModelAndView qnaMain(ModelAndView model, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit) {

		List<QA> list = null;
		PageInfo pageInfo = null;
		int count = 0;

		count = service.qaCount();
		pageInfo = new PageInfo(page, 5, count, listLimit);
		list = service.findQAByNo(pageInfo);

		System.out.println(count);
		System.out.println(list);

		model.addObject("count", count);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);

		model.setViewName("board/cs_board/qnaBoardMain");

		return model;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(ModelAndView model, @RequestParam("qaNo") int qaNo) {

		int result = service.deleteBoard(qaNo);

		if (result > 0) {
			model.addObject("msg", "정상적으로 삭제되었습니다.");
			model.addObject("location", "/board/cs_board/qnaBoardMain");
		} else {
			model.addObject("msg", "실패하였습니다.");
			model.addObject("location", "/board/cs_board/qnaBoardMain");
		}

		model.setViewName("common/msg");

		return model;
	}

	@RequestMapping(value = "/qnaBoardWrite", method = { RequestMethod.POST })
	public ModelAndView write(ModelAndView model, QA qa, @AuthenticationPrincipal Member member) {

		if (member.getUserNo() == qa.getUserNo()) {
			qa.setQaWriter(member.getUsername());

			int result = 0;

			result = service.saveBoard(qa);

			System.out.println(result);

			if (result > 0) {
				model.addObject("msg", "게시글 등록 성공");
				model.addObject("location", "/board/cs_board/qnaBoardMain");
			} else {
				model.addObject("msg", "게시글 등록 실패");
				model.addObject("location", "/board/cs_board/qnaBoardMain");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/board/cs_board/qnaBoardMain");
		}

		model.setViewName("common/msg");

		return model;
	}

	@RequestMapping(value = "/qnaBoardWrite")
	public String qnaWriter() {

		return "board/cs_board/qnaBoardWrite";
	}

	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView model, @RequestParam(value = "qaNo") int qaNo, HttpServletRequest request, HttpServletResponse response) {

		QA qa = null;

		qa = service.findQADetail(qaNo);

		System.out.println(qa);

		// 조회수 증가, 쿠키를 이용한 중복 조회수 증가방지
		Cookie[] cookies = request.getCookies();
		// 비교하기 위해 새로운 쿠키생성
		Cookie viewCookie = null;

		// 쿠키가 있을 경우
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {

				// Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌
				if (cookies[i].getName().equals("cookie" + qaNo)) {
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");

					viewCookie = cookies[i];
				}
			}
		}

		if (qa != null) {
			System.out.println("System - 해당 상세 리뷰페이지로 넘어감");

			model.addObject("propose", qa);

			// 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
			if (viewCookie == null) {
				System.out.println("cookie 없음");

				// 쿠키 생성(이름, 값)
				Cookie newCookie = new Cookie("cookie" + qaNo, "|" + qaNo + "|");

				// 쿠키 추가
				response.addCookie(newCookie);

				// 쿠키를 추가 시키고 조회수 증가시킴
				int result = service.increaseViewcnt(qaNo);

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

			model.setViewName("board/cs_board/qnaDetail");
			return model;
		} else {
			// 에러 페이지 설정
			model.setViewName("/");
			return model;
		}
	}

	// 코멘트 DB저장하기
	@RequestMapping(value = "/saveComment", method = { RequestMethod.POST })
	@ResponseBody
	public int saveComment(@RequestParam("qaNo") int qaNo, @RequestParam("comWriter") String comWriter, @RequestParam("comContent") String comContent,
			Comment comment, ModelAndView model) throws Exception {

		int result = 0;

		System.out.println(comment);

		result = service.saveComment(comment);

		System.out.println(result);

//    	if(result > 0) {
//			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
//			model.addObject("location", "/board/cs_board/qnaBoardMain");
//		} else {
//			model.addObject("msg", "게시글 등록을 실패하였습니다.");
//			model.addObject("location", "/board/cs_board/qnaBoardMain");
//		}			
//    	
//    	model.setViewName("common/msg");

		return result;
	}

	// 코멘트 불러오기
	@RequestMapping(value = "/commentList", method = { RequestMethod.GET })
	@ResponseBody
	public List<Comment> getCommentList(@RequestParam int qaNo) throws Exception {
		List<Comment> list = null;
		list = service.listComment(qaNo);
		System.out.println(list);
		return list;
	}
}