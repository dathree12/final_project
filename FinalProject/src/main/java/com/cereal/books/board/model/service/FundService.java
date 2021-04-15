package com.cereal.books.board.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.cereal.books.board.model.vo.FundBoard;
import com.cereal.books.common.util.PageInfo;

public interface FundService {

	int getBoardCount();

	List<FundBoard> getBoardList(PageInfo pageInfo);

	int saveRemainDate();

	int changeStatus();

	int saveBoard(FundBoard fundboard);

	// 관리자
	List<FundBoard> getFundList(PageInfo fundPageInfo, String status);

	int getFundCount(String status);
	
	int adminFundStatus(String status, int bfNo);
	
	// 마이페이지 (참여 / 제안)
	int getMyFundCount(int userNo);

	List<FundBoard> getMyFundList(PageInfo pageInfo, int userNo);
	
	int getMyAplctFundCount(int userNo);
	
	List<FundBoard> getMyAplctFundList(PageInfo pageInfo, int userNo);

	FundBoard findBoardByNo(int bfNo);

	// 조회수, 일정시간 이후 조회수 +1 구현해야
	int increaseViewcnt(int bfNo);
	
}
