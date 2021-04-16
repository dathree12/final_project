package com.cereal.books.board.model.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

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

	// 검색을 통한 조회
//	int getSearchCount(String fd_search_sort, String keyword);
//	List<FundBoard> getSearchList(RowBounds rowBounds, String fd_search_sort, String keyword);

	int getSearchCount111(String keyword);
	List<FundBoard> selectBoardList111(RowBounds rowBounds, String keyword);

	

}
