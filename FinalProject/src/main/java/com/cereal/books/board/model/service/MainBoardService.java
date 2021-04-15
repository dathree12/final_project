package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.ReviewBoard;
import com.cereal.books.common.util.PageInfo;
import com.cereal.books.member.model.vo.Member;

public interface MainBoardService {

	int getBoardCount();

	List<ReviewBoard> getBoardList(PageInfo pageInfo);

	List<ReviewBoard> getBoardListNo(PageInfo pageInfo);

	

	
	
	
	
}
