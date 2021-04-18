package com.cereal.books.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.Propose;

@Mapper
public interface ProposeDao {

	int selectCount();

	int proposeCount();

	int insertPropose(Propose propose);
	
	List<Propose> selectProposeList(RowBounds rowBounds);

}
