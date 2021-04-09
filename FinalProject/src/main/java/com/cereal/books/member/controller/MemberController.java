package com.cereal.books.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.member.model.service.CustomUserDetailService;
import com.cereal.books.member.model.service.MemberService;
import com.cereal.books.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private  CustomUserDetailService customservice;
	
	/*로그인 페이지 이동*/
	@RequestMapping(value = "member/login" , method = {RequestMethod.GET,RequestMethod.POST})
	public String loginViews() {
		
		
		return "member/login";
	}
	
	/*회원가입 약관*/
	@RequestMapping("member/enrollTerms")
	public String enrollTerms(){
		
		return "member/enrollTerms";
		
	}
	
	/*회원가입 페이지 요청*/
	@RequestMapping("member/enroll")
	public String enrollViews(){
		
		return "member/enroll";
		
	}
	
	/*회원가입 페이지 작성 */
	@RequestMapping(value = "member/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member){
		
		int result =service.saveMember(member);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/member/login");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/member/enroll");
		}
		
		model.setViewName("common/msg");		
		
		return model;
	}
	
	/*아이디 중복 체크 */
	@ResponseBody
	@RequestMapping("/member/idCheck")
	public Object idCheck(@RequestParam("id")String userId) {		

		
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.validate(userId));
						
		return map;
	}
	/*닉네임 중복 체크 */
	@ResponseBody
	@RequestMapping("/member/NnameCheck")
	public Object NnameCheck(@RequestParam("Nname")String userNname) {		
	
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.NnameValidate(userNname));
		
		return map;
	}
	/*이메일 중복 체크 */
	@ResponseBody
	@RequestMapping("/member/emailCheck")
	public Object emailCheck(@RequestParam("email")String userEmail) {		
	
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.emailValidate(userEmail));
		
		return map;
	}
	/*핸드폰 중복 체크 */
	@ResponseBody
	@RequestMapping("/member/phoneCheck")
	public Object phoneCheck(@RequestParam("phone")String userPhone) {		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.phoneValidate(userPhone));
		
		return map;
	}
	
	/*회원 id찾기 페이지 이동*/
	@GetMapping("/member/userIdSerch")
	public String serchIdView () {
		
		return "/member/userIdSerch";
	}

	/*회원 id찾기 이메일 로직*/
	@ResponseBody
	@RequestMapping(value = "/member/serchIdEmail" , method ={RequestMethod.POST})
	public Object serchIdEmail( @RequestParam("name")String name, 
			@RequestParam("email")String userEmail) {
		 	
			Map<String, Object> map = new HashMap<>();
			
			map.put("result", service.serchIdEmail(name, userEmail));
			
			return map;
	}
	/*회원 id찾기 핸드폰 로직*/
	@ResponseBody
	@RequestMapping(value = "/member/serchIdPhone" , method ={RequestMethod.POST})
	public Object serchIdPhone( @RequestParam("name")String name, 
			@RequestParam("phone")String userPhone) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("result", service.serchIdPhone(name, userPhone));
		
		return map;
	}
	
}
