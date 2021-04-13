package com.cereal.books.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.ReviewBoard;

@Mapper
public interface ReviewDao {

		int updateReviewBoard(ReviewBoard reviewboard);

		int insertReviewBoard(ReviewBoard reviewboard);

		List<ReviewBoard> selectBoardList(RowBounds rowBounds);

}
