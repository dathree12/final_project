package com.cereal.books.board.controller;

import java.util.List;

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
	public ModelAndView qnaMain(ModelAndView model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
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
	public ModelAndView delete(ModelAndView model,
			@RequestParam("qaNo") int qaNo
			) {
		
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
	public ModelAndView write(ModelAndView model, QA qa,
			@AuthenticationPrincipal Member member) {

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
	public ModelAndView detail(ModelAndView model, @RequestParam(value = "qaNo") int qaNo) {

		QA qa = null;

		qa = service.findQADetail(qaNo);

		System.out.println(qa);

		model.addObject("qa", qa);
		model.setViewName("board/cs_board/qnaDetail");

		return model;
	}
	
	//코멘트 DB저장하기
	@RequestMapping(value = "/saveComment" , method = {RequestMethod.POST})
	@ResponseBody
    public int saveComment(@RequestParam("qaNo") int brNo, @RequestParam("comWriter")String comWriter, 
    		@RequestParam("comContent")String comContent, Comment comment, ModelAndView model) throws Exception{

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
	
	//코멘트 불러오기
	@RequestMapping(value="/commentList", method = {RequestMethod.GET})
	@ResponseBody
	public List<Comment> getCommentList(@RequestParam int qaNo) throws Exception {
		List<Comment> list = null;
		list = service.listComment(qaNo);
		System.out.println(list);
		return list;
	}
}