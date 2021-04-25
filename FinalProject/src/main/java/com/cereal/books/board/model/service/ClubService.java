package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.board.model.vo.Payment;
import com.cereal.books.common.util.PageInfo;

public interface ClubService {

	int getBoardCount();

	int saveBoard(ClubBoard clubBoard);

	int saveRemainDate();

	int noneRemainDate();

	int selectExpCount(int bcNo);

	int getAdminClubCount(String status);

	// 마이페이지
	int getMyClubCount(int userNo);

	List<ClubBoard> getBoardList(PageInfo pageInfo);

	List<ClubBoard> getDlBoardList();

	// 관리자 페이지
	List<ClubBoard> getAdminClubList(PageInfo pageInfo, String status);

	List<ClubBoard> getMyClubList(PageInfo myClubPageInfo, int userNo);

	ClubBoard findClubByNo(int bcNo);

	ClubBoard findBoardByNo(int bcNo);

	int increaseViewcnt(int bcNo);

	int plusReachPrice(ClubBoard clubBoard);

	int insertPayment(Payment payment);

}
