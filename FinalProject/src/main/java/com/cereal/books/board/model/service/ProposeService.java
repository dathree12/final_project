package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.ClubBoard;
import com.cereal.books.board.model.vo.Propose;
import com.cereal.books.common.util.PageInfo;

public interface ProposeService {

	int getProposeCount();

	int saveBoard(Propose propose);

	List<Propose> getProposeList(PageInfo pageInfo);
	
	// 마이페이지
	int getMyAplctClubCount(int userNo);

	List<ClubBoard> getMyAplctClubList(PageInfo myAplctClubpageInfo, int userNo);
}
