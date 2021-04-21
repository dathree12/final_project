package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.BookSearch;
import com.cereal.books.board.model.vo.ReviewBoard;
import com.cereal.books.common.util.PageInfo;
import com.cereal.books.member.model.vo.Member;

public interface MainBoardService {

	int getBoardCount();

	List<ReviewBoard> getBoardList(PageInfo pageInfo);

	List<ReviewBoard> getBoardListNo(PageInfo pageInfo);

	List<ReviewBoard> getBoardListMB(PageInfo pageInfo);

	List<ReviewBoard> getBoardListBeforeMB(PageInfo pageInfo);

	List<ReviewBoard> getBoardGenreList(PageInfo pageInfo, String brBookType);

	List<ReviewBoard> getBoardGList(PageInfo pageInfoGr);

	List<BookSearch> getBoardSearch(PageInfo pageInfo, String search);

	

	
	
	
	
}
