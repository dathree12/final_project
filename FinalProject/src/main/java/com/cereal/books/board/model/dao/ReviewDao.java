package com.cereal.books.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.BookScrap;
import com.cereal.books.board.model.vo.Comment;
import com.cereal.books.board.model.vo.ReviewBoard;

@Mapper
public interface ReviewDao {

		int updateReviewBoard(ReviewBoard reviewboard);

		int insertReviewBoard(ReviewBoard reviewboard);

		List<ReviewBoard> selectBoardList(RowBounds rowBounds);

		int selectCount();

		ReviewBoard selectBoardDetail(int brNo);
		
		int updateBookScrap(BookScrap bookscrap);
		
		int insertBookScrap(BookScrap bookscrap);
		
		List<Comment> listComment(int brNo);

		int saveComment(Comment comment);

		int getBoardCount_Id(String br_searchword);

		int getBoardCount_Title(String br_searchword);

		int getBoardCount_Content(String br_searchword);

		List<ReviewBoard> getSearchList_Id(RowBounds rowBounds, String br_searchword);

		List<ReviewBoard> getSearchList_Title(RowBounds rowBounds, String br_searchword);

		List<ReviewBoard> getSearchList_Content(RowBounds rowBounds, String br_searchword);

		List<BookScrap> getScrapStatus(String bsIsbn, int userNo);

		void updateViewCount(int brViewCount);

		int increateViewcnt(int brNo); 
		
		
}
