package com.cereal.books;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cereal.books.board.model.service.FundService;
import com.cereal.books.board.model.service.MainBoardService;
import com.cereal.books.board.model.vo.FundBoard;
import com.cereal.books.board.model.vo.ReviewBoard;
import com.cereal.books.common.util.PageInfo;

import com.cereal.books.member.model.vo.Member;



@Controller
public class MainController {
	@Autowired
	private MainBoardService service;
	
	@Autowired
	private FundService fundservice;
	
	
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView main(ModelAndView model,
			@AuthenticationPrincipal Member member) {
		List<ReviewBoard> list = null;
		List<ReviewBoard> mBest = null;
		List<ReviewBoard> gBest = null;
		List<FundBoard> bflist = null;
		int boardCount = boardCount = service.getBoardCount();
		int userNo = 0;
		PageInfo pageInfo = new PageInfo(1, 1, boardCount, 3);
		PageInfo pageInfoGr = new PageInfo(1, 1, boardCount, 4);
		PageInfo bfpageInfo = new PageInfo(1, 1, 3, 3);
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat ("MM");
		Calendar cal = Calendar.getInstance();
		cal.setTime(time);
		
		String month = null; 
		
		// 펀딩이나 북클럽

		fundservice.saveRemainDate();
		fundservice.changeStatus();
		
		bflist = fundservice.getBoardList(bfpageInfo);
		
		// 로그인시 추천
		if (member == null) {
			list = service.getBoardList(pageInfo);
			
		}else if(member.getUserId().equals("admin")){
			
			model.setViewName("mainpage");
			return model;
		}else {
			if(list == null) {
				list = service.getBoardList(pageInfo);	
			}else {
				list = service.getBoardListNo(pageInfo);		
			}
		}
		// 월간 베스트
		mBest = service.getBoardListMB(pageInfo);	
		if(mBest.size() > 2 ) {
			month = format.format(cal.getTime());
			model.addObject("mBest", mBest);
			model.addObject("month", month);
			
		}else {
			mBest = service.getBoardListBeforeMB(pageInfo);	
			cal.add(Calendar.MONTH, -1);
			month = format.format(cal.getTime());
			model.addObject("mBest", mBest);
			model.addObject("month", month);	
		}
		
		//장르별 리스트
		gBest = service.getBoardGList(pageInfoGr);
		
		model.addObject("bflist", bflist);
		model.addObject("gBest", gBest);
		model.addObject("list", list);
		model.setViewName("mainpage");
		return model;
	}
	
	@ResponseBody
	@RequestMapping(value="/reviews" , method = {RequestMethod.GET})
	public List<ReviewBoard> reviews(ModelAndView model, 
			@RequestParam("menu")String brBookType) {
		int boardCount = 0;
		boardCount = service.getBoardCount();
		PageInfo pageInfo = new PageInfo(1, 1, boardCount, 4);

		return service.getBoardGenreList(pageInfo, brBookType);
	}
	

	
	
	
	
}
