package com.cereal.books.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/bc_board")
public class ClubController {
	
//	@Autowired
//	private ClubService service;

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
	@RequestMapping("/bcAdminWrite")
	public String adminWrite() {
		
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

	@RequestMapping(value = {"/bcBoardWrite", "/bcAdminWrite"}, method = RequestMethod.POST)
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

}
