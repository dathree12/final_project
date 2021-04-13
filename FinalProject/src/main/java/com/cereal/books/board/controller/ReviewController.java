package com.cereal.books.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.ReviewService;
import com.cereal.books.board.model.vo.ReviewBoard;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("board/br_board")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@RequestMapping(value="/brBoardMain")
	public String brBoardMain() {
		
		return "board/br_board/brBoardMain";
	}

	@RequestMapping(value="/brBoardWrite", method = {RequestMethod.GET})
	public void brBoardWriteView() {
		
		//return "board/br_board/brBoardWrite";
	}
	
//	
//	@RequestMapping(value = "/brBoardWrite", method = { RequestMethod.POST })
//	public ModelAndView brWrite (HttpServletRequest request, 
//								 ReviewBoard reviewboard, ModelAndView model) {
//
//			int result = 0;
//
//			result = service.saveBoard(reviewboard);
//			
//			if(result > 0) {
//				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
//				model.addObject("location", "/board/br_board/brBoardMain");
//			} else {
//				model.addObject("msg", "게시글 등록을 실패하였습니다.");
//				model.addObject("location", "/board/list");
//			}			
//			
//		
//		model.setViewName("common/msg");
//		
//		return model;
//		}
//	
	
	@RequestMapping(value = "/brBoardWrite", method = { RequestMethod.POST })
	public ModelAndView brWrite(HttpServletRequest request, MultipartFile upload,
							ReviewBoard reviewboard, ModelAndView model, @RequestParam("userNo") int userNo, @RequestParam("userId") String userId)
			throws Exception {
		
		int result = 0;

		result = service.saveBoard(reviewboard);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/board/br_board/brBoardMain");
		} else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("location", "/board/list");
		}			
		
	
	model.setViewName("common/msg");
	
	return model;
	}
	

	@RequestMapping(value = "/imageUpload", method = { RequestMethod.POST })
	public void brWrite(HttpServletRequest request, HttpServletResponse response, MultipartFile upload)
			throws Exception {
		String renameFileName = null;
		log.info("upload 들어온다! ");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 파일 이름 가져오기
		String fileName = upload.getOriginalFilename();
		
		// file이 존재해야 로직실행되도록 null이 아니어야 하고, file 있으면 false이고 !붙여서 true로 로직 실행되도록 한다.
				if(upload != null && !upload.isEmpty()) {
					// 파일을 저장하는 로직 작성
					renameFileName = saveFileRename(upload, request);
					
					System.out.println(renameFileName);
					
//					if(renameFileName != null) {
//						board.setBoardOriginalFileName(upload.getOriginalFilename());
//						board.setBoardRenamedFileName(renameFileName);
//					}
				}
				
		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리를 정해준다
		//String uploadPath = "C:\\finalproject\\final_project\\FinalProject\\src\\main\\webapp\\resources\\upload\\";
		String uploadPath = request.getServletContext().getRealPath("resources/upload/");
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
	
	
	
	
	
	// ck에디터 이미지 이름 변경하는 메소드
		private String saveFileRename(MultipartFile upload, HttpServletRequest request) {
			// file 이름 뒤에 등록하는 시간 붙여서 rename에 넣기
			String originalFileName = null;
			String renameFileName = null;
			
			originalFileName = upload.getOriginalFilename();
			String ext = (originalFileName.lastIndexOf(".") == -1) ? "" : originalFileName.substring(originalFileName.lastIndexOf("."));
			renameFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) +	ext;
			
			return renameFileName;
		}
		
	@RequestMapping(value="/bookSearch")
		public void brBookSearch() {
			

		}


	@RequestMapping(value="/brReviewDetail")
	public void brReviewDetail() {
		
		
	}
	
	
}