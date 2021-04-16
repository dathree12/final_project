package com.cereal.books.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.ReviewBoard;

@Mapper
public interface MainBoardDao {

	int selectCount();

	List<ReviewBoard> selectBoardList(RowBounds rowBounds);

	List<ReviewBoard> selectBoardListNo(RowBounds rowBounds, @Param("userNo") int userNo);

	List<ReviewBoard> selectBoardListbest(RowBounds rowBounds, @Param("arr") String[] arr);
	
}
