package com.cereal.books.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonController {
	
	/*footer 연결*/
	@RequestMapping("common/agreement/termsGuide")
	public String termsView(){
		
		return "common/agreement/termsGuide";
	}
	/*footer 연결*/
	@RequestMapping("common/agreement/personalGuide")
	public String personalView(){
		
		return "common/agreement/personalGuide";
	}
	/*footer 연결*/
	@RequestMapping("common/agreement/userGuide")
	public String userView(){
		
		return "common/agreement/userGuide";
	}
	
	/*접근권한 메시지 */
	@GetMapping("/accessError")
	public String accessDenied(Model model) {
		log.info("accessDenied() call");
		
		model.addAttribute("msg", "접근 권한이 없습니다.");
		
		return "common/accessError";		
	}
	
}
