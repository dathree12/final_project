package com.cereal.books.board.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.cereal.books.board.model.vo.ReviewBoard;

@Mapper
public interface ReviewDao {

		int updateReviewBoard(ReviewBoard reviewboard);

		int insertReviewBoard(ReviewBoard reviewboard);

}
