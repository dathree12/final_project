package com.cereal.books.board.controller;

import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.ReviewService;
import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.ReviewBoard;
import com.cereal.books.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("board/br_board")
@SessionAttributes("loginMember")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@RequestMapping(value="/brBoardMain", method = {RequestMethod.GET})
	public ModelAndView mainView(
			ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "12") int listLimit) {
		
		List<ReviewBoard> list = null;
		
		int boardCount = service.getBoardCount();
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, listLimit);
		
		System.out.println(boardCount);
		
		// remainDate 업데이트 하는 과정
		
		list = service.getBoardList(pageInfo);
		
		
//		for (ReviewBoard reviewBoard : list) {
//			
//			reviewBoard.setBrIsbn(null);
//		}
		
		
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/br_board/brBoardMain");
		
		System.out.println(list);
		System.out.println(model);
		return model;
	}
	
	@RequestMapping(value="/brBoardWrite", method = {RequestMethod.GET})
	public void brBoardWriteView() {
		
		//return "board/br_board/brBoardWrite";
	}
	
	
	@RequestMapping(value = "/brBoardWrite", method = {RequestMethod.POST})
	public ModelAndView brWrite(HttpServletRequest request, MultipartFile upload,
							ReviewBoard reviewboard, ModelAndView model)
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
	
	// 북리뷰글 쓸때 책검색창 열기
	@RequestMapping(value="/bookSearch")
		public void brBookSearch() {
			

		}

	//책 상세보기
	@ResponseBody
	@RequestMapping(value="/brReviewDetail", method = {RequestMethod.GET})
	public ModelAndView brReviewDetail(@RequestParam("brNo") int brNo, ModelAndView model, HttpServletRequest request, HttpServletResponse response) {
		ReviewBoard reviewboard = service.findBoardByNo(brNo);
		
		// 조회수 증가, 쿠키를 이용한 중복 조회수 증가방지
				Cookie[] cookies = request.getCookies();
				// 비교하기 위해 새로운 쿠키생성
				Cookie viewCookie = null;
				
				// 쿠키가 있을 경우 
		        if (cookies != null && cookies.length > 0) {
		            for (int i = 0; i < cookies.length; i++) {
		            	
		                // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
		                if (cookies[i].getName().equals("cookie"+brNo)) { 
		                    System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
		                    
		                    viewCookie = cookies[i];
		                }
		            }
		        }
		        
		        if (reviewboard != null) {
		            System.out.println("System - 해당 상세 리뷰페이지로 넘어감");
		            
		            model.addObject("board", reviewboard);
		 
		            // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
		            if (viewCookie == null) {    
		                System.out.println("cookie 없음");
		                
		                // 쿠키 생성(이름, 값)
		                Cookie newCookie = new Cookie("cookie"+brNo, "|" + brNo + "|");
		                                
		                // 쿠키 추가
		                response.addCookie(newCookie);
		 
		                // 쿠키를 추가 시키고 조회수 증가시킴
		                int result = service.increaseViewcnt(brNo);
		                
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
		 
		            model.setViewName("board/br_board/brReviewDetail");
		            return model;
		        } 
		        else {
		            // 에러 페이지 설정
		        	model.setViewName("/");
		            return model;
		        }
		
	}
	
	//스크랩 정보 가져오기
	@ResponseBody
	@RequestMapping(value = "/scrapGet", method = {RequestMethod.GET})
	public int brBookScrap(@RequestParam("bsIsbn") String bsIsbn, @RequestParam("userNo") int userNo) {
		int result = 0;
		System.out.println(bsIsbn);
		result = service.getScrapStatus(bsIsbn, userNo);
		return result;
	}
	
	
	//코멘트 DB저장하기
	@RequestMapping(value = "/saveComment" , method = {RequestMethod.POST})
	@ResponseBody
    public int saveComment(@RequestParam("brNo") int brNo, @RequestParam("comWriter")String comWriter, 
    		@RequestParam("comContent")String comContent, Comment comment, ModelAndView model) throws Exception{

        int result = 0;
        
        System.out.println(comment);
		
    	result = service.saveComment(comment);
    	
//    	if(result > 0) {
//			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
//			model.addObject("location", "/board/br_board/brBoardMain");
//		} else {
//			model.addObject("msg", "게시글 등록을 실패하였습니다.");
//			model.addObject("location", "/board/list");
//		}			
//            
        
        return result;
    }
	
	//코멘트 불러오기
	@RequestMapping(value="/commentList", method = {RequestMethod.GET})
	@ResponseBody
	public List<Comment> getCommentList(@RequestParam int brNo) throws Exception {
		List<Comment> list = null;
		list = service.listComment(brNo);
		System.out.println(list);
		return list;
	}
	
	// 검색을 통한 리스트 조회, 페이징 처리o
		@RequestMapping(value = "brsearchList", method = {RequestMethod.GET})
		public ModelAndView searchList(
				ModelAndView model,
				@RequestParam(value = "br_search_sort", defaultValue = "br_search_id") String br_search_sort,
				@RequestParam(value = "br_searchword") String searchword, 
				@RequestParam(value = "page", required = false, defaultValue = "1") int page,
				@RequestParam(value = "listLimit", required = false, defaultValue = "12") int listLimit ) {
			
			List<ReviewBoard> list = null;
			
			int boardCount = 0;
			PageInfo pageInfo = null;
			
			// remainDate 업데이트 하는 과정
			System.out.println(searchword);
			if(br_search_sort.equals("br_search_id")) {
				boardCount = service.getBoardCount_Id(searchword);
				pageInfo = new PageInfo(page, 5, boardCount, listLimit);
				list = service.getSearchList_Id(pageInfo, searchword);
			} 
			else if(br_search_sort.equals("br_search_title")) {
				boardCount = service.getBoardCount_Title(searchword);
				pageInfo = new PageInfo(page, 5, boardCount, listLimit);
				list = service.getSearchList_Title(pageInfo, searchword);
			}
			else if(br_search_sort.equals("br_search_content")) {
				boardCount = service.getBoardCount_Content(searchword);
				pageInfo = new PageInfo(page, 5, boardCount, listLimit);
				list = service.getSearchList_Content(pageInfo, searchword);
			}
			model.addObject("br_search_sort", br_search_sort);
			model.addObject("br_searchword", searchword);
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("board/br_board/brBoardMainSearch");
			
			return model;
		}
	
}