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
		
		int insertComment(Comment comment);

}
