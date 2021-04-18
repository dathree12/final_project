package com.cereal.books.board.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.cereal.books.board.model.vo.Exp;

@Mapper
public interface ExpDao {

	int insertExp(Exp exp);
}
