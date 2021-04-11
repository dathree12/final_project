package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.common.util.PageInfo;

public interface ClubService {

	int getBoardCount();

	int saveBoard(ClubBoard clubBoard);
	
	List<ClubBoard> getBoardList(PageInfo pageInfo);

	ClubBoard findClubByNo(int bcNo);

}
