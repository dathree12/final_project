package com.cereal.books.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.	bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.FundService;
import com.cereal.books.board.model.vo.FundBoard;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/bf_board")
public class FundController {
	
	@Autowired
	private FundService service;
	
	@RequestMapping(value="/bf_boardList", method = {RequestMethod.GET})
	public ModelAndView listView(
			ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "12") int listLimit	) {
		
		List<FundBoard> list = null;
		
		int boardCount = service.getBoardCount();
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);
		
//		System.out.println(boardCount);
		
		// remainDate 업데이트 하는 과정
		service.saveRemainDate();
		service.changeStatus();
		
		list = service.getBoardList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/bf_board/bf_boardList");
		
//		System.out.println(list);
//		System.out.println(model);
		return model;
	}
	
	@RequestMapping(value="/bf_boardWrite", method = {RequestMethod.GET})
	public String writeView() {
		
		return "board/bf_board/bf_boardWrite";
	}
	
	@RequestMapping(value="/bf_boardWrite", method = {RequestMethod.POST})
	public ModelAndView write(
			ModelAndView model, HttpServletRequest request,	FundBoard fundboard,
			@RequestParam("upfile") MultipartFile upfile, @RequestParam("userNo") int userNo, @RequestParam("userId") String userId) {
		
		int result = 0;
//		System.out.println("param 체크 : " + userNo);
		
		if(userId != null) {
			fundboard.setUserNo(userNo);
			// 파일을 저장하는 로직 작성
			String renameFileName = saveFile(upfile, request);
			
			if(renameFileName != null) {
				fundboard.setBfOriImgName(upfile.getOriginalFilename());
				fundboard.setBfReImgName(renameFileName);
			}
		
			// board 객체를 DB에 저장할 수 있도록 service에 넘겨주는 과정
			result = service.saveBoard(fundboard);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/board/bf_board/bf_boardList");
			} else {
				model.addObject("msg", "게시글 등록을 실패하였습니다.");
				model.addObject("location", "/board/bf_board/bf_boardList");
			}
		} else {
			model.addObject("msg", "로그인 후 작성해주세요.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
//		model.setViewName("board/write");
		
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
		String savePath = rootPath + "/upload/bf_board";
		
		log.debug("Root Path : " + rootPath);
		log.debug("Save Path : " + savePath);
		
		// savePath가 실제로 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(savePath);
		
		// folder가 존재하지 않으면 false, !붙이면 true로 바뀌면서 로직실행
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		originalFileName = upfile.getOriginalFilename();
		String ext = (originalFileName.lastIndexOf(".") == -1) ? "" : originalFileName.substring(originalFileName.lastIndexOf("."));
		renameFileName = 
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) +
				ext;
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

	// ck에디터 이미지 업로드 메소드
	@RequestMapping(value = "/bf_boardWriteCK", method = RequestMethod.POST)
	public void uploadimg(HttpServletRequest request, HttpServletResponse response, MultipartFile upload)
			throws Exception {
		String renameFileNameCK = null;
		log.info("upload 들어온다! ");

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// 파일 이름 가져오기
		String fileName = upload.getOriginalFilename();
		
		// file이 존재해야 로직실행되도록 null이 아니어야 하고, file 있으면 false이고 !붙여서 true로 로직 실행되도록 한다.
		if(upload != null && !upload.isEmpty()) {
			// 파일을 저장하는 로직 작성
			renameFileNameCK = saveFileRename(upload, request);
			
			System.out.println(renameFileNameCK);
			
//			if(renameFileName != null) {
//				board.setBoardOriginalFileName(upload.getOriginalFilename());
//				board.setBoardRenamedFileName(renameFileName);
//			}
		}
		
		// 파일을 바이트 배열로 변환
		byte[] bytes = upload.getBytes();

		// 이미지를 업로드할 디렉토리를 정해준다
//		String uploadPath = "C:\\workspace\\final_project2\\FinalProject\\src\\main\\webapp\\resources\\upload\\";
		String uploadPath = request.getServletContext().getRealPath("resources/upload/");
		OutputStream out = new FileOutputStream(new File(uploadPath + renameFileNameCK));

		// 서버에 write
		out.write(bytes);

		// 성공여부 가져오기
		String callback = request.getParameter("CKEditorFuncNum");

		// 클라이언트에 이벤트 추가 (자바스크립트 실행)
		PrintWriter printWriter = response.getWriter(); // 자바스크립트 쓰기위한 도구

//		String fileUrl = "http://localhost:8088/books/resources/upload/" + fileName;
		String fileUrl = request.getContextPath() + "/upload/" + renameFileNameCK;

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

	@RequestMapping(value="/bf_agreement")
	public String agreement() {
		
		return "board/bf_board/bf_agreement";
	}
	
	@RequestMapping(value="/bf_payment")
	public String payment() {
		
		return "board/bf_board/bf_payment";
	}
	
	@RequestMapping(value="/bf_payFailure")
	public String payFailure() {
		
		return "board/bf_board/bf_payFailure";
	}
	
	@RequestMapping(value="/bf_paySuccess")
	public String paySuccess() {
		
		return "board/bf_board/bf_paySuccess";
	}
	
	// 게시판 상세조회 + 조회수 증가(반복조회 방지)
	@RequestMapping(value="/bf_viewDetail", method = {RequestMethod.GET})
	public ModelAndView viewDetail(@RequestParam("bfNo") int bfNo, ModelAndView model, HttpServletRequest request, HttpServletResponse response) {

//		System.out.println("viewDetailTest : " + bfNo);
		// 해당번호에 해당하는 게시글 상세조회
		FundBoard board = service.findBoardByNo(bfNo);
		
		// 조회수 증가, 쿠키를 이용한 중복 조회수 증가방지
		Cookie[] cookies = request.getCookies();
		// 비교하기 위해 새로운 쿠키생성
		Cookie viewCookie = null;
		
		// 쿠키가 있을 경우 
        if (cookies != null && cookies.length > 0) {
            for (int i = 0; i < cookies.length; i++) {
            	
                // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
                if (cookies[i].getName().equals("cookie"+bfNo)) { 
                    System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
                    
                    viewCookie = cookies[i];
                }
            }
        }
        
        if (board != null) {
            System.out.println("System - 해당 상세 리뷰페이지로 넘어감");
            
            model.addObject("board", board);
 
            // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
            if (viewCookie == null) {    
                System.out.println("cookie 없음");
                
                // 쿠키 생성(이름, 값)
                Cookie newCookie = new Cookie("cookie"+bfNo, "|" + bfNo + "|");
                                
                // 쿠키 추가
                response.addCookie(newCookie);
 
                // 쿠키를 추가 시키고 조회수 증가시킴
                int result = service.increaseViewcnt(bfNo);
                
                if(result>0) {
                    System.out.println("조회수 증가");
                }else {
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
 
            model.setViewName("board/bf_board/bf_viewDetail");
            return model;
        } 
        else {
            // 에러 페이지 설정
        	model.setViewName("/");
            return model;
        }
	}
	
	// 검색을 통한 리스트 조회, 페이징 처리o
	@RequestMapping(value = "bf_searchList", method = {RequestMethod.GET})
	public ModelAndView searchList(
			ModelAndView model,
			@RequestParam(value = "fd_search_sort", defaultValue = "bfTitle") String fd_search_sort,
			@RequestParam(value = "keyword") String keyword, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "12") int listLimit ) {
		
		List<FundBoard> list = null;
		
		int boardCount = 0;
		PageInfo pageInfo = null;
		
		// remainDate 업데이트 하는 과정
		service.saveRemainDate();
		service.changeStatus();
		
		if(fd_search_sort.equals("bfTitle")) {
			boardCount = service.getBoardCount_Title(keyword);
			pageInfo = new PageInfo(page, 5, boardCount, listLimit);
			list = service.getSearchList_Title(pageInfo, keyword);
		} 
		else if(fd_search_sort.equals("bfContent")) {
			boardCount = service.getBoardCount_Content(keyword);
			pageInfo = new PageInfo(page, 5, boardCount, listLimit);
			list = service.getSearchList_Content(pageInfo, keyword);
		}
	
		model.addObject("fd_search_sort", fd_search_sort);
		model.addObject("keyword", keyword);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/bf_board/bf_searchList");
		
		return model;
	}
	
	// 인기프로젝트(조회수순정렬), 성공임박프로젝트(남은시간순정렬), 마감된프로젝트(마감항목표시)
	@RequestMapping(value="/bf_boardList_viewCount", method = {RequestMethod.GET})
	public ModelAndView listViewCount(
			ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "12") int listLimit	) {
		
		List<FundBoard> list = null;
		
		int boardCount = service.getBoardCount();
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);
		
		service.saveRemainDate();
		service.changeStatus();
		
		list = service.getBoardList_viewCount(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/bf_board/bf_boardList_viewCount");
		
		return model;
	}
	@RequestMapping(value="/bf_boardList_remainDate", method = {RequestMethod.GET})
	public ModelAndView listremainDate(
			ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "12") int listLimit	) {
		
		List<FundBoard> list = null;
		
		int boardCount = service.getBoardCount();
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);
		
		service.saveRemainDate();
		service.changeStatus();
		
		list = service.getBoardList_remainDate(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/bf_board/bf_boardList_remainDate");
		
		return model;
	}
	// 마감된 프로젝트 조회(마감항목 받아와서 조회하기)
	@RequestMapping(value="/bf_boardList_endDate", method = {RequestMethod.GET})
	public ModelAndView listendDate(
			ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "12") int listLimit	) {
		
		List<FundBoard> list = null;
		
		int boardCount = service.getBoardCount_endDate();
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);
		
		service.saveRemainDate();
		service.changeStatus();
		
		list = service.getBoardList_endDate(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/bf_board/bf_boardList_endDate");
		
		return model;
	}	
	
}











