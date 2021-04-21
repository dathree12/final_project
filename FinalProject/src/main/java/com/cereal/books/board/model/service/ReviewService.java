package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.BookScrap;
import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.ReviewBoard;
import com.cereal.books.common.util.PageInfo;

public interface ReviewService {

	int saveBoard(ReviewBoard reviewboard);
	
	List<ReviewBoard> getBoardList(PageInfo pageInfo);

	int getBoardCount();

	ReviewBoard findBoardByNo(int brNo);

	int saveScrapStatus(BookScrap bookscrap);

	List<Comment> listComment(int brNo);

	int saveComment(Comment comment);
	

}
