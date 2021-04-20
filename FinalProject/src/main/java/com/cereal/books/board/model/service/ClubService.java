package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.board.model.vo.Exp;
import com.cereal.books.common.util.PageInfo;

public interface ClubService {

	int getBoardCount();

	int saveBoard(ClubBoard clubBoard);

	int saveRemainDate();

	int noneRemainDate();

	int saveExpList(Exp exp);

	List<ClubBoard> getBoardList(PageInfo pageInfo);

	List<ClubBoard> getDlBoardList();

	ClubBoard findClubByNo(int bcNo, PageInfo pageInfo);

	int selectExpCount(int bcNo);

}
