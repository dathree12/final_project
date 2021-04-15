package com.cereal.books.board.model.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.cereal.books.board.model.dao.MainBoardDao;
import com.cereal.books.board.model.vo.ReviewBoard;
import com.cereal.books.common.util.PageInfo;
import com.cereal.books.member.model.vo.Member;

@Service
public class MainBoardServiceImpl implements MainBoardService {
	@Autowired
	private MainBoardDao mainBoardDao ;

	
	
	@Override
	public int getBoardCount() {
		
		return mainBoardDao.selectCount();
	}



	@Override
	public List<ReviewBoard> getBoardList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); 
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
				
		return mainBoardDao.selectBoardList(rowBounds);
	}



	@Override
	public List<ReviewBoard> getBoardListNo(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); 
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member member = (Member) authentication.getPrincipal();
		String[] arr = member.getUserGenre().split(",");
		List<ReviewBoard> list = new ArrayList<>();
		
		for (int i = 0; i < arr.length; i++) {
			
			if(arr[i].equals("소설")) {
				arr[i] = "b1";
			}else if(arr[i].equals("어린이/청소년")){
				arr[i] = "b2";
			}else if(arr[i].equals("경제/경영")){
				arr[i] = "b3";
			}else if(arr[i].equals("인문/사회/역사")){
				arr[i] = "b4";
			}else if(arr[i].equals("종교/역학")){
				arr[i] = "b5";
			}else if(arr[i].equals("자기개발")){
				arr[i] = "b6";
			}else {
				System.out.println("회원장르 정보가 null입니다.");
			}
		}
				

		return  mainBoardDao.selectBoardListbest(rowBounds, arr);
	}


}
