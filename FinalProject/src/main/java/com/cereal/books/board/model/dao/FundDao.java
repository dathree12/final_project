package com.cereal.books.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.FundBoard;

@Mapper
public interface FundDao {

	int selectCount();

	List<FundBoard> selectBoardList(RowBounds rowBounds);

}
