package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.Propose;
import com.cereal.books.common.util.PageInfo;

public interface ProposeService {

	int getProposeCount();

	List<Propose> getProposeList(PageInfo pageInfo);

}
