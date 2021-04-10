package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.FundBoard;
import com.cereal.books.common.util.PageInfo;

public interface FundService {

	int getBoardCount();

	List<FundBoard> getBoardList(PageInfo pageInfo);
	
}
