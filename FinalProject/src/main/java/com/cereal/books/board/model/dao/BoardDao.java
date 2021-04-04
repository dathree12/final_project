package com.cereal.books.board.model.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDao {
	
	int selectCount();
}
