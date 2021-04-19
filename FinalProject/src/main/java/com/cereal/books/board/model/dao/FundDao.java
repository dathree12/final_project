package com.cereal.books.board.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.cereal.books.board.model.vo.FundBoard;

@Mapper
public interface FundDao {

	int selectCount();

	List<FundBoard> selectBoardList(RowBounds rowBounds);

	int saveRemainDate();

	int changeStatus();

	int insertBoard(FundBoard fundboard);

	// 관리자
	List<FundBoard> adminFundList(@Param("rowBounds") RowBounds rowBounds, @Param("status") String status);

	int selectFundStatusCount(String status);
	
	int adminUpdateFundStatus(@Param("status") String status, @Param("bfNo") List<Integer> bfNo);
	
	// 마이페이지 (참여 / 제안)
	List<FundBoard> myFundList(@Param("rowBounds") RowBounds rowBounds, @Param("userNo") int userNo);
	
	int selectMyFundCount(int userNo);

	List<FundBoard> myAplctFundList(@Param("rowBounds") RowBounds rowBounds, @Param("userNo") int userNo);
	
	int selectMyAplcFundCount(int userNo);
	
	// viewDetail 해당 번호 찾는 메소드
	FundBoard selectBoardDetail(int bfNo);
	
	// 조회수 증가(반복조회 방지)
	int increateViewcnt(int bfNo);

	// 검색을 통한 리스트 조회, 페이징 처리o
	int getBoardCount_Title(String keyword);
	List<FundBoard> getSearchList_Title(RowBounds rowBounds, String keyword);
	int getBoardCount_Content(String keyword);
	List<FundBoard> getSearchList_Content(RowBounds rowBounds, String keyword);

	// 인기프로젝트 조회(조회수순), 성공임박프로젝트 조회(남은시간순)
	List<FundBoard> getBoardList_viewCount(RowBounds rowBounds);
	List<FundBoard> getBoardList_remainDate(RowBounds rowBounds);
	// 마감된프로젝트 조회(마감항목, 최근마감날짜순)
	int getBoardCount_endDate();
	List<FundBoard> getBoardList_endDate(RowBounds rowBounds);

	// 관리자페이지에서 관리자가 펀딩 게시판 승인,거절 & 코멘트 업데이트 메소드
	int updateAdminCheck(FundBoard fundboard);


	



	

}
