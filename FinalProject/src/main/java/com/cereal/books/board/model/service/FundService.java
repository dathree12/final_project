package com.cereal.books.board.model.service;

import java.util.List;

import com.cereal.books.board.model.vo.FundBoard;
import com.cereal.books.board.model.vo.Payment;
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
	
	int adminFundStatus(String status, List<Integer> bfNo);
	
	// 마이페이지 (참여 / 제안)
	int getMyFundCount(int userNo);

	List<FundBoard> getMyFundList(PageInfo pageInfo, int userNo);
	
	int getMyAplctFundCount(int userNo);
	
	List<FundBoard> getMyAplctFundList(PageInfo pageInfo, int userNo);

	
	FundBoard findBoardByNo(int bfNo);

	// 조회수 증가(반복조회 방지)
	int increaseViewcnt(int bfNo);

	// 검색을 통한 리스트 조회, 페이징 처리o
	int getBoardCount_Title(String keyword);
	List<FundBoard> getSearchList_Title(PageInfo pageInfo, String keyword);
	int getBoardCount_Content(String keyword);
	List<FundBoard> getSearchList_Content(PageInfo pageInfo, String keyword);

	// 인기프로젝트 조회(조회수순), 성공임박프로젝트 조회(남은시간순)
	List<FundBoard> getBoardList_viewCount(PageInfo pageInfo);
	List<FundBoard> getBoardList_remainDate(PageInfo pageInfo);
	// 마감된프로젝트 조회(마감항목, 최근마감날짜순)
	int getBoardCount_endDate();
	List<FundBoard> getBoardList_endDate(PageInfo pageInfo);
	
	// 펀딩 프로젝트 관리자 상세조회 페이지 코멘트 입력, 승인&거절 보내기
	int updateAdminCheck(FundBoard fundboard);
	
	// 결제성공 시 결제정보 저장하기
	int insertPayment(Payment payment);
	// payment에서 결제 성공 후 결제내역 db에 저장하고 fundboard에 구입내역 추가
	int plusReachPrice(FundBoard fundboard);



	
	
	
}
