package com.cereal.books.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.ClubService;
import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

/*
 * 에러내역
 *  - Field error in object -> VO 객체 타입 확인해볼 것 (Data 이상한듯 일단 String 으로 고쳐보자)
 *  - cannot insert NULL into ("BOOK"."BOOK_CLUB_BOARD"."BC_WRITER")
 *  - No qualifying bean of type -> @Service...
 */

@Slf4j
@Controller
@RequestMapping("/board/bc_board")
public class ClubController {

	@Autowired
	private ClubService service;

	@RequestMapping(value = "/bcBoardDetail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView model, HttpServletRequest request, HttpServletResponse response, @RequestParam("bcNo") int bcNo
			) {

		ClubBoard clubBoard = null;

		clubBoard = service.findClubByNo(bcNo);
		
		model.addObject("clubBoard", clubBoard);
		
		model.setViewName("board/bc_board/bcBoardDetail");
		
		return model;

	}

	// CKEDITOR
	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
	public void uploadimg(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) throws Exception {

		String fileName = null;
		String uploadPath = null;
		String callback = null;
		String fileUrl = null;
		PrintWriter printWriter = null;
		OutputStream out = null;

		log.info("upload 들어온다! ");

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 파일 이름 가져오기
		fileName = upload.getOriginalFilename();

		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리를 정해준다
		uploadPath = request.getServletContext().getRealPath("resources/upload/");
		out = new FileOutputStream(new File(uploadPath + fileName));

		// 서버에 write
		out.write(bytes);

		// 성공여부 가져오기
		callback = request.getParameter("CKEditorFuncNum");

		// 클라이언트에 이벤트 추가 (자바스크립트 실행)
		printWriter = response.getWriter(); // 자바스크립트 쓰기위한 도구

		// String fileUrl = "http://localhost:8088/books/resources/upload/" + fileName;
		fileUrl = request.getContextPath() + "/upload/" + fileName;

		if (!callback.equals("1")) { // callback이 1일 경우만 성공한 것
			printWriter.println("<script>alert('이미지 업로드에 실패했습니다.');" + "</script>");

		} else {
			log.info("upload img 들어온다! " + fileUrl);

			printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl + "','이미지가 업로드되었습니다.')" + "</script>");
		}
		printWriter.flush();
	}

	// 북 클럽 메인페이지
	@RequestMapping(value = "/bcBoardMain", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView model, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "12") int listLimit) {

		List<ClubBoard> list = null;
		List<ClubBoard> dlList = null;
		PageInfo pageInfo = null;

		int boardCount = service.getBoardCount();
		int result = service.saveRemainDate();
		int noneResult = service.noneRemainDate();

		pageInfo = new PageInfo(page, 5, boardCount, listLimit);

		list = service.getBoardList(pageInfo);
		dlList = service.getDlBoardList();

		model.addObject("list", list);
		model.addObject("dlList", dlList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("boardCount", boardCount);
		model.setViewName("board/bc_board/bcBoardMain");

		return model;
	}

	// 북 클럽 메인페이지(관리자), 대표이미지
	@RequestMapping(value = "/bcAdminWrite", method = RequestMethod.POST)
	public ModelAndView adminWrite(ModelAndView model, Principal user, ClubBoard clubBoard, HttpServletRequest request,
			@RequestParam("upfile") MultipartFile upfile) throws Exception {
		// 리턴 타입이 void 일 경우 Mapping URL을 유추해서 View를 찾는다.

		if (user.getName().equals(clubBoard.getUserId())) {
			clubBoard.setUserId(user.getName());

			int result = 0;

			String renameFileName = saveFile(upfile, request);

			if (renameFileName != null) {
				clubBoard.setBcOriginImage(upfile.getOriginalFilename());
				clubBoard.setBcModifyImage(renameFileName);
			}

			result = service.saveBoard(clubBoard);

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

	// 대표사진 저장할 수 있는 메소드
	private String saveFile(MultipartFile upfile, HttpServletRequest request) {
		// file 이름 뒤에 등록하는 시간 붙여서 rename에 넣기
		String renamePath = null;
		String originalFileName = null;
		String renameFileName = null;

		// 저장되는 경로
		String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/bc_board";

		log.debug("Root Path : " + rootPath);
		log.debug("Save Path : " + savePath);

		// savePath가 실제로 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(savePath);

		// folder가 존재하지 않으면 false, !붙이면 true로 바뀌면서 로직실행
		if (!folder.exists()) {
			folder.mkdir();
		}

		originalFileName = upfile.getOriginalFilename();
		String ext = (originalFileName.lastIndexOf(".") == -1) ? "" : originalFileName.substring(originalFileName.lastIndexOf("."));
		renameFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + ext;
		renamePath = savePath + "/" + renameFileName;

		try {
			// 업로드한 파일데이터를 지정한 파일에 저장한다.
			upfile.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}

		return renameFileName;
	}

	// 펀딩 프로젝트 일반회원 상세조회 페이지 수정하기 내에서 새롭게 대표이미지 파일 등록되면 기존파일 삭제
	private void deleteFile(String fileName, HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/bc_board";

		log.debug("Root Path : " + rootPath);
		log.debug("Save Path : " + savePath);

		File file = new File(savePath + "/" + fileName);

		if (file.exists()) {
			file.delete();
		}
	}

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

	// 북 클럽 메인페이지
	@RequestMapping("/bcReviewWrite")
	public String clubReview() {

		return "board/bc_board/bcReviewWrite";
	}

	// 북 클럽 메인페이지(관리자)
	@RequestMapping("/bcAdminWrite")
	public String adminWrite() {
		// 리턴 타입이 void 일 경우 Mapping URL을 유추해서 View를 찾는다.

		return "board/bc_board/bcAdminWrite";
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

	// 북 클럽 결제페이지
	@RequestMapping("/bcExpWrite")
	public String expWrite() {

		return "board/bc_board/bcExpWrite";
	}

}
