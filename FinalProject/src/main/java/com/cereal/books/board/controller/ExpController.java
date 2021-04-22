package com.cereal.books.board.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.ExpService;
import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.board.model.vo.Exp;

import lombok.extern.slf4j.Slf4j;

// 안만들어도되는 페이지인데 제가 햇갈려서 만들었습니닷
@Slf4j
@Controller
@RequestMapping("/board/bc_board")
public class ExpController {
	
	@Autowired
	private ExpService service;
	
	// 북 클럽 후기 작성
	@ResponseBody
	@RequestMapping(value = "/bcExpWrite", method = RequestMethod.POST)
	public ModelAndView expWrite(ModelAndView model, Principal user, ClubBoard clubBoard, Exp exp, HttpServletRequest request,
			@RequestParam("upfile") MultipartFile upfile
			) throws Exception {
		
//		model.addObject("bcOriginTitle", bcOriginTitle);
//		model.setViewName("board/bc_board/bcExpWrite");
		
		if (user.getName().equals(clubBoard.getUserId())) {
			clubBoard.setUserId(user.getName());

			int result = 0;

			
			String renameFileName = saveFile(upfile, request);
			
			if(renameFileName != null) {
				exp.setExpOriginImage(upfile.getOriginalFilename());
				exp.setExpModifyImage(renameFileName);
			}
			
			result = service.saveExpList(exp);
			
			System.out.println("upfile.getOriginalFilename() : " + upfile.getOriginalFilename());
			System.out.println("saveExpList : " + result);

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
		String savePath = rootPath + "/upload/exp";
		
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
	
	// 펀딩 프로젝트 일반회원 상세조회 페이지 수정하기 내에서 새롭게 대표이미지 파일 등록되면 기존파일 삭제
	private void deleteFile(String fileName, HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/exp";
		
		log.debug("Root Path : " + rootPath);
		log.debug("Save Path : " + savePath);
		
		File file = new File(savePath + "/" + fileName);
		
		if(file.exists()) {
			file.delete();
		}
	}	
}
