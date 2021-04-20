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
	
	// 관리자 페이지
	List<ClubBoard> getAdminClubList(PageInfo pageInfo, String status);

	int getAdminClubCount(String status);
	
	// 마이페이지
	int getMyClubCount(int userNo);

	List<ClubBoard> getMyClubList(PageInfo myClubPageInfo, int userNo);
}
