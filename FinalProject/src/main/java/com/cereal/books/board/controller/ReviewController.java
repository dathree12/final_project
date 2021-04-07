package com.cereal.books.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.cereal.books.board.model.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("board/br_board")
public class ReviewController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/brBoardMain")
	public String brBoardMain() {
		
		return "board/br_board/brBoardMain";
	}

	@RequestMapping(value="/brBoardWrite", method = {RequestMethod.GET})
	public void brBoardWriteView() {
		
		//return "board/br_board/brBoardWrite";
	}
	
	
	@RequestMapping(value = "/brBoardWrite", method = { RequestMethod.POST })
	public void uploadimg(HttpServletRequest request, HttpServletResponse response, MultipartFile upload)
			throws Exception {

		log.info("upload 들어온다! ");
		
		JSONObject json = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 파일 이름 가져오기
		String fileName = upload.getOriginalFilename();

		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리를 정해준다
		String uploadPath = "C:\\finalproject\\final_project\\FinalProject\\src\\main\\webapp\\resources\\upload\\";
		OutputStream out = new FileOutputStream(new File(uploadPath + fileName));

		// 서버에 write
		out.write(bytes);

		// 성공여부 가져오기
		String callback = request.getParameter("CKEditorFuncNum");

		// 클라이언트에 이벤트 추가 (자바스크립트 실행)
		PrintWriter printWriter = response.getWriter(); // 자바스크립트 쓰기위한 도구

		String fileUrl = "http://localhost:8088/books/resources/upload/" + fileName;

		if (!callback.equals("1")) { // callback이 1일 경우만 성공한 것
			printWriter.println("<script>alert('이미지 업로드에 실패했습니다.');" + "</script>");

		} else {
			log.info("upload img 들어온다! " + fileUrl);

			printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
					+ "','이미지가 업로드되었습니다.')" + "</script>");
			
		}
		
		printWriter.flush();
		

	}

	
	@RequestMapping(value="/brReviewDetail")
	public void brReviewDetail() {
		
		
	}
	
	
}