package com.cereal.books.board.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.ClubService;
import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

/*
 * 에러내역
 *  - Field error in object -> VO 객체 타입 확인해볼 것 (Data 이상한듯 일단 String 으로 고쳐보자)
 *  - cannot insert NULL into ("BOOK"."BOOK_CLUB_BOARD"."BC_WRITER")
 */

@Slf4j
@Controller
@RequestMapping("/board/bc_board")
public class ClubController {
	
	// No qualifying bean of type -> @Service...
	@Autowired
	private ClubService service;

	// 북 클럽 상세페이지
	@RequestMapping("/bcBoardDetail")
	public String clubDetail() {

		return "board/bc_board/bcBoardDetail";
	}
	
	// 북 클럽 메인페이지
	@RequestMapping("/bcBoardMain")
	public String clubMain() {

		return "board/bc_board/bcBoardMain";
	}
	
	// 북 클럽 메인페이지(관리자)
	@RequestMapping("/bcAdminWrite")
	public String adminWrite() {
		// 리턴 타입이 void 일 경우 Mapping URL을 유추해서 View를 찾는다. 
		
		 return "board/bc_board/bcAdminWrite";
	}

	// 북 클럽 제안 리스트
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

	// CKEDITOR {BoardWrite, AdminWrite}
	/*
	 * 
	@RequestMapping(value = "/bcBoardWrite", method = RequestMethod.POST)
	public void uploadimg(HttpServletRequest request, HttpServletResponse response, MultipartFile upload)
			throws Exception {

		log.info("upload 들어온다! ");

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 파일 이름 가져오기
		String fileName = upload.getOriginalFilename();

		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리를 정해준다
//		String uploadPath = "C:\\develop\\final_project\\FinalProject\\src\\main\\webapp\\resources\\upload\\";
		String uploadPath = request.getServletContext().getRealPath("resources/upload/");
		OutputStream out = new FileOutputStream(new File(uploadPath + fileName));

		// 서버에 write
		out.write(bytes);

		// 성공여부 가져오기
		String callback = request.getParameter("CKEditorFuncNum");

		// 클라이언트에 이벤트 추가 (자바스크립트 실행)
		PrintWriter printWriter = response.getWriter(); // 자바스크립트 쓰기위한 도구

//		String fileUrl = "http://localhost:8088/books/resources/upload/" + fileName;
		String fileUrl = request.getContextPath() + "/upload/" + fileName;

		if (!callback.equals("1")) { // callback이 1일 경우만 성공한 것
			printWriter.println("<script>alert('이미지 업로드에 실패했습니다.');" + "</script>");

		} else {
			log.info("upload img 들어온다! " + fileUrl);

			printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
					+ "','이미지가 업로드되었습니다.')" + "</script>");

		}

		printWriter.flush();

	}
	 */

	// 북 클럽 메인페이지
	@RequestMapping(value = "/bcBoardMain", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit) {
		
		List<ClubBoard> list = null;
		
		int boardCount = service.getBoardCount();
		int result = service.saveRemainDate();
		
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);
		
		System.out.println("boardCount : " + boardCount);
		
		list = service.getBoardList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/bc_board/bcBoardMain");
		
		System.out.println(list);
		
		return model;
	}
	
	@RequestMapping(value = "/bcBoardDetail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView model, @RequestParam("bcNo") int bcNo) {
		
		ClubBoard clubBoard = service.findClubByNo(bcNo);
		
		model.addObject("clubBoard", clubBoard);
		model.setViewName("board/bc_board/bcBoardDetail");
		
		return model;
	}

	// 북 클럽 메인페이지(관리자)
	@RequestMapping(value = "/bcAdminWrite", method = RequestMethod.POST)
	public ModelAndView adminWrite(ModelAndView model, 
			Principal user,
			ClubBoard clubBoard) {
		// 리턴 타입이 void 일 경우 Mapping URL을 유추해서 View를 찾는다. 
		
		if(user.getName().equals(clubBoard.getUserId())) {
			clubBoard.setUserId(user.getName());

			int result = 0;
			
			result = service.saveBoard(clubBoard);
			
			if(result > 0 ) {
				model.addObject("msg", "게시글 등록 성공");
				model.addObject("location", "/board/bc_board/bcBoardMain");
			} else {
				model.addObject("msg", "게시글 등록 실패");
				model.addObject("location", "/board/bc_board/bcBoardMain");
			}
		} 
		else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/board/bc_board/bcBoardMain");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
}
