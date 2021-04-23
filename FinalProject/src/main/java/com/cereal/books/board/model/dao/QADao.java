package com.cereal.books.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.QA;

@Mapper
public interface QADao {

	List<QA> selectQAList(RowBounds rowBounds);

	int qaCount();

}
