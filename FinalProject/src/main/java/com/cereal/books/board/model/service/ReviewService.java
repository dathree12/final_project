package com.cereal.books.board.model.service;

import java.util.List;
import java.util.Map;

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

	int getBoardCount_Id(String searchword);

	int getBoardCount_Title(String searchword);

	int getBoardCount_Content(String searchword);

	List<ReviewBoard> getSearchList_Id(PageInfo pageInfo, String searchword);

	List<ReviewBoard> getSearchList_Title(PageInfo pageInfo, String searchword);

	List<ReviewBoard> getSearchList_Content(PageInfo pageInfo, String searchword);

	int increaseViewcnt(int brNo);

	Map<String, Object> scrapCheck(Map<String, Object> commandMap);

	Map<String, Object> insertScrap(Map<String, Object> commandMap);

	Map<String, Object> deleteScrap(Map<String, Object> commandMap);

	List<ReviewBoard> getBoardSortingList(PageInfo pageInfo);

	int deleteBookreview(int brNo);
	
	// 마이페이지 북리뷰 조회
	List<ReviewBoard> getMyReviewList(int userNo);
	
	// 마이페이지 스크랩 조회
	List<BookScrap> getMyScrapList(PageInfo pageInfo, int userNo);

	int getMyScrapCount(int userNo);

	int saveRecommend(int brNo);

	ReviewBoard findBoard(int brNo);
}
